module Deku.DOM.Elt.FeTurbulence where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeTurbulence_

feTurbulence
  :: forall lock payload
   . Event (Attribute FeTurbulence_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feTurbulence attributes kids = Domable
  ( Element'
      ( DC.elementify "feTurbulence" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feTurbulence_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feTurbulence_ = feTurbulence empty

feTurbulence__
  :: forall lock payload
   . String
  -> Domable lock payload
feTurbulence__ t = feTurbulence_ [ DC.text_ t ]
