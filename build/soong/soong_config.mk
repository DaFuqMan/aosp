<<<<<<< HEAD
<<<<<<< HEAD
_contents := $(_contents)    "Aosp":{$(newline)

# See build/core/soong_config.mk for the add_json_* functions you can use here.
$(call add_json_bool, Has_legacy_camera_hal1,                $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)))
$(call add_json_bool, Needs_text_relocations,                $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)))
$(call add_json_str,  Specific_camera_parameter_library,     $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY))
$(call add_json_str,  Target_shim_libs,                      $(TARGET_LD_SHIM_LIBS))
>>>>>>> parent of cbf970e... soong_config: Remove extra spacing
$(call add_json_bool, Uses_generic_camera_parameter_library, $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),,true))
$(call add_json_bool, Uses_nvidia_enhancements,              $(filter TRUE,$(NV_ANDROID_FRAMEWORK_ENHANCEMENTS)))
$(call add_json_bool, Uses_qcom_bsp_legacy,                  $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)))
$(call add_json_bool, Uses_qti_camera_device,                $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)))

# This causes the build system to strip out the last comma in our nested struct, to keep the JSON valid.
_contents := $(_contents)__SV_END

_contents := $(_contents)    },$(newline)
=======
# Insert new variables inside the Aosp structure
aosp_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Aosp": {'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Uses_non_treble_camera": $(if $(filter true,$(TARGET_USES_NON_TREBLE_CAMERA)),true,false),'; \
	echo '    "Has_legacy_camera_hal1": $(if $(filter true,$(TARGET_HAS_LEGACY_CAMERA_HAL1)),true,false),'; \
 	echo '    "Needs_legacy_camera_hal1_dyn_native_handle": $(if $(filter true,$(TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE)),true,false),'; \
	echo '    "Uses_media_extensions": $(if $(filter true,$(TARGET_USES_MEDIA_EXTENSIONS)),true,false),'; \
	echo '    "BTVendorPath": "$(call project-path-for,bt-vendor)",'; \
	echo '    "RILPath": "$(call project-path-for,ril)",'; \
	echo '    "WLANPath": "$(call project-path-for,wlan)",'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))"'; \
	echo '},'; \
	echo '"Qualcomm": {'; \
	echo '    "BoardUsesQTIHardware": $(if $(filter true,$(BOARD_USES_QTI_HARDWARE)),true,false),'; \
	echo '    "BoardUsesQCOMHardware": $(if $(filter true,$(BOARD_USES_QCOM_HARDWARE)),true,false),'; \
	echo '    "TargetUsesQCOMBsp": $(if $(filter true,$(TARGET_USES_QCOM_BSP)),true,false),'; \
	echo '    "TargetUsesQCOMLegacyBsp": $(if $(filter true,$(TARGET_USES_QCOM_LEGACY_BSP)),true,false),'; \
	echo '    "BoardUsesLegacyAlsa": $(if $(filter true,$(BOARD_USES_LEGACY_ALSA_AUDIO)),true,false),'; \
	echo '    "Cant_reallocate_omx_buffers":  $(if $(filter omap4,$(TARGET_BOARD_PLATFORM)),true,false),';  \
	echo '    "QCOMAudioPath": "$(call project-path-for,qcom-audio)",'; \
	echo '    "QCOMCameraPath": "$(call project-path-for,qcom-camera)",'; \
	echo '    "QCOMDataservicesPath": "$(call project-path-for,qcom-dataservices)",';  \
	echo '    "QCOMDisplayPath": "$(call project-path-for,qcom-display)",';  \
	echo '    "QCOMGPSPath": "$(call project-path-for,qcom-gps)",';  \
	echo '    "QCOMMediaPath": "$(call project-path-for,qcom-media)",';  \
	echo '    "QCOMSensorsPath": "$(call project-path-for,qcom-sensors)"';  \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
>>>>>>> parent of fca9ad0... vendor: Clean up soong flags
