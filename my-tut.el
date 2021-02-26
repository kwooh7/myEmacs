(setq inhibit-startup-message t)

;; 俑앹뼔六ｆ琉놁�쐩 饔앸슔嫄ラ턁�뼔六� 癲띿슙�뜽俑앹뼔六ㅼ�� 傭�諛닿��俑앹뼚苑묈�뒙餓쪎 饔앸슔嫄ラ턁�뼔六ｈ퐴�슦�뤅俑앹떞留� 癲띿슙�돭癲띿슜瑗띌턁�떝�렰傭�諛멸도 劣눀�몭琯竊숅�앓띕눀�젆�.
(setq utf-translate-cjk-mode nil)
;; UTF-8 俑앹떞留잓땡諭��젳癲ル슢�뀈泳�怨멱린�
(set-language-environment 'utf-8)
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
;; 傭�諛몄춶劣눀筌앷엥竊숇裕� 癲띿슜瑗띌�눇�뙼�뿫�쑋凹덩應㎥堯빝膺뒧�뇡痢� 癲ル슢�뀈泳���뛾�� 饔쓬�癰궑�뇡痢⑵퐴�슢肄�劣쨬�� utf-8諺뒙餓쪎 傭�諛몃뜲�瞬쳛鴉딅끽��뫗 劣눀瞬돌癲ル솛� 俑앹뼔γ깷竊숋쭗�뱷苡쵖�諺뒙餓쪎, �뙶節딅춼岳됰렓鵝얠쑅�뇺�뀪劣눀�뤃� 傭�諛몃뜲�눢턀隅껀佾폇應윝傭�諛멸도 utf-8 諺뒙餓쪎 饔앸슢�봼癲ル솛� 俑앹뼔γ깺�눀獒뺣맚�눀�젆�.
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(setq system-time-locale "C")

(setq custom-file (concat user-emacs-directory "/custom.el"))

(set-face-attribute 'default nil :family "Hack NF" :height 110)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(global-hl-line-mode +1)

(delete-selection-mode 1)



(setq visible-bell nil
    ring-bell-function 'flash-mode-line)
(defun flash-mode-line ()
 (invert-face 'mode-line)
 (run-with-timer 0.1 nil #'invert-face 'mode-line))

(setq-default cursor-type 'bar)
(set-cursor-color "#ffffff")
(display-time-mode 1)

(use-package doom-themes
:ensure t
:config (load-theme 'doom-one t))

(use-package doom-modeline
  :ensure t
  :config
  (setq doom-modeline-height 30
      doom-modeline-window-width-limit 100
      doom-modeline-buffer-file-name-style 'truncate-upto-root
      doom-modeline-icon t
      doom-modeline-major-mode-icon t)
  (column-number-mode t)
    :hook (after-init . doom-modeline-mode))

 (use-package all-the-icons
   :ensure t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)
(use-package which-key
 :ensure t
 :config (which-key-mode))

(use-package dashboard
  :ensure t
  :init
  (progn
    (setq dashboard-items '((recents . 5)
			 (projects . 2)))
    (setq dashboard-show-shortcuts t)
    (setq dashboard-center-content t)
    (setq dashboard-banner-logo-title "Welcome to Emacs!!!")
    (setq dashboard-set-file-icons t)
    (setq dashboard-set-heading-icons t)
    (setq dashboard-navigator t)
    (setq dashboard-navigator-buttons
      `(
	((, nil
           "init file"
           "Open init file"
             (lambda (&rest _) (find-file "~/.emacs.d/my-tut.org"))
            )))))
   :config
     (dashboard-setup-startup-hook))

(use-package rainbow-delimiters
  :ensure t):
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(use-package org
  :ensure t)

(use-package org-bullets
  :ensure t)

(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'orge-mode
			'(("^+\\([-*]) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))








(use-package helm
  :ensure t
  :bind (
	 ("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b" . helm-buffers-list)
	 )
  :init
  (setq helm-M-x-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-display-header-line nil)
  :config
  (helm-mode 1)
  (helm-autoresize-mode 1)
  (add-to-list 'helm-completing-read-handlers-alist '(find-file . helm-completing-read-symbols)))




(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))

(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))



(use-package neotree
  :ensure t)
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)

;; company mode
(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0.2)
  (setq company-show-numbers "on"))



(use-package expand-region
  :ensure t
  :bind
    ("C-=" . er/expand-reqion)
    ("C--" . er/contract-region))

;; ruby package
(use-package ruby-mode
  :init
  (setq ruby-insert-encoding-magic-comment nil))

;; elixir package
(use-package elixir-mode
  :ensure t)

(use-package python-mode
  :ensure t)

(use-package go-mode
  :ensure t)
(use-package rust-mode
 
  :ensure t)
  
;; Faster startup: adjusting the frequench of garbage collection
(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)
