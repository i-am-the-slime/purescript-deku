module Deku.DOM.Elt.H6 where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable, M)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)

data H6_

h6
  :: forall lock payload
   . AnEvent M (Attribute H6_)
  -> Array (Domable lock payload)
  -> Domable lock payload
h6 attributes kids = Element' (elementify "h6" attributes (fixed kids))

h6_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
h6_ = h6 empty

