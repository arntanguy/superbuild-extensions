AddProject(stabiliplus
  GITE mc-controllers/stabiliplus
  GIT_TAG origin/devel
  DEPENDS mc_rtc 
)

set(stabiliplus_APT_DEPENDENCIES
  libeigen3-dev
  libglpk-dev
  libtinyxml2-dev
)

AptInstall(${stabiliplus_APT_DEPENDENCIES})
