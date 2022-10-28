;;; -*- lexical-binding: t -*-

;; Title: My emacs configuration
;; Author: George Konstantis

;;Set a really high threshold to avoid garbage collections at startup
;;thus increasing the startup time.
(setq gc-cons-threshold (* 50 1000 1000))

(add-hook 'emacs-startup-hook #'gk/display-startup-time)					


;;UI "improvements".
(setq inhibit-startup-message t)
(setq ring-bell-function 'ignore)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)


;;General
(setq-default tab-width 2)
(setq make-backup-files nil) ;;Plis no more backups
(set-language-environment "UTF-8")

;;y or n instead of yes or no, everywhere
(fset 'yes-or-no-p 'y-or-n-p)

;;Setting up the package manager.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(require 'use-package)
;;If its the first time sourcing on other computer, refresh the repos.
(unless package-archive-contents
  (package-refresh-contents))

;;Use-package
(unless (package-installed-p 'use-package) ;;Unless you have use-package already,
                                           ;;install it
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;Set your default font and font size.
(set-face-attribute 'default nil :font "Dejavu Sans Mono" :height 120)


;;theme
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-palenight t))

;;No extra stuff in the config
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Completion Framework
(use-package vertico
  :init
  (vertico-mode))

;;(use-package evil
;;  :config
;;  (evil-mode 1)
;;  (define-key evil-insert-state-map (kbd "C-ψ") 'evil-normal-state)
;;  (define-key evil-insert-state-map (kbd "C-c") 'evil-normal-state)
;;  (define-key evil-normal-state-map (kbd "ξ") 'evil-next-line)
;;  (define-key evil-normal-state-map (kbd "κ") 'evil-previous-line)
;;  (define-key evil-normal-state-map (kbd "η") 'evil-backward-char)
;;  (define-key evil-normal-state-map (kbd "λ") 'evil-forward-char)
;;  (define-key evil-normal-state-map (kbd "λ") 'evil-forward-char)
;;  (define-key evil-normal-state-map (kbd "λ") 'evil-forward-char)
;;  (define-key evil-normal-state-map (kbd "λ") 'evil-forward-char))

;;Auto-completion
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  (corfu-auto-prefix 2)
  (corfu-auto-delay 0.0)
  :init
  (global-corfu-mode))

(use-package tex
  :ensure auctex)

(load "~/.emacs.d/lang.el") ;;Load the lang specific keybinds
(load "~/.emacs.d/keymaps.el");;Load all the keymaps
(load "~/.emacs.d/functions.el")
(load "~/.emacs.d/hooks.el");;Necessary hooks for each mode

;;After the init is loaded reset the threshold to a normal value
;;so that emacs doesn't eat your ram.
(setq gc-cons-threshold (* 2 1000 1000))
