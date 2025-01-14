module Deku.DOM.Elt.Td where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Td_

td
  :: forall lock payload
   . Event (Attribute Td_)
  -> Array (Domable lock payload)
  -> Domable lock payload
td attributes kids = Domable
  ( Element'
      ( DC.elementify "td" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

td_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
td_ = td empty

td__
  :: forall lock payload
   . String
  -> Domable lock payload
td__ t = td_ [ DC.text_ t ]
