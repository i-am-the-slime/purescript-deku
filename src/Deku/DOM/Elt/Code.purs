module Deku.DOM.Elt.Code where

import Control.Plus (empty)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable)
import Bolson.Core (Entity(..), fixed)
import FRP.Event (AnEvent)
import Hyrule.Zora (Zora)

data Code_

code
  :: forall lock payload
   . AnEvent Zora (Attribute Code_)
  -> Array (Domable lock payload)
  -> Domable lock payload
code attributes kids = Element' (elementify "code" attributes (fixed kids))

code_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
code_ = code empty

