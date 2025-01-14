module Deku.DOM.Elt.Address where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Address_

address
  :: forall lock payload
   . Event (Attribute Address_)
  -> Array (Domable lock payload)
  -> Domable lock payload
address attributes kids = Domable
  ( Element'
      ( DC.elementify "address" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

address_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
address_ = address empty

address__
  :: forall lock payload
   . String
  -> Domable lock payload
address__ t = address_ [ DC.text_ t ]
