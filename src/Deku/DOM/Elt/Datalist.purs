module Deku.DOM.Elt.Datalist where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Datalist_

datalist
  :: forall lock payload
   . Event (Attribute Datalist_)
  -> Array (Domable lock payload)
  -> Domable lock payload
datalist attributes kids = Domable
  ( Element'
      ( DC.elementify "datalist" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

datalist_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
datalist_ = datalist empty

datalist__
  :: forall lock payload
   . String
  -> Domable lock payload
datalist__ t = datalist_ [ DC.text_ t ]
