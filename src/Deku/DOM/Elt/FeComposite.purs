module Deku.DOM.Elt.FeComposite where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data FeComposite_

feComposite
  :: forall lock payload
   . Event (Attribute FeComposite_)
  -> Array (Domable lock payload)
  -> Domable lock payload
feComposite attributes kids = Domable
  ( Element'
      ( elementify "feComposite" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

feComposite_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
feComposite_ = feComposite empty