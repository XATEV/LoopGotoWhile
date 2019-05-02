{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_loopgotowhile (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/pc/.cabal/bin"
libdir     = "/home/pc/.cabal/lib/x86_64-linux-ghc-8.0.2/loopgotowhile-0.1-FZRHlz3QgyiDmpnRCFPvrz"
dynlibdir  = "/home/pc/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/pc/.cabal/share/x86_64-linux-ghc-8.0.2/loopgotowhile-0.1"
libexecdir = "/home/pc/.cabal/libexec"
sysconfdir = "/home/pc/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "loopgotowhile_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "loopgotowhile_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "loopgotowhile_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "loopgotowhile_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "loopgotowhile_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "loopgotowhile_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
