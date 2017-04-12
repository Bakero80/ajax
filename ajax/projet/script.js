var tabcd	    = [];
var tabcateg    = [];
var indicecd	= 0;
var indiceUser	= 0;
var cdId        = 1;
var idCateg     = 1;

function Titre(titre, id){
    this.id     = id || cdId++;
    this.titre  = titre;
}

function Piste(piste, nom, temps){
    this.idPiste = piste;
    this.nom     = nom;
    this.temps   = temps;
}

function Categorie(text, id){
    this.id = id || idCateg++;
    this.text = text;
}

function afficherCd(){
    var str = '';
    for (var i = 0; i < tabcd.length; i++) {

        str +="<br><br>";
        str +='<table class="table table-striped" data-id='+tabcd[i].id+'>';
        str	+="<tr>";
        str	+="<td colspan=3><h3>#"+tabcd[i].id +" "+tabcd[i].titre;
        str	+=' <a class="btn btn-primary btnDelCD" role="button">';
        str	+='<span class="glyphicon glyphicon-trash">';
        str	+='</span></a></h3></td>';
        str	+="</tr>";
        // entete du tableau
        str	+="<tr>";
        str	+="<th>Piste</th><th>Titre</th><th>Temps</th>";
        str	+="</tr>";
        str	+="</table>";
    }
    $('#demo').html(str);
}

function afficherCateg(){
    var str = '';
    for (var i = 0; i < tabcateg.length; i++) {

        str +="<br><br>";
        str +='<table class="table table-striped" data-id='+tabcateg[i].idCateg+'>';
        str	+="<tr>";
        str	+="<td colspan=3><h3>#"+tabcateg[i].id +" "+tabcateg[i].text;
        str	+=' <a class="btn btn-primary btnDelCateg" role="button">';
        str	+='<span class="glyphicon glyphicon-trash">';
        str	+='</span></a></h3></td>';
        str	+="</tr>";
        // entete du tableau
        str	+="<tr>";
        str	+="<th>Nom</th>";
        str	+="</tr>";
        str	+="</table>";
    }
    $('#info').html(str);
}


$(function(){ // doc ready function
    $('#spinner').hide();
//---------------------------------

    $("#btnAddCD").click(function(){
        var cdName = $('#titre').val(); // Récupération de la valeur du champ input.
        $.post(
				// 1 URL
				"../cdtheque/album_create.php",
				// 2 les Variable
				{ name: cdName } ,
				// 3 function call back
				function( cd_Id ) {
                var nwTitre = new Titre(cdName,cd_Id);     // Création d'un objet Titre
                tabcd.push(nwTitre);                      // Ajout du titre dans le tableau de cd
                afficherCd();
                $('#titre').val('');

			}).fail(function() {
		    alert( "error" );
		  });

    }); // btn Add User (person)



    $("#btnAddUser").click(function(){
        var category = $('#nom').val();
        $.post(
            "../cdtheque/categ_create.php",

            {name: category },

            function(idCateg){
                var nwCateg  = new Categorie(idCateg,category);
                tabcateg.push(nwCateg);
                afficherCateg();
                $('#nom').val('');
            }).fail(function(){
                alert("error");
            });

    });
//--------------------------------------
//--------------------------------------
//
// Delete Team
//
//--------------------------------------


//---------------------------------
}); // doc ready function
//---------------------------------


$(document).on("click",'.btnDelCD', function(){

    var id = $(this).parents('table').attr("data-id");
    $(this).parents('table').hide();
    for (var i = 0; i < tabcd.length; i++){
        {if(id == tabcd[i].id){
        tabcd.splice(i,1);
        $(this).parents('table').prev().remove();
        $(this).parents('table').prev().remove();
        $(this).parents('table').remove();
        break;
        }
    }
}
});

$(document).on("click",'.btnDelCateg', function(){

    var id = $(this).parents('table').attr("data-id");
    $(this).parents('table').hide();
    for (var i = 0; i < tabcateg.length; i++){
        {if(id == tabcateg[i].idCateg){
        tabcateg.splice(i,1);
        $(this).parents('table').prev().remove();
        $(this).parents('table').prev().remove();
        $(this).parents('table').remove();
        break;
        }
    }
    //afficherCateg();
}
});

$(function(){
    $.ajax({
        url : "../cdtheque/load.php",
        dataType : "json"
    }).done(function(data) {
        console.log(data.tabCateg);
        tabcd = data.tabCD;
        tabcateg = data.tabCateg;
        afficherCd();
        afficherCateg();
        }
    ).fail(function(){
        alert('error');
    });

});
