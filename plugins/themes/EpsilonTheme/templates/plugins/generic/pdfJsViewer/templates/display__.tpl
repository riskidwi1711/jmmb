{**
* plugins/generic/pdfJsViewer/templates/display.tpl
*
* Copyright (c) 2014-2020 Simon Fraser University
* Copyright (c) 2003-2020 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Template to view a PDF or HTML galley
*}

{**
* plugins/generic/pdfJsViewer/templates/display.tpl
*
* Copyright (c) 2014-2020 Simon Fraser University
* Copyright (c) 2003-2020 John Willinsky
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

{include file="frontend/components/banner-article.tpl"}
{include file="frontend/components/content-wrapper.tpl"}
	<main class="galley">
		
			<header class="galley__header">
				<p>
					<a href="{$parentUrl}" class="btn btn-primary btn-sm">
						<i class="fa fa-angle-left me-2" aria-hidden="true"></i>
						{if $parent instanceOf Issue}
						{translate key="issue.return"}
						{else}
						{translate key="article.return"}
						{/if}
					</a>

					<a href="{$pdfUrl}" class="btn btn-success btn-sm float-end" download>
						<i class="fa fa-cloud-download me-2" aria-hidden="true"></i>
						{translate key="common.download"}
						<span class="sr-only">
							{translate key="common.downloadPdf"}
						</span>
					</a>
				</p>
				<!--
				<h3>{$article->getLocalizedTitle()|escape}</h3>
				-->
				{if !$isLatestPublication}
					<div role="alert">
						{translate key="submission.outdatedVersion" datePublished=$galleyPublication->getData('datePublished')|date_format:$dateFormatLong urlRecentVersion=$parentUrl}
					</div>
				{/if}
			</header>

			<div id="pdfCanvasContainer" class="galley__content" style="overflow: visible; -webkit-overflow-scrolling: touch;">
				<iframe src="{$pluginUrl}/pdf.js/web/viewer.html?file={$pdfUrl|escape:"url"}" width="100%" height="100%" style="min-height: 500px;" allowfullscreen webkitallowfullscreen></iframe>
			</div>
		
	</main>
</body>
</html>
