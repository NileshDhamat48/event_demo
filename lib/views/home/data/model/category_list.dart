class CategoryRes {
  bool? status;

  String? message;
  CategoryList? responsedata;

  CategoryRes({this.status, this.message, this.responsedata});

  CategoryRes.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    responsedata = json['responsedata'] != null
        ? CategoryList.fromJson(json['responsedata'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (responsedata != null) {
      data['responsedata'] = responsedata!.toJson();
    }
    return data;
  }
}

class CategoryList {
  List<Popular>? popular;
  List<Upcoming>? upcoming;
  List<Indoor>? indoor;
  List<Outdoor>? outdoor;

  CategoryList({this.popular, this.upcoming, this.indoor, this.outdoor});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if (json['Popular'] != null) {
      popular = <Popular>[];
      json['Popular'].forEach((v) {
        popular!.add(Popular.fromJson(v));
      });
    }
    if (json['Upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['Upcoming'].forEach((v) {
        upcoming!.add(Upcoming.fromJson(v));
      });
    }
    if (json['Indoor'] != null) {
      indoor = <Indoor>[];
      json['Indoor'].forEach((v) {
        indoor!.add(Indoor.fromJson(v));
      });
    }
    if (json['Outdoor'] != null) {
      outdoor = <Outdoor>[];
      json['Outdoor'].forEach((v) {
        outdoor!.add( Outdoor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (popular != null) {
      data['Popular'] = popular!.map((v) => v.toJson()).toList();
    }
    if (upcoming != null) {
      data['Upcoming'] = upcoming!.map((v) => v.toJson()).toList();
    }
    if (indoor != null) {
      data['Indoor'] = indoor!.map((v) => v.toJson()).toList();
    }
    if (outdoor != null) {
      data['Outdoor'] = outdoor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Popular {
  String? bannerUrl;
  String? thumbUrl;
  int? id;
  int? userId;
  String? eventName;
  String? eventSlug;
  String? eventEmail;
  String? eventOrganizer;
  String? eventDescription;
  String? eventStartDateTime;
  int? eventCategoryId;
  int? eventArtistId;
  String? ageRestriction;
  String? pointOfContactName;
  String? pointOfContactEmail;
  String? pointOfContactPhone;
  String? healthySafetyPrecautions;
  String? artistTitle;
  String? banner;
  String? hidBanner;
  String? thumb;
  String? hidThumb;
  int? status;
  String? reason;
  String? entDt;
  int? countryId;
  String? country;
  Address? address;
  Dates? dates;
  Price? price;

  Popular(
      {this.bannerUrl,
      this.thumbUrl,
      this.id,
      this.userId,
      this.eventName,
      this.eventSlug,
      this.eventEmail,
      this.eventOrganizer,
      this.eventDescription,
      this.eventStartDateTime,
      this.eventCategoryId,
      this.eventArtistId,
      this.ageRestriction,
      this.pointOfContactName,
      this.pointOfContactEmail,
      this.pointOfContactPhone,
      this.healthySafetyPrecautions,
      this.artistTitle,
      this.banner,
      this.hidBanner,
      this.thumb,
      this.hidThumb,
      this.status,
      this.reason,
      this.entDt,
      this.countryId,
      this.country,
      this.address,
      this.dates,
      this.price});

  Popular.fromJson(Map<String, dynamic> json) {
    bannerUrl = json['BannerUrl'];
    thumbUrl = json['ThumbUrl'];
    id = json['Id'];
    userId = json['UserId'];
    eventName = json['EventName'];
    eventSlug = json['EventSlug'];
    eventEmail = json['EventEmail'];
    eventOrganizer = json['EventOrganizer'];
    eventDescription = json['EventDescription'];
    eventStartDateTime = json['EventStartDateTime'];
    eventCategoryId = json['EventCategoryId'];
    eventArtistId = json['EventArtistId'];
    ageRestriction = json['AgeRestriction'];
    pointOfContactName = json['PointOfContactName'];
    pointOfContactEmail = json['PointOfContactEmail'];
    pointOfContactPhone = json['PointOfContactPhone'];
    healthySafetyPrecautions = json['HealthySafetyPrecautions'];
    artistTitle = json['ArtistTitle'];
    banner = json['Banner'];
    hidBanner = json['Hid_Banner'];
    thumb = json['Thumb'];
    hidThumb = json['Hid_Thumb'];
    status = json['Status'];
    reason = json['Reason'];
    entDt = json['EntDt'];
    countryId = json['CountryId'];
    country = json['Country'];
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
    dates = json['Dates'] != null ? Dates.fromJson(json['Dates']) : null;
    price = json['Price'] != null ? Price.fromJson(json['Price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BannerUrl'] = bannerUrl;
    data['ThumbUrl'] = thumbUrl;
    data['Id'] = id;
    data['UserId'] = userId;
    data['EventName'] = eventName;
    data['EventSlug'] = eventSlug;
    data['EventEmail'] = eventEmail;
    data['EventOrganizer'] = eventOrganizer;
    data['EventDescription'] = eventDescription;
    data['EventStartDateTime'] = eventStartDateTime;
    data['EventCategoryId'] = eventCategoryId;
    data['EventArtistId'] = eventArtistId;
    data['AgeRestriction'] = ageRestriction;
    data['PointOfContactName'] = pointOfContactName;
    data['PointOfContactEmail'] = pointOfContactEmail;
    data['PointOfContactPhone'] = pointOfContactPhone;
    data['HealthySafetyPrecautions'] = healthySafetyPrecautions;
    data['ArtistTitle'] = artistTitle;
    data['Banner'] = banner;
    data['Hid_Banner'] = hidBanner;
    data['Thumb'] = thumb;
    data['Hid_Thumb'] = hidThumb;
    data['Status'] = status;
    data['Reason'] = reason;
    data['EntDt'] = entDt;
    data['CountryId'] = countryId;
    data['Country'] = country;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (dates != null) {
      data['Dates'] = dates!.toJson();
    }
    if (price != null) {
      data['Price'] = price!.toJson();
    }
    return data;
  }
}

class Indoor {
  String? bannerUrl;
  String? thumbUrl;
  int? id;
  int? userId;
  String? eventName;
  String? eventSlug;
  String? eventEmail;
  String? eventOrganizer;
  String? eventDescription;
  String? eventStartDateTime;
  int? eventCategoryId;
  int? eventArtistId;
  String? ageRestriction;
  String? pointOfContactName;
  String? pointOfContactEmail;
  String? pointOfContactPhone;
  String? healthySafetyPrecautions;
  String? artistTitle;
  String? banner;
  String? hidBanner;
  String? thumb;
  String? hidThumb;
  int? status;
  String? reason;
  String? entDt;
  int? countryId;
  String? country;
  Address? address;
  Dates? dates;
  Price? price;

  Indoor(
      {this.bannerUrl,
      this.thumbUrl,
      this.id,
      this.userId,
      this.eventName,
      this.eventSlug,
      this.eventEmail,
      this.eventOrganizer,
      this.eventDescription,
      this.eventStartDateTime,
      this.eventCategoryId,
      this.eventArtistId,
      this.ageRestriction,
      this.pointOfContactName,
      this.pointOfContactEmail,
      this.pointOfContactPhone,
      this.healthySafetyPrecautions,
      this.artistTitle,
      this.banner,
      this.hidBanner,
      this.thumb,
      this.hidThumb,
      this.status,
      this.reason,
      this.entDt,
      this.countryId,
      this.country,
      this.address,
      this.dates,
      this.price});

  Indoor.fromJson(Map<String, dynamic> json) {
    bannerUrl = json['BannerUrl'];
    thumbUrl = json['ThumbUrl'];
    id = json['Id'];
    userId = json['UserId'];
    eventName = json['EventName'];
    eventSlug = json['EventSlug'];
    eventEmail = json['EventEmail'];
    eventOrganizer = json['EventOrganizer'];
    eventDescription = json['EventDescription'];
    eventStartDateTime = json['EventStartDateTime'];
    eventCategoryId = json['EventCategoryId'];
    eventArtistId = json['EventArtistId'];
    ageRestriction = json['AgeRestriction'];
    pointOfContactName = json['PointOfContactName'];
    pointOfContactEmail = json['PointOfContactEmail'];
    pointOfContactPhone = json['PointOfContactPhone'];
    healthySafetyPrecautions = json['HealthySafetyPrecautions'];
    artistTitle = json['ArtistTitle'];
    banner = json['Banner'];
    hidBanner = json['Hid_Banner'];
    thumb = json['Thumb'];
    hidThumb = json['Hid_Thumb'];
    status = json['Status'];
    reason = json['Reason'];
    entDt = json['EntDt'];
    countryId = json['CountryId'];
    country = json['Country'];
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
    dates = json['Dates'] != null ? Dates.fromJson(json['Dates']) : null;
    price = json['Price'] != null ? Price.fromJson(json['Price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BannerUrl'] = bannerUrl;
    data['ThumbUrl'] = thumbUrl;
    data['Id'] = id;
    data['UserId'] = userId;
    data['EventName'] = eventName;
    data['EventSlug'] = eventSlug;
    data['EventEmail'] = eventEmail;
    data['EventOrganizer'] = eventOrganizer;
    data['EventDescription'] = eventDescription;
    data['EventStartDateTime'] = eventStartDateTime;
    data['EventCategoryId'] = eventCategoryId;
    data['EventArtistId'] = eventArtistId;
    data['AgeRestriction'] = ageRestriction;
    data['PointOfContactName'] = pointOfContactName;
    data['PointOfContactEmail'] = pointOfContactEmail;
    data['PointOfContactPhone'] = pointOfContactPhone;
    data['HealthySafetyPrecautions'] = healthySafetyPrecautions;
    data['ArtistTitle'] = artistTitle;
    data['Banner'] = banner;
    data['Hid_Banner'] = hidBanner;
    data['Thumb'] = thumb;
    data['Hid_Thumb'] = hidThumb;
    data['Status'] = status;
    data['Reason'] = reason;
    data['EntDt'] = entDt;
    data['CountryId'] = countryId;
    data['Country'] = country;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (dates != null) {
      data['Dates'] = dates!.toJson();
    }
    if (price != null) {
      data['Price'] = price!.toJson();
    }
    return data;
  }
}

class Outdoor {
  String? bannerUrl;
  String? thumbUrl;
  int? id;
  int? userId;
  String? eventName;
  String? eventSlug;
  String? eventEmail;
  String? eventOrganizer;
  String? eventDescription;
  String? eventStartDateTime;
  int? eventCategoryId;
  int? eventArtistId;
  String? ageRestriction;
  String? pointOfContactName;
  String? pointOfContactEmail;
  String? pointOfContactPhone;
  String? healthySafetyPrecautions;
  String? artistTitle;
  String? banner;
  String? hidBanner;
  String? thumb;
  String? hidThumb;
  int? status;
  String? reason;
  String? entDt;
  int? countryId;
  String? country;
  Address? address;
  Dates? dates;
  Price? price;

  Outdoor(
      {this.bannerUrl,
      this.thumbUrl,
      this.id,
      this.userId,
      this.eventName,
      this.eventSlug,
      this.eventEmail,
      this.eventOrganizer,
      this.eventDescription,
      this.eventStartDateTime,
      this.eventCategoryId,
      this.eventArtistId,
      this.ageRestriction,
      this.pointOfContactName,
      this.pointOfContactEmail,
      this.pointOfContactPhone,
      this.healthySafetyPrecautions,
      this.artistTitle,
      this.banner,
      this.hidBanner,
      this.thumb,
      this.hidThumb,
      this.status,
      this.reason,
      this.entDt,
      this.countryId,
      this.country,
      this.address,
      this.dates,
      this.price});

  Outdoor.fromJson(Map<String, dynamic> json) {
    bannerUrl = json['BannerUrl'];
    thumbUrl = json['ThumbUrl'];
    id = json['Id'];
    userId = json['UserId'];
    eventName = json['EventName'];
    eventSlug = json['EventSlug'];
    eventEmail = json['EventEmail'];
    eventOrganizer = json['EventOrganizer'];
    eventDescription = json['EventDescription'];
    eventStartDateTime = json['EventStartDateTime'];
    eventCategoryId = json['EventCategoryId'];
    eventArtistId = json['EventArtistId'];
    ageRestriction = json['AgeRestriction'];
    pointOfContactName = json['PointOfContactName'];
    pointOfContactEmail = json['PointOfContactEmail'];
    pointOfContactPhone = json['PointOfContactPhone'];
    healthySafetyPrecautions = json['HealthySafetyPrecautions'];
    artistTitle = json['ArtistTitle'];
    banner = json['Banner'];
    hidBanner = json['Hid_Banner'];
    thumb = json['Thumb'];
    hidThumb = json['Hid_Thumb'];
    status = json['Status'];
    reason = json['Reason'];
    entDt = json['EntDt'];
    countryId = json['CountryId'];
    country = json['Country'];
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
    dates = json['Dates'] != null ? Dates.fromJson(json['Dates']) : null;
    price = json['Price'] != null ? Price.fromJson(json['Price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BannerUrl'] = bannerUrl;
    data['ThumbUrl'] = thumbUrl;
    data['Id'] = id;
    data['UserId'] = userId;
    data['EventName'] = eventName;
    data['EventSlug'] = eventSlug;
    data['EventEmail'] = eventEmail;
    data['EventOrganizer'] = eventOrganizer;
    data['EventDescription'] = eventDescription;
    data['EventStartDateTime'] = eventStartDateTime;
    data['EventCategoryId'] = eventCategoryId;
    data['EventArtistId'] = eventArtistId;
    data['AgeRestriction'] = ageRestriction;
    data['PointOfContactName'] = pointOfContactName;
    data['PointOfContactEmail'] = pointOfContactEmail;
    data['PointOfContactPhone'] = pointOfContactPhone;
    data['HealthySafetyPrecautions'] = healthySafetyPrecautions;
    data['ArtistTitle'] = artistTitle;
    data['Banner'] = banner;
    data['Hid_Banner'] = hidBanner;
    data['Thumb'] = thumb;
    data['Hid_Thumb'] = hidThumb;
    data['Status'] = status;
    data['Reason'] = reason;
    data['EntDt'] = entDt;
    data['CountryId'] = countryId;
    data['Country'] = country;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (dates != null) {
      data['Dates'] = dates!.toJson();
    }
    if (price != null) {
      data['Price'] = price!.toJson();
    }
    return data;
  }
}

class Upcoming {
  String? bannerUrl;
  String? thumbUrl;
  int? id;
  int? userId;
  String? eventName;
  String? eventSlug;
  String? eventEmail;
  String? eventOrganizer;
  String? eventDescription;
  String? eventStartDateTime;
  int? eventCategoryId;
  int? eventArtistId;
  String? ageRestriction;
  String? pointOfContactName;
  String? pointOfContactEmail;
  String? pointOfContactPhone;
  String? healthySafetyPrecautions;
  String? artistTitle;
  String? banner;
  String? hidBanner;
  String? thumb;
  String? hidThumb;
  int? status;
  String? reason;
  String? entDt;
  int? countryId;
  String? country;
  Address? address;
  Dates? dates;
  Price? price;

  Upcoming(
      {this.bannerUrl,
      this.thumbUrl,
      this.id,
      this.userId,
      this.eventName,
      this.eventSlug,
      this.eventEmail,
      this.eventOrganizer,
      this.eventDescription,
      this.eventStartDateTime,
      this.eventCategoryId,
      this.eventArtistId,
      this.ageRestriction,
      this.pointOfContactName,
      this.pointOfContactEmail,
      this.pointOfContactPhone,
      this.healthySafetyPrecautions,
      this.artistTitle,
      this.banner,
      this.hidBanner,
      this.thumb,
      this.hidThumb,
      this.status,
      this.reason,
      this.entDt,
      this.countryId,
      this.country,
      this.address,
      this.dates,
      this.price});

  Upcoming.fromJson(Map<String, dynamic> json) {
    bannerUrl = json['BannerUrl'];
    thumbUrl = json['ThumbUrl'];
    id = json['Id'];
    userId = json['UserId'];
    eventName = json['EventName'];
    eventSlug = json['EventSlug'];
    eventEmail = json['EventEmail'];
    eventOrganizer = json['EventOrganizer'];
    eventDescription = json['EventDescription'];
    eventStartDateTime = json['EventStartDateTime'];
    eventCategoryId = json['EventCategoryId'];
    eventArtistId = json['EventArtistId'];
    ageRestriction = json['AgeRestriction'];
    pointOfContactName = json['PointOfContactName'];
    pointOfContactEmail = json['PointOfContactEmail'];
    pointOfContactPhone = json['PointOfContactPhone'];
    healthySafetyPrecautions = json['HealthySafetyPrecautions'];
    artistTitle = json['ArtistTitle'];
    banner = json['Banner'];
    hidBanner = json['Hid_Banner'];
    thumb = json['Thumb'];
    hidThumb = json['Hid_Thumb'];
    status = json['Status'];
    reason = json['Reason'];
    entDt = json['EntDt'];
    countryId = json['CountryId'];
    country = json['Country'];
    address =
        json['Address'] != null ? Address.fromJson(json['Address']) : null;
    dates = json['Dates'] != null ? Dates.fromJson(json['Dates']) : null;
    price = json['Price'] != null ? Price.fromJson(json['Price']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BannerUrl'] = bannerUrl;
    data['ThumbUrl'] = thumbUrl;
    data['Id'] = id;
    data['UserId'] = userId;
    data['EventName'] = eventName;
    data['EventSlug'] = eventSlug;
    data['EventEmail'] = eventEmail;
    data['EventOrganizer'] = eventOrganizer;
    data['EventDescription'] = eventDescription;
    data['EventStartDateTime'] = eventStartDateTime;
    data['EventCategoryId'] = eventCategoryId;
    data['EventArtistId'] = eventArtistId;
    data['AgeRestriction'] = ageRestriction;
    data['PointOfContactName'] = pointOfContactName;
    data['PointOfContactEmail'] = pointOfContactEmail;
    data['PointOfContactPhone'] = pointOfContactPhone;
    data['HealthySafetyPrecautions'] = healthySafetyPrecautions;
    data['ArtistTitle'] = artistTitle;
    data['Banner'] = banner;
    data['Hid_Banner'] = hidBanner;
    data['Thumb'] = thumb;
    data['Hid_Thumb'] = hidThumb;
    data['Status'] = status;
    data['Reason'] = reason;
    data['EntDt'] = entDt;
    data['CountryId'] = countryId;
    data['Country'] = country;
    if (address != null) {
      data['Address'] = address!.toJson();
    }
    if (dates != null) {
      data['Dates'] = dates!.toJson();
    }
    if (price != null) {
      data['Price'] = price!.toJson();
    }
    return data;
  }
}

class Address {
  int? cityId;
  int? countryId;
  int? languageId;
  String? duration;
  String? type;
  String? location;
  String? address;

  Address(
      {this.cityId,
      this.countryId,
      this.languageId,
      this.duration,
      this.type,
      this.location,
      this.address});

  Address.fromJson(Map<String, dynamic> json) {
    cityId = json['CityId'];
    countryId = json['CountryId'];
    languageId = json['LanguageId'];
    duration = json['Duration'];
    type = json['Type'];
    location = json['Location'];
    address = json['Address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['CityId'] = cityId;
    data['CountryId'] = countryId;
    data['LanguageId'] = languageId;
    data['Duration'] = duration;
    data['Type'] = type;
    data['Location'] = location;
    data['Address'] = address;
    return data;
  }
}

class Dates {
  String? eventDate;
  String? eventStartTime;
  String? eventEndTime;

  Dates({this.eventDate, this.eventStartTime, this.eventEndTime});

  Dates.fromJson(Map<String, dynamic> json) {
    eventDate = json['EventDate'];
    eventStartTime = json['EventStartTime'];
    eventEndTime = json['EventEndTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['EventDate'] = eventDate;
    data['EventStartTime'] = eventStartTime;
    data['EventEndTime'] = eventEndTime;
    return data;
  }
}

class Price {
  String? ticketName;
  String? ticketPrice;
  String? ticketQuantity;

  Price({this.ticketName, this.ticketPrice, this.ticketQuantity});

  Price.fromJson(Map<String, dynamic> json) {
    ticketName = json['TicketName'];
    ticketPrice = json['TicketPrice'];
    ticketQuantity = json['TicketQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['TicketName'] = ticketName;
    data['TicketPrice'] = ticketPrice;
    data['TicketQuantity'] = ticketQuantity;
    return data;
  }
}
