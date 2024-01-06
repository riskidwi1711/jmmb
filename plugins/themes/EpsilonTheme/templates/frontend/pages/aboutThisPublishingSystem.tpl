{**
 * templates/frontend/pages/aboutThisPublishingSystem.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view details about the OJS software.
 *
 * @uses $currentJournal Journal The journal currently being viewed
 * @uses $appVersion string Current version of OJS
 * @uses $pubProcessFile string Path to image of OJS publishing process
 *}
{include file="frontend/components/header.tpl" pageTitle="about.aboutThisPublishingSystem"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="page page_about_publishing_system delay-1s">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.aboutThisPublishingSystem"}
	
	<div class="page-header">
		<h3>{translate key="about.aboutThisPublishingSystem"}</h3>
	</div>
	
	<p>
		{if $currentJournal}
			{translate key="about.aboutOJSJournal" ojsVersion=$appVersion}
		{else}
			{translate key="about.aboutOJSSite" ojsVersion=$appVersion}
		{/if}
	</p>
	<div class="mx-auto text-center">
	<figure class="figure">
		<a href="{$baseUrl}/{$pubProcessFile}" target="_blank"><img class="figure-img img-fluid rounded" src="{$baseUrl}/{$pubProcessFile}" alt="{translate key="about.aboutThisPublishingSystem.altText"}"></a>
		<figcaption class="figure-caption text-center">{translate key="about.aboutThisPublishingSystem.altText"}.</figcaption>
	</figure>
	</div>
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
