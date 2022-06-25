(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

;; Git-auto-commit stuff
(setq-default gac-automatically-push-p t)
(setq-default gac-automatically-add-new-files-p t)

;; Some settings to load before hand
(package-initialize)
(fset 'yes-or-no-p 'y-or-n-p)
(require 'use-package-ensure)
;; (load-theme 'solarized-light t)
(load-theme 'vscode-dark-plus t)
;; (electric-pair-mode 1)
;; (setq electric-pair-pairs '(
;;                             (?\" . ?\")
;;                             (?\{ . ?\})

;;                             ) )
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

(setq ring-bell-function 'ignore)

;; Package Stuff
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "34c1b320a9d35318ca01660d533eee299d538f5a0c505c076511493b0a4f093d" "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" default))
 '(package-selected-packages
   '(lsp-latex laas company-auctex ggtags counsel-projectile projectile auctex moody lsp-jedi lsp-ui lsp-treemacs lsp-mode company-coq proof-general all-the-icons-ivy-rich ivy-rich yasnippet flycheck org-appear orgalist org-superstar org-contrib color-theme-modern solarized-theme color-theme key-chord evil-collection evil company-box all-the-icons company auto-compile avy counsel swiper org-bullets which-key try use-package))
 '(warning-suppress-types '((color-theme) (use-package) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
