<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsbanner.' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f606ed234_56682848',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3c87604c8363d4a19144a06f8f19adaad8754f23' => 
    array (
      0 => 'app:frontendcomponentsbanner.',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65752f606ed234_56682848 (Smarty_Internal_Template $_smarty_tpl) {
?><!-- Banner main -->
<div class="banner-sec banner-fst animate__animated animate__fadeInDown d-flex flex-column">
	
	<div id="bannerContainer" class="container align-items-center my-auto">
		
		<!-- Journal name -->
		<h2 class="banner-title">
			<a href="<?php echo $_smarty_tpl->tpl_vars['homeUrl']->value;?>
" title="<?php echo $_smarty_tpl->tpl_vars['displayPageHeaderTitle']->value;?>
"><?php echo $_smarty_tpl->tpl_vars['displayPageHeaderTitle']->value;?>
</a>
		</h2>
		
		<!-- tagline or subtitle for journal -->
		<?php if ($_smarty_tpl->tpl_vars['currentContext']->value->getSetting('publisherInstitution')) {?>
			<p><?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getLocalizedData('acronym');?>
 | <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.EpsilonTheme.publisher"),$_smarty_tpl ) );?>

				<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getSetting('publisherInstitution');?>

			</p>
			
		<?php }?>
		
		<!-- journal ISSN -->
		
		<p class="serial mb-0">
			<?php if ($_smarty_tpl->tpl_vars['currentContext']->value->getSetting('onlineIssn')) {?>
				<span class="e-issn"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.EpsilonTheme.onlineISSN"),$_smarty_tpl ) );?>
 <a href="https://portal.issn.org/resource/issn/<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getSetting('onlineIssn');?>
" target="_blank"><?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getSetting('onlineIssn');?>
</a></span>
			<?php }?>
			<?php if ($_smarty_tpl->tpl_vars['currentContext']->value->getSetting('printIssn')) {?>
				<span class="p-issn"> | <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"plugins.themes.EpsilonTheme.printISSN"),$_smarty_tpl ) );?>
 <a href="https://portal.issn.org/resource/issn/<?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getSetting('printIssn');?>
" target="_blank"><?php echo $_smarty_tpl->tpl_vars['currentContext']->value->getSetting('printIssn');?>
</a></span>
			<?php }?>
		</p>
		

	</div>
</div>
<?php }
}
