;;; package --- Summary
(require 'package)
(require 'use-package)

;; Add MELPA repository for additional packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq package-install-upgrade-built-in t)

;; INTERFACE: change the visual style and the management of the interface

;; Setup visual theme
(load-theme 'modus-operandi)

;; Setup font
(set-frame-font "FiraCode 11" nil t)

;; Setup vertico for improved search interface
(use-package vertico
  :ensure t
  :init (vertico-mode))

;; Setup marginalia for additional informations in minibuffer
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init (marginalia-mode))



;; PROGRAMMING: setup all main programming languages

;; Set spaces instead of tabs:
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; Syntax Highlighting with flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  (global-flycheck-annotate-mode)
  :config
  ;; Report Eglot's LSP diagnostics through Flycheck
  (global-flycheck-eglot-mode 1))

;; Auto completion with company-mode
(use-package company
  :ensure t
  :hook (after-init-hook . global-company-mode))

;; Git: install magit for git management
(use-package magit
  :ensure t)

;; Web development
(use-package web-mode
  :ensure t
  :mode
   (("\\.phtml\\'" . web-mode)
   ("\\.php\\'" . web-mode)
   ("\\.tpl\\'" . web-mode)
   ("\\.[agj]sp\\'" . web-mode)
   ("\\.as[cp]x\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.njk\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)))


;; Markdown writing
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do)))

;; Rocq development
(use-package proof-general
  :ensure t)

(use-package company-coq
  :ensure t
  :hook (coq-mode . company-coq-mode))

;; Lean development
(setq exec-path (append exec-path '("~/.elan/env"))) ;; Add local bin for emac functions
(use-package nael
  :ensure t
  :hook (nael-mode . abbrev-mode) (nael-mode . eglot-ensure) (nael-mode . (lambda () (prettify-symbols-mode))))

;; Rust development
(use-package rust-mode
  :ensure t
  :hook ((rust-mode . eglot-ensure) (rust-mode . (lambda () (prettify-symbols-mode))))
  :init (setq rust-mode-treesitter-derive t))


;; Haskell: add haskell mode to code haskell code
(setq exec-path (append exec-path '("~/.ghcup/bin"))) ;; Add local bin for emac functions

(use-package haskell-mode
  :ensure t)

;; Typst: setup to work with typst documents

;; LSP: for the moment I will use the lighter eglot, will see if I need the beefier lsp-mode
(use-package eglot
  :ensure t
  :config
  (add-hook 'haskell-mode-hook 'eglot-ensure)
  :config
    (setq-default eglot-workspace-configuration
                '(:haskell (:plugin (:stan (:globalOn :json-false))
                            :formattingProvider "fourmolu")))
  :custom
  (eglot-autoshutdown t)
  (eglot-confirm-server-initiated-edits nil)
  )


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(eglot-confirm-server-edits nil nil nil "Customized with use-package eglot")
 '(package-selected-packages
   '(company-coq consult flycheck haskell-mode magit marginalia
                 markdown-mode nael proof-general rust-mode vertico
                 web-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
