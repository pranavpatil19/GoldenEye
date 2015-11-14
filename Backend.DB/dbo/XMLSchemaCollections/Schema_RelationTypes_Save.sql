﻿CREATE XML SCHEMA COLLECTION [dbo].[Schema_RelationTypes_Save]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xsd:element name="Request" type="Request_RelationTypes_Save" />
  <xsd:attributeGroup name="Administratives_AG">
    <xsd:attribute name="IsArchive" type="xsd:boolean" default="false" />
    <xsd:attribute name="ArchivedFrom" type="datetimeSQL" />
    <xsd:attribute name="ArchivedBy" type="xsd:unsignedInt" />
    <xsd:attribute name="IsDeleted" type="xsd:boolean" default="false" />
    <xsd:attribute name="DeletedFrom" type="datetimeSQL" />
    <xsd:attribute name="DeletedBy" type="xsd:unsignedInt" />
    <xsd:attribute name="CreatedOn" type="datetimeSQL" />
    <xsd:attribute name="CreatedBy" type="xsd:unsignedInt" />
    <xsd:attribute name="LastModifiedOn" type="datetimeSQL" use="required" />
    <xsd:attribute name="LastModifiedBy" type="xsd:unsignedInt" />
  </xsd:attributeGroup>
  <xsd:attributeGroup name="BaseRequest_AG">
    <xsd:attribute name="BranchId" type="xsd:unsignedInt" />
    <xsd:attribute name="UserId" type="xsd:unsignedInt" use="required" />
    <xsd:attribute name="StatusS" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusP" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusW" type="xsd:unsignedInt" />
    <xsd:attribute name="GetFullColumnsData" type="xsd:boolean" default="false" />
    <xsd:attribute name="ExpandNestedValues" type="xsd:boolean" default="false" />
    <xsd:attribute name="AppDate" type="datetimeSQL" />
    <xsd:attribute name="RequestType" type="ProcedureEnum_Type" use="required" />
  </xsd:attributeGroup>
  <xsd:attributeGroup name="Histories_AG">
    <xsd:attribute name="ChangeFrom" type="datetimeSQL" />
    <xsd:attribute name="ChangeTo" type="datetimeSQL" />
    <xsd:attribute name="EffectiveFrom" type="datetimeSQL" />
    <xsd:attribute name="EffectiveTo" type="datetimeSQL" />
    <xsd:attribute name="IsMainHistFlow" type="xsd:boolean" default="true" />
    <xsd:attribute name="IsAlternativeHistory" type="xsd:boolean" default="false" />
  </xsd:attributeGroup>
  <xsd:attributeGroup name="Statuses_AG">
    <xsd:attribute name="IsStatus" type="xsd:boolean" default="false" />
    <xsd:attribute name="StatusS" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusSFrom" type="datetimeSQL" />
    <xsd:attribute name="StatusSTo" type="datetimeSQL" />
    <xsd:attribute name="StatusSFromBy" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusSToBy" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusW" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusWFrom" type="datetimeSQL" />
    <xsd:attribute name="StatusWTo" type="datetimeSQL" />
    <xsd:attribute name="StatusWFromBy" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusWToBy" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusP" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusPFrom" type="datetimeSQL" />
    <xsd:attribute name="StatusPTo" type="datetimeSQL" />
    <xsd:attribute name="StatusPFromBy" type="xsd:unsignedInt" />
    <xsd:attribute name="StatusPToBy" type="xsd:unsignedInt" />
  </xsd:attributeGroup>
  <xsd:complexType name="AttributeType">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:choice>
          <xsd:sequence>
            <xsd:element name="DataType" type="DataType" minOccurs="0" />
            <xsd:element name="UnitOfMeasure" type="UnitOfMeasure" minOccurs="0" />
          </xsd:sequence>
          <xsd:sequence>
            <xsd:element name="Dictionary" type="Dictionary" minOccurs="0" />
          </xsd:sequence>
        </xsd:choice>
        <xsd:attribute name="ShortName" type="xsd:string" />
        <xsd:attribute name="Hint" type="xsd:string" />
        <xsd:attribute name="Description" type="xsd:string" />
        <xsd:attribute name="IsDictionary" type="xsd:boolean" use="required" />
        <xsd:attribute name="TypeId" type="xsd:int" use="required" />
        <xsd:attribute name="Format" type="xsd:string" />
        <xsd:attribute name="IsRequired" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsEmpty" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsQuantifiable" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsProcessed" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsFiltered" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsPersonalData" type="xsd:boolean" use="required" />
        <xsd:attribute name="DefaultValue" type="xsd:string" />
        <xsd:attribute name="ListOfLimitValues" type="xsd:string" />
        <xsd:attribute name="IsUserAttribute" type="xsd:boolean" default="false" />
        <xsd:attribute name="Visibility" type="xsd:string" />
        <xsd:attribute name="ControlSize" type="xsd:int" default="1" />
        <xsd:attribute name="UnitOfMeasureId" type="xsd:int" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="CouplerAttributeType">
    <xsd:complexContent>
      <xsd:extension base="CouplerAttributeType_Base">
        <xsd:sequence>
          <xsd:element name="AttributeType" type="AttributeType" minOccurs="0" />
        </xsd:sequence>
        <xsd:attribute name="Importance" type="xsd:unsignedInt" />
        <xsd:attribute name="AttributeTypeId" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="Priority" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="UIOrder" type="xsd:unsignedInt" use="required" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="CouplerAttributeType_Base" abstract="true">
    <xsd:complexContent>
      <xsd:restriction base="Entity_Type">
        <xsd:choice minOccurs="0" maxOccurs="2">
          <xsd:sequence>
            <xsd:element name="History" type="History" />
          </xsd:sequence>
          <xsd:sequence>
            <xsd:element name="Statuses" type="Statuses" />
          </xsd:sequence>
        </xsd:choice>
        <xsd:attributeGroup ref="Administratives_AG" />
        <xsd:attribute name="Id" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="Name" type="xsd:string" use="prohibited" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="DataType">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence />
        <xsd:attribute name="SQLName" type="xsd:string" use="required" />
        <xsd:attribute name="UIName" type="xsd:string" use="required" />
        <xsd:attribute name="IsUserAttribute" type="xsd:boolean" use="required" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Dictionary">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="Entries" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="DataType" type="DataType" minOccurs="0" />
                    <xsd:element name="DictionaryEntry" type="DictionaryEntry" minOccurs="0" maxOccurs="unbounded" />
                  </xsd:sequence>
                  <xsd:attribute name="TypeId" type="xsd:unsignedInt" use="required" />
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="DictionaryEntry">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence />
        <xsd:attribute name="ShortName" type="xsd:string" use="required" />
        <xsd:attribute name="Comment" type="xsd:string" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Entity_Type">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:choice minOccurs="0" maxOccurs="2">
          <xsd:sequence>
            <xsd:element name="History" type="History" />
          </xsd:sequence>
          <xsd:sequence>
            <xsd:element name="Statuses" type="Statuses" />
          </xsd:sequence>
        </xsd:choice>
        <xsd:attributeGroup ref="Administratives_AG" />
        <xsd:attribute name="Id" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="Name" type="xsd:string" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="History">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence />
        <xsd:attributeGroup ref="Histories_AG" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="RelationBaseType">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type" />
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="RelationType">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="RelationBaseType" type="RelationBaseType" minOccurs="0" />
          <xsd:element name="CouplerAttributeType" type="CouplerAttributeType" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
        <xsd:attribute name="TypeId" type="xsd:unsignedInt" use="required" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Request_RelationTypes_Save">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence maxOccurs="unbounded">
          <xsd:element name="RelationType" type="RelationType" maxOccurs="unbounded" />
        </xsd:sequence>
        <xsd:attributeGroup ref="BaseRequest_AG" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Statuses">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence />
        <xsd:attributeGroup ref="Statuses_AG" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="UnitOfMeasure">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="Conversions" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="UnitsOfMeasureConversion" maxOccurs="unbounded">
                      <xsd:complexType>
                        <xsd:complexContent>
                          <xsd:restriction base="xsd:anyType">
                            <xsd:sequence />
                            <xsd:attribute name="UOMId" type="xsd:unsignedInt" use="required" />
                            <xsd:attribute name="Ratio" type="xsd:double" use="required" />
                          </xsd:restriction>
                        </xsd:complexContent>
                      </xsd:complexType>
                    </xsd:element>
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
        <xsd:attribute name="ShortName" type="xsd:string" use="required" />
        <xsd:attribute name="Comment" type="xsd:string" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:simpleType name="ProcedureEnum_Type">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Objects_GetOfType" />
      <xsd:enumeration value="Objects_Get" />
      <xsd:enumeration value="Objects_Delete" />
      <xsd:enumeration value="Objects_Save" />
      <xsd:enumeration value="Objects_GetRelationsCount" />
      <xsd:enumeration value="Relations_GetByIds" />
      <xsd:enumeration value="Relations_GetFurther" />
      <xsd:enumeration value="Relations_GetBy" />
      <xsd:enumeration value="Relations_GetOfType" />
      <xsd:enumeration value="Relations_Delete" />
      <xsd:enumeration value="Relations_Save" />
      <xsd:enumeration value="Branches_Get" />
      <xsd:enumeration value="Branches_Delete" />
      <xsd:enumeration value="Branches_Save" />
      <xsd:enumeration value="ObjectTypes_Get" />
      <xsd:enumeration value="ObjectTypes_GetByIds" />
      <xsd:enumeration value="ObjectTypes_Delete" />
      <xsd:enumeration value="ObjectTypes_Save" />
      <xsd:enumeration value="StructureTypes_Get" />
      <xsd:enumeration value="StructureTypes_GetByIds" />
      <xsd:enumeration value="StructureTypes_Delete" />
      <xsd:enumeration value="StructureTypes_Save" />
      <xsd:enumeration value="ObjectTypes_Branches_Get" />
      <xsd:enumeration value="AttributeTypes_Get" />
      <xsd:enumeration value="AttributeTypes_GetByIds" />
      <xsd:enumeration value="AttributeTypes_Delete" />
      <xsd:enumeration value="AttributeTypes_Save" />
      <xsd:enumeration value="DataTypes_Get" />
      <xsd:enumeration value="DataTypes_Delete" />
      <xsd:enumeration value="DataTypes_Save" />
      <xsd:enumeration value="Dictionary_Get" />
      <xsd:enumeration value="Dictionary_GetByIds" />
      <xsd:enumeration value="Dictionary_GetValuesByAttributeId" />
      <xsd:enumeration value="Dictionary_Delete" />
      <xsd:enumeration value="Dictionary_Save" />
      <xsd:enumeration value="UnitsOfMeasure_Get" />
      <xsd:enumeration value="UnitsOfMeasure_Delete" />
      <xsd:enumeration value="UnitsOfMeasure_Save" />
      <xsd:enumeration value="RelationTypes_Get" />
      <xsd:enumeration value="RelationTypes_GetByIds" />
      <xsd:enumeration value="RelationTypes_Delete" />
      <xsd:enumeration value="RelationTypes_Save" />
      <xsd:enumeration value="RelationBaseTypes_Get" />
      <xsd:enumeration value="Structures_GetOfType" />
      <xsd:enumeration value="Structures_GetByIds" />
      <xsd:enumeration value="Structures_Delete" />
      <xsd:enumeration value="Structures_Save" />
      <xsd:enumeration value="RelationAttributes_Get" />
      <xsd:enumeration value="Attribute_GetHistory" />
      <xsd:enumeration value="Users_Get" />
      <xsd:enumeration value="User_IsAdminGuaranteed" />
      <xsd:enumeration value="User_IsLoginUnique" />
      <xsd:enumeration value="Users_Delete" />
      <xsd:enumeration value="Users_Save" />
      <xsd:enumeration value="Users_GetByLogin" />
      <xsd:enumeration value="Users_IsAuthenticated" />
      <xsd:enumeration value="UserGroups_Get" />
      <xsd:enumeration value="UserGroups_Delete" />
      <xsd:enumeration value="UserGroups_Save" />
      <xsd:enumeration value="Roles_Get" />
      <xsd:enumeration value="Roles_Delete" />
      <xsd:enumeration value="Roles_Save" />
      <xsd:enumeration value="Operations_Get" />
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

