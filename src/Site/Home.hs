module Site.Home (homePageCompiler) where

import Hakyll

import Site.Post (postCtx)


homePageCompiler :: Compiler (Item String)
homePageCompiler = do
    posts <- recentFirst =<< loadAll "posts/*"
    let indexCtx = listField "posts" postCtx (return posts)
                    <> constField "title" "Home"
                    <> defaultContext

    getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls
