(setq inhibit-splash-screen t)
(set-frame-font "DejaVu Sans Mono-9" nil t)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; Auto-install packages, hurray!
(dolist (p '(better-defaults cider clojure-mode elpy paredit rainbow-delimiters))
  (when (not (member p package-activated-list))
    (list-packages)
    (package-install p)))

;; Clojure
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)
(setq cider-repl-display-in-current-window t)



;; Python
(elpy-enable)
