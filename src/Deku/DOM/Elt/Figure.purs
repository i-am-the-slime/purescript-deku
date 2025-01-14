module Deku.DOM.Elt.Figure where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Figure_

figure
  :: forall lock payload
   . Event (Attribute Figure_)
  -> Array (Domable lock payload)
  -> Domable lock payload
figure attributes kids = Domable
  ( Element'
      ( DC.elementify "figure" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

figure_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
figure_ = figure empty

figure__
  :: forall lock payload
   . String
  -> Domable lock payload
figure__ t = figure_ [ DC.text_ t ]
