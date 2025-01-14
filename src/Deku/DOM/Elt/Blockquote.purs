module Deku.DOM.Elt.Blockquote where

import Bolson.Core (Entity(..), fixed)
import Control.Plus (empty)
import Data.Array (mapWithIndex)
import Deku.Attribute (Attribute)
import Deku.Control as DC
import Deku.Core (Domable(..), Domable', unsafeSetPos)
import FRP.Event (Event)
import Safe.Coerce (coerce)

data Blockquote_

blockquote
  :: forall lock payload
   . Event (Attribute Blockquote_)
  -> Array (Domable lock payload)
  -> Domable lock payload
blockquote attributes kids = Domable
  ( Element'
      ( DC.elementify "blockquote" attributes
          ( (coerce :: Domable' lock payload -> Domable lock payload)
              (fixed (coerce (mapWithIndex unsafeSetPos kids)))
          )
      )
  )

blockquote_
  :: forall lock payload
   . Array (Domable lock payload)
  -> Domable lock payload
blockquote_ = blockquote empty

blockquote__
  :: forall lock payload
   . String
  -> Domable lock payload
blockquote__ t = blockquote_ [ DC.text_ t ]
