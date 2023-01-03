(in-package #:wave-editor)

(defun playlist-view ()
  "Open a playlist view."
  (with-nodgui (:title "playlist-view" :debug 0)
    (let* ((frame (make-instance 'frame :pack (list :fill :both :expand t)))
           (tree (make-instance 'scrolled-treeview
                                :master frame
                                :pack '(:side :top :expand t :fill :both)
                                :columns '("title"))))
      (treeview-heading tree "#0" :text "artist")
      (treeview-heading tree "#1" :text "title")
      (treeview-insert-item ))))

(defmethod initialize-instance :after ((object treeviewtest) &key)
  (let ((tree (make-instance 'scrolled-treeview
                             :master  object
                             :pack    '(:side :top :expand t :fill :both)
                             ;; the following are going  to be the ids
                             ;; of  the  column   and  theirs  default
                             ;; labels too
                             ;; note: every item has an implicit first column
                             :columns (list "cid1" "cid2"))))
    (setf (tree object) tree)
    ;; a tree-item's instance represent a row, with or without parent,
    ;; of this treeview
    (let* ((parent    (make-instance 'tree-item
                                     :text    "~hallo~" ; text of the first column
                                     :id      "[a]"
                                     ;; the parent of this item is the root of the treeview
                                     :parent  +treeview-root+
                                     :index   +treeview-last-index+))
           (child      (make-instance 'tree-item
                                      ;; text of the first column
                                      :text          "w[e]lt"
                                      ;; the parent of this item is the first item defined
                                      :parent        (id parent)
                                      ;; text of the second and third column
                                      :column-values '("} [~hello]" "[world]")
                                      :index          +treeview-last-index+))
           (second-row nil)) ; used later...
      ;; setup headers
      (treeview-heading tree     +treeview-first-column-id+ ; or #0
                        :text    "column 0"
                        :command (lambda ()
                                   (when (> (length (items (treeview tree))) 1)
                                     (setf (children tree parent) (list child second-row))
                                     (do-msg "You clicked on column 0, row collapsed."))))
      (treeview-heading tree     "cid1" ; or "#1"
                        :text    "column 1"
                        :command (lambda ()
                                   (when (treeview-find-item tree parent)
                                     (treeview-delete tree parent)
                                     (do-msg "First row deleted"))))
      (treeview-heading tree     "cid2" ; or '#2' or +treeview-last-index+ in this case
                        :text    "column 2"
                        :command (lambda ()
                                   (do-msg "You clicked on column 2")))
      (treeview-insert-item tree :item parent) ; first row
      (treeview-insert-item tree :item child)  ; child of first row
      ;; you can insert value without instancing a tree-item object
      (setf second-row
            (treeview-insert-item tree                            ; actual second row
                                  :text          "foo"            ; first column
                                  :column-values '("bar" "baz"))) ; second and third column
      (format t "~a~%" tree))))
