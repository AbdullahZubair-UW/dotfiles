(setq inhibit-startup-message t)
 (tool-bar-mode -1)
 (tool-bar-mode -1)

 (setq use-package-always-ensure t)

 (setq confirm-kill-emacs nil)
 (global-font-lock-mode t)

 (use-package auto-compile
   :config (auto-compile-on-load-mode))

 (setq load-prefer-newer t)

 (use-package try
   :ensure t)

 (use-package which-key
   :ensure t
   :config (which-key-mode))

(global-hl-line-mode t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode -1)

(set-window-scroll-bars (minibuffer-window) nil nil)
(setq frame-title-format '((:eval (projectile-project-name))))

(defun hrs/kill-current-buffer ()
"Kill the current buffer without prompting."
(interactive)
(kill-buffer (current-buffer)))

(global-set-key (kbd "C-x k") 'hrs/kill-current-buffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

(defun outer-bracket ()
  (interactive)
  (sp-up-sexp)
  (evil-append 1))

(defun my-shrink ()
  (interactive)
  (shrink-window-horizontally 22))

;; Keybindings
(defun sensible-defaults/bind-keys-to-change-text-size ()
    "Bind C-+ and C-- to increase and decrease text size,
respectively."
    (define-key global-map (kbd "C-)") 'sensible-defaults/reset-text-size)
    (define-key global-map (kbd "C-c") (make-sparse-keymap))
    (define-key global-map (kbd "C-+") 'text-scale-increase)
    (define-key global-map (kbd "C-=") 'text-scale-increase)
    ;; (define-key global-map (kbd "<f8>") 'compile)
    (define-key global-map (kbd "C-_") 'text-scale-decrease)
    (define-key global-map (kbd "C-c .") 'next-buffer)
    (define-key global-map (kbd "C-c ,") 'previous-buffer)
    (define-key c-mode-map (kbd "C-c C-s") 'my-shrink)
    (define-key global-map (kbd "C-c e") 'LaTeX-environment)
    (define-key c-mode-map (kbd "C-c C-c") 'compile)
    (define-key global-map (kbd "C-f") 'outer-bracket)
    (define-key global-map (kbd "C--") 'text-scale-decrease))

(defun sensible-defaults/use-all-keybindings ()
    "Use all of the sensible-defaults keybindings."
    (sensible-defaults/bind-keys-to-change-text-size))

(sensible-defaults/use-all-keybindings)

(use-package undo-tree)

(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package browse-kill-ring
    :bind ("C-x C-y" . browse-kill-ring))

(use-package recentf
    :bind ("C-x C-r" . counsel-recentf)
    :init
    (recentf-mode t)
    (setq recentf-max-saved-items 100))

(use-package dumb-jump
  :config
  (add-hook 'xref-backend-functions #'dumb-jump-xref-activate))

(use-package ivy-xref
  :init
  (setq xref-show-definitions-function #'ivy-xref-show-defs))

(use-package let-alist)

(use-package vscode-dark-plus-theme)
(use-package color-theme-modern)
(use-package solarized-theme)
(use-package monokai-pro-theme)
(use-package gruvbox)

;; Org-Mode Stuff
(use-package org)
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)
			     (flyspell-mode 1))))

(setq indo-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-src-window-setup 'current-window)

(use-package org-superstar
:config
(setq org-superstar-special-todo-items t)
(setq org-hide-leading-stars t)
(add-hook 'org-mode-hook (lambda ()
			   (org-superstar-mode 1))))

;; LaTeX
(use-package tex
    :ensure auctex)


(use-package company-auctex)

(add-hook 'LaTeX-mode-hook 'add-my-latex-environments)
(defun add-my-latex-environments ()
  (LaTeX-add-environments
   '("defn")
   '("rem")))

(use-package laas
  :hook (LaTeX-mode . laas-mode)
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
		    ;; set condition!
		    "mk" (lambda () (interactive) (yas-expand-snippet "$$1$$0"))
		    "dt" (lambda () (interactive) (yas-expand-snippet "^{$1}$0"))
		    :cond #'texmathp ; expand only while in math
		    "Span" (lambda () (interactive) (yas-expand-snippet "\\Span($1)$0"))))

(use-package aas
    :hook (LaTeX-mode . aas-activate-for-major-mode)
    :hook (org-mode . aas-activate-for-major-mode))

;; Rainbow-Stuff
(add-hook 'LaTeX-mode-hook #'rainbow-delimiters-mode)

(defun LaTeX-save-and-compile ()
    "Save and compile the tex project using latexmk.
If compilation fails, split the current window and open error-buffer
then jump to the error line, if errors corrected, close the error-buffer
window and close the *TeX help* buffer."
    (interactive)
    (progn
	;; ;; turn off smartparens because LaTeX-electric-left-right-brace
	;; ;; offers more for specific LaTeX mode
	;; ;; Since SP is always triggered later by sth., so put these two lines here
	(turn-off-smartparens-mode)
	(setq LaTeX-electric-left-right-brace t)
	(let ((TeX-save-query nil)
		    (TeX-process-asynchronous nil)
		    (master-file (TeX-master-file)))
	    (TeX-save-document "")
	    ;; clean all generated files before compile
	    ;; DO NOT do it when up-to-date, remove this line in proper time
	    (TeX-clean t)
	    (TeX-run-TeX "latexmk"
				    (TeX-command-expand "latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf %s")
				    master-file)
	    (if (plist-get TeX-error-report-switches (intern master-file))
		    ;; avoid creating multiple windows to show the *TeX Help* error buffer
		    (if (get-buffer-window (get-buffer "*TeX Help*"))
			    (TeX-next-error)
			(progn
			    (split-window-vertically -10)
			    (TeX-next-error)))
		;; if no errors, delete *TeX Help* window and buffer
		(if (get-buffer "*TeX Help*")
			(progn
			    (if (get-buffer-window (get-buffer "*TeX Help*"))
				    (delete-windows-on "*TeX Help*"))
			    (kill-buffer "*TeX Help*")))))))

(defun LaTeX-indent-item ()
    "Provide proper indentation for LaTeX \"itemize\",\"enumerate\", and
\"description\" environments.

    \"\\item\" is indented `LaTeX-indent-level' spaces relative to
    the the beginning of the environment.

    Continuation lines are indented either twice
    `LaTeX-indent-level', or `LaTeX-indent-level-item-continuation'
    if the latter is bound."
    (save-match-data
    (let* ((offset LaTeX-indent-level)
	    (contin (or (and (boundp 'LaTeX-indent-level-item-continuation)
			    LaTeX-indent-level-item-continuation)
			(* 2 LaTeX-indent-level)))
	    (re-beg "\\\\begin{")
	    (re-end "\\\\end{")
	    (re-env "\\(itemize\\|\\enumerate\\|description\\)")
	    (indent (save-excursion
		    (when (looking-at (concat re-beg re-env "}"))
			(end-of-line))
		    (LaTeX-find-matching-begin)
		    (current-column))))
	(cond ((looking-at (concat re-beg re-env "}"))
	    (or (save-excursion
		    (beginning-of-line)
		    (ignore-errors
		    (LaTeX-find-matching-begin)
		    (+ (current-column)
			(if (looking-at (concat re-beg re-env "}"))
			    contin
			    offset))))
		indent))
	    ((looking-at (concat re-end re-env "}"))
		indent)
	    ((looking-at "\\\\item")
	    (+ offset indent))
	    (t
	    (+ contin indent))))))

(defcustom LaTeX-indent-level-item-continuation 5
    "*Indentation of continuation lines for items in itemize-like
environments."
    :group 'LaTeX-indentation
    :type 'integer)

(eval-after-load "latex"
    '(setq LaTeX-indent-environment-list
	(nconc '(("itemize" LaTeX-indent-item)
		    ("enumerate" LaTeX-indent-item)
		    ("description" LaTeX-indent-item))
		LaTeX-indent-environment-list)))

(add-hook 'LaTeX-mode-hook
		  (lambda ()
			(setq LaTeX-item-indent 0)
			(visual-line-mode)
			(flyspell-mode)
			(setq fill-column 125)
			;; make the code look like the pdf file, C-c C-o ... for commands
			;; If it should be activated in all AUCTEX modes, use TeX-mode-hook
			;; instead of LaTeX-mode-hook.
			(TeX-fold-mode 1)
			;; usepackage
			(setq tex-tree-roots t)
			(LaTeX-math-mode)
			;; this line have to be here to make company work
			(company-auctex-init)
			;; disable smartparens-mode completely and use
			;; LaTeX-electric-left-right-brace instea
			(setq LaTeX-electric-left-right-brace t)
			;; the following line will inset braces after _ or ^
			;; unnecessarily most of time
			;; (setq TeX-electric-sub-and-superscript t)
			;; NOTE: C-c C-a to combine C-c C-c and C-c C-v
			;; C-u C-c C-c latexmk (or others like View) so you can change the command line
			;; jump: the following makes viewing the pdf right at the line of the tex file
			(add-to-list 'TeX-command-list
						 '("latexmk" "latexmk -pdflatex='pdflatex -file-line-error -synctex=1' -pdf %s"
						   TeX-run-command nil t :help "Run latexmk") t)
			(setq TeX-command-default "latexmk")
			(push '("%(masterdir)" (lambda nil (file-truename (TeX-master-directory))))
				  TeX-expand-list)
			(push "Zathura"
				  TeX-view-program-list)
			(push '(output-pdf "Zathura") TeX-view-program-selection)
			(TeX-source-correlate-mode)
			(server-force-delete)  ;; WARNING: Kills any existing edit server
			(setq TeX-source-correlate-method 'synctex
				  TeX-source-correlate-start-server t)
			;;
			(bind-keys :map LaTeX-mode-map
					   ;; default C-c C-e rebound and cannot be rebound
					   ("C-c C-x e" . LaTeX-environment)
					   ("C-c C-x s" . LaTeX-section)
					   ("C-c C-x m" . TeX-insert-macro)
					   ("C-x C-s" . LaTeX-save-and-compile)
					   ;; default C-c. not working and replaced by org-time-stamp
					   ("C-c m" . LaTeX-mark-environment)
					   ;; ("<tab>" . TeX-complete-symbol)
					   ;; ("M-<return>" . LaTeX-insert-item)
					   )))
(setq LaTeX-command-section-level t)
;; C-c C-c without prompt, use Clean by default, to clean aux and log files
;; Use "Clean All" to clean files including generated pdf file
;; Or use M-x Tex-clean (Clean) and prefix(Clean All)
;; (setq TeX-command-force "Clean")
(setq TeX-clean-confirm nil)
;; RefTex -- built-in
;; Turn on RefTeX in AUCTeX
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; Activate nice interface between RefTeX and AUCTeX
(setq reftex-plug-into-AUCTeX t)
;; magic-latex-buffer
;; (require 'magic-latex-buffer)
;; (add-hook 'LaTeX-mode-hook 'magic-latex-buffer)
;; latex-preview-pane
;; (add-hook 'LaTeX-mode-hook 'latex-preview-pane-mode)
(setq
 ;; Function for reading \includegraphics files
 LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative
 ;; Strip known extensions from image file name
 LaTeX-includegraphics-strip-extension-flag nil)
;; (setq LaTeX-section-hook
;;		  '(LaTeX-section-heading
;;			LaTeX-section-title
;;			LaTeX-section-toc
;;			LaTeX-section-section
;;			LaTeX-section-label))
(eval-after-load "proof-script" '(progn
				   (define-key proof-mode-map [(control n)] 
				     'proof-assert-next-command-interactive)
				   (define-key proof-mode-map [(control b)] 
				     'proof-undo-last-successful-command)
				   ))

;; Swiper (Searching)

(use-package counsel
    :bind (("C-h f" . counsel-describe-function)
	   ("C-h v" . counsel-describe-variable)
	   ("M-i" . counsel-imenu)
	   :map read-expression-map
	   ("C-r" . counsel-expression-history)))

  (use-package ivy
    :ensure t
    :diminish (ivy-mode)
    :bind (("C-x b" . ivy-switch-buffer))
    :config
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "%d/%d ")
    (setq ivy-display-style 'fancy))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :init
  (all-the-icons-ivy-rich-mode 1))


  (use-package swiper
    :ensure t
    :config
    (progn
      (ivy-mode)
      (setq ivy-use-virtual-buffers t)
      (setq enable-recursive-minibuffers t)
      ;; enable this if you want `swiper' to use it
      ;; (setq search-default-mode #'char-fold-to-regexp)
      (global-set-key (kbd "C-c s") 'swiper)
      (global-set-key (kbd "C-c C-r") 'ivy-resume)
      (global-set-key (kbd "<f6>") 'ivy-resume)
      (global-set-key (kbd "M-x") 'counsel-M-x)
      (global-set-key (kbd "C-x C-f") 'counsel-find-file)
      (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)))

;; Avy (Navigation)
(use-package avy
  :ensure t
  :bind ("C-'" . 'avy-goto-char-2))

;; company
(use-package company
  :hook (prog-mode . company-mode)
  :bind (:map company-active-map
	      ("<tab>" . company-complete-selection))

  :custom
  (company-backends '((texlab company-capf company-dabbrev-code)))
  (company-idle-delay 0)
  (company-minimum-prefix-length 3)
  (company-tooltip-align-annotations t)
  (company-tooltip-limit 20)

  :config
  (setq lsp-completion-provider :capf)
  (global-company-mode t))

(use-package all-the-icons)
(use-package company-box
  :after company
  :hook (company-mode . company-box-mode)

  :config
  (setq company-box-icons-alist 'company-box-icons-all-the-icons))

(use-package company-dict)
(setq company-dict-dir (concat user-emacs-directory "/usr/share/dict"))
(add-to-list 'company-backends 'company-dict)

(use-package autocomplete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete mode t)))

;; Vim/Evil-Mode
(use-package evil
  :init
  (setq evil-want-abbrev-expand-on-insert-exit nil
	evil-want-keybinding nil)

  :config
  (evil-mode 1)
  (evil-define-key 'normal org-mode-map (kbd "TAB") 'org-cycle)
  (define-key evil-normal-state-map (kbd "C-f") 'outer-bracket)
  (fset 'evil-visual-update-x-selection 'ignore))

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list
	'(deadgrep
	  dired
	  ibuffer
	  magit
	  mu4e
	  pdf-view
	  which-key))

  (evil-collection-init))

(use-package evil-leader
  :config
  (evil-leader/set-leader "<SPC>"))

(use-package evil-nerd-commenter)
(global-evil-leader-mode)

(evil-leader/set-key
  "f" 'find-file
  "b" 'switch-to-buffer
  "k" 'kill-buffer
  "gl" 'evilnc-comment-or-uncomment-lines
  "gp" 'evilnc-comment-or-uncomment-paragraphs
  "gc" 'comment-or-uncomment-region
  )

(use-package key-chord
    :config
    (key-chord-mode 1)
    (key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)
)

  ;; Font
  (set-face-attribute 'default nil :font "Source Code Pro" :height 120)

(use-package let-alist)
(use-package flycheck
  :init (global-flycheck-mode))

(use-package flyspell-correct
  :ensure t
  :after flyspell
  :bind (:map flyspell-mode-map ("C-s" . flyspell-correct-wrapper)))

(use-package flyspell-correct-ivy
  :ensure t
  :after flyspell-correct)

(use-package yasnippet
  :config
  (setq yas-indent-line 'auto)
  :init
  (yas-global-mode 1)
  :bind (("C-l" . 'yas-next-field-or-maybe-expand)))

(use-package proof-general)
(use-package company-coq)

(add-hook 'coq-mode-hook
	  (lambda ()
	    (company-coq-mode)
	    (abbrev-mode 0)))

(setq proof-three-window-mode-policy 'hybrid)
(setq  proof-shrink-windows-tofit t)
(setq proof-splash-enable nil)

;; set prefix for lsp-command-keymap (few alternatives - "s-l", "C-l")
  (setq lsp-keymap-prefix "C-c l")
  ;; (setq company-clang-executable "/usr/bin/clangd-10")
  ;; (setq lsp-clients-clangd-executable "/usr/bin/clangd-10")



  (use-package lsp-mode
    :ensure t
    :commands lsp
    :hook ((LaTeX-mode c-mode c++-mode  python-mode) . lsp)
    )

  (use-package lsp-treemacs :ensure t)
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'cpp-mode-hook 'lsp)
  (setq lsp-tex-server 'digestif)
  (setq lsp-enabled-clients '(jedi clangd))
  (use-package lsp-ui
  :ensure t
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq lsp-ui-sideline-enable t)
    (setq lsp-ui-sideline-show-hover nil)
    (setq lsp-ui-doc-position 'bottom)
;; lsp config stuff
    (setq lsp-enable-links nil)
    (setq lsp-signature-render-documentation nil)
    (setq lsp-headerline-breadcrumb-enable nil)
    (setq lsp-ui-doc-enable nil)
    (setq lsp-completion-enable-additional-text-edit nil)
    (setq web-mode-enable-current-element-highlight t)
	(lsp-ui-doc-show))


  (use-package lsp-jedi
    :ensure t
    :config
    (with-eval-after-load "lsp-mode"
      (add-to-list 'lsp-disabled-clients 'pyls)
      (add-to-list 'lsp-enabled-clients 'jedi)))

  (setq lsp-ui-doc-show-with-cursor nil)

  ;; (use-package dap-mode
  ;;   :ensure t
  ;;   :hook (lsp-mode . dap-mode)
  ;;   :config
  ;;   (dap-ui-mode 1)
  ;;   (dap-tooltip-mode 1)
  ;;   (require 'dap-node)
  ;;   (dap-node-setup))

  ;; (dap-auto-configure-mode)
  ;; (require 'dap-gdb-lldb)
  ;;  (require 'dap-cpptools)
  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/

(use-package moody
  :config
  (setq x-underline-at-descent-line t)
  (moody-replace-mode-line-buffer-identification)
  (moody-replace-vc-mode))

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

(use-package counsel-projectile
  :config
  (counsel-projectile-on))

(add-hook 'c-mode-commmon-hook #'rainbow-delimiters-mode)
(add-hook 'c-mode-hook 'smartparens-mode)
(add-hook 'c++-mode-hook 'smartparens-mode)

(setq special-display-buffer-names
  '("*compilation*"))

(setq special-display-function
      (lambda (buffer &optional args)
	      (split-window-horizontally)
	      (other-window -1)
	      (switch-to-buffer buffer)))

(setq compile1 "clang -std=c99 -fsanitize=address -fno-omit-frame-pointer main.c lame-robot.ll -o main && ./main")
(setq compile2 "make test")

(defun my-compile ()
  (interactive)
  (save-buffer)
  (set (make-local-variable 'compile-command)
	 (format compile2 (shell-quote-argument (buffer-name))))
  (compile compile-command)
  (shrink-window-horizontally 13)
  )

;; (define-key global-map (kbd "<f7>") 'my-compile)
(global-set-key (kbd "<f8>") 'my-compile)

(with-eval-after-load 'compile
  (define-key compilation-mode-map (kbd "C-c C-c") 'compile))

;; Code-Folding
(use-package hideshow
  :hook ((prog-mode . hs-minor-mode)))

(defun toggle-fold ()
  (interactive)
  (save-excursion
    (end-of-line)
    (hs-toggle-hiding)))

(global-set-key (kbd "C-c C-f") 'toggle-fold)

;; SmartParens
(use-package smartparens)

(use-package smartparens-config
  :ensure smartparens
  :config (progn (show-smartparens-global-mode t)))

(add-hook 'prog-mode-hook 'git-auto-commit-mode)

(use-package crux)
(global-set-key (kbd "C-c k") #'crux-kill-other-buffers)

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)
(global-set-key (kbd "C-c i") #'crux-ispell-word-then-abbrev)

(use-package fd-dired)

(use-package ivy-dired-history)

(require 'savehist)
(add-to-list 'savehist-additional-variables 'ivy-dired-history-variable)
(savehist-mode 1)
;; or if you use desktop-save-mode
;; (add-to-list 'desktop-globals-to-save 'ivy-dired-history-variable)

(add-hook 'dired-mode-hook 'auto-revert-mode)


(with-eval-after-load 'dired
  (require 'ivy-dired-history)
  ;; if you are using ido,you'd better disable ido for dired
  ;; (define-key (cdr ido-minor-mode-map-entry) [remap dired] nil) ;in ido-setup-hook
  (define-key dired-mode-map "," 'dired))

(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-c g" . magit-status)
	 :map magit-status-mode-map
	 ("TAB" . magit-section-toggle)
	 ("<C-tab>" . magit-section-cycle)
	 :map magit-branch-section-map
	 ("RET" . magit-checkout)))

(use-package git-auto-commit-mode
  :config
  (setq-default gac-automatically-push-p t)
  (setq-default gac-automatically-add-new-files-p t))
