import '../../id_value_data_response.dart';
import '../../ui/id_value.dart';

extension IdValueResponseToUi on IdValueDataResponse {
  IdValue toUi() {
    return IdValue(id: id, value: value);
  }
}
