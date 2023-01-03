;;;; package.lisp - package definition for wave-editor.

(uiop:define-package #:wave-editor
  (:use #:cl
        #:alexandria
        #:mutility
        #:bdef
        #:nodgui)
  (:local-nicknames (:a :alexandria)
                    (:clp :cl-patterns))
  (:export :wave-editor))
