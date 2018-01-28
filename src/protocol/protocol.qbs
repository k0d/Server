import qbs 1.0

Product {
	type: "staticlibrary"
	name: "casparcg_protocol"

	FileTagger {
		patterns: "StdAfx.h"
		fileTags: ["cpp_pch_src"]
	}

	files: [
		"amcp/AMCPCommandQueue.cpp",
		"amcp/AMCPCommandsImpl.cpp",
		"amcp/AMCPProtocolStrategy.cpp",
		"amcp/amcp_command_repository.cpp",
		"cii/CIICommandsImpl.cpp",
		"cii/CIIProtocolStrategy.cpp",
		"clk/CLKProtocolStrategy.cpp",
		"clk/clk_commands.cpp",
		"clk/clk_command_processor.cpp",
		"log/tcp_logger_protocol_strategy.cpp",
		"osc/oscpack/OscOutboundPacketStream.cpp",
		"osc/oscpack/OscPrintReceivedElements.cpp",
		"osc/oscpack/OscReceivedElements.cpp",
		"osc/oscpack/OscTypes.cpp",
		"osc/client.cpp",
		"util/AsyncEventServer.cpp",
		"util/lock_container.cpp",
		"util/strategy_adapters.cpp",
		"StdAfx.cpp",
		"amcp/AMCPCommand.h",
		"amcp/AMCPCommandQueue.h",
		"amcp/AMCPCommandsImpl.h",
		"amcp/AMCPProtocolStrategy.h",
		"amcp/amcp_command_repository.h",
		"amcp/amcp_shared.h",
		"cii/CIICommand.h",
		"cii/CIICommandsImpl.h",
		"cii/CIIProtocolStrategy.h",
		"clk/CLKProtocolStrategy.h",
		"clk/clk_commands.h",
		"clk/clk_command_processor.h",
		"log/tcp_logger_protocol_strategy.h",
		"osc/oscpack/MessageMappingOscPacketListener.h",
		"osc/oscpack/OscException.h",
		"osc/oscpack/OscHostEndianness.h",
		"osc/oscpack/OscOutboundPacketStream.h",
		"osc/oscpack/OscPacketListener.h",
		"osc/oscpack/OscPrintReceivedElements.h",
		"osc/oscpack/OscReceivedElements.h",
		"osc/oscpack/OscTypes.h",
		"osc/client.h",
		"util/AsyncEventServer.h",
		"util/ClientInfo.h",
		"util/lock_container.h",
		"util/ProtocolStrategy.h",
		"util/protocol_strategy.h",
		"util/strategy_adapters.h",
		"StdAfx.h",
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
