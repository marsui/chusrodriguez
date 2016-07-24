package es.chusrodriguez.generator;

import io.konga.metadata.definition.KongaDefinition;
import io.konga.metadata.definition.KongaMetadata;
import io.konga.metadata.generator.KongaGenerator;

/**
 * Created by marsui on 9/3/16.
 */
public class Generator {

    public static void main(String[] args){
        KongaDefinition chusrodriguez = new KongaDefinition("chusrodriguez.es", "es.chusrodriguez.model");

        KongaMetadata app = KongaGenerator.readPackage(chusrodriguez);
        System.out.println(app.toJson());
    }
}
