{**
* templates/frontend/objects/article_details.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief View of an Article which displays all details about the article.
*  Expected to be primary object on the page.
*
* @uses $article Article This article
* @uses $issue Issue The issue this article is assigned to
* @uses $section Section The journal section this article is assigned to
* @uses $keywords array List of keywords assigned to this article
* @uses $citationFactory @todo
* @uses $pubIdPlugins @todo
*}

<article class="article-details">
	<div class="row g-3">
		<h4 class="sr-only">{translate key="plugins.themes.EpsilonTheme.article.details"}</h4>
		
		<!-- article column -->
		<div class="article-content col-md-8 col-lg-8">
			<div class="d-block d-sm-none">
			{if $section}
				{include file="frontend/components/breadcrumbs_article.tpl" currentTitle=$section->getLocalizedTitle()}
			{else}
				{include file="frontend/components/breadcrumbs_article.tpl" currentTitleKey="article.article"}
			{/if}
			</div>
			
			<!-- article title -->
			<header class="d-block d-sm-none mb-5">
				<h2 class="article-title">
					{$article->getLocalizedTitle()|escape}
				</h2>
				{if $article->getLocalizedSubtitle()}
				<h3 class="article-subtitle">
					{$article->getLocalizedSubtitle()|escape}
				</h3>
				{/if}
			</header>
			
			<!-- .article main content -->
			<section class="article-main">
				{* Screen-reader heading for easier navigation jumps *}
				<h4 class="sr-only">{translate key="plugins.themes.EpsilonTheme.article.main"}</h4>
				{if $article->getAuthors()}
				<div class="row g-3">
					{foreach from=$article->getAuthors() item=author}
					<div class="author-detail col-md-6">
						<figure>
						<blockquote class="blockquote">
							<div class="author-name">{$author->getFullName()|escape}</div>
						</blockquote>
						{if $author->getLocalizedAffiliation()}
							<figcaption class="blockquote-footer">
								<i class="fa fa-university me-2" aria-hidden="true"></i>{$author->getLocalizedAffiliation()|escape}
							</figcaption>
						{/if}
						{if $author->getOrcid()}
						<div class="author-orcid">
							<figcaption class="blockquote-footer">
							<img class="img-fluid" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/orcid-icon.png" width=16/>
							<a href="{$author->getOrcid()|escape}" target="_blank">
							{$author->getOrcid()|escape}
							</a>
							</figcaption>
						</div>
						{/if}
						</figure>
					</div>
					{/foreach}
				</div>
				{/if}
				
				<!-- article navtabs for article main content -->
				<nav>
					<div class="nav nav-pills mb-1" id="article_navtab" role="tablist">
						<button class="nav-link  active" id="nav-abstract-tab" data-bs-toggle="tab" data-bs-target="#nav-abstract" type="button" role="tab" aria-controls="nav-abstract" aria-selected="true"><i class="fa fa-file-text-o me-2"></i>{translate key="article.abstract"}</button>
						<button class="nav-link " id="nav-refference-tab" data-bs-toggle="tab" data-bs-target="#nav-refference" type="button" role="tab" aria-controls="nav-refference" aria-selected="false"><i class="fa fa-files-o me-2"></i>{translate key="submission.citations"}</button>
						{if $author->getLocalizedData('biography')}
						<button class="nav-link " id="nav-authorBio-tab" data-bs-toggle="tab" data-bs-target="#nav-authorBio" type="button" role="tab" aria-controls="nav-authorBio" aria-selected="false">
						<i class="fa fa-user-o me-2"></i>
						{if $hasBiographies > 1}
						{translate key="submission.authorBiographies"}
						{else}
						{translate key="submission.authorBiography"}
						{/if}
						</button>
						{/if}
						{if $citation}
					<button class="nav-link" type="button" data-bs-toggle="modal" data-bs-target="#citeModal">
						<i class="fa fa-copy me-2"></i>{translate key="submission.howToCite"}
					</button>
					{/if}	
					</div>
				</nav>
				
				<!-- article abstract -->
				<div class="tab-content" id="article_tabcontents">
					<div class="tab-pane fade show active" id="nav-abstract" role="tabpanel" aria-labelledby="nav-abstract-tab">
						<div class="card card-body">
							{* Keywords *}
							{if !empty($keywords[$currentLocale])}
							<div class="small keywords mb-2">
								{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
								<strong>{translate key="semicolon" label=$translatedKeywords}</strong>
								{foreach from=$keywords item=keyword}
								{foreach name=keywords from=$keyword item=keywordItem}
								<span class="badge bg-primary-darken-2">
									{$keywordItem|escape}{if !$smarty.foreach.keywords.last} {/if}
								</span>
								{/foreach}
								{/foreach}
							</div>
							{/if}
							{* Abstrac *}
							{if $article->getLocalizedAbstract()}
								{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
							{/if}
						</div>
					</div>
					
					<div class="tab-pane fade" id="nav-refference" role="tabpanel" aria-labelledby="nav-refference-tab">
						<div class="card card-body">
							{* References *}
							{if $parsedCitations || $publication->getData('citationsRaw')}
								{if $parsedCitations}
									{foreach from=$parsedCitations item="parsedCitation"}
									<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
								{/foreach}
							{else}
								{$publication->getData('citationsRaw')|escape|nl2br}
							{/if}
						{/if}
					</div>
					</div>
					<div class="tab-pane fade" id="nav-authorBio" role="tabpanel" aria-labelledby="nav-authorBio-tab">
						<div class="card card-body">
							{* Author biographies *}
							{assign var="hasBiographies" value=1}
							{foreach from=$publication->getData('authors') item=author}
								{if $author->getLocalizedData('biography')}
									{assign var="hasBiographies" value=$hasBiographies+1}
								{/if}
							{/foreach}
							
							{if $hasBiographies}
							<section class="item author_bios">
								{foreach from=$publication->getData('authors') item=author}
								{if $author->getLocalizedData('biography')}
								<div class="sub_item">
									<h6 class="label">
										{if $author->getLocalizedData('affiliation')}
										{capture assign="authorName"}
											<strong>{$author->getFullName()|escape}</strong>
										{/capture}
										{capture assign="authorAffiliation"}
											<span class="affiliation">
												<i class="fa fa-university me-1"></i>{$author->getLocalizedData('affiliation')|escape}
											</span>
										{/capture}
										{translate key="submission.authorWithAffiliation" name=$authorName affiliation=$authorAffiliation}
										{else}
											{$author->getFullName()|escape}
										{/if}
									</h6>
									<div class="value text-muted fst-italic">
										{$author->getLocalizedData('biography')|strip_unsafe_html}
									</div>
								</div>
							{/if}
							{/foreach}
							</section>
							{/if}
						</div>
					</div>
				</div>
				<div class="marker"></div>
			</section>
		</div><!-- .col-md-8 -->
		
		
		<!-- article sidebar -->
		<section class="article-sidebar col-md-4 col-lg-4">
			<h4 class="sr-only">{translate key="plugins.themes.EpsilonTheme.article.sidebar"}</h4>
			<div class="position-sticky" style="top: 5.5rem;">
			<div class="tab-content" id="nav-tabSidebarContent">
				<div role="tabpanel" class="list-group tab-pane fade show active" id="baseInfo" aria-labelledby="nav-baseInfo-tab">
					<div class="card">
					  
					<div class="card-body">
					{* Screen-reader heading for easier navigation jumps *}
					
					
					{* Article/Issue cover image *}
					{if $article->getLocalizedCoverImage() || $issue->getLocalizedCoverImage()}
					<div class="list-group-item px-0 mt-0 pt-0 border-top-0 border-start-0 border-end-0">
						<div class="cover-image">
							{if $article->getLocalizedCoverImage()}
							<img class="img-fluid rounded mb-0 abc"  style="max-width:100%;" src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
							{else}
							<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
								<img class="img-fluid rounded mb-0 abc"  style="max-width:100%;" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
							</a>
							{/if}
						</div>
					</div>
					{else}
					<div class="list-group-item px-0 mt-0 pt-0 border-top-0 border-start-0 border-end-0">
							<div class="cover-image">
								<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
									<img class="img-fluid rounded mb-0 abc" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/no-cover.png">
								</a>
							</div>
					</div>
					{/if}

					{* Article Galleys *}
					{if $primaryGalleys || $supplementaryGalleys}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0">
						<div class="download-btn">
							{if $primaryGalleys}
							{foreach from=$primaryGalleys item=galley}
							<span class="value galleys_links">
							{include file="frontend/objects/galley_link.tpl" parent=$article purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
							</span>
							{/foreach}
							{/if}
							{if $supplementaryGalleys}
							{foreach from=$supplementaryGalleys item=galley}
							<span class="value supplementary_galleys_links">
							{include file="frontend/objects/galley_link.tpl" parent=$article isSupplementary="1"}
							</span>
							{/foreach}
							{/if}
						</div>
					</div>
					{/if}
					
					{* Published date *}
					{if $article->getDatePublished()}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0">
						<div class=" date-published">
							{capture assign=translatedDatePublished}{translate key="submissions.published"}{/capture}
							{translate key="semicolon" label=$translatedDatePublished} <strong>{$article->getDatePublished()|date_format}</strong>
						</div>
					</div>
					{/if}
					
					{* DOI (requires plugin) *}
					{foreach from=$pubIdPlugins item=pubIdPlugin}
					{if $pubIdPlugin->getPubIdType() != 'doi'}
					{continue}
					{/if}
					{if $issue->getPublished()}
					{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					{else}
					{assign var=pubId value=$pubIdPlugin->getPubId($article)}
					{* Preview pubId *}
					{/if}
					{if $pubId}
					{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0">
						<div class=" doi">
							{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
							<div class="d-flex align-items-start">
								<div class="flex-shrink-0">
									<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-icon.png"> 
								</div>
								<div class="ms-2" 
   style="overflow: auto;
    flex-wrap: wrap;
"><a href="{$doiUrl}">{$doiUrl}</a></div>
							</div>
						</div>
					</div>
					{/if}
					{/foreach}
					
					{* Screen-reader heading for easier navigation jumps *}
					{* PubIds (requires plugins) *}
					{foreach from=$pubIdPlugins item=pubIdPlugin}
					{if $pubIdPlugin->getPubIdType() == 'doi'}
					{continue}
					{/if}
					{if $issue->getPublished()}
					{assign var=pubId value=$article->getStoredPubId($pubIdPlugin->getPubIdType())}
					{else}
					{assign var=pubId value=$pubIdPlugin->getPubId($article)}
					{* Preview pubId *}
					{/if}
					{if $pubId}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 pub_ids">
						<div class="">
							{$pubIdPlugin->getPubIdDisplayType()|escape}
						</div>
						<div class="">
							{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							<strong>
							<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
							{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
							</a>
							</strong>
							{else}
							{$pubId|escape}
							{/if}
						</div>
					</div>
					{/if}
					{/foreach}
					
					{* Article Subject *}
					{if $article->getLocalizedSubject()}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 subject">
						<div class="">
							{translate key="article.subject"}: {$article->getLocalizedSubject()|escape}
						</div>
					</div>
					{/if}
					{* Issue article appears in *}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 issue">
						<div class="">
							{translate key="issue.issue"}: <strong><a class="title" href="{url|escape page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a></strong>
						</div>
					</div>
					{if $section}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 section">
						<div class="">
							{translate key="section.section"}: <strong>{$section->getLocalizedTitle()|escape}</strong>
						</div>
					</div>
					{/if}
					
					{* View stat *}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 issue">
						<div class="">
							Metrics:
							{assign var=galleys value=$article->getGalleys()}
							<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.view"}">
							<i class="fa fa-eye me-1"></i>{$article->getViews()}</span>
							{if $galleys}
							{foreach from=$primaryGalleys item=galley}
							<span class="me-2" title="{translate key="plugins.themes.EpsilonTheme.download"}">
							<i class="fa fa-cloud-download me-1"></i>{$galley->getViews()}</span>
							{/foreach}
							{/if}
						</div>
					</div>
					{if $activeTheme->getOption('dimensionBadgeDetailArticle')}
					<div class="list-group-item px-0 border-top-0 border-start-0 border-end-0 download-chart">
						{* Dimensions Badge *}
						<span class="mb-2 __dimensions_badge_embed__" data-doi="{$pubId|escape}" data-legend="always" data-style="small_circle"></span>
						<script async src="https://badge.dimensions.ai/badge.js" charset="utf-8"></script>
						{* End of Dimensions Badge *}
					
						{* download chart *}
						{call_hook name="Templates::Article::Main"}
					</div>
					{/if}
						
					
					{* Licensing info *}
			{if $currentContext->getLocalizedData('licenseTerms') || $publication->getData('licenseUrl')}
				<div class="list-group-item px-0 mb-0 border-top-0 border-start-0 border-end-0  border-bottom-0 article-details-block article-details-license small">
					{if $publication->getData('licenseUrl')}
						{if $ccLicenseBadge}
							{if $publication->getLocalizedData('copyrightHolder')}
								<p class="mb-2">{translate key="submission.copyrightStatement" copyrightHolder=$publication->getLocalizedData('copyrightHolder') copyrightYear=$publication->getData('copyrightYear')}</p>
							{/if}
							{$ccLicenseBadge}
						{else}
							<a href="{$publication->getData('licenseUrl')|escape}" class="copyright">
								{if $publication->getLocalizedData('copyrightHolder')}
									{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder copyrightYear=$publication->getData('copyrightYear')}
								{else}
									{translate key="submission.license"}
								{/if}
							</a>
						{/if}
					{/if}
					{$currentContext->getLocalizedData('licenseTerms')}
				</div>
			{/if}
			
					
				</div>
				</div>
			</div>
		{call_hook name="Templates::Article::Details"}
	</div><!-- card-body -->
	</div>
	</section><!-- .article-sidebar col-md-4 -->
	
	</div><!-- .row -->
</article>