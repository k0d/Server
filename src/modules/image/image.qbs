import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_image"
	files: [
		'consumer/image_consumer.cpp',
		'producer/image_producer.cpp',
		'producer/image_scroll_producer.cpp',
		'util/image_algorithms.cpp',
		'util/image_loader.cpp',
		'image.cpp',
		'consumer/image_consumer.h',
		'producer/image_producer.h',
		'producer/image_scroll_producer.h',
		'util/image_algorithms.h',
		'util/image_loader.h',
		'util/image_view.h',
		'image.h',
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
	cpp.includePaths: [product.sourceDirectory + '/..']

	Export {
		Depends { name: "cpp" }
		cpp.includePaths: [project.sourceDirectory]
	}
}
