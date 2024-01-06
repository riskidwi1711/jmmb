{**
 * plugins/generic/webFeed/templates/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Feed plugin navigation sidebar.
 *
 *}

<div class="pkp_block block_web_feed accordion" id="blockFeed">
	<div class="accordion-item">
		<h4 class="accordion-header" id="feedHead">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#feedBody" aria-expanded="false" aria-controls="feedBody">
                {translate key="journal.currentIssue"}
              </button>
		</h4>
		<div id="feedBody" class="accordion-collapse collapse"  aria-labelledby="feedHead" data-bs-parent="#blockFeed">
			<div class="accordion-body">
				
					<div>
						<a target="_blank" href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"atom"}"><img src="{$baseUrl}/lib/pkp/templates/images/atom.svg" alt="{translate key="plugins.generic.webfeed.atom.altText"}"></a>
					</div>
					<div>
						<a target="_blank" href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"rss2"}"><img src="{$baseUrl}/lib/pkp/templates/images/rss20_logo.svg" alt="{translate key="plugins.generic.webfeed.rss2.altText"}"></a>
					</div>
					<div>
						<a target="_blank" href="{url router=$smarty.const.ROUTE_PAGE page="gateway" op="plugin" path="WebFeedGatewayPlugin"|to_array:"rss"}"><img src="{$baseUrl}/lib/pkp/templates/images/rss10_logo.svg" alt="{translate key="plugins.generic.webfeed.rss1.altText"}"></a>
					</div>
				
			</div>
		</div>
	</div>
</div>