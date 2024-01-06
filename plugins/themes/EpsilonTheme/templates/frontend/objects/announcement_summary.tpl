{**
 * templates/frontend/objects/announcement_summary.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display a summary view of an announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}
<div class="obj-wrapper animate__animated animate__fadeInUp">
	<div class="obj-summary">
	<div class="description-block">
		<h3 class="obj-title">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
				{$announcement->getLocalizedTitle()|escape}
			</a>
		</h3>
		<small class="text-muted my-3">
			<i class="fa fa-calendar me-2" aria-hidden="true"></i>
			{$announcement->getDatePosted()|escape}
		</small>
		
		{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		<div class="float-end">
			<a class="btn btn-outline-primary btn-sm" style="--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .75rem;" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
				{translate key="plugins.themes.EpsilonTheme.readmore"}<i class="fa fa-angle-right ms-2" aria-hidden="true"></i>
			</a>
		</div>
	</div>
	</div>
</div><!-- .announcement-summary -->
