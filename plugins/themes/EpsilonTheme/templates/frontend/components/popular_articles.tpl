{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}


{* Most Popular Articles *}
				
				{if !empty($popularArticles)}
				
					<div class="row g-3 px-2 most-view">
						
						
						{foreach from=$popularArticles item="popularArticle" key="popularNumber"}
							
							<div class="article-summary p-3">
								{if $popularArticle["localized_title"]}
									<a href="{url page="article" op="view" path=$popularNumber}">
										<h5>
											{$popularArticle["localized_title"][{$locale}]|escape}
										</h5>
									</a>
								{/if}
								{if array_key_exists('authors', $popularArticle)}
									<span class="blockquote-footer text-dark authors my-1">
										{foreach from=$popularArticle['authors'] item="popularAuthor"}
											<span class="list-content__article-author">
												<span>{$popularAuthor[{$locale}]['given_name']|escape}</span>
												<span>{$popularAuthor[{$locale}]['family_name']|escape}</span>
											</span>
										{/foreach}
									</span>
									{*
									<small class="d-block text-muted mt-2"><i class="fa fa-calendar-o me-2" aria-hidden="true"></i>{translate key="submissions.published"}: {$popularArticle['date_published']|date_format:$dateFormatShort}</small>
									*}
								{/if}
							
							</div>
						{/foreach}
					
					</div>
				{/if}
