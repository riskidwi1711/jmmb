{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$announcement->getLocalizedTitle()|escape}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="main__content" id="main">
	{include file="frontend/components/breadcrumbs_announcement.tpl" currentTitleKey="announcement.announcements"}
	

			<article class="announcement-full">
				<div class="page-header">
		<h1>
			{$announcement->getLocalizedTitle()|escape}
		</h1>
	</div>
			<div class="small text-muted date mb-3">
			<i class="fa fa-calendar me-2"></i>
			{$announcement->getDatePosted()|date_format:$dateFormatShort}
		</div>	
				<div class="description">
					{if $announcement->getLocalizedDescription()}
						{$announcement->getLocalizedDescription()|strip_unsafe_html}
					{else}
						{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
					{/if}
				</div>
			</article>

		
</div>

{include file="frontend/components/footer.tpl"}
