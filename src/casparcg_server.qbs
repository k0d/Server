import qbs 1.0

Project {
	references: [
		"accelerator/accelerator.qbs",
		"common/common.qbs",
		"core/core.qbs",
//		"modules/modules.qbs",
		"protocol/protocol.qbs",
		"shell/shell.qbs",

		"modules/decklink/decklink.qbs",
		"modules/ffmpeg/ffmpeg.qbs",
//		"modules/html/html.qbs",
		"modules/image/image.qbs",
		"modules/psd/psd.qbs",
		"modules/oal/oal.qbs",
		"modules/reroute/reroute.qbs",
		"modules/screen/screen.qbs",
	]
}
