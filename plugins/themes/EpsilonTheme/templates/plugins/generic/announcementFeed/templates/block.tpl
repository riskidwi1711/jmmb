{**
 * plugins/generic/announcementFeed/templates/block.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Announcement feed plugin navigation sidebar.
 *
 *}
<div class="pkp_block block_announcement_feed accordion" id="blockAnnouncement">
	<div class="accordion-item">
		<h4 class="accordion-header" id="announcementHead">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#announcementBody" aria-expanded="false" aria-controls="announcementBody">
                {translate key="announcement.announcements"}
              </button>
		</h4>
	<div id="announcementBody" class="accordion-collapse collapse"  aria-labelledby="announcementHead" data-bs-parent="#blockAnnouncement">
		<div class="accordion-body">
		<div>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="AnnouncementFeedGatewayPlugin"|to_array:"atom"}">
					<img src="{$baseUrl}/lib/pkp/templates/images/atom.svg" alt="{translate key="plugins.generic.announcementfeed.atom.altText"}">
				</a>
			</div>
			<div>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="AnnouncementFeedGatewayPlugin"|to_array:"rss2"}">
					<img src="{$baseUrl}/lib/pkp/templates/images/rss20_logo.svg" alt="{translate key="plugins.generic.announcementfeed.rss2.altText"}">
				</a>
			</div>
			<div>
				<a href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="AnnouncementFeedGatewayPlugin"|to_array:"rss"}">
					<img src="{$baseUrl}/lib/pkp/templates/images/rss10_logo.svg" alt="{translate key="plugins.generic.announcementfeed.rss1.altText"}">
				</a>
			</div>
	</div>
	</div>
	</div>
</div>
