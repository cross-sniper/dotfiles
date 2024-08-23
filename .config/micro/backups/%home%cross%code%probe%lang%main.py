#!/usr/bin/env python
import json
import os
import pygame
import pygame.mixer as mixer

# Initialize pygame and mixer
pygame.init()
mixer.init()

# Set up display
screen = pygame.display.set_mode((600, 500))
pygame.display.set_caption("Rhythm Game")

# List charts and let the user select one
charts = os.listdir("charts")
selected = ""
if len(charts) == 1:
    selected = charts[0]
else:
    while selected == "" or selected not in charts:
        selected = input("Select a chart: ")

# Load chart data
with open(f"charts/{selected}/chart.json") as f:
    data = json.load(f)

# Load music
mixer.music.load(f"charts/{selected}/music.mp3")
mixer.music.play()

# Set up notes
notes = [
    {"fj": note[0], "dk": note[1], "pos_y": -x * 100}
    for x, note in enumerate(data["chart"])
    if note[0] or note[1]
]
note_speed = 2  # Speed at which notes fall

# Game variables
running = True
hit_area = pygame.Rect(250, 450, 100, 50)  # The area where the player can hit the notes
score = 0
font = pygame.font.Font(None, 36)

# Game loop
while running:
    screen.fill((0, 0, 0))  # Clear screen

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    keys = pygame.key.get_pressed()
    for note in notes[:]:
        # Move notes
        note["pos_y"] += note_speed

        # Draw notes
        color = (255, 0, 0) if note["dk"] else (0, 0, 255)
        pygame.draw.rect(
            screen,
            color,
            (250, note["pos_y"], 100, 10),
        )

        # Check for hits
        if hit_area.colliderect(pygame.Rect(250, note["pos_y"], 100, 10)):
            if (
                (keys[pygame.K_d] and note["dk"])
                or (keys[pygame.K_k] and note["dk"])
                or (keys[pygame.K_f] and note["fj"])
                or (keys[pygame.K_j] and note["fj"])
            ):
                score += 100  # Add points for hitting the note
                notes.remove(note)  # Remove note from the list
        elif note["pos_y"] > 500:  # Remove notes that go out of bounds
            notes.remove(note)

    # Draw hit area
    pygame.draw.rect(screen, (0, 255, 0), hit_area)

    # Display score and helpful text
    score_text = font.render(f"Song: {selected}, Score: {score}", True, (255, 255, 255))
    screen.blit(score_text, (10, 10))
    help_text = font.render("DK: red, FJ: blue", True, (255, 255, 255))
    screen.blit(help_text, (10, 50))

    pygame.display.flip()  # Update the display

pygame.quit()
