select* from housing_data;

/*
 DATA CLEANING
*/

-- Padronizando a coluna Data
SHOW COLUMNS FROM housing_data;

UPDATE housing_data
SET SaleDate = DATE(SaleDate)
WHERE UniqueID IS NOT NULL;



-- Preenchendo Property Adress

select
	*
from housing_data
 Where
	PropertyAddress is null
Order by ParcelID;



SELECT
	a.ParcelID,
    a.PropertyAddress AS address_a,
    b.ParcelID,
    b.PropertyAddress AS address_b,
    IFNULL(a.PropertyAddress, b.PropertyAddress) AS filled_address
FROM housing_data a
JOIN housing_data b
	ON a.ParcelID = b.ParcelID
	AND a.UniqueID <> b.UniqueID
WHERE a.PropertyAddress IS NULL;

UPDATE housing_data a
JOIN housing_data b
  ON a.ParcelID = b.ParcelID
  AND a.UniqueID <> b.UniqueID
SET a.PropertyAddress = b.PropertyAddress
WHERE a.PropertyAddress IS NULL
  AND b.PropertyAddress IS NOT NULL;


-- Dividir Endereço em Colunas

Select PropertyAddress
from housing_data;


SELECT 
  SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress) - 1) AS Address
FROM housing_data;

ALTER TABLE housing_data
ADD COLUMN splitAddress VARCHAR(255);
UPDATE housing_data
-- Endereço
SET splitAddress = SUBSTRING(PropertyAddress, 1, LOCATE(',', PropertyAddress) - 1)
WHERE PropertyAddress IS NOT NULL AND LOCATE(',', PropertyAddress) > 0;
ALTER TABLE housing_data
ADD COLUMN splitCity VARCHAR(255);
UPDATE housing_data
-- CIdade
SET splitCity = TRIM(SUBSTRING(PropertyAddress, LOCATE(',', PropertyAddress) + 1))
WHERE PropertyAddress IS NOT NULL AND LOCATE(',', PropertyAddress) > 0;
ALTER TABLE housing_data
ADD COLUMN splitState VARCHAR(255);
UPDATE housing_data
-- Estado
SET splitState = TRIM(SUBSTRING_INDEX(OwnerAddress, ',', -1))
WHERE OwnerAddress IS NOT NULL AND 
      LENGTH(OwnerAddress) - LENGTH(REPLACE(OwnerAddress, ',', '')) >= 2;
      
ALTER TABLE housing_data
CHANGE COLUMN splitState OwnerState VARCHAR(255);
ALTER TABLE housing_data
ADD COLUMN OwnerStreet VARCHAR(255),
ADD COLUMN OwnerCity VARCHAR(255);

UPDATE housing_data
SET OwnerStreet = SUBSTRING_INDEX(OwnerAddress, ',', 1)
WHERE OwnerAddress IS NOT NULL;

UPDATE housing_data
SET OwnerCity = TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(OwnerAddress, ',', 2), ',', -1))
WHERE OwnerAddress IS NOT NULL
  AND LENGTH(OwnerAddress) - LENGTH(REPLACE(OwnerAddress, ',', '')) >= 2;

UPDATE housing_data
SET OwnerState = TRIM(SUBSTRING_INDEX(OwnerAddress, ',', -1))
WHERE OwnerAddress IS NOT NULL
  AND LENGTH(OwnerAddress) - LENGTH(REPLACE(OwnerAddress, ',', '')) >= 2;

select * from housing_data;




-- Trocando Y/N por Yes/NO

SELECT SoldAsVacant, COUNT(*) AS count
FROM housing_data
GROUP BY SoldAsVacant
ORDER BY count;

SELECT DISTINCT SoldAsVacant FROM housing_data;


ALTER TABLE housing_data
MODIFY COLUMN SoldAsVacant VARCHAR(10);

UPDATE housing_data
SET SoldAsVacant = CASE 
  WHEN SoldAsVacant IN ('Y', '1') THEN 'Yes'
  WHEN SoldAsVacant IN ('N', '0') THEN 'No'
  ELSE SoldAsVacant
END;

SELECT SoldAsVacant, COUNT(*) AS count
FROM housing_data
GROUP BY SoldAsVacant;




-- REMOVER DUPLICATAS

SELECT *,
       ROW_NUMBER() OVER (
           PARTITION BY ParcelID,
                        PropertyAddress,
                        SalePrice,
                        SaleDate,
                        LegalReference
           ORDER BY UniqueID
       ) AS row_num
FROM housing_data
ORDER BY ParcelID;

WITH duplicates AS (
    SELECT UniqueID,
           ROW_NUMBER() OVER (
               PARTITION BY ParcelID,
                            PropertyAddress,
                            SalePrice,
                            SaleDate,
                            LegalReference
               ORDER BY UniqueID
           ) AS row_num
    FROM housing_data
)
DELETE FROM housing_data
WHERE UniqueID IN (
    SELECT UniqueID FROM duplicates WHERE row_num > 1
);

-- Deletar Coluna Inuteis

ALTER TABLE housing_data
DROP COLUMN OwnerAddress,
DROP COLUMN PropertyAddress,
DROP COLUMN TaxDistrict;


select * from housing_data;