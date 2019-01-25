import Data.Monoid ((<>))
import Hakyll
import Hakyll.Web.Sass (sassCompiler)

import Site.Home (homePageCompiler)
import Site.Post (postCompiler)


config :: Configuration
config = defaultConfiguration { providerDirectory = "./src" }


main :: IO ()
main = hakyllWith config $ do

    match "templates/*" $ compile templateBodyCompiler

    match "images/*" $ do
        route   idRoute
        compile copyFileCompiler
        
    match "styles/*.scss" $ do
        route $ setExtension "css"
        let compressCssItem = fmap compressCss
        compile (compressCssItem <$> sassCompiler)


    match "index.html" $ do
        route idRoute
        compile homePageCompiler

    match "posts/*" $ do
        route $ setExtension "html"
        compile postCompiler

    {-
    match (fromList ["about.rst", "contact.markdown"]) $ do
        route   $ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" defaultContext
            >>= relativizeUrls

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) `mappend`
                    constField "title" "Archives"            `mappend`
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= loadAndApplyTemplate "templates/default.html" archiveCtx
                >>= relativizeUrls
    -}
