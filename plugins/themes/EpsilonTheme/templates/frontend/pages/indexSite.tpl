{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/headerIndexSite.tpl"}

<div class="clearfix py-5"></div>
<div class="pkp_structure_content page_indexSite animate__animated animate__fadeInUp">
	<div class="container">
		<div id="main-site" class="page_index_site">
			{if $about}
			<div class="about_site">{$about|nl2br}</div>
			{/if}
			
			<div class="journals">
				
				
				{if !$journals|@count}
				<div class="alert alert-info alert-dismissible" role="alert">
					{translate key="site.noJournals"}
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
				{else}
				
				<div class="journal-list row g-3">
					{foreach from=$journals item=journal}
					{capture assign="url"}{url journal=$journal->getPath()}{/capture}
					{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
					{assign var="description" value=$journal->getLocalizedDescription()}
					<div class="col-lg-6">
						<div class="journal-block animate__animated animate__fadeInUp border-0 shadow rounded-2" style="
    
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 20px;
    border-radius: 13px!important;
    align-items: center;

">
							
							{if $thumb}
							<div class="image-block d-md-block">
								<a href="{$url|escape}" >
									<img class="img-fluid" style="margin: 0 !important;" src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape}"{/if}>
								</a>
							</div>
							{/if}
							
							<div class="description-block">
								<h3 class="mt-4">
									<a href="{$url|escape}" rel="bookmark" >
										<p style="font-size: 18px;line-height: 1.2;text-align: center; font-weight:bold;">{$journal->getLocalizedName()}</p>
									</a>
								</h3>
								{if $description}
								<div class="description excerpt-txt text-center">
									{$description}
								</div>
								{/if}
								<div class="mt-3 d-flex align-items-center justify-content-center w-100 mt-4">
									<a class="btn btn-primary btn-sm me-2" href="{$url|escape}"><i class="fa fa-desktop me-2" aria-hidden="true"></i>
										{translate key="site.journalView"}
									</a>
									<a class="btn btn-outline-primary btn-sm" href="{url|escape journal=$journal->getPath() page="issue" op="current"}"><i class="fa fa-check me-2" aria-hidden="true"></i>
										{translate key="site.journalCurrent"}
									</a>
								</div>
							</div>
							
						</div><!-- journal-block -->
						
					</div><!-- col-lg-6 -->
				{/foreach}
			</div> <!-- row -->

			
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footerIndexSite.tpl"}
