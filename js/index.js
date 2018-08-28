/*JS DOCUMENT */

window.addEventListener('load',()=>{

	var g=document.querySelector('.dropdown-menu');
    for(var i=0;i<generos.length;i++){
        g.innerHTML+='<a class="dropdown-item"';
        g.innerHTML+='<a href="?id_genero='+generos[i].id_genero+'">'+generos[i].genero;
        g.innerHTML+='</a>';
    }
	    
});

