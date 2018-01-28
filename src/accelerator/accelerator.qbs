import qbs 1.0

Product {
	type: "staticlibrary"
	name: "accelerator"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		"ogl/image/image_kernel.cpp",
		"ogl/image/image_mixer.cpp",
		"ogl/image/image_shader.cpp",
		"ogl/util/buffer.cpp",
		"ogl/util/device.cpp",
		"ogl/util/shader.cpp",
		"ogl/util/texture.cpp",
		"accelerator.cpp",
		"StdAfx.cpp",
		"ogl/image/blending_glsl.h",
		"ogl/image/image_kernel.h",
		"ogl/image/image_mixer.h",
		"ogl/image/image_shader.h",
		"ogl/util/buffer.h",
		"ogl/util/device.h",
		"ogl/util/shader.h",
		"ogl/util/texture.h",
		"accelerator.h",
		"StdAfx.h",
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
