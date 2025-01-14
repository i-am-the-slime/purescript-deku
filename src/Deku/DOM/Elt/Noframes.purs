module Deku.DOM.Elt.Noframes where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Noframes_

noframes
  :: forall lock payload
   . Event (Attribute Noframes_)
  -> Array (Domable lock payload)
  -> Domable lock payload
noframes attributes kids = Domable
  ( Element'
      ( DC.elementify "noframes" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

noframes_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
noframes_ = noframes empty

noframes__
  :: forall lock payload
   . String
  -> Domable lock payload
noframes__ t = noframes_ [ DC.text_ t ]
