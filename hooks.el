;;; -*- lexical-binding: t; -*-

;;Set proper C indentation
(setq-default c-basic-offset 4
  tab-width 4
  indent-tabs-mode nil)

(add-hook 'c-mode-hook '(λ () (setq compile-command "gcc % -lm && ./a.out")))

;;Set proper python indentation

(add-hook 'python-mode-hook
	 (lambda ()
	   (setq-default tab-width 4)))

;;Set necessary packages and hooks for tex
(add-hook 'plain-TeX-mode-hook 'LaTeX-mode)
