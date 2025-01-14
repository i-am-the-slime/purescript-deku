module Deku.DOM.Elt.Dir where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Dir_

dir
  :: forall lock payload
   . Event (Attribute Dir_)
  -> Array (Domable lock payload)
  -> Domable lock payload
dir attributes kids = Domable
  ( Element'
      ( DC.elementify "dir" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

dir_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
dir_ = dir empty

dir__
  :: forall lock payload
   . String
  -> Domable lock payload
dir__ t = dir_ [ DC.text_ t ]
