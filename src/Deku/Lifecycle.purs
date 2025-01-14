-- | This module allows you to execute arbitrary side effects when a Deku Nut mounts and unmounts.
-- | As a rule, you should avoid using these and try to build your effect system so that it is purely a response
-- | to listeners, timeouts, loops and top-level events. However, sometimes, this is unergonomic or impossible,
-- | in which case these functions can be helpful.
module Deku.Lifecycle where

import Prelude

import Deku.Core (Domable, envy)
import Effect (Effect)
import FRP.Event (makeEvent)

-- | Run effect `e` before nut `d` is added to the DOM.
onWillMount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onWillMount e d = envy $ makeEvent \k -> do
  e
  k d
  pure (pure unit)

-- | Run effect `e` after nut `d` is added to the DOM.
onDidMount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onDidMount e d = envy $ makeEvent \k -> do
  k d
  e
  pure (pure unit)

-- | Run effect `e` when nut `d` is removed from the DOM.
onDismount
  :: forall lock payload
   . Effect Unit
  -> Domable lock payload
  -> Domable lock payload
onDismount e d = envy $ makeEvent \k -> do
  k d
  pure e