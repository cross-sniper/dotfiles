(menu-bar-mode -1)
(tool-bar-mode -1)  ; Disable the tool bar
(scroll-bar-mode -1)  ; Disable the scroll bar

(setq inhibit-startup-screen t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'emacs-everywhere)
(straight-use-package 'evil)
(straight-use-package 'monokai-theme)
(straight-use-package 'ibuffer)

(require 'evil)
(evil-mode 1)
(global-set-key (kbd "C-x C-b") 'ibuffer) ; Better buffer management

(load-theme 'monokai t)

;; Set the default font
(set-frame-font "JetBrainsMono Nerd Font-18")

(straight-use-package 'lsp-mode)
(straight-use-package 'company)
(straight-use-package 'company-lsp) ; Optional, for better LSP integration with company
(straight-use-package 'lsp-ui) ; Optional, for UI enhancements
(straight-use-package 'which-key) ; Optional, for better keybinding hints

(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp) ; Enable lsp-mode in programming modes

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode) ; Enable lsp-ui-mode

(require 'company)
(add-hook 'prog-mode-hook 'company-mode) ; Enable company-mode in programming modes

(require 'company-lsp)
(push 'company-lsp company-backends) ; Add company-lsp as a backend for company

(require 'which-key)
(which-key-mode) ; Enable which-key mode

(setq lsp-prefer-flymake nil) ; Use lsp-ui and flycheck instead of flymake
(setq lsp-enable-symbol-highlighting t)
(setq lsp-ui-doc-enable t)

(require 'lsp-mode)
(require 'cc-mode)

(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c-mode-hook #'lsp)

(setq lsp-clients-clangd-args '("--header-insertion=never" "--clang-tidy"))

(with-eval-after-load 'lsp-mode
  (add-to-list 'lsp-language-id-configuration '(c++-mode . "cpp"))
  (add-to-list 'lsp-language-id-configuration '(c-mode . "c")))

(global-display-line-numbers-mode t)

(setq display-line-numbers-type 'relative)

(straight-use-package 'lua-mode)
(straight-use-package 'typescript-mode)
(straight-use-package 'rust-mode)

(defun load-directory-modes (dir)
  "Load all Emacs Lisp files from the specified directory."
  (let ((load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

(load-directory-modes (expand-file-name "~/.config/emacs/modes/"))
