package es.chusrodriguez.model;

import io.konga.metadata.annotations.*;
import io.konga.metadata.definition.enumerations.FieldTypes;

import java.util.Date;

/**
 * Created by marsui on 9/3/16.
 */
@Entity
@Label("Colección")
@Searchable
@Editable
@Createable
@Deleteable
@ApiPath("collections")
public class Collection {

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
    @Required
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
    @Required
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

}
