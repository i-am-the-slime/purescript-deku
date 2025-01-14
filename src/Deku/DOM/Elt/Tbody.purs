module Deku.DOM.Elt.Tbody where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Tbody_

tbody
  :: forall lock payload
   . Event (Attribute Tbody_)
  -> Array (Domable lock payload)
  -> Domable lock payload
tbody attributes kids = Domable
  ( Element'
      ( DC.elementify "tbody" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

tbody_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
tbody_ = tbody empty

tbody__
  :: forall lock payload
   . String
  -> Domable lock payload
tbody__ t = tbody_ [ DC.text_ t ]
