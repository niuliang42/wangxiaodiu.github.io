{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_myblog (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/bin"
libdir     = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/lib/x86_64-osx-ghc-8.2.2/myblog-0.1.0.0-202JtY13FKxcYKIyzw70X-myblog"
dynlibdir  = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/share/x86_64-osx-ghc-8.2.2/myblog-0.1.0.0"
libexecdir = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/libexec/x86_64-osx-ghc-8.2.2/myblog-0.1.0.0"
sysconfdir = "/Users/niu/study/website/hakyll_github_pages/wangxiaodiu.github.io/.stack-work/install/x86_64-osx/lts-11.6/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "myblog_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "myblog_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "myblog_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "myblog_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "myblog_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "myblog_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
