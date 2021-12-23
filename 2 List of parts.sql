--List of part created in the system in the last month
declare @d datetime
set @d = GETDATE();

select PAR_CODE as N'Part',
PAR_DESC as N'Description',
PAR_UDFCHAR12 as N'StadlerID',
PAR_UDFCHAR06 as N'Artikel-Nr',
PAR_UDFCHAR10 as N'Manufacturer',
PAR_UDFCHAR04 as N'Drawing no.',
PAR_UDFCHAR07 as N'Project',
PAR_UDFCHAR02 as N'Type',
PAR_LONGDESCRIPTION N'Part desc.',
PAR_CREATEDBY N'Created by',
PAR_CREATED as N'Created - date',
CAST(MONTH(PAR_CREATED) AS varchar) + '.' + CAST(YEAR(PAR_CREATED) AS varchar) AS N'Created - Month'
from R5PARTS
where YEAR(PAR_CREATED) = YEAR(@d) and MONTH(PAR_CREATED) = Month(@d)-1
and (RIGHT(PAR_CODE,2)='-N' or (LEN(PAR_CODE)='5' and PAR_CONDITIONTPL is null))
order by PAR_CREATED asc


