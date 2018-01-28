import qbs 1.0

CppApplication {
	name: "casparcg_server"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		"linux_specific.cpp",
		"casparcg.config",
		"included_modules.tmpl",
		"main.cpp",
		"server.cpp",
		"stdafx.cpp",
		"default_audio_config.h",
		"included_modules.h",
		"platform_specific.h",
		"server.h",
		"stdafx.h",
	]
	Depends { name: "accelerator" }
	Depends { name: "common" }
	Depends { name: "core" }
	Depends { name: "protocol" }
//	Depends { name: "casparcg_modules" }

	Depends { name: "casparcg_module_decklink" }
	Depends { name: "casparcg_module_ffmpeg" }
//	Depends { name: "casparcg_module_html" }
	Depends { name: "casparcg_module_image" }
	Depends { name: "casparcg_module_psd" }
	Depends { name: "casparcg_module_oal" }
	Depends { name: "casparcg_module_reroute" }
	Depends { name: "casparcg_module_screen" }

	cpp.cxxLanguageVersion: 'c++14'
	cpp.warningLevel: 'none'
	cpp.cxxFlags: [
		'-msse3',
		'-mssse3',
		'-msse4.1',
		'-fnon-call-exceptions',
	]
	cpp.defines: [
		'TBB_USE_CAPTURED_EXCEPTION=1',
		'BOOST_ALL_NO_LIB',
		'BOOST_ALL_DYN_LINK',
		'BOOST_LOG_DYN_LINK',
	]
	cpp.dynamicLibraries: [
		'boost_system',
		'boost_thread',
		'boost_chrono',
		'boost_filesystem',
		'boost_log',
		'boost_locale',
		'boost_regex',
		'boost_date_time',
		'boost_atomic',
		'boost_log_setup',
		'pthread',
		'tbb',
		'tbbmalloc',
		'sfml-graphics',
		'sfml-window',
		'sfml-system',
		'GLEW',
		'GL',
		'SM',
		'ICE',
		'X11',
		'Xext',
		'jpeg',
		'sndfile',
		'freetype',
		'dl',
		'icui18n',
		'icuuc',
		'z',
		'freeimage',
		'avformat',
		'avcodec',
		'avutil',
		'avfilter',
		'avdevice',
		'swscale',
		'swresample',
		'postproc',
	]
}
