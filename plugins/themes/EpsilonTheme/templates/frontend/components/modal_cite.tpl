<div class="modal fade" id="citeModal" tabindex="-1" role="dialog" aria-labelledby="citeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-fullscreen-sm-down">
		<div class="modal-content rounded-0">
			<div class="modal-header">
				<h4 class="modal-title" id="citeModalLabel">{translate key="submission.howToCite"}</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				{* How to cite *}
				{if $citation}
					<div class="dropdown">
						<button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							{translate key="submission.howToCite.citationFormats"}
						</button>
						<div class="dropdown-menu">
							{foreach from=$citationStyles item="citationStyle"}
							<a class="dropdown-item small" aria-controls="citationOutput" href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}" data-load-citation data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}">
								{$citationStyle.title|escape}
							</a>
							{/foreach}
							{if count($citationDownloads)}
							<div class="dropdown-divider"></div>
							<h6 class="dropdown-header px-3">{translate key="submission.howToCite.downloadCitation"}</h6>
							{foreach from=$citationDownloads item="citationDownload"}
							<a class="dropdown-item small" href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
								<i class="fa fa-cloud-download"></i>
								{$citationDownload.title|escape}
							</a>
							{/foreach}
							{/if}
						</div>
					</div>
				{/if}
				
				<div class="card text-bg-light mt-3 mb-0">
					<div class="card-body">
				<div id="citationOutput" role="region" aria-live="polite">
					
						{$citation}
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
