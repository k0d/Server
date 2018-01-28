import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_oal"
	files: [
		'consumer/oal_consumer.cpp',
		'oal.cpp',
		'consumer/oal_consumer.h',
		'oal.h',
	]
	Depends { name: 'cpp' }
	Depends { name: "casparcg_common" }
	Depends { name: "casparcg_core" }
	cpp.cxxLanguageVersion: 'c++14'
	cpp.warningLevel: 'none'
	cpp.cxxFlags: ['-msse3', '-mssse3', '-msse4.1', '-fnon-call-exceptions']
	cpp.defines: [
		'TBB_USE_CAPTURED_EXCEPTION=1',
		'BOOST_ALL_NO_LIB',
		'BOOST_ALL_DYN_LINK',
		'BOOST_LOG_DYN_LINK',
	]
	cpp.dynamicLibraries: ['openal']

	Export {
		Depends { name: "cpp" }
		cpp.includePaths: [project.sourceDirectory]
	}
}
