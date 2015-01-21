(setq inhibit-splash-screen t)
(set-frame-font "DejaVu Sans Mono-9" nil t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Auto-install packages, hurray!
(defvar packages
  '(better-defaults ido-hacks smex elpy
    cider clojure-mode paredit rainbow-delimiters))

(dolist (p packages)
  (when (not (member p package-activated-list))
    (package-refresh-contents)
    (package-install p)))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; The old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq cider-repl-display-in-current-window t)

;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

;; Python
(elpy-enable)
