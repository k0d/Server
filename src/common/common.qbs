import qbs 1.0

Product {
	type: "staticlibrary"
	name: "common"
	files: [
		"diagnostics/graph.cpp",
		"gl/gl_check.cpp",
		"base64.cpp",
		"env.cpp",
		"except.cpp",
		"filesystem.cpp",
		"log.cpp",
		"polling_filesystem_monitor.cpp",
		"stdafx.cpp",
		"thread_info.cpp",
		"tweener.cpp",
		"utf.cpp",
		"os/linux/filesystem.cpp",
		"os/linux/prec_timer.cpp",
		"os/linux/signal_handlers.cpp",
		"os/linux/threading.cpp",
		"os/linux/stack_trace.cpp",
		"os/linux/system_info.cpp",
		"diagnostics/graph.h",
		"gl/gl_check.h",
		"os/filesystem.h",
		"os/general_protection_fault.h",
		"os/page_locked_allocator.h",
		"os/threading.h",
		"os/stack_trace.h",
		"os/system_info.h",
		"array.h",
		"assert.h",
		"base64.h",
		"blocking_bounded_queue_adapter.h",
		"blocking_priority_queue.h",
		"cache_aligned_vector.h",
		"endian.h",
		"enum_class.h",
		"env.h",
		"except.h",
		"executor.h",
		"filesystem.h",
		"filesystem_monitor.h",
		"forward.h",
		"future.h",
		"future_fwd.h",
		"linq.h",
		"lock.h",
		"log.h",
		"memory.h",
		"memshfl.h",
		"no_init_proxy.h",
		"param.h",
		"polling_filesystem_monitor.h",
		"prec_timer.h",
		"ptree.h",
		"scope_exit.h",
		"semaphore.h",
		"software_version.h",
		"stdafx.h",
		"thread_info.h",
		"timer.h",
		"tweener.h",
		"utf.h",
	]
	Depends { name: 'cpp' }
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
