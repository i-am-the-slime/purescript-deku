module Deku.DOM.Elt.Path where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control (elementify)
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Path_

path
  :: forall lock payload
   . Event (Attribute Path_)
  -> Array (Domable lock payload)
  -> Domable lock payload
path attributes kids = Domable
  ( Element'
      ( elementify "path" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

path_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
path_ = path empty