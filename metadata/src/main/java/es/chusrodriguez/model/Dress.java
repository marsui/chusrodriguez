package es.chusrodriguez.model;

import io.konga.metadata.annotations.*;
import io.konga.metadata.definition.enumerations.*;

import java.util.Date;

/**
 * Created by marsui on 9/3/16.
 */
@Entity
@Label("Vestido")
@Searchable
@Editable
@Createable
@Deleteable
@ApiPath("dresses")
@FieldSets({@FieldSet("Datos"), @FieldSet("Fotos")})
public class Dress {

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
    @FieldSet("Datos")
    private String name;

    @Field
    @Label("Descripción")
    @Editable
    @Searchable
    @Required
    @MinLength(4)
    @ShowInResults
    @ShowInUpdate
    @FieldSet("Datos")
    private String description;

    @Field
    @Label("Fecha de creación")
    @ShowInResults
    @ShowInUpdate
    @FieldSet("Datos")
    private Date time_created;

    @Field
    @Label("Texto")
    @Editable
    @Required
    @MinLength(10)
    @ShowInUpdate(configuration=@Raw(key="CUSTOM_FIELD_TYPE", value="EXTENDED_TEXT_EDITOR"))
    @FieldType(update=FieldTypes.CUSTOM)
    @FieldSet("Datos")
    private String text;

    @Field
    @Label("Foto principal")
    @Editable
    @ShowInResults
    @FieldType(FieldTypes.IMAGE)
    @FieldSet("Datos")
    private String image_url;

    @Field
    @Label("Fotos")
    @Editable
    @ShowInUpdate(configuration = @Raw(key= "CUSTOM_FIELD_TYPE", value = "IMAGE_FIELD"))
    @FieldType(update = FieldTypes.CUSTOM, results=FieldTypes.IMAGE)
    @FieldSet("Datos")
    private String photos;

    @Field
    @Label("Colección")
    @Editable
    @ShowInResults
    @ShowInUpdate
    @Type(value= DataTypes.COMPLEX, complexType = "Collection")
    @FieldType(FieldTypes.SELECT)
    @Priority(1)
    @Required
    @FieldSet("Datos")
    private String collection_id;
}
