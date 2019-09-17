/* pour chaque animal, indiquer les veterinaires qui les ont traité */

select A.nom, A.Traitement->'Veterinaire'->>'nom' as nom_vet, A.Traitement->'Veterinaire'->>'prenom' as prenom_vet
from Animal A
where A.Traitement IS NOT NULL; 