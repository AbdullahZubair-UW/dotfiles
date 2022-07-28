(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(setq-default gac-automatically-push-p t)
(setq-default gac-automatically-add-new-files-p t)

(package-initialize)
(fset 'yes-or-no-p 'y-or-n-p)
(require 'use-package-ensure)

(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; (load-file "~/.emacs.d/themes/vivid-theme.el")

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


(load-theme 'vscode-dark-plus t)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("6c4c97a17fc7b6c8127df77252b2d694b74e917bab167e7d3b53c769a6abb6d6" "67f0f440afa2e68d9d00219b5a56308761af45832fb60769d2b2fd36e3fead45" "06e0662b31a2ae8da5c6b5e9a05b25fabd1dc8dd3c3661ac194201131cafb080" "d1527d35673f958d370d23096a266888771d68f5942be5377796d79ab2c9792f" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "654b365467a92ff70c70f4926974e07dcdb34805d2787c51710b467e695342e6" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "67b11ee5d10f1b5f7638035d1a38f77bca5797b5f5b21d16a20b5f0452cbeb46" "34c1b320a9d35318ca01660d533eee299d538f5a0c505c076511493b0a4f093d" "ff8be9ed2696bf7bc999423d909a603cb23a9525bb43135c0d256b0b9377c958" "4c56af497ddf0e30f65a7232a8ee21b3d62a8c332c6b268c81e9ea99b11da0d3" default))
 '(package-selected-packages
   '(lsp-latex laas company-auctex ggtags counsel-projectile projectile auctex moody lsp-jedi lsp-ui lsp-treemacs lsp-mode company-coq proof-general all-the-icons-ivy-rich ivy-rich yasnippet flycheck org-appear orgalist org-superstar org-contrib color-theme-modern solarized-theme color-theme key-chord evil-collection evil company-box all-the-icons company auto-compile avy counsel swiper org-bullets which-key try use-package))
 '(warning-suppress-types '((color-theme) (use-package) (comp) (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
