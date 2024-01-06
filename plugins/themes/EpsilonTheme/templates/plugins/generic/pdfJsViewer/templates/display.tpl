{**
 * plugins/generic/pdfJsViewer/templates/display.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Embedded viewing of a PDF galley.
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>{translate key="article.pageTitle" title=$title|escape}</title>

	{load_header context="frontend" headers=$headers}
	{load_stylesheet context="frontend" stylesheets=$stylesheets}
	{load_script context="frontend" scripts=$scripts}
</head>
<body class="pkp_page_{$requestedPage|escape} pkp_op_{$requestedOp|escape}">

	{* Header wrapper *}
	<header class="header_view">
	<div class="row">
		<div class="col-md-12">
			<h5 class="text-primary m-2 text-center">{$title|escape}</h5>
		</div>
		
		<div class="col-6">
		<a href="{$parentUrl}" class="btn btn-sm btn-primary  float-start mb-2 mx-1">
			<i class="fa fa-arrow-left me-2" aria-hidden="true"></i>
			<span class="pkp_screen_reader">
				{if $parent instanceOf Issue}
					{translate key="issue.return"}
				{else}
					{translate key="article.return"}
				{/if}
			</span>
		</a>
		</div>
		
		<div class="col-6">
		<a href="{$pdfUrl}" class="btn btn-primary btn-sm  float-end mb-2 mx-1">
			<i class="fa fa-cloud-download me-2" aria-hidden="true"></i>
			<span class="label">
				{translate key="common.download"}
			</span>
			{*
			<span class="pkp_screen_reader">
				{translate key="common.downloadPdf"}
			</span>
			*}
		</a>
		</div>
		
		
		

	</div>
	</header>

	<div id="pdfCanvasContainer" class="galley_view">
		<iframe src="{$pluginUrl}/pdf.js/web/viewer.html?file={$pdfUrl|escape:"url"}" width="100%" height="100%" style="min-height: 580px;" allowfullscreen webkitallowfullscreen></iframe>
	</div>
	
	<span id="myCopyright"><a href="#" target="_blank">{translate|escape key="plugins.AlphaTheme.name"}</a></span>
	
	{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
