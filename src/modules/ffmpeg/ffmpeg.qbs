import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_module_ffmpeg"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		"consumer/ffmpeg_consumer.cpp",
		"producer/audio/audio_decoder.cpp",
		"producer/filter/audio_filter.cpp",
		"producer/filter/filter.cpp",
		"producer/input/input.cpp",
		"producer/muxer/frame_muxer.cpp",
		"producer/util/flv.cpp",
		"producer/util/util.cpp",
		"producer/video/video_decoder.cpp",
		"producer/ffmpeg_producer.cpp",
		"producer/tbb_avcodec.cpp",
		"audio_channel_remapper.cpp",
		"ffmpeg.cpp",
		"ffmpeg_error.cpp",
		"StdAfx.cpp",
		"consumer/ffmpeg_consumer.h",
		"producer/audio/audio_decoder.h",
		"producer/filter/audio_filter.h",
		"producer/filter/filter.h",
		"producer/input/input.h",
		"producer/muxer/display_mode.h",
		"producer/muxer/frame_muxer.h",
		"producer/util/flv.h",
		"producer/util/util.h",
		"producer/video/video_decoder.h",
		"producer/ffmpeg_producer.h",
		"producer/tbb_avcodec.h",
		"ffmpeg.h",
		"ffmpeg_error.h",
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
	cpp.includePaths: [product.sourceDirectory + '/..']

	Export {
		Depends { name: "cpp" }
		cpp.includePaths: [project.sourceDirectory + '/modules']
	}
}
