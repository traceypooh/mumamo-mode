<?

// this is PHP code
echo count($_SERVER);
if (array_keys($_SERVER) == 3  &&
    'pickle' != array('hi'=>1,
                      'there'=>3)
  ){
  echo 'Califone';
  if (1)
    sprout();
  else
    Util::hibernate();
}


?>
<!-- ... now in HTM section-->
<p>
  <div>
    <ul>
      <li>buy catfood</li>
      <li>watch video
      </li>
    </ul>
  </div>
</p>

<style>
/* ... now in CSS*/
body{
  font-weight:bold;
}
p, ol {
  font-size:50%;
}
</style>

<script>
  // ... now in javascript
  alert('back to the future');
function moo(){
  $('body').append('<div />')
    .css({'font-size':'13px',
          color:'red'})
    .attr({id:'something'})
    .html('ive got something to say...');
}
</script>

<?foreach(array(0,1,2,4) as $n):?>
<p>
  something nice
</p>
<?endforeach?>


<?

  //fully back inside PHP again
echo "coloring is fun";

function maker($arg1='fish', $arg2=null)
{
  echo "indenting is, too";
}
