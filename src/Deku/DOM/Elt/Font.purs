module Deku.DOM.Elt.Font where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Font_

font
  :: forall lock payload
   . Event (Attribute Font_)
  -> Array (Domable lock payload)
  -> Domable lock payload
font attributes kids = Domable
  ( Element'
      ( DC.elementify "font" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

font_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
font_ = font empty

font__
  :: forall lock payload
   . String
  -> Domable lock payload
font__ t = font_ [ DC.text_ t ]
