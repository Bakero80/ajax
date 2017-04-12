<!DOCTYPE html>
<html>
<head>
	<title>Mini projet Equipe de personnes</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
	<script src="jquery.min.js"></script>
	<link rel="stylesheet" href="style.css">
	<script src="script.js"></script>

</head>
	<body>
		<div class="container">

			<div class="row">
				<div class="col-md-8">
				<div class="divTeam">
					Titre du CD :
					<input type="text" id="titre">
					<a class="btn btn-success"
								id="btnAddCD" role="button">
								<span class="glyphicon glyphicon-plus"></span>
								Ajouter un CD
							</a>
							<span id="spinner">
								<!-- <img src="spinner.gif"> -->
							</span>
				</div>
				<div id="demo"></div>
				</div>
				<div class="col-md-4">
				<div class="divUser">
					<table>
						<tr>
							<td>Categorie :</td>
							<td><input type="text" id="nom" /></td>
						</tr>

						<tr>
							<td>&nbsp;</td>
							<td><br>
							<a class="btn btn-success"
								id="btnAddUser" role="button">
								<span class="glyphicon glyphicon-plus"></span>
								Ajouter une Category
							</a>
						</td>
						</tr>
						</table>
						<div id="info">
						</div>
				</div>
				</div>

			</div>
		</div>
		
	</body>
</html>
