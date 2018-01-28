import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_psd"
	files: [
		'util/bigendian_file_input_stream.cpp',
		'util/pdf_reader.cpp',
		'descriptor.cpp',
		'psd_document.cpp',
		'layer.cpp',
		'misc.cpp',
		'psd_scene_producer.cpp',
		'util/bigendian_file_input_stream.h',
		'util/pdf_reader.h',
		'channel.h',
		'descriptor.h',
		'psd_document.h',
		'image.h',
		'layer.h',
		'misc.h',
		'psd_scene_producer.h',
	]
	Depends { name: 'cpp' }
	Depends { name: "common" }
	Depends { name: "core" }
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
