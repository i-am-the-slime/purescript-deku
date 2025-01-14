module Deku.DOM.Elt.Embed where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Embed_

embed
  :: forall lock payload
   . Event (Attribute Embed_)
  -> Array (Domable lock payload)
  -> Domable lock payload
embed attributes kids = Domable
  ( Element'
      ( DC.elementify "embed" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

embed_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
embed_ = embed empty

embed__
  :: forall lock payload
   . String
  -> Domable lock payload
embed__ t = embed_ [ DC.text_ t ]
