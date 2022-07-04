;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Tilzem"
      user-mail-address "tilzen@protonmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; set org directory
(setq org-directory "~/Documents/org/")

;; Keymaps
(cua-mode +1)

(define-key evil-insert-state-map (kbd "C-c") (lambda () (interactive) (cua-copy-region nil)))
(define-key evil-insert-state-map (kbd "C-v") (lambda () (interactive) (cua-paste nil)))
(define-key evil-insert-state-map (kbd "C-x") (lambda () (interactive) (cua-cut-region nil)))
(define-key evil-insert-state-map (kbd "C-f") (lambda () (interactive) (isearch-forward-regexp nil)))
(define-key evil-insert-state-map (kbd "C-z") 'evil-undo)
(define-key evil-insert-state-map (kbd "C-y") 'evil-redo)
(define-key evil-insert-state-map (kbd "C-a") 'mark-whole-buffer)

(setq cua-keep-region-after-copy t)

;; Keybindings
(global-set-key (kbd "C-s") 'evil-write)
(global-set-key (kbd "C-v") 'cua-paste)
(global-set-key (kbd "C-\\") 'treemacs)
(global-set-key (kbd "C-<up>") 'windmove-up)
(global-set-key (kbd "C-<down>") 'windmove-down)
(global-set-key (kbd "C-<right>") 'windmove-right)
(global-set-key (kbd "C-<left>") 'windmove-left)
(global-set-key (kbd "M-x") 'ivy-posframe)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-S-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-'") '+vterm/toggle)


;; Treemacs
(setq doom-themes-treemacs-theme "doom-colors")
(treemacs-resize-icons 18)

;; Ivy Posframe
(ivy-posframe-mode 1)

;; Font
(set-face-attribute 'default nil :font "Iosevka" :height 110)

;; Cursor
(setq evil-insert-state-cursor '((bar . 1) "white")
      evil-normal-state-cursor '(box "white"))

;; Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(97 50))
;; (add-to-list 'default-frame-alist '(alpha 97 50))

;; Editor column limit
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)

;; Doom Themes
(setq doom-themes-enable-bold nil)

;; Themes by Language
(defun set-theme-on-mode ()
  (interactive)
  (let* (($bfn (buffer-file-name))
         ($fileNameExt (if $bfn (file-name-extension $bfn) nil)))

    (cond ((not $fileNameExt) nil)

          ((string-equal $fileNameExt "el")
           (progn (load-theme 'doom-one)))
          ((string-equal $fileNameExt "txt")
           (progn (load-theme 'nord-light)))

          ;; JS/TS
          ((string-equal $fileNameExt "js")
           (progn (load-theme 'doom-tokyo-night t)))

          ((string-equal $fileNameExt "jsx")
           (progn (load-theme 'doom-tokyo-night t)))

          ((string-equal $fileNameExt "ts")
           (progn (load-theme 'doom-tokyo-night t)))

          ((string-equal $fileNameExt "tsx")
           (progn (load-theme 'doom-tokyo-night t)))

          ;; Rust
          ((string-equal $fileNameExt "rs")
           (progn (load-theme 'doom-zenburn t)))

          ;; Go
          ((string-equal $fileNameExt "go")
           (progn (load-theme 'doom-zenburn t)))

          ;; C/C++
          ((string-equal $fileNameExt "c")
           (progn (load-theme 'doom-Iosvkem t)))

          ((string-equal $fileNameExt "h")
           (progn (load-theme 'doom-Iosvkem t)))

          ((string-equal $fileNameExt "cc")
           (progn (load-theme 'doom-Iosvkem t)))

          ;; Elixir
          ((string-equal $fileNameExt "ex")
           (progn (load-theme 'doom-horizon t)))

          ((string-equal $fileNameExt "exs")
           (progn (load-theme 'doom-horizon t)))
          (t nil))))

(add-hook 'find-file-hook 'set-theme-on-mode)
(add-hook 'kill-buffer-hook 'set-theme-on-mode)
