{**
 * templates/frontend/pages/information.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Information page.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle=$pageTitle}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}


<div class="page page_custom" id="main">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey={$pageTitle|escape}}
	
			<div class="page-header">
				<h3>{translate key=$pageTitle}</h3>
				{include file="frontend/components/editLink.tpl" page="management" op="settings" path="website" anchor="setup/information" sectionTitleKey="manager.website.information"}
			</div>
			
				{$content|strip_unsafe_html}
			
</div>

{include file="frontend/components/footer.tpl"}
