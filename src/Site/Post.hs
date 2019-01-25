module Site.Post (postCompiler, postCtx) where

import Hakyll

postCompiler :: Compiler (Item String)
postCompiler = pandocCompiler
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= loadAndApplyTemplate "templates/default.html" postCtx
            >>= relativizeUrls


{-
    dateField examines the file path (e.g. posts/2015-08-12-spqr.markdown)
    to determine which date to use (unless there is a `published` metadata field)
-}
postCtx :: Context String
postCtx = dateField "date" "%B %e, %Y"  <> defaultContext
