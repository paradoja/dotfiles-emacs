;;; we can use ox-rss to export a RSS; but we need an enclosure

;;; to add the enclosure element we take advantage of the call to
;;; `org-rss-build-categories`

(defun org-rss-add-enclosure-to-podcast (f headline info)
  (let ((categories (funcall f headline info))
        (enclosure (org-element-property :MEDIA headline))
        (lfile-link "")
        (file-link (org--property-global-value "PODCAST_FILES" t))
        )
    (concat categories "\n"
            "<enclosure url='" file-link enclosure "' type='audio/mp3'></enclosure>")))
