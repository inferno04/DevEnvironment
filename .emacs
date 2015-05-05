;; ###########################################################################
;; # Emacs Configuration File                                                #
;; # Erik Ginter                                                             #
;; #=========================================================================#
;; #                                                                         #
;; # My personal Emacs configuration, piecemealed from                       #
;; #   Dr. Gary Zoppetti's ( gzoppetti ) '.emacs' file and                   #
;; #   Dan Rabiega's ( drabiega ) 'awesome-emacs-config/init.el'             #
;; #                                                                         #
;; ###########################################################################

;; ###########################################################################
;; # General                                                                 #
;; #=========================================================================#
;; #                                                                         #
;; # Features that aid in editing, or just preferences                       #
;; #                                                                         #
;; ###########################################################################

  ;; Don't show the splash on startup
  ;;==================================
  ( setq inhibit-splash-screen t )

  ;; Ensure text files have a newline after the last character
  ;;===========================================================
  ( setq require-final-newline t )

  ;; Turn on column numbering
  ;;==========================
  ( column-number-mode 1 )

  ;; Turn off the toolbar
  ;;======================
  ( tool-bar-mode nil )

  ;; Turn on paren matching
  ;;========================
  ( show-paren-mode 1 )

  ;; Don't indent C blocks
  ;;=======================
  ;; if ( condition )
  ;; {
  ;;   // body
  ;; }
  ( c-set-offset 'substatement-open 0 )

;; ############################################################################
;; # Convenience Packages                                                     #
;; #==========================================================================#
;; #                                                                          #
;; # Add MELPA packages to the package manager,                               #
;; #   set up some desired helper packages                                    #
;; #                                                                          #
;; # I make use of the following, installed via 'M-x package-install':        #
;; #   - better-defaults                                                      #
;; #   - ido-ubiquitous                                                       #
;; #   - smex                                                                 #
;; #                                                                          #
;; ############################################################################

  ;; Get the MELPA Package list
  ;;============================
  ( require 'package )
  ( add-to-list 'package-archives
    '( "melpa" . "http://melpa.org/packages/" ) t )
  ( when ( < emacs-major-version 24 )
    ;; For important compatibility libraries like cl-lib
    ( add-to-list 'package-archives
      '( "gnu" . "http://elpa.gnu.org/packages/" ) )
  )
  ( package-initialize )

  ;; Smex Initialization
  ;;=====================
  ( smex-initialize )                    ;; Initialize smex
  ( global-set-key ( kbd "M-x" ) 'smex ) ;; This will rebind M-x, that's okay

;; ###########################################################################
;; # C / C++ Cosmetics                                                       #
;; #=========================================================================#
;; #                                                                         #
;; # Some special handling of C/C++ keywords and constants                   #
;; #                                                                         #
;; ###########################################################################

  ;; Add 'NULL' as a C and C++ keywords
  ;;====================================
  ( defun add-NULL-hook ()
    "Adds 'NULL' keywords for C / C++"
    ( font-lock-add-keywords nil
      '(( "\\(NULL\\)" 1 font-lock-constant-face t ))
    )
  )
  ( add-hook 'c-mode-hook 'add-NULL-hook )
  ( add-hook 'c++-mode-hook 'add-NULL-hook )

  ( defun add-nullptr-hook ()
    "Adds 'nullptr' keywords for C++"
    ( font-lock-add-keywords nil
      '(( "\\(nullptr\\)" 1 font-lock-constant-face t ))
    )
  )
  ( add-hook 'c++-mode-hook 'add-nullptr-hook )

;; ############################################################################
;; # TODO: Highlighting                                                       #
;; #==========================================================================#
;; #                                                                          #
;; # Add 'warning' highlighting face to TODO comments                         #
;; #                                                                          #
;; ############################################################################

  ;; On some configurations, font-lock-warning-face looks better
  ;;( setq todo-face 'font-lock-warning-face )
  ( setq todo-face 'warning )

  ;; Makefile ( GNU )
  ;;=================
  ( add-hook
    'makefile-mode-hook
    ( lambda ()
      ( font-lock-add-keywords nil
        '(( "\\(#\s*TODO\s*:.*$\\)" 1 todo-face t ))
      )
    )
  )

  ;; C Languages
  ;;=============
  ( add-hook
    'c-mode-common-hook
    ( lambda ()
      ( font-lock-add-keywords nil
        '(( "\\(/\\*\\**\s*TODO\s*:\\(\n\\|.\\)*\\*/\\)" 1 todo-face t ))
      )
      ( font-lock-add-keywords nil
        '(( "\\(//*\s*TODO\s*:.*$\\)" 1 todo-face t ))
      )
    )
  )

  ;; Emacs Lisp
  ;;============
  ( add-hook
    'emacs-lisp-mode-hook
    ( lambda ()
      ( font-lock-add-keywords nil
        '(( "\\(/\\*\\**\s*TODO\s*:.*$\\)" 1 todo-face t ))
      )
    )
  )

;; ############################################################################
;; # Theming on Windows                                                       #
;; #==========================================================================#
;; #                                                                          #
;; # Set up dark theming on Windows                                           #
;; #                                                                          #
;; ############################################################################

  ;; Load and apply misterioso
  ;;===========================
  ( load-theme 'misterioso )
