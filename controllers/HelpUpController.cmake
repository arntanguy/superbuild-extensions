include(${CMAKE_CURRENT_LIST_DIR}/../control/stabiliplus.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/../plugins/mc_xsens_plugin.cmake)

if(NOT WITH_XSENS_PLUGIN)
  message(FATAL_ERROR "[HelpUpController] Xsens Plugin is required, enable with WITH_XSENS_PLUGIN=ON")
endif()

AddCatkinProject(human_description
  GITE hlefevre/human_description
  GIT_TAG origin/topic/model_celia
  WORKSPACE data_ws
)

option(WITH_HELPUP_CONTROLLER_HUMAN "Build modified human model for HelpUpController" ON)
if(WITH_HELPUP_CONTROLLER_HUMAN)
  AddProject(human_mj_description
    GITHUB  Hugo-L3174/human_mj_description
    GIT_TAG origin/topic/mujoco_celia
    DEPENDS mc_mujoco
  )

  AddProject(mc_human
    GITE hlefevre/mc_human
    GIT_TAG origin/master
    DEPENDS mc_rtc human_description
  )

  AddProject(mc_force_shoe_plugin
    GITE hlefevre/mc_force_shoe_plugin
    GIT_TAG origin/main
    DEPENDS mc_rtc
  )

  AddProject(mc_robot_model_update
    GITHUB arntanguy/mc_robot_model_update
    GIT_TAG origin/main
    DEPENDS mc_rtc
  )

  AddProject(HelpUpController
    GITE hlefevre/helpupcontroller
    GIT_TAG origin/master
    DEPENDS mc_rtc gram_savitzky_golay stabiliplus mc_xsens_plugin mc_robot_model_update mc_force_shoe_plugin mc_human mc_panda
  )
endif()
