module Deku.DOM.Elt.Picture where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data Picture_

picture
  :: forall lock payload
   . AnEvent M (Attribute Picture_)
  -> Array (Domable lock payload)
  -> Domable lock payload
picture attributes kids = Element'
  (elementify "picture" attributes (fixed kids))

picture_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
picture_ = picture empty

