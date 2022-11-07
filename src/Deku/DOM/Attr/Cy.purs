module Deku.DOM.Attr.Cy where

import Deku.DOM.Elt.RadialGradient (RadialGradient_)
import Deku.DOM.Elt.Ellipse (Ellipse_)
import Deku.DOM.Elt.Circle (Circle_)
import Deku.Attribute (class Attr, prop', unsafeAttribute)

data Cy = Cy

instance Attr Circle_ Cy String where
  attr Cy value = unsafeAttribute { key: "cy", value: prop' value }

instance Attr Ellipse_ Cy String where
  attr Cy value = unsafeAttribute { key: "cy", value: prop' value }

instance Attr RadialGradient_ Cy String where
  attr Cy value = unsafeAttribute { key: "cy", value: prop' value }