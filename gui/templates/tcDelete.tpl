{* 
TestLink Open Source Project - http://testlink.sourceforge.net/
$Id: tcDelete.tpl,v 1.7 2006/10/23 06:42:22 franciscom Exp $
Purpose: smarty template - delete test case in test specification

*}

{include file="inc_head.tpl"}

<body>
<div class="workBack">
{include file="inc_title.tpl" title=$title } 
{include file="inc_update.tpl" result=$sqlResult action=$action item="test case" refresh=$refresh_tree}

{if $sqlResult == ''}
  <p>
  {if $exec_status_quo neq ''}
    <table class="smallGrey" >
    <th>{lang_get s='th_version'}</th>
    <th>{lang_get s='th_linked_to_tplan'}</th> 
    <th>{lang_get s='th_executed'}</th> 
  	{foreach key=tcversion_id item=on_tplan_status from=$exec_status_quo}
      {foreach key=tplan_id item=status from=$on_tplan_status}
      <tr>
      <td align="right">{$status.version}</td>
      <td align="right">{$status.tplan_name}</td>
      <td align="center">{if $status.executed neq ""}<img src="icons/apply_f2_16.png">{/if}</td>
      </tr>
      {/foreach}  
  	{/foreach}
    </table>
    
    {$delete_message}
  {/if}

	<p>{lang_get s='question_del_tc'}</p>
	<form method="post" action="lib/testcases/tcEdit.php">
	  <input type="hidden" name="testcase_id" value="{$testcase_id}">
	  <input type="hidden" name="tcversion_id" value="{$tcversion_id}">
		<input type="submit" id="do_delete" name="do_delete" value="{lang_get s='btn_yes_iw2del'}" />
	</form>
{/if}

</div>
</body>
</html>