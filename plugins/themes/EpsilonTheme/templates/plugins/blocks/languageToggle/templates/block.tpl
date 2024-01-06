{**
 * plugins/blocks/languageToggle/block.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- language toggle.
 *}
{if $enableLanguageToggle}

<div class="pkp_block block_language accordion" id="blockLang">
	<div class="accordion-item">
		<h4 class="accordion-header" id="langHead">
			<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#langBody" aria-expanded="false" aria-controls="langBody">{translate key="common.language"}</button>
		</h4>
		
		<div id="langBody" class="accordion-collapse collapse"  aria-labelledby="langHead" data-bs-parent="#blockLang">
			<div class="accordion-body p-0">
				<div class="list-group">
					{foreach from=$languageToggleLocales item=localeName key=localeKey}
						<div class="locale_{$localeKey|escape}{if $localeKey == $currentLocale} current{/if}" lang="{$localeKey|escape}">
							<a class="list-group-item list-group-item-action border-start-0 border-end-0 border-bottom-0" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">{$localeName}</a>
						</div>
					{/foreach}
				</div>
			</div>
		</div>
	</div>
</div>

{/if}