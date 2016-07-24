package es.chusrodriguez.model;

import io.konga.metadata.annotations.*;
import io.konga.metadata.definition.enumerations.DataTypes;
import io.konga.metadata.definition.enumerations.FieldTypes;

import java.util.Date;

/**
 * Created by marsui on 9/3/16.
 */
@Entity
@Label("Complemento")
@Searchable
@Editable
@Createable
@Deleteable
@ApiPath("accessories")
public class Accessory {

    @Field
    @Label("ID")
    @EntityId
    @EntityKey
    private Integer id;

    @Field
    @Label("Nombre")
    @Required
    @Editable
    @EntityLabel
    @Searchable
    @ShowInResults
    @ShowInUpdate
    private String name;

    @Field
    @Label("Descripción")
    @Editable
    @Searchable
    @ShowInResults
    @ShowInUpdate
    private String description;

    @Field
    @Label("Fecha de creación")
    @ShowInResults
    @ShowInUpdate
    private Date time_created;

    @Field
    @Label("Texto")
    @Editable
    @ShowInUpdate(configuration=@Raw(key="CUSTOM_FIELD_TYPE", value="EXTENDED_TEXT_EDITOR"))
    @FieldType(update= FieldTypes.CUSTOM)
    private String text;

    @Field
    @Label("URL imagen")
    @Editable
    @Required
    @ShowInResults
    @ShowInUpdate(configuration = @Raw(key= "CUSTOM_FIELD_TYPE", value = "IMAGE_FIELD"))
    @FieldType(update = FieldTypes.CUSTOM, results=FieldTypes.IMAGE)
    private String image_url;

    @Field
    @Label("Colección")
    @Editable
    @ShowInResults
    @ShowInUpdate
    @Type(value= DataTypes.COMPLEX, complexType = "Collection")
    @FieldType(FieldTypes.SELECT)
    @Priority(1)
    @Required
    private String collection_id;
}
