import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_decklink"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		'consumer/decklink_consumer.cpp',
		'producer/decklink_producer.cpp',
		'decklink.cpp',
		'StdAfx.cpp',
		'consumer/decklink_consumer.h',
		'producer/decklink_producer.h',
		'util/util.h',
		'decklink.h',
		'decklink_api.h',
		'StdAfx.h',
		'linux_interop/DeckLinkAPIConfiguration.h',
		'linux_interop/DeckLinkAPIDeckControl.h',
		'linux_interop/DeckLinkAPIDispatch.cpp',
		'linux_interop/DeckLinkAPIModes.h',
		'linux_interop/DeckLinkAPI_v10_2.h',
		'linux_interop/DeckLinkAPI_v7_3.h',
		'linux_interop/DeckLinkAPI_v7_9.h',
		'linux_interop/DeckLinkAPI_v8_1.h',
		'linux_interop/DeckLinkAPI_v9_9.h',
		'linux_interop/LinuxCOM.h',
		'linux_interop/DeckLinkAPIConfiguration_v10_2.h',
		'linux_interop/DeckLinkAPIDiscovery.h',
		'linux_interop/DeckLinkAPI.h',
		'linux_interop/DeckLinkAPITypes.h',
		'linux_interop/DeckLinkAPI_v7_1.h',
		'linux_interop/DeckLinkAPI_v7_6.h',
		'linux_interop/DeckLinkAPI_v8_0.h',
		'linux_interop/DeckLinkAPI_v9_2.h',
		'linux_interop/DeckLinkAPIVersion.h',
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
