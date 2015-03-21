module Paths_binary_search_tree (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/anastasia/Haskell/binary-search-tree/.cabal-sandbox/bin"
libdir     = "/home/anastasia/Haskell/binary-search-tree/.cabal-sandbox/lib/x86_64-linux-ghc-7.8.3/binary-search-tree-0.1.0.0"
datadir    = "/home/anastasia/Haskell/binary-search-tree/.cabal-sandbox/share/x86_64-linux-ghc-7.8.3/binary-search-tree-0.1.0.0"
libexecdir = "/home/anastasia/Haskell/binary-search-tree/.cabal-sandbox/libexec"
sysconfdir = "/home/anastasia/Haskell/binary-search-tree/.cabal-sandbox/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "binary_search_tree_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "binary_search_tree_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "binary_search_tree_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "binary_search_tree_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "binary_search_tree_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
