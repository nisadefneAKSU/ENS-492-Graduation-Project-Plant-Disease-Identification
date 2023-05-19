import 'package:hive/hive.dart';

part 'disease_model.g.dart';

@HiveType(typeId: 0)
class Disease extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  late String possibleCauses;

  @HiveField(2)
  late String possibleSolution;

  @HiveField(3)
  late String imagePath;

  @HiveField(4)
  late DateTime dateTime;

  Disease({required this.name, required this.imagePath}) {
    dateTime = DateTime.now();

    switch (name) {
      case "Pepper Bell Bacterial Spot":
        possibleCauses =
            "Caused by Xanthomonas campestris pv. vesicatoria which is a gram-negative and rod-shaped bacterium. Wet and humid weather conditions favor this disease to occur.";
        possibleSolution =
            "Older leaves develop small pimple-like spots on their lower surfaces, and younger leaves develop small water-soaked spots on their top surfaces. The spots progressively get tan to gray cores with darker edges. Choose resistant varieties, purchase disease-free seeds and transplants, avoid overhead watering, remove and discard infected plant parts and all debris and use fungicide to slow down the spread of infection.";
        break;

      case "Pepper Bell Healthy":
        possibleCauses = "No causes, it is healthy.";
        possibleSolution = "Bright colored and spotless peppers, green colored spotless leaves, average plant height, healthy stems are present. No solutions, it is healthy.";
        break;

      case "Potato Early Blight":
        possibleCauses = "Early blight can be caused by Alternaria tomatophila which is formerly known as Alternaria solani. Disease develops at moderate to warm temperatures and humid conditions.";
        possibleSolution ="Near the soil, older foliage develops small dark spots. Brown, rounded leaf spots. Larger spots have target-like concentric rings. The tissue around spots often turns yellow. Use resistant cultivars, apply cultural controls such as use fertilizers carefully, prune infected leaves and plant parts, apply sanitation, use fungicides.";
        break;

      case "Potato Healthy":
        possibleCauses = "No causes, it is healthy.";
        possibleSolution = "Green and spotless leaves, healthy stem, regular shaped and firm potato tubers are present. No solutions, it is healthy.";
        break;

      case "Potato Late Blight":
        possibleCauses =
            "Caused by Phytophthora infestans which is a water mold. Disease develops at cool and damp conditions. Occurs in humid regions with temperatures ranging between 4 and 29 °C.";
        possibleSolution =
            "Leaves have large, dark brown blotches with a green gray edge; not confined by major leaf veins. Large sections of dry, brown foliage. Stem infections are firm and dark brown with a rounded edge. Use resistant cultivars, apply cultural controls such as prune infected leaves and plant parts, apply sanitation, use fungicides.";
        break;

      case "Tomato Bacterial Spot":
        possibleCauses =
            "Warm and humid weather conditions favor this disease to occur. Caused by Xanthomonas campestris pv. vesicatoria.";
        possibleSolution =
            "Small, circular, water-soaked spots which turn dark brown or black and are surrounded by yellow halo. Leaves may blight and collapse. On stems and petioles, lesions are elliptical and dark brown colored. Choose resistant varieties, purchase disease-free seeds and transplants, avoid overhead watering, remove and discard infected plant parts and all debris, and use fungicide to slow down the spread of infection.";
        break;

      case "Tomato Early Blight":
        possibleCauses =
            "Early blight can be caused by Alternaria tomatophila which is formerly known as Alternaria solani. Disease develops at moderate to warm temperatures and humid conditions.";
        possibleSolution =
            "Near the soil, older foliage develops small dark spots. Brown, rounded leaf spots. Larger spots have target-like concentric rings. The tissue around spots often turns yellow. Use resistant cultivars, apply cultural controls such as use fertilizers carefully, prune infected leaves and plant parts, apply sanitation, use fungicides.";
        break;

      case "Tomato Healthy":
        possibleCauses = "No causes. Crops are healthy.";
        possibleSolution = "Green and spotless leaves, healthy stem, undistorted and spotless fruits. No solutions, it is healthy";
        break;

      case "Tomato Late Blight":
        possibleCauses = "Caused by Phytophthora infestans which is a water mold. Disease develops at cool and damp conditions.";
        possibleSolution = "Leaves have large, dark brown blotches with a green gray edge; not confined by major leaf veins. Large sections of dry, brown foliage. Stem infections are firm and dark brown with a rounded edge. Use resistant cultivars, apply cultural controls, prune infected leaves and plant parts, apply sanitation, use fungicides.";
        break;

      case "Tomato Leaf Mold":
        possibleCauses = "Conditions with high relative humidity increase the risk of disease occurrence. Caused by the fungus Passalora fulva (previously called Fulvia fulva or Cladosporium fulvum).";
        possibleSolution = "On the upper sides of leaves, pale greenish-yellow spots with no definite margins and on the lower leaf surface below leaf spots, olive-green to brown velvety molds occur. Leaf spots coalesce and turn brown. Use resistant cultivars, apply cultural controls, prune infected leaves and plant parts, apply sanitation, use fungicides.";
        break;

      case "Tomato Septoria Leaf Spot":
        possibleCauses = "Caused by the fungus Septoria lycopersici. Septoria leaf spot is favored by warm, wet and humid conditions.";
        possibleSolution = "Small, water-soaked, circular spots on the undersides of older leaves. The centers of these spots then turn gray to tan and have a dark-brown margin. In the tan centers of the spots, visible, dark-brown, pimple-like structures called pycnidia (fruiting bodies of the fungus) occur. Purchase disease-free seeds and transplants, avoid overhead watering, apply sanitary practices, remove and discard infected plant parts and all debris, and use fungicides.";
        break;

      case "Tomato Spotted Spider Mites":
        possibleCauses = "Caused by the two-spotted spider mite, Tetranychus urticae, which is a type of arachnid. Two-spotted spider mite disease is favored by hot, dry summer weather.";
        possibleSolution = "Small white or yellow spots on the leaves, bronzed or bleached plants, leaves may drop, webbings occur. Check plants for spider mites, keep plants well-watered, use drought-tolerant plants, use natural enemies of the two-spotted spider mites such as lady beetles or predatory mites, and use pesticides.";
        break;

      case "Tomato Target Spot":
        possibleCauses = "Caused by the fungal pathogen Corynespora cassiicola. Conditions with high humidity increase the risk of disease occurrence.";
        possibleSolution = "On the upper leaf surface, pinpoint-sized water-soaked patches emerge. The spots grow into small necrotic lesions with dark borders and light brown cores. The lesions get larger and develop circular shapes with gray to light brown centers. Lesions may grow darker concentric circles as they get bigger. Apply cultural practices, avoid over-fertilizing with nitrogen, remove the infected plants, avoid the use of overhead irrigation, use fungicides.";
        break;

      case "Tomato Mosaic Virus":
        possibleCauses = "Caused by a plant pathogenic virus. Spread by aphids and other insects, mites, fungi, nematodes, and contact; pollen and seeds can carry the infection as well.";
        possibleSolution = "The affected tomato plants have mottling on their foliage, with regions that alternate between yellowish and darker green colors. The latter are often thicker and raised, giving them a blister-like appearance. Use resistant varieties, remove infected plants, apply crop rotation, purchase disease-free seeds and transplants, and apply sanitation practices.";
        break;

      case "Tomato Yellow Leaf Curl Virus":
        possibleCauses =
            "Tomato yellow leaf curl virus is vectored by silverleaf whitefly (Bemisia tabaci).";
        possibleSolution =
            "Plant stunting, reduction of leaf size, upward cupping/curling of leaves, chlorosis on leaves and flowers, and reduction of fruit production. The fruit appears unaffected. Use insecticides, use resistant crop varieties and apply crop rotation.";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }
}
