include(${CMAKE_CURRENT_LIST_DIR}/../simulation/MuJoCo.cmake)

AptInstall(libxrandr-dev libxinerama-dev libxcursor-dev libxi-dev libglew-dev)

AddProject(mc_mujoco
  GITHUB rohanpsingh/mc_mujoco
  GIT_TAG origin/main
  CMAKE_ARGS -DMUJOCO_ROOT_DIR=${MUJOCO_ROOT_DIR}
  DEPENDS mc_rtc
)

if(WITH_HRP5)
  AddProject(hrp5p_mj_description
    GITHUB_PRIVATE isri-aist/hrp5p_mj_description
    GIT_TAG origin/main
    DEPENDS mc_mujoco
  )
endif()

if(WITH_HRP4CR)
  AddProject(hrp4cr_mj_description
    GITHUB_PRIVATE isri-aist/hrp4cr_mj_description
    GIT_TAG origin/main
    DEPENDS mc_mujoco
  )
endif()

if(WITH_HRP4)
  AddProject(hrp4_mj_description
    GITE mc-hrp4/hrp4_mj_description
    GIT_TAG origin/master
    DEPENDS mc_mujoco
  )
endif()

if(WITH_Panda)
  AddProject(franka_sim
    GITHUB Hugo-L3174/franka_sim
    GIT_TAG origin/hugo-master
    DEPENDS mc_mujoco mc_panda
  )
endif()
