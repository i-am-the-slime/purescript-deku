module Deku.DOM.Elt.Aside where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Aside_

aside
  :: forall lock payload
   . AnEvent Zora (Attribute Aside_)
  -> Array (Domable lock payload)
  -> Domable lock payload
aside attributes kids = Element' (elementify "aside" attributes (fixed kids))

aside_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
aside_ = aside empty

