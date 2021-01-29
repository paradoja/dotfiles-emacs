(require 'use-package)

(require 'config-utils)

(load-configurations
 '(general-helm
   visuals

   evil
   rest
   shortcuts)) ; rest & shortcuts should go last
