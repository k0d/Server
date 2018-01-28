import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_screen"
	files: [
		'consumer/screen_consumer.cpp',
		'screen.cpp',
		'consumer/screen_consumer.h',
		'screen.h',
	]
	Depends { name: 'cpp' }
	Depends { name: "common" }
	Depends { name: "core" }
	Depends { name: "casparcg_module_ffmpeg" }
	cpp.cxxLanguageVersion: 'c++14'
	cpp.warningLevel: 'none'
	cpp.cxxFlags: ['-msse3', '-mssse3', '-msse4.1', '-fnon-call-exceptions']
	cpp.defines: [
		'TBB_USE_CAPTURED_EXCEPTION=1',
		'BOOST_ALL_NO_LIB',
		'BOOST_ALL_DYN_LINK',
		'BOOST_LOG_DYN_LINK',
	]

	Export {
		Depends { name: "cpp" }
		cpp.includePaths: [project.sourceDirectory]
	}
}
