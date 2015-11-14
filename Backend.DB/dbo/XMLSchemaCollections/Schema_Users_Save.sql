﻿CREATE XML SCHEMA COLLECTION [dbo].[Schema_Users_Save]
    AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" elementFormDefault="qualified">
  <xsd:element name="Request" type="Request_Users_Save" />
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
  <xsd:complexType name="Branch">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type" />
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="CouplerRoleOperation">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence>
          <xsd:element name="Role" type="Role" minOccurs="0" />
          <xsd:element name="Operation" type="Operation" minOccurs="0" />
          <xsd:element name="Branch" type="Branch" minOccurs="0" />
        </xsd:sequence>
        <xsd:attribute name="RoleId" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="OperationId" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="BranchId" type="xsd:unsignedInt" use="required" />
      </xsd:restriction>
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
  <xsd:complexType name="Operation">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence />
        <xsd:attribute name="Description" type="xsd:string" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Request_Users_Save">
    <xsd:complexContent>
      <xsd:restriction base="xsd:anyType">
        <xsd:sequence maxOccurs="unbounded">
          <xsd:element name="User" type="User" maxOccurs="unbounded" />
        </xsd:sequence>
        <xsd:attributeGroup ref="BaseRequest_AG" />
      </xsd:restriction>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="Role">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="CouplerRoleOperation" type="CouplerRoleOperation" minOccurs="0" maxOccurs="unbounded" />
        </xsd:sequence>
        <xsd:attribute name="Rank" type="xsd:unsignedInt" use="required" />
        <xsd:attribute name="Description" type="xsd:string" />
      </xsd:extension>
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
  <xsd:complexType name="User">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="Roles" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="Role" type="Role" maxOccurs="unbounded" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
          <xsd:element name="Groups" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="UserGroup" type="UserGroup" maxOccurs="unbounded" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
        <xsd:attribute name="Login" type="xsd:string" use="required" />
        <xsd:attribute name="FirstName" type="xsd:string" />
        <xsd:attribute name="LastName" type="xsd:string" />
        <xsd:attribute name="Email" type="xsd:string" />
        <xsd:attribute name="Password" type="xsd:string" use="required" />
        <xsd:attribute name="IsActive" type="xsd:boolean" use="required" />
        <xsd:attribute name="IsDomain" type="xsd:boolean" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:complexType name="UserGroup">
    <xsd:complexContent>
      <xsd:extension base="Entity_Type">
        <xsd:sequence>
          <xsd:element name="Users" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="User" type="User" minOccurs="0" maxOccurs="unbounded" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
          <xsd:element name="Roles" minOccurs="0">
            <xsd:complexType>
              <xsd:complexContent>
                <xsd:restriction base="xsd:anyType">
                  <xsd:sequence>
                    <xsd:element name="Role" type="Role" minOccurs="0" maxOccurs="unbounded" />
                  </xsd:sequence>
                </xsd:restriction>
              </xsd:complexContent>
            </xsd:complexType>
          </xsd:element>
        </xsd:sequence>
        <xsd:attribute name="Description" type="xsd:string" />
      </xsd:extension>
    </xsd:complexContent>
  </xsd:complexType>
  <xsd:simpleType name="ProcedureEnum_Type">
    <xsd:restriction base="xsd:string">
      <xsd:enumeration value="Units_GetOfType" />
      <xsd:enumeration value="Units_Get" />
      <xsd:enumeration value="Units_Delete" />
      <xsd:enumeration value="Units_Save" />
      <xsd:enumeration value="Units_GetRelationsCount" />
      <xsd:enumeration value="Relations_GetByIds" />
      <xsd:enumeration value="Relations_GetFurther" />
      <xsd:enumeration value="Relations_GetBy" />
      <xsd:enumeration value="Relations_Delete" />
      <xsd:enumeration value="Relations_Save" />
      <xsd:enumeration value="Branches_Get" />
      <xsd:enumeration value="Branches_Delete" />
      <xsd:enumeration value="Branches_Save" />
      <xsd:enumeration value="UnitTypes_Get" />
      <xsd:enumeration value="UnitTypes_GetByIds" />
      <xsd:enumeration value="UnitTypes_Delete" />
      <xsd:enumeration value="UnitTypes_Save" />
      <xsd:enumeration value="StructureTypes_Get" />
      <xsd:enumeration value="StructureTypes_GetByIds" />
      <xsd:enumeration value="StructureTypes_Delete" />
      <xsd:enumeration value="StructureTypes_Save" />
      <xsd:enumeration value="ObjectTypes_Branches_Get" />
      <xsd:enumeration value="AttributeTypes_Get" />
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
      <xsd:enumeration value="RelationTypes_Dalete" />
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

