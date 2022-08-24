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
(setq doom-theme 'gruber-darker)

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
(global-set-key (kbd "M-'") 'shell-command)
(global-set-key (kbd "TAB") 'indent-for-tab-command)

;; Treemacs
(setq doom-themes-treemacs-theme "doom-colors")
(treemacs-resize-icons 18)

;; Ivy Posframe
(ivy-posframe-mode 1)

;; Wakatime
(global-wakatime-mode)

;; LSP
(after! lsp-semantic-tokens
  (defface lsp-face-semhl-attribute
    '((t :inherit font-lock-comment-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-boolean
    '((t :inherit font-lock-constant-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-builtin-type
    '((t :inherit font-lock-type-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-lifetime
    '((t :inherit font-lock-type-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-keyword-self
    '((t :inherit font-lock-keyword-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-type-alias
    '((t :inherit font-lock-type-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-union
    '((t :inherit font-lock-type-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-unresolved-reference
    '((t :inherit font-lock-warning-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-rust-format-specifier
    '((t :inherit font-lock-variable-name-face))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-punctuation
    '((t))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-parenthesis
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-bracket
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-brace
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-angle
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-comma
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-colon
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-semicolon
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (defface lsp-face-semhl-dot
    '((t :inherit lsp-face-semhl-punctuation))
    "." :group 'lsp-faces)
  (setq lsp-semantic-token-faces
        (append lsp-semantic-token-faces
                '(("method" . lsp-face-semhl-method)
                  ("attribute" . lsp-face-semhl-attribute)
                  ("boolean" . lsp-face-semhl-boolean)
                  ("builtinType" . lsp-face-semhl-builtin-type)
                  ("lifetime" . lsp-face-semhl-lifetime)
                  ("selfKeyword" . lsp-face-semhl-keyword-self)
                  ("typeAlias" . lsp-face-semhl-type-alias)
                  ("union" . lsp-face-semhl-union)
                  ("unresolvedReference" . lsp-face-semhl-unresolved-reference)
                  ("formatSpecifier" . lsp-face-semhl-rust-format-specifier)
                  ("punctuation" . lsp-face-semhl-punctuation)
                  ("parenthesis" . lsp-face-semhl-parenthesis)
                  ("bracket" . lsp-face-semhl-bracket)
                  ("brace" . lsp-face-semhl-brace)
                  ("angle" . lsp-face-semhl-angle)
                  ("comma" . lsp-face-semhl-comma)
                  ("colon" . lsp-face-semhl-colon)
                  ("semicolon" . lsp-face-semhl-semicolon)
                  ("dot" . lsp-face-semhl-dot))))
  (face-spec-set 'lsp-face-semhl-enum '((t :inherit font-lock-type-face)))
  (defface lsp-face-semhl-declaration
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-mutable
    '((t :underline t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-rust-attribute-element
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-rust-constant
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-control-flow
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-unsafe
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-consuming
    '((t)) "." :group 'lsp-faces)
  (defface lsp-face-semhl-callable
    '((t)) "." :group 'lsp-faces)
  (setq lsp-semantic-token-modifier-faces
        '(("declaration" . lsp-face-semhl-declaration)
          ("deprecated" . lsp-face-semhl-deprecated)
          ("readonly" . lsp-face-semhl-constant)
          ("mutable" . lsp-face-semhl-mutable)
          ("attribute" . lsp-face-semhl-rust-attribute-element)
          ("constant" . lsp-face-semhl-rust-constant)
          ("controlFlow" . lsp-face-semhl-control-flow)
          ("unsafe" . lsp-face-semhl-unsafe)
          ("consuming" . lsp-face-semhl-consuming)
          ("callable" . lsp-face-semhl-callable))))

;; Font
(set-face-attribute 'default nil :font "Iosevka" :height 120)

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

;; Org
(define-key global-map (kbd "C-c c") 'org-capture)
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/Documents/org/todo.org" "Tasks")
         "* TODO [#A] %?")))

;; Rust
(remove-hook! rust-mode-hook #'racer-mode #'eldoc-mode)
(remove-hook! rustic-mode-hook #'racer-mode #'eldoc-mode)
(remove-hook! rustic-mode-local-vars-hook #'racer-mode)
(remove-hook! hack-local-variables-hook #'racer-mode)

; Analyzer
(setq lsp-rust-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-command '("env" "RA_LOG=error,rust_analyzer::config" "RA_PROFILE=*>400" "RUST_BACKTRACE=1" "rust-analyzer"))
(setq lsp-rust-analyzer-completion-add-call-argument-snippets nil)
(setq lsp-rust-analyzer-call-info-full nil)
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-parameter-hints t)
(setq lsp-rust-analyzer-proc-macro-enable t)
(setq lsp-rust-analyzer-cargo-run-build-scripts t)
(setq lsp-rust-analyzer-max-inlay-hint-length 20)

(defadvice! lsp-rust-analyzer-additional-options (fun)
  :around 'lsp-rust-analyzer--make-init-options
  (let ((opts (funcall fun)))
    (append opts '(:experimental (:procAttrMacros t)))))
