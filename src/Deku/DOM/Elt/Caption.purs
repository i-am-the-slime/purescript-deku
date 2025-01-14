module Deku.DOM.Elt.Caption where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Caption_

caption
  :: forall lock payload
   . Event (Attribute Caption_)
  -> Array (Domable lock payload)
  -> Domable lock payload
caption attributes kids = Domable
  ( Element'
      ( DC.elementify "caption" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

caption_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
caption_ = caption empty

caption__
  :: forall lock payload
   . String
  -> Domable lock payload
caption__ t = caption_ [ DC.text_ t ]
