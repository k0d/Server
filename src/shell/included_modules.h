/*
 * Generated file.
 */

#pragma once

#include <common/log.h>

#include <core/module_dependencies.h>

#include <modules/reroute/reroute.h>
#include <modules/ffmpeg/ffmpeg.h>
#include <modules/oal/oal.h>
#include <modules/decklink/decklink.h>
#include <modules/screen/screen.h>
//#include <modules/html/html.h>
#include <modules/psd/psd_scene_producer.h>
#include <modules/image/image.h>

namespace caspar {

static bool intercept_command_line_args(int argc, char** argv)
{
//	if (html::intercept_command_line(argc, argv))
//		return true;

	return false;
}

static void initialize_modules(const core::module_dependencies& dependencies)
{
	reroute::init(dependencies);
	CASPAR_LOG(info) << L"Initialized reroute module.";

	ffmpeg::init(dependencies);
	CASPAR_LOG(info) << L"Initialized ffmpeg module.";

	oal::init(dependencies);
	CASPAR_LOG(info) << L"Initialized oal module.";

	decklink::init(dependencies);
	CASPAR_LOG(info) << L"Initialized decklink module.";

	screen::init(dependencies);
	CASPAR_LOG(info) << L"Initialized screen module.";

//	html::init(dependencies);
//	CASPAR_LOG(info) << L"Initialized html module.";

	psd::init(dependencies);
	CASPAR_LOG(info) << L"Initialized psd module.";

	image::init(dependencies);
	CASPAR_LOG(info) << L"Initialized image module.";
}

static void uninitialize_modules()
{
//	image::uninit();
//	html::uninit();
//	ffmpeg::uninit();
}

}
