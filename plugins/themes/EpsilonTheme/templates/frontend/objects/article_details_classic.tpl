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
	<div class="row">
		<h4 class="sr-only">{translate key="plugins.themes.EpsilonTheme.article.details"}</h4>
		<!-- article column -->
		<div class="article-content col-md-8 col-lg-9">
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
				{foreach from=$article->getAuthors() item=author}
				<div class="author-detail">
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
				{/if}
				{* Keywords *}
				{if !empty($keywords[$currentLocale])}
				<div class="small keywords border-0 my-3">
					{capture assign=translatedKeywords}{translate key="article.subject"}{/capture}
					{translate key="semicolon" label=$translatedKeywords}
					{foreach from=$keywords item=keyword}
					{foreach name=keywords from=$keyword item=keywordItem}
					<span class="badge bg-primary-darken-2">
					{$keywordItem|escape}{if !$smarty.foreach.keywords.last} {/if}
					</span>
					{/foreach}
					{/foreach}
				</div>
				{/if}
				<div class="list-group">
					{* Abstract *}
					{if $article->getLocalizedAbstract()}
					<div class="list-group-item">
						<h4 class="mb-3">{translate key="article.abstract"}</h4>
						{$article->getLocalizedAbstract()|strip_unsafe_html|nl2br}
					</div>
					{/if}
					{* Author biographies *}
					{assign var="hasBiographies" value=0}
					{foreach from=$publication->getData('authors') item=author}
					{if $author->getLocalizedData('biography')}
					{assign var="hasBiographies" value=$hasBiographies+1}
					{/if}
					{/foreach}
					{if $hasBiographies}
					<div class="list-group-item">
						<h4 class="mb-3">
							{if $hasBiographies > 1}
							{translate key="submission.authorBiographies"}
							{else}
							{translate key="submission.authorBiography"}
							{/if}
						</h4>
						<section class="item author_bios">
							{foreach from=$publication->getData('authors') item=author}
								{if $author->getLocalizedData('biography')}
							<div class="sub_item">
								<h6 class="label">
									{if $author->getLocalizedData('affiliation')}
										{capture assign="authorName"}
											{$author->getFullName()|escape}
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
						
					</div>
					{/if}
					
					{if $parsedCitations || $publication->getData('citationsRaw')}
					<div class="list-group-item">
						<h4 class="mb-3">
							{translate key="submission.citations"}
						</h4>
						{* References *}
						{if $parsedCitations}
						{foreach from=$parsedCitations item="parsedCitation"}
						<p>{$parsedCitation->getCitationWithLinks()|strip_unsafe_html} {call_hook name="Templates::Article::Details::Reference" citation=$parsedCitation}</p>
						{/foreach}
						{else}
						{$publication->getData('citationsRaw')|escape|nl2br}
						{/if}
					</div>
					{/if}
				</div>
			</section>
		</div><!-- article-content col-md-8 -->
		
		<!-- article sidebar -->
		<section class="article-sidebar col-md-4 col-lg-3">
			<h4 class="sr-only">{translate key="plugins.themes.EpsilonTheme.article.sidebar"}</h4>
			<div class="position-sticky" style="top: 5.5rem;">
				<div class="card">
					<div class="card-body">
						<div class="list-group">
							{* Screen-reader heading for easier navigation jumps *}
							{* Article/Issue cover image *}
							{if $article->getLocalizedCoverImage() || $issue->getLocalizedCoverImage()}
							<div class="list-group-item pt-0">
								<div class="cover-image">
									{if $article->getLocalizedCoverImage()}
									<img class="img-fluid rounded mb-0" src="{$article->getLocalizedCoverImageUrl()|escape}"{if $article->getLocalizedCoverImageAltText()} alt="{$article->getLocalizedCoverImageAltText()|escape}"{/if}>
									{else}
									<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
									<img class="img-fluid mb-0 rounded" src="{$issue->getLocalizedCoverImageUrl()|escape}"{if $issue->getLocalizedCoverImageAltText()} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
									</a>
									{/if}
								</div>
							</div>
							{else}
							<div class="list-group-item pt-0">
								<div class="cover-image">
									<a href="{url page="issue" op="view" path=$issue->getBestIssueId()}">
									<img class="img-fluid mb-0 rounded" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/no-cover.png">
									</a>
								</div>
							</div>
							{/if}
							
							{* Article Galleys *}
							{if $primaryGalleys || $supplementaryGalleys}
							<div class="list-group-item">
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
							<div class="list-group-item">
								<div class=" date-published">
									{capture assign=translatedDatePublished}{translate key="submissions.published"}{/capture}
									{translate key="semicolon" label=$translatedDatePublished} {$article->getDatePublished()|date_format}
								</div>
							</div>
							{/if}
							
							{* How to cite *}
							{if $citation}
							<div class="list-group-item">
								<div class="how-to-cite mb-1">
									{translate key="submission.howToCite"}
								</div>
								<div class="alert alert-secondary bg-light mb-0 p-2 ">
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
											<span class="dropdown-header px-3">{translate key="submission.howToCite.downloadCitation"}</span>
											{foreach from=$citationDownloads item="citationDownload"}
											<a class="dropdown-item small" href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
											<i class="fa fa-cloud-download me-1"></i>{$citationDownload.title|escape}
											</a>
											{/foreach}
											{/if}
										</div>
									</div>
									<div id="citationOutput" class="small" role="region" aria-live="polite">
										{$citation}
									</div>
									
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
							<div class="list-group-item">
								<div class=" doi">
									{capture assign=translatedDoi}{translate key="plugins.pubIds.doi.readerDisplayName"}{/capture}
									<div class="d-flex align-items-center">
										<div class="flex-shrink-0">
											<img src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/doi-icon.png"> 
										</div>
										<div class="ms-2"><a href="{$doiUrl}">{$doiUrl}</a></div>
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
							<div class="list-group-item pub_ids">
								<div class="">
									{$pubIdPlugin->getPubIdDisplayType()|escape}
								</div>
								<div class="">
									{if $pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									<a id="pub-id::{$pubIdPlugin->getPubIdType()|escape}" href="{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}">
									{$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
									</a>
									{else}
									{$pubId|escape}
									{/if}
								</div>
							</div>
							{/if}
							{/foreach}
							{* Article Subject *}
							{if $article->getLocalizedSubject()}
							<div class="list-group-item subject">
								<div class="">
									{translate key="article.subject"}: {$article->getLocalizedSubject()|escape}
								</div>
							</div>
							{/if}
							{* Issue article appears in *}
							<div class="list-group-item issue">
								<div class="">
									{translate key="issue.issue"}: <a class="title" href="{url|escape page="issue" op="view" path=$issue->getBestIssueId($currentJournal)}">{$issue->getIssueIdentification()|escape}</a>
								</div>
							</div>
							{if $section}
							<div class="list-group-item section">
								<div class="">
									{translate key="section.section"}: {$section->getLocalizedTitle()|escape}
								</div>
							</div>
							{/if}
							{* View stat *}
							<div class="list-group-item issue">
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
							<div class="list-group-item download-chart">
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
							<div class="list-group-item article-details-license small">
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
						</div><!-- card-body -->
					</div><!-- card -->
				</div><!-- list-group -->
				
			</div><!-- position-sticky -->
			{call_hook name="Templates::Article::Details"}
		</section><!-- .article-sidebar col-md-4 -->
	
	</div><!-- .row -->
</article>