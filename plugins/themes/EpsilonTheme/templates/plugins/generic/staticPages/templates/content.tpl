{**
 * templates/content.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$title}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="page page_custom">
{include file="frontend/components/breadcrumbs.tpl" currentTitle={$title|escape}}


	{* Page Title *}
	<div class="page-header">
		<h3>{$title|escape}</h3>
	</div>
	{* /Page Title *}

	{$content}
	
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
