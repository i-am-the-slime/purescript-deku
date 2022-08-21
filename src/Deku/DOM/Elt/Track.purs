module Deku.DOM.Elt.Track where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Track_

track
  :: forall lock payload
   . AnEvent Zora (Attribute Track_)
  -> Array (Domable lock payload)
  -> Domable lock payload
track attributes kids = Element' (elementify "track" attributes (fixed kids))

track_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
track_ = track empty

