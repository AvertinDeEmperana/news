import 'package:objectbox/objectbox.dart';

import '../../../model/Source.dart';

@Entity()
class SourceEntity{
    int id = 0;
    String? stringId;
    String? name;

    Source toSource(){
        return Source(id: stringId?? "", name: name?? "");
    }
}

extension SourceExtension on Source{
    SourceEntity toEntity(){
        SourceEntity sourceEntity = SourceEntity();
        sourceEntity.stringId = id;
        sourceEntity.name = name;
        return sourceEntity;
    }
}