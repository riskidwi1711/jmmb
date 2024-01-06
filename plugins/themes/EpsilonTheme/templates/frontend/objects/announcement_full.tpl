{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}

<article class="announcement-full">
	<div class="page-header">
		<h3 class="">
			{$announcement->getLocalizedTitle()|escape}
		</h3>
	</div>
		
	<div class="small text-muted date font-weight-normal mb-4">
		<i class="fa fa-calendar me-2"></i>
		{translate key="announcement.postedOn" postDate=$announcement->getDatePosted()|escape}
	</div>
	<div class="description">
		{if $announcement->getLocalizedDescription()}
			{$announcement->getLocalizedDescription()|strip_unsafe_html}
		{else}
			{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		{/if}
	</div>
</article><!-- .announcement-full" -->
