part of 'landing_page_provider.dart';


class LandingPageChangeNotifier with ChangeNotifier {

  LandingPageChangeNotifier(){
    updateInitialData();
  }

  //setters
  bool _zoneOneExtended = false;
  bool _zoneTwoExtended = false;
  bool _zoneThreeExtended = false;
  bool _zoneOneSuspended = false;
  bool _zoneTwoSuspended = false;
  bool _zoneThreeSuspended = false;

  int _currentCardIndex = 0;
  int _currentEMICardIndex = 1;
  int _selectedTenurePeriod = 6;
  int _selectedBankCardIndex = 0;

  double _selectedAmount = 10000.0;
  double _selectedTenureMonthlyAmount = 0;

  String _selectedBank = '';

  final List<String> _ctaItems = ['Begin application','Proceed to EMI selection', 'Select your bank account', 'Tap for 1-click KYC'];
  final List<String> _bankLists = ['IDFC Bank','SBI','Axis Bank'];
  final List<String> _bankAccountNumbers = ['510000345672','010000349944','720010345623'];
  final List<String> _bankLogos = [Assets.assetsPicIdfcBankLogo,Assets.assetsPicSbiLogo,Assets.assetsPicAxisLogo];
  final List<int> _tenurePeriods = [3,6,9,12];

  //getters
  bool get zoneOneExtended => _zoneOneExtended;
  bool get zoneTwoExtended => _zoneTwoExtended;
  bool get zoneThreeExtended => _zoneThreeExtended;
  bool get zoneOneSuspended => _zoneOneSuspended;
  bool get zoneTwoSuspended => _zoneTwoSuspended;
  bool get zoneThreeSuspended => _zoneThreeSuspended;

  int get currentCardIndex => _currentCardIndex;
  int get selectedTenurePeriod => _selectedTenurePeriod;
  int get currentEMICardIndex => _currentEMICardIndex;
  int get selectedBankCardIndex => _selectedBankCardIndex;

  double get selectedAmount => _selectedAmount;
  double get selectedTenureMonthlyAmount => _selectedTenureMonthlyAmount;

  String get selectedBank => _selectedBank;

  List<String> get bankLists => _bankLists;
  List<String> get bankAccountNumbers => _bankAccountNumbers;
  List<String> get bankLogos => _bankLogos;
  List<int> get tenurePeriods => _tenurePeriods;


  //methods
  updateAmount(double amount){
    _selectedAmount = amount;
    notifyListeners();
  }

  updateInitialData(){
    _selectedTenureMonthlyAmount = calculateEMIAmount(6);
    _selectedBank = _bankLists[_selectedBankCardIndex];
    notifyListeners();
  }

  updateSelectedBank(String bank){
    _selectedBank = bank;
    notifyListeners();
  }

  updateEMICardIndex(int index){
    _currentEMICardIndex = index;
    notifyListeners();
  }

  updateTenurePeriod(int tenure){
    _selectedTenurePeriod = tenure;
    notifyListeners();
  }

  void updateCurrentCardIndex(int value) {
    _currentCardIndex = value;
    notifyListeners();
  }

  void updateEMIMonthlyAmountValue(double value) {
    _selectedTenureMonthlyAmount = value;
    notifyListeners();
  }

  void updateBankCardIndex(int value) {
    _selectedBankCardIndex = value;
    notifyListeners();
  }

  void toggleZoneExtension(int index, bool isExtension) {
    if(index == 1){
      _zoneOneExtended = isExtension;
    }
    if(index == 2){
      _zoneTwoExtended = isExtension;
    }
    if(index == 3){
      _zoneThreeExtended = isExtension;
    }
    notifyListeners();
  }

  void toggleZoneSuspension(int index, bool isExtension) {
    if(index == 1){
      _zoneOneSuspended = isExtension;
    }
    if(index == 2){
      _zoneTwoSuspended = isExtension;
    }
    if(index == 3){
      _zoneThreeSuspended = isExtension;
    }
    notifyListeners();
  }


  String changeCTAItems(){
    if(_currentCardIndex == 0){
      return _ctaItems[0];
    }
    if(_currentCardIndex == 1){
      return _ctaItems[1];
    }
    if(_currentCardIndex == 2){
      return _ctaItems[2];
    }
    if(_currentCardIndex == 3){
      return _ctaItems[3];
    }
    else {
      return '';
    }
  }

   calculateEMIAmount(int tenure) {
    double A = 0.0;
    int P = _selectedAmount.toInt();
    double r = 11 / 12 / 100;
    int n = tenure == 12 ?
    tenure * 12  : tenure;
    A = (P * r * pow((1+r), n) / ( pow((1+r),n) -1));
    return A.roundToDouble();
  }

  void resetData(){
    _selectedAmount = 10000.0;
    _zoneOneExtended = false;
    _zoneTwoExtended = false;
    _zoneThreeExtended = false;
    _zoneOneSuspended = false;
    _zoneTwoSuspended = false;
    _zoneThreeSuspended = false;
    _currentCardIndex = 0;
    _currentEMICardIndex = 1;
    _selectedBank = '';
    _selectedTenurePeriod = 6;
    _selectedTenureMonthlyAmount;
    _selectedBankCardIndex = 0;
  }

}