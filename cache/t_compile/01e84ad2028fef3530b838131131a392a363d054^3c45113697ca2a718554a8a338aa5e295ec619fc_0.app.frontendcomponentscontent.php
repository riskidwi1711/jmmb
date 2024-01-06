<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-09 15:45:18
  from 'app:frontendcomponentscontent' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65748b8e3dfa19_44268894',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3c45113697ca2a718554a8a338aa5e295ec619fc' => 
    array (
      0 => 'app:frontendcomponentscontent',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65748b8e3dfa19_44268894 (Smarty_Internal_Template $_smarty_tpl) {
?>		<div id="wrapperContainer" class="pkp_structure_content container-sm animate__animated animate__fadeInUp">
		<div class="row g-3">
			<?php if (empty($_smarty_tpl->tpl_vars['isFullWidth']->value) && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "article" && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "user" && call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['requestedPage']->value )) != "login") {?>
			<main class="pkp_structure_main col-sm-12 col-md-8 col-lg-9 animate__animated animate__fadeInUp" role="main">
			<?php } else { ?>
			<main class="pkp_structure_main col-sm-12 animate__animated animate__fadeInUp" role="main">
			<?php }
}
}
