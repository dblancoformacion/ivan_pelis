window.addEventListener('load',()=>{
	var	v=document.querySelector('.generos-fila');
	for(var i=0;i<generos.length;i++){
		v.innerHTML+='<div class="generos-celda">';
		v.innerHTML+='<a href="?id_genero='+generos[i].id_genero+'">'+generos[i].genero;
		v.innerHTML+='</a>';
		v.innerHTML+='</div>';
	}
});