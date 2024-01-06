<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsbanneri' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f606e27a4_95354356',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '8af71c78f182fe3f9067731dfdbddf27fa4e0afc' => 
    array (
      0 => 'app:frontendcomponentsbanneri',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65752f606e27a4_95354356 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/home/u608281967/domains/cavemen.cloud/public_html/jmmb-ojstraining/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/modifier.date_format.php','function'=>'smarty_modifier_date_format',),));
?>
<div class="banner-sec animate__animated animate__fadeInDown d-flex flex-column">
	
	<div id="bannerContainer" class="container align-items-center my-auto">
	    <?php if (!$_smarty_tpl->tpl_vars['issue']->value) {?>
			<h3 class="banner-subtitle-article"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"current.noCurrentIssueDesc"),$_smarty_tpl ) );?>
</h3>
		<?php } else { ?>
			<h1 class="banner-title">
				<a class="cover-journal" href="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('op'=>"view",'page'=>"issue",'path'=>$_smarty_tpl->tpl_vars['issue']->value->getBestIssueId()),$_smarty_tpl ) ) ));?>
"><?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'strip_unsafe_html' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getIssueIdentification() ));?>
</a>
			</h1>
			<h3 class="banner-subtitle">
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"submissions.published"),$_smarty_tpl ) );?>
 <?php echo smarty_modifier_date_format(call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['issue']->value->getDatePublished() )),$_smarty_tpl->tpl_vars['dateFormatShort']->value);?>

			</h3>
		<?php }?>
	</div>
</div><?php }
}
