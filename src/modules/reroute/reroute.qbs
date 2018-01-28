import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_reroute"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		'producer/channel_producer.cpp',
		'producer/layer_producer.cpp',
		'producer/reroute_producer.cpp',
		'reroute.cpp',
		'stdafx.cpp',
		'producer/channel_producer.h',
		'producer/layer_producer.h',
		'producer/reroute_producer.h',
		'reroute.h',
		'stdafx.h',
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

	Export {
		Depends { name: "cpp" }
		cpp.includePaths: [project.sourceDirectory]
	}
}
