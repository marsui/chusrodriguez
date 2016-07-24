package es.chusrodriguez.model;

import io.konga.metadata.annotations.*;

import java.util.Date;

/**
 * Created by marsui on 9/3/16.
 */
@Entity
@Label("Foto")
@Searchable
@Editable
@Createable
@Deleteable
@ApiPath("photos")
public class Photo {

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
    @Label("URL")
    @Editable
    @Required
    @ShowInResults
    @ShowInUpdate
    private String image_url;

    @Field
    @Label("Item")
    @Editable
    @Required
    @ShowInResults
    @ShowInUpdate
    private String item_id;

    @Field
    @Label("Fuente")
    @Editable
    @Required
    @ShowInResults
    @ShowInUpdate
    private String source;

}
