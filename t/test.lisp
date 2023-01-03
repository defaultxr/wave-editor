(defpackage #:wave-editor/tests
  (:use #:cl
        #:wave-editor
        #:alexandria
        #:mutility
        #:fiveam))

(in-package #:wave-editor/tests)

(def-suite wave-editor-tests
  :description "wave-editor tests suite.")

(in-suite wave-editor-tests)

(test undocumented-symbols
  "Check for any undocumented exported symbols"
  (let ((undocumented (package-undocumented-symbols :wave-editor)))
    (is-false undocumented
              "some exported symbols do not have docstrings: ~s"
              undocumented)))
