;;;; wave-editor.asd

(defsystem #:wave-editor
  :name "wave-editor"
  :description "nodgui-based waveform editor"
  :version "0.1"
  :author "modula t."
  :license "MIT"
  ;; :homepage "https://"
  ;; :bug-tracker "https://github.com/defaultxr/wave-editor/issues"
  :mailto "defaultxr at gmail dot com"
  ;; :source-control (:git "git@github.com:defaultxr/wave-editor.git")
  :depends-on (#:alexandria
               #:mutility
               #:cl-patterns
               #:bdef
               #:nodgui)
  :pathname "src/"
  :serial t
  :components ((:file "package")
               (:file "wave-editor"))
  :in-order-to ((test-op (test-op "wave-editor/tests"))))

(defsystem #:wave-editor/tests
  :name "wave-editor/tests"
  :description "FiveAM-based test suite for wave-editor."
  :author "modula t."
  :license "MIT"
  :depends-on (#:wave-editor
               #:fiveam)
  :pathname "t/"
  :serial t
  :components ((:file "test")
               (:file "wave-editor"))
  :perform (test-op (op c)
                    (uiop:symbol-call :fiveam :run!
                                      (uiop:find-symbol* '#:wave-editor-tests
                                                         :wave-editor/tests))))

