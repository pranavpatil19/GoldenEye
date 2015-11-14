﻿CREATE XML SCHEMA COLLECTION [dbo].[Schema_Database_SaveSettings]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xsd:element name="Request">
    <xsd:complexType>
      <xsd:complexContent>
        <xsd:extension base="Request_BaseType">
          <xsd:sequence maxOccurs="unbounded">
            <xsd:element name="SettingEntry" type="SettingEntry" minOccurs="0" maxOccurs="unbounded" />
          </xsd:sequence>
        </xsd:extension>
      </xsd:complexContent>
    </xsd:complexType>
  </xsd:element>
  <xsd:attributeGroup name="BaseRequest_AG">
    <xsd:attribute name="BranchId" type="xsd:unsignedInt" />
    <xsd:attribute name="UserId" type="xsd:unsignedInt" use="required" />
    <xsd:attribute name="StatusS" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusP" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusW" type="xsd:unsignedInt" />
    <xsd:attribute name="GetFullColumnsData" type="xsd:boolean" default="false" />
    <xsd:attribute name="ExpandNestedValues" type="xsd:boolean" default="false" />
    <xsd:attribute name="AppDate" type="datetimeSQL" />
    <xsd:attribute name="RequestType" type="ProcedureEnum" use="required" />
  </xsd:attributeGroup>
  <xsd:complexType name="Request_BaseType">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence />
        <xsd:attributeGroup ref="BaseRequest_AG" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="SettingEntry">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence />
        <xsd:attribute name="Key" type="KeyString" use="required" />
        <xsd:attribute name="Value" type="ValueString" use="required" />
        <xsd:attribute name="DataType" type="DataType" use="required" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:simpleType name="DataType">
    <xsd:restriction base="xsd:int">
      <xsd:minInclusive value="1" />
      <xsd:maxInclusive value="3" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="KeyString">
    <xsd:restriction base="xsd:token">
      <xsd:minLength value="1" />
      <xsd:maxLength value="100" />
      <xsd:enumeration value="_DefaultTimeIntervalId" />
      <xsd:enumeration value="_DefaultRelationshipKind" />
      <xsd:enumeration value="_DefaultRelationshipKindId" />
      <xsd:enumeration value="_DefaultStructureKindId" />
      <xsd:enumeration value="_DefaultStructureKind" />
      <xsd:enumeration value="_IsBlocked" />
      <xsd:enumeration value="ActualMonth" />
      <xsd:enumeration value="ActualYear" />
      <xsd:enumeration value="AppLicence" />
      <xsd:enumeration value="AppLicenceNumber" />
      <xsd:enumeration value="AppName" />
      <xsd:enumeration value="CompanyBank" />
      <xsd:enumeration value="CompanyBankAccountNumber" />
      <xsd:enumeration value="CompanyCity" />
      <xsd:enumeration value="CompanyName" />
      <xsd:enumeration value="CompanyName1" />
      <xsd:enumeration value="CompanyName2" />
      <xsd:enumeration value="CompanyName3" />
      <xsd:enumeration value="CompanyNIP" />
      <xsd:enumeration value="CompanyNumber" />
      <xsd:enumeration value="CompanyPhone" />
      <xsd:enumeration value="CompanyStreet" />
      <xsd:enumeration value="CompanyZipCode" />
      <xsd:enumeration value="FakturySubgroupKosztyGroupCZKName" />
      <xsd:enumeration value="GroupAdministracjaName" />
      <xsd:enumeration value="GroupAdministracjaVisibility" />
      <xsd:enumeration value="GroupCZKName" />
      <xsd:enumeration value="GroupCZKVisibility" />
      <xsd:enumeration value="GroupOdpadyName" />
      <xsd:enumeration value="GroupOdpadyVisibility" />
      <xsd:enumeration value="GroupWodaName" />
      <xsd:enumeration value="GroupWodaVisibility" />
      <xsd:enumeration value="GroupWydrukiName" />
      <xsd:enumeration value="GroupWydrukiVisibility" />
      <xsd:enumeration value="GroupZOMName" />
      <xsd:enumeration value="GroupZOMVisibility" />
      <xsd:enumeration value="GrupyUzytkownikowSubgroupUzytkownicyGroupAdministracjaName" />
      <xsd:enumeration value="KonfiguracjaSubgroupAdministracjaGroupAdministracjaName" />
      <xsd:enumeration value="KontrahenciSubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="LicznikiSubgroupWodaGroupWodaName" />
      <xsd:enumeration value="LogowanieSubgroupAdministracjaGroupAdministracjaName" />
      <xsd:enumeration value="MiejscaSubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="MiejscaSubgroupWodaGroupWodaName" />
      <xsd:enumeration value="NaliczeniaSubgroupWodaGroupWodaName" />
      <xsd:enumeration value="OperacjeSubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="OperacjeSubgroupWodaGroupWodaName" />
      <xsd:enumeration value="PlatnicySubgroupCZKGroupCZKName" />
      <xsd:enumeration value="PlatnicySubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="PlatnicySubgroupWodaGroupWodaName" />
      <xsd:enumeration value="PlatnicySubgroupZOMGroupZOMName" />
      <xsd:enumeration value="RoleSubgroupUzytkownicyGroupAdministracjaName" />
      <xsd:enumeration value="SlownikiSubgroupCZKGroupCZKName" />
      <xsd:enumeration value="SlownikiSubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="SlownikiSubgroupWodaGroupWodaName" />
      <xsd:enumeration value="SubgroupAdministracjaGroupAdministracjaName" />
      <xsd:enumeration value="SubgroupAdministracjaGroupAdministracjaVisibility" />
      <xsd:enumeration value="SubgroupCZKGroupCZKName" />
      <xsd:enumeration value="SubgroupCZKGroupCZKVisibility" />
      <xsd:enumeration value="SubgroupKosztyGroupCZKName" />
      <xsd:enumeration value="SubgroupKosztyGroupCZKVisibility" />
      <xsd:enumeration value="SubgroupOdpadyGroupOdpadyName" />
      <xsd:enumeration value="SubgroupOdpadyGroupOdpadyVisibility" />
      <xsd:enumeration value="SubgroupUzytkownicyGroupAdministracjaName" />
      <xsd:enumeration value="SubgroupUzytkownicyGroupAdministracjaVisibility" />
      <xsd:enumeration value="SubgroupWodaGroupWodaName" />
      <xsd:enumeration value="SubgroupWodaGroupWodaVisibility" />
      <xsd:enumeration value="SubgroupWydrukiGroupWydrukiName" />
      <xsd:enumeration value="SubgroupWydrukiGroupWydrukiVisibility" />
      <xsd:enumeration value="SubgroupZOMGroupZOMName" />
      <xsd:enumeration value="SubgroupZOMGroupZOMVisibility" />
      <xsd:enumeration value="UzytkownicySubgroupUzytkownicyGroupAdministracjaName" />
      <xsd:enumeration value="WodaEnergy" />
      <xsd:enumeration value="WodaInstall" />
      <xsd:enumeration value="WodaLawSuits" />
      <xsd:enumeration value="WodaMeter" />
      <xsd:enumeration value="WodaNumber" />
      <xsd:enumeration value="WodaPayments" />
      <xsd:enumeration value="WodaPsion" />
      <xsd:enumeration value="WodaReceipt" />
      <xsd:enumeration value="WodaSignatures" />
      <xsd:enumeration value="WodaStatus" />
      <xsd:enumeration value="WodaZOM" />
      <xsd:enumeration value="WybierzSubgroupCZKGroupCZKName" />
      <xsd:enumeration value="XtraReportsSubgroupWydrukiGroupWydrukiVisibility" />
      <xsd:enumeration value="ZasobySubgroupCZKGroupCZKName" />
      <xsd:enumeration value="GroupRejestryName" />
      <xsd:enumeration value="GroupRejestryVisibility" />
      <xsd:enumeration value="SubgroupRejestryGroupRejestryName" />
      <xsd:enumeration value="SubgroupRejestryGroupRejestryVisibility" />
      <xsd:enumeration value="RejestrUmowSubgroupRejestryGroupRejestryName" />
      <xsd:enumeration value="RejestrZlecenSubgroupRejestryGroupRejestryName" />
      <xsd:enumeration value="RejestrSprzedazySubgroupRejestryGroupRejestryName" />
      <xsd:enumeration value="RejestrZaplatSubgroupRejestryGroupRejestryName" />
      <xsd:enumeration value="KodPocztowy" />
      <xsd:enumeration value="Miasto" />
      <xsd:enumeration value="Ulica" />
      <xsd:enumeration value="NumerKonta" />
      <xsd:enumeration value="NazwaFirmy1" />
      <xsd:enumeration value="NazwaFirmy2" />
      <xsd:enumeration value="NazwaFirmy3" />
      <xsd:enumeration value="Telefon" />
      <xsd:enumeration value="Bank" />
      <xsd:enumeration value="NIP" />
      <xsd:enumeration value="WodaLiczniki" />
      <xsd:enumeration value="WodaPodpisy" />
      <xsd:enumeration value="WodaZOM" />
      <xsd:enumeration value="WodaEnergia" />
      <xsd:enumeration value="WodaStatus" />
      <xsd:enumeration value="WodaNumer" />
      <xsd:enumeration value="WodaOdcinek" />
      <xsd:enumeration value="WodaWplaty" />
      <xsd:enumeration value="WodaSprSad" />
      <xsd:enumeration value="WodaPsion" />
      <xsd:enumeration value="WodaInstal" />
      <xsd:enumeration value="SezamVersion" />
      <xsd:enumeration value="BiezacyRok" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="ProcedureEnum">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Units_GetOfType" />
      <xsd:enumeration value="Units_Get" />
      <xsd:enumeration value="Units_Delete" />
      <xsd:enumeration value="Units_Save" />
      <xsd:enumeration value="Units_GetRelationsCount" />
      <xsd:enumeration value="Units_GetHistory" />
      <xsd:enumeration value="Relations_GetByIds" />
      <xsd:enumeration value="Relations_GetFurther" />
      <xsd:enumeration value="Relations_Get" />
      <xsd:enumeration value="Relations_GetOfType" />
      <xsd:enumeration value="Relations_Delete" />
      <xsd:enumeration value="Relations_Save" />
      <xsd:enumeration value="Relations_GetHistory" />
      <xsd:enumeration value="Branches_Get" />
      <xsd:enumeration value="Branches_Delete" />
      <xsd:enumeration value="Branches_Save" />
      <xsd:enumeration value="Branches_GetHistory" />
      <xsd:enumeration value="UnitTypes_Get" />
      <xsd:enumeration value="UnitTypes_GetByIds" />
      <xsd:enumeration value="UnitTypes_Delete" />
      <xsd:enumeration value="UnitTypes_Save" />
      <xsd:enumeration value="UnitTypes_GetHistory" />
      <xsd:enumeration value="StructureTypes_Get" />
      <xsd:enumeration value="StructureTypes_GetByIds" />
      <xsd:enumeration value="StructureTypes_Delete" />
      <xsd:enumeration value="StructureTypes_Save" />
      <xsd:enumeration value="StructureTypes_GetHistory" />
      <xsd:enumeration value="UnitTypes_Branches_Get" />
      <xsd:enumeration value="AttributeTypes_Get" />
      <xsd:enumeration value="AttributeTypes_Delete" />
      <xsd:enumeration value="AttributeTypes_Save" />
      <xsd:enumeration value="AttributeTypes_GetHistory" />
      <xsd:enumeration value="DataTypes_Get" />
      <xsd:enumeration value="DataTypes_Delete" />
      <xsd:enumeration value="DataTypes_Save" />
      <xsd:enumeration value="DataTypes_GetHistory" />
      <xsd:enumeration value="Dictionary_Get" />
      <xsd:enumeration value="Dictionary_GetByIds" />
      <xsd:enumeration value="Dictionary_GetValuesByAttributeId" />
      <xsd:enumeration value="Dictionary_Delete" />
      <xsd:enumeration value="Dictionary_Save" />
      <xsd:enumeration value="Dictionary_GetHistory" />
      <xsd:enumeration value="UnitsOfMeasure_Get" />
      <xsd:enumeration value="UnitsOfMeasure_GetHistory" />
      <xsd:enumeration value="UnitsOfMeasure_Delete" />
      <xsd:enumeration value="UnitsOfMeasure_Save" />
      <xsd:enumeration value="UnitsOfMeasure_GetHistory" />
      <xsd:enumeration value="RelationTypes_Get" />
      <xsd:enumeration value="RelationTypes_GetByIds" />
      <xsd:enumeration value="RelationTypes_Delete" />
      <xsd:enumeration value="RelationTypes_Save" />
      <xsd:enumeration value="RelationTypes_GetHistory" />
      <xsd:enumeration value="RelationBaseTypes_Get" />
      <xsd:enumeration value="RelationBaseTypes_GetHistory" />
      <xsd:enumeration value="Structures_GetOfType" />
      <xsd:enumeration value="Structures_GetByIds" />
      <xsd:enumeration value="Structures_Delete" />
      <xsd:enumeration value="Structures_Save" />
      <xsd:enumeration value="Structures_GetHistory" />
      <xsd:enumeration value="Structures_DeleteElements" />
      <xsd:enumeration value="Attribute_GetHistory" />
      <xsd:enumeration value="Users_Get" />
      <xsd:enumeration value="User_IsAdminGuaranteed" />
      <xsd:enumeration value="User_IsLoginUnique" />
      <xsd:enumeration value="Users_Delete" />
      <xsd:enumeration value="Users_Save" />
      <xsd:enumeration value="Users_GetByLogin" />
      <xsd:enumeration value="Users_AreCredentialsValid" />
      <xsd:enumeration value="UserGroups_Get" />
      <xsd:enumeration value="UserGroups_Delete" />
      <xsd:enumeration value="UserGroups_Save" />
      <xsd:enumeration value="Roles_Get" />
      <xsd:enumeration value="Roles_Delete" />
      <xsd:enumeration value="Roles_Save" />
      <xsd:enumeration value="Operations_Get" />
      <xsd:enumeration value="Attributes_GetHistory" />
      <xsd:enumeration value="AttributeTypes_GetByUnitTypeAndOtherFilters" />
      <xsd:enumeration value="Dictionary_DeleteEntries" />
      <xsd:enumeration value="AttributeTypes_GetByIds" />
      <xsd:enumeration value="AttributeTypes_DeleteAssignedBranches" />
      <xsd:enumeration value="RelationTypes_DeleteAssignedAttributeTypes" />
      <xsd:enumeration value="UnitTypes_DeleteAssignedAttributeTypes" />
      <xsd:enumeration value="Structures_GetByUnit" />
      <xsd:enumeration value="UserGroups_DeleteAssignedUsers" />
      <xsd:enumeration value="UserGroups_DeleteAssignedRoles" />
      <xsd:enumeration value="UnitsOfMeasure_DeleteAssignedConversions" />
      <xsd:enumeration value="StructureTypes_DeleteElements" />
      <xsd:enumeration value="AttributeTypes_IsUsed" />
      <xsd:enumeration value="Structures_GetByUnitType" />
      <xsd:enumeration value="AttributeTypes_GetAvailable" />
      <xsd:enumeration value="UserSettings_Save" />
      <xsd:enumeration value="Units_SaveAlternativeHistoryAttribute" />
      <xsd:enumeration value="Units_SetMainHistFlowForAttribute" />
      <xsd:enumeration value="Database_GetStatistics" />
      <xsd:enumeration value="Database_Upgrade" />
      <xsd:enumeration value="Database_GetBackups" />
      <xsd:enumeration value="Database_GetVersion" />
      <xsd:enumeration value="Database_CreateBackup" />
      <xsd:enumeration value="Database_GetSettings" />
      <xsd:enumeration value="Database_SaveSettings" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="ValueString">
    <xsd:restriction base="xsd:token">
      <xsd:minLength value="1" />
      <xsd:maxLength value="100" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="dateSQL">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="((000[1-9])|(00[1-9][0-9])|(0[1-9][0-9]{2})|([1-9][0-9]{3}))-((0[1-9])|(1[012]))-((0[1-9])|([12][0-9])|(3[01]))(Z?)" />
    </xsd:restriction>
  </xsd:simpleType>
  <xsd:simpleType name="datetimeSQL">
    <xsd:restriction base="xsd:string">
      <xsd:pattern value="((000[1-9])|(00[1-9][0-9])|(0[1-9][0-9]{2})|([1-9][0-9]{3}))-((0[1-9])|(1[012]))-((0[1-9])|([12][0-9])|(3[01]))T(([01][0-9])|(2[0-3]))(:[0-5][0-9]){2}(\.[0-9]{1,3})?(Z?)" />
    </xsd:restriction>
  </xsd:simpleType>
</xsd:schema>';

