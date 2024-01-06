{**
 * plugins/blocks/information/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- information links.
 *
 *}
{if !empty($forReaders) || !empty($forAuthors) || !empty($forLibrarians)}


<div class="pkp_block block_information accordion" id="blockInfo">
<div class="accordion-item">
	<h4 class="accordion-header" id="infoHead">
		<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#infoBody" aria-expanded="false" aria-controls="infoBody">{translate key="plugins.block.information.link"}</button>
	</h4>
	<div id="infoBody" class="accordion-collapse collapse" aria-labelledby="infoHead" data-bs-parent="#blockInfo">
		<div class="accordion-body p-0">
			<div class="list-group">
				{if !empty($forReaders)}
				<div>
					<a class="list-group-item list-group-item-action border-start-0 border-end-0 border-top-0 border-bottom-0" href="{url router=$smarty.const.ROUTE_PAGE page="information" op="readers"}">
					{translate key="navigation.infoForReaders"}
					</a>
				</div>
				{/if}
				{if !empty($forAuthors)}
				<div>
					<a class="list-group-item list-group-item-action border-start-0 border-end-0 border-bottom-0" href="{url router=$smarty.const.ROUTE_PAGE page="information" op="authors"}">
					{translate key="navigation.infoForAuthors"}
					</a>
				</div>
				{/if}
				{if !empty($forLibrarians)}
				<div>
					<a class="list-group-item list-group-item-action border-start-0 border-end-0 border-bottom-0" href="{url router=$smarty.const.ROUTE_PAGE page="information" op="librarians"}">
					{translate key="navigation.infoForLibrarians"}
					</a>
				</div>
				{/if}
			</div>
		</div>
	</div>
</div>
</div>

{/if}