{**
 * plugins/blocks/mostRead/block.tpl
 *
 * Copyright (c) 2014-2018 Simon Fraser University
 * Copyright (c) 2003-2018 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * "Most Read" block.
 *}

	<div class="pkp_block block_most_read accordion" id="blockMostRead" >
		<div class="accordion-item">
			<h4 class="accordion-header" id="mostreadHead">
				<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMostRead" aria-expanded="false" aria-controls="collapseMostRead">
                {translate|escape key="plugins.block.mostRead.blockTitle"}
				</button>
			  
			</h4>
		
			<div id="mostreadBody" class="accordion-collapse collapse"  aria-labelledby="mostreadHead" data-bs-parent="#blockMostRead">
				<div class="accordion-body p-0">
					<div class="list-group">
						{foreach from=$resultMetrics item=article}
							<div class="most_read_article_title small"><a class="list-group-item list-group-item-action border-start-0 border-end-0" href="{url journal=$article.journalPath page="article" op="view" path=$article.articleId}">{$article.articleTitle}{if !empty($article.articleSubTitle)} {$article.articleSubTitle}{/if}</a> <span class="fa fa-folder-open-o ml-3 me-2"></span> {$article.metric}</div>
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>