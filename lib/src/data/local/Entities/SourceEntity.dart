import 'package:objectbox/objectbox.dart';

import '../../../model/Source.dart';

@Entity()
class SourceEntity{
    int id = 0;
    late String stringId;
    late String name;

    Source toSource(){
        return Source.fromEntity(iD: id, id: stringId, name: name);
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