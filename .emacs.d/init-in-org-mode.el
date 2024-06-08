(require 'package)
;; TODO: make emacs go to an empty buffer when the last file is closed

;; Disable the startup screen
(setq inhibit-startup-screen t)

;; Disable the menu bar, tool bar, and scroll bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Add custom theme directory to the theme load path
(add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/themes"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Load the theme
(load-theme 'monokai t)
(set-face-attribute 'default nil :font "Monospace-20")

;; Set up package.el to work with MELPA
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Ensure the required packages are installed
(dolist (package '(fzf lsp-mode company projectile evil))
  (unless (package-installed-p package)
    (package-install package)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(fzf lsp-mode company projectile evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode 1)

;; Go to *scratch* buffer when the last file is closed
(defun my/close-buffer-hook ()
  (when (eq (length (buffer-list)) 2) ; 2 because *scratch* buffer is always there
    (switch-to-buffer "*scratch*")
    (message "Switched to *scratch* buffer")))

(add-hook 'kill-buffer-hook 'my/close-buffer-hook)
