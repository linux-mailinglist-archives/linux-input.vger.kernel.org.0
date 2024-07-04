Return-Path: <linux-input+bounces-4853-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38589927665
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9443DB21271
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 12:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78D1F1ACE96;
	Thu,  4 Jul 2024 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Dfvm8eE/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3055C26289;
	Thu,  4 Jul 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720097505; cv=fail; b=QXeJvB9+KRSrXASYkRikSON/OSOXeFUJhhT/nVp10CtGxN96/oV0caJ7lcO9s1afOWRC1+DndrAtN6yDkYSs71MRHIM3TPB9+tDdVsIcPIJHiz+cAGTEH4beR4QFG98bhZZ8QGtcUFcl2I6n2/KiA8qIlzSYv3bj7W/+GdZY6C4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720097505; c=relaxed/simple;
	bh=NXf58LCri5y9y4xY6EMlL5QY5OfncLibf4x3cdEZwuU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RwqD7f7RDDoXX1lCIUhmANi1jRGVkliDjrE87GfoCEt/OcUk7CeHwpIuWLvdr4lbxWlmblrxtNk5tTvkjNno1qgYSH+sXdS6vwcU8Q1gGj6jGGcx2kqGXyhxmyGA1pM14kb/709j0q4yayY6iKkrI3IPxmTNAdHtGiX179pYyHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Dfvm8eE/; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 464B5vwD006828;
	Thu, 4 Jul 2024 08:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=NXf58
	LCri5y9y4xY6EMlL5QY5OfncLibf4x3cdEZwuU=; b=Dfvm8eE/LJppz/x67ZeVP
	eWXQuBp4Bugzu0fRo2/waoZgWGskhWrC3PVgoDLoj2ZjI6N8R8kYAw2LpkqqLvEs
	AMwNUT9BRaKBJy/qVEg2MkISXt5Nnc1+sgycbkS+Owyk5zobeL1kcSuH2EZ+v2kn
	keoqSqpKwjhUnUrjpXzfqCsY9Z14oXGW/DVNr2mlZyqIPo/2g9L6wsti1x11PSLW
	v48cZu8+1KEoe+ViwU96RnTCo0kXqll2nswDj+5FgQPJ9PmEq0/DXqsNrXE6Oz8Z
	bgk3c8gGQQrLVx6gHuh/cJuEkMXca9XN4yZ2SVYZElOyb1AlSHZ1Q0Gr6xLIB6WR
	g==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 405n2p1efe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 08:51:38 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nj5q1godu7aLucyOSZo1MG6JSkUqg3T1vFLGEKGrfcdgpBz5930TL/yTpeO7ed48MYHYnARqcCsbcEncM8Kr8AlqueG4y1kqL1iMtRu8oDHBf6LzpZgOeC07QkGLxQdgmoDNTPekBCxLjIlCovn1j9YCvuKZwsF0/A6gPHgOB44l2cH5ofDHZXDZgF4/4YxX2Ao0DhzFslNw4NNTc3jQo3iU9QeSftcoQqXyPMd2pEhBaOC7QT3lfBX4Tg5JQKpTlTSS6aGcGRGTT/p18pYrlh8gQKkvtA5djzX6DK6uaoeJHvdweRSwvwjLx06Tdxu2JfmfeZ48VDkgWr5WhSYbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NXf58LCri5y9y4xY6EMlL5QY5OfncLibf4x3cdEZwuU=;
 b=bNQdL4dxHeGmq4sWcTB5T8GovFUN0/iqfGi9S6tnwVVkPTy2Uk9tr+4L5iM+Pa9czSD14/z08rc3NFlumsGyhrwu/lJVoneQAh1lenl/7nF0+48to/lUNOQqgyRF8mnelShc6H5UvMSUzasdcCRs6bLIa2g9NxoR0/agnglJoCWLspXS9MLHj5KNYueVxwl9RNEwxQmrRREsdLqLgbh3UU8kjDzID1CxTbEgUwWLLqQU9wv3d3F9oRqGkhmk/6/fe1es0fRXrRaMv0MdFzeGPn0HdkYu7OduWeGhiY9bH+qwk6jpylHCCPimf9QZGWgsd6/zcxKRbVA2y1I/nqRg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by MW4PR03MB6556.namprd03.prod.outlook.com (2603:10b6:303:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 12:51:35 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 12:51:35 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        "Hennerich, Michael"
	<Michael.Hennerich@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH v6 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Topic: [PATCH v6 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Index: AQHazf9drdrNxGEZME+DFDTb85OWbbHmaXiAgAAcN6A=
Date: Thu, 4 Jul 2024 12:51:35 +0000
Message-ID: 
 <SJ0PR03MB63437674F1C1259F3CCA41139BDE2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
	 <20240704-adp5588_gpio_support-v6-2-cb65514d714b@analog.com>
 <fc12a44eccc1e3843bb9ae0f25ee5df6eecddafb.camel@gmail.com>
In-Reply-To: <fc12a44eccc1e3843bb9ae0f25ee5df6eecddafb.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB5TTJZME9UVTVPQzB6WVRBMExURXhaV1l0T0RSbU15MDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjTWpObU5EazFPV0V0TTJFd05DMHhN?=
 =?utf-8?B?V1ZtTFRnMFpqTXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STJOekUwSWlCMFBTSXhNek0yTkRVM01UQTVNemsyTWpjMk1USWlJR2c5SW5o?=
 =?utf-8?B?VFRVbEliVWxXWjFSbWNESktlbkJTYXpWbFEzbEdTMFZzT0QwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUW1OdlJTOXRSVTAzWVVGWU1rY3dNemcwYTFsM2RX?=
 =?utf-8?B?WlpZbFJtZW1sU2FrTTBSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQk0weG9VMlpuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|MW4PR03MB6556:EE_
x-ms-office365-filtering-correlation-id: 75b06b2b-6b59-46cc-6da6-08dc9c2809a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?eDVHamQ2SDNOMTNTMTh6bmlFSFpjZWI5eUFYcE82Yng0NnBra2kwV0JpampS?=
 =?utf-8?B?cCtQZXAySldOSUNBdmJVSGViWEp2cHBXeEw4MzFIc2NDSllLNHYyNUF3YXRM?=
 =?utf-8?B?TGNJVFNCNnpDOGdCdm5SNlMzT1VRVzNxRDBOeWIxbnZrUEs2OXF6MVNhbUcr?=
 =?utf-8?B?ck44a3VHOW41OWNUQTVjblNXVUF5TnlQTTBNeXV0RU9hMXJLUEdaMmdoM3Jv?=
 =?utf-8?B?OHNJdE01RlUvWEFwNTRPRGs1RURUTzY2L29HeFora0RQNGk1bHhQNTFxSUlj?=
 =?utf-8?B?TVcxZTlKRlorb3pSUUZvZTQ1S2JSYWNxSlpzNjVLMVRVT1A5UGRHUlJobnlI?=
 =?utf-8?B?K1RyS3NqcXdHQ0J6bmVCRlNNOUpOYkJaaEZlYnRGemJaVm4zMG9sQ2RnaVdU?=
 =?utf-8?B?bGR3S1ZUelB4eHBJcXU3SU1ieGs4dEtMd2FkcDNIOGY3QVVEMXNweCsyOEpp?=
 =?utf-8?B?Qkx1dkQ4NHlUdW5TblR5dGJuaU5tNDdhNnE5YWhWeWRBT2lEbGk2Z1dGUWY4?=
 =?utf-8?B?MzFwRDkyV08vNXRTckZrdXBWZzRWa0JmNm5OQk10RXhHMHRTUXJscmI3bU5y?=
 =?utf-8?B?VGFqVE96dUt6SjN0b3VSWkE3bmRWNDUrOXJKWFdjcS94U2puYjRPc0tGL2l4?=
 =?utf-8?B?RVFtVjUzQ2FnYkczMzdUZElxcDJ0R0tlZEFhL2c2VmRzRGE4QmMrTzc5MUtZ?=
 =?utf-8?B?V3lGMldPVHBDSDl0UjN0dXRnRmJ2czVlRHhscXVrVFFYYlllQ2dQbis3c3NL?=
 =?utf-8?B?cEdUMWV3Qy9oSVMrMmlqQUpFYlFjU3g4a1BTT3VZRGNQQjdnQTQxclNObmc2?=
 =?utf-8?B?YlRTcGppMWt6d2FCTS9QWjl6SFhsNGpFUGo5Nkkvd3psUVY3RlJKTmEySWly?=
 =?utf-8?B?bU16N0RYZHlTNkVQcEc5R2pYYk9UbzBka0JhaTRGdjdKb3BsMGsyUWVFYy96?=
 =?utf-8?B?Z0FvM0lOU0IwT0JLK3Z3WVNYWEFiT0JsZlZsRnovdWszOVU0OWdsb21LKzVJ?=
 =?utf-8?B?Q0FXaktWdUtaZWZvc1p3dG03VVR4NitDL3NNV2o5ajR5K2NiNHJyU2JXSXZH?=
 =?utf-8?B?bExUY3lLYXZIWU85VVAvSUkySkxNdVhiREh6RGRMcVJreHhQdVZzM2lqUDhm?=
 =?utf-8?B?TXJyWGh3SVFwVDZrcC9XV2F2YWxLYkJqSFFmcU9zK2dPZGhaalpMNzZKN1Rz?=
 =?utf-8?B?Qk1YREp3SmJXRm0vV0NIRDhUSjVJd0syNGVpeGl1T0pRWEdoUHFQOGVCRTJ1?=
 =?utf-8?B?cTVpOS9hTE00cCsrVXJUYUkvM3FwS3U5cUo4c2dSaCtkMHMybXhldFVnK09z?=
 =?utf-8?B?K29JaFdrQ0xNU0dLQ3VsT0tIY1FWRjA4emNCNWduNHlPdG41aXZ2ckoxVWhm?=
 =?utf-8?B?R2pYKy9zTTIzWjVCNU02ZnJ6dnhMV21JR0xsS2hhQnpqYmFxRTVGcTN5bXlh?=
 =?utf-8?B?ODNtSHpSSmx5NXFlVmVoUVFWVmtMOGtFbFZxNjhObmZIaXZFUjdKa3k3NkxV?=
 =?utf-8?B?TkZPV1pGYmNtZmVycThNRVNrK3ZVUGwvVVhLdnJIM2ZrV1dTZDFFek9OckpY?=
 =?utf-8?B?VHRZVzlTdXVBZjl0Wm00c3lZYnZZZ0hhVisyQU56cFloaXFpR3lxRDR3NFRP?=
 =?utf-8?B?cHVEWUpkMjlmM1l2RVVHbTlCYXB4ajdFNmU2YWUwSkhkek1kaFJ5NDROZGhC?=
 =?utf-8?B?cjBjTUQvYmllUlBmZU1MU3lQS0VXazBzWFdRSmdrVGM4WkZINDgzMDYybnBj?=
 =?utf-8?B?dVBsTHVtNnRWdk5FYWZMZGZab0tsaVhOU0VQMmJHdlBxb2g5cndVOEdiY3Zv?=
 =?utf-8?B?L0NNb1hXT2hjZmxxRFliR0lnQnArK2I4cTBsUWRFQ3FhTWtPOG1kZ29pZU5w?=
 =?utf-8?B?Z2xTYVoyd3loNW1sZlRvTUMwYXYwdlh6V1BJZGdmK0F2RFE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUpRR2c4TTEyc0JUWXBlQWRNS0p0WSsyK2Y2LzdQcE9oaUNBSzFUQUQ4bnZy?=
 =?utf-8?B?WmVXRGozTktIM1djbjVhcTF5bSs5NExIeGN1bGtRNUhRWno5SU1OOUNCS1d3?=
 =?utf-8?B?aCt3aklNcW1WYU94UWtnOEFNUXVFUnJSbHZIT1BtZGdTc2ZSOENoczNIdndv?=
 =?utf-8?B?RDBCMUVxWWtKdlBCYlErR3dxTktaZUkxVXVQSFJ5K0hDVzBGYm11NnJNR1dS?=
 =?utf-8?B?NkhWTGIzVHNJRXNPSDJ4SjZ1V2NrallmaGtEaUZPNzE5RlhQK1E5MlRkekxl?=
 =?utf-8?B?NFpxdVhVc1BtWUJTdTRZY0s2OWxxVEtmMm1VenhWcG93QW5TZXdDU3IrdVFr?=
 =?utf-8?B?Q1EwaEtyc0VJSW51SFU5cG5xRGNadDE0d1ZZU1EzR0JUTW1iZUJLU0d1dXlN?=
 =?utf-8?B?T3kzMDdEVE13cEtCUFZCK0RkZWFCa2xseTlKWkxWU3B2SC9qMGdVeUhlM2tL?=
 =?utf-8?B?S0ZGSXBwTGZjdncwNEh6VEQ2SmY5NHNTbFk1d0k5dUxEWVI1eFgrazlFalVT?=
 =?utf-8?B?TnVTYk9xV29CRFA0TWxoOUhJQUUwWGJtSTFsQlZ4Q2hDeVp3bTNFTDR4K25h?=
 =?utf-8?B?Ui9kOVdyZDhCMHcyTnhsbWtrVWxTSUJqMVg4VDBZNVpwMGRMS3dZSTI1cERG?=
 =?utf-8?B?MjhpbTRJcS9ZWDUwR1VUSEZNcG9DY29kOWEwNzZXbEpZdytqb09SbDFOYmli?=
 =?utf-8?B?N2xFc2xRMkoyd3gxRnVvQklwUXlzVWJIbU83bThVTVhGbW9wTlF6VDJuV09t?=
 =?utf-8?B?djNpMzR0UURjMkpNTnVUVkVMYk9lTkFPaWdHSkRmcDZYMXdSWnNKT2lTNjZL?=
 =?utf-8?B?eFQranNSb3FDbVFXVVNzQ2wrME94bG1IZzdWZXJocWVNcXJwaStFYkNUdWlx?=
 =?utf-8?B?U3I0MzlPSHdMQjV0eVEvcEdXaXczQlVqVUhWcDBPZGZWMDF2UzFhUWlTVmpZ?=
 =?utf-8?B?c09ESEVoa2VBeG5BL1A4VGkvWHdiTXp2a2NtVi9FL3BPblJFK2FUaUFIajNS?=
 =?utf-8?B?T09IMm0xYU41MTA3NGVLQnBhVmoxeUpIQno2dHBhcEIyQXM1VlhFaWVQVGNX?=
 =?utf-8?B?YktVRS9JVGp1dWNYQUlPSitBY2hZRExYMm9ZT1JHRFA3eklvYU14RVQwL25y?=
 =?utf-8?B?QldSWERDTHhNa29LaVVVSkJUZ1VJeEVhVEU5TURheEJjeHplcERGODVubDdi?=
 =?utf-8?B?M2ZEcUJlSDVYVW53Vy9qbDUzaUtkZzZxTldta1NXbXRYd2tFM2g0MDZxMFVE?=
 =?utf-8?B?OTdEaVhCcjhGUDVUOWVJV2Q3SkZPWWtmSURHTHFNQ0Uya0haUG5FbmNHbWNC?=
 =?utf-8?B?NEtNK2xaeWo0S0Y5TllRRytCMmtidGpNeWJXRlU2d1pxRldISHBqVEluU3dX?=
 =?utf-8?B?ek1MUUNqMTdEcTZ0T0VlTEtKVE9BZmg5cUNBUjVJZ3FqM3JGYndzK3VpeXQr?=
 =?utf-8?B?Q3l3d1Y4cE9EcThJTiszRmd1bHg1WlFCSzRiYi9RMWU0Q2ZvOFFIZkh4b01j?=
 =?utf-8?B?MHhCL0prcTBpa0FCTEgyWjQ2V1VMZkZsYW1KcHU0WHd1WE5HYURaeEVrWEI5?=
 =?utf-8?B?Wm1QN2d0SnFhQkJIeU04NHBRdkw4RUNHZUkwNm9zcVhjRkJqemRyNWpETFhh?=
 =?utf-8?B?YThYR1FxZjJxZXJqYS9DV2V2ckFFSWxONjJ0cGZxK1l4WTBZRWVOUHB4Y0Nw?=
 =?utf-8?B?Q21HcXF4ZmJjWXh2eDhSdW9ITWE5VUMwT2dIemNmVTV3ZDljakFSSC9WZE94?=
 =?utf-8?B?a0JLM0pLVnpFVlFYRFNoNUNhN2FLNkE4UjVPUzQzc0UyNFdIZGhKZG4vVzVq?=
 =?utf-8?B?NEw2SDdWMFc4dWtZN2M4YURuQjV1OTdnd2lsKzZlYno1Z1ZQL0JOaTRHc0Nw?=
 =?utf-8?B?SGZWLzFTM3RxK3h6TzYvOEgvajdtdjRJdU5vTFVSZHY1SmdkSnlzNkxKK29F?=
 =?utf-8?B?WTliN0wrMmhNazlNZTJrRE1FRDZnZnI4Rzd6dy9CRUZHNExiaUFtRGo4R3NW?=
 =?utf-8?B?akZtTjNUM1FvS0N0clFWZjZ3SDhvQlJEUzhYa0lRYXNNUmp2TTJId1N5OGdu?=
 =?utf-8?B?cUdUYVFaU3Vwaytzc3hLdjh5bE9RQkV3NCtuTllqc1Y0czlSRHd3Z3FHV0lO?=
 =?utf-8?Q?ZemH1/dOGJmXficMkyeJx3r+m?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b06b2b-6b59-46cc-6da6-08dc9c2809a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 12:51:35.3520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ln2qLOA2F3/YEyt7ci7N/pd11Uq14DyYiOH7f0YD7EhlYNtZ0sFDjX+aZorZoJB766qolZ/s5baiYRGkDIE9/F1mIrvyVTHjbCthDeLFTRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6556
X-Proofpoint-ORIG-GUID: DPidw-drPSWeqwyIwMMds6Iig1nEvqM8
X-Proofpoint-GUID: DPidw-drPSWeqwyIwMMds6Iig1nEvqM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_09,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040091

SGkgTnVubywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOdW5vIFPD
oSA8bm9uYW1lLm51bm9AZ21haWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSA0LCAyMDI0
IDEyOjEwIFBNDQo+IFRvOiBBZ2Fyd2FsLCBVdHNhdiA8VXRzYXYuQWdhcndhbEBhbmFsb2cuY29t
PjsgSGVubmVyaWNoLCBNaWNoYWVsDQo+IDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsg
RG1pdHJ5IFRvcm9raG92DQo+IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsgUm9iIEhlcnJp
bmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2Vy
bmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNhLA0KPiBOdW5v
IDxOdW5vLlNhQGFuYWxvZy5jb20+DQo+IENjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7
IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgQXJ0YW1vbm92cywgQXJ0dXJzDQo+IDxBcnR1cnMuQXJ0YW1vbm92c0BhbmFsb2cuY29t
PjsgQmltcGlrYXMsIFZhc2lsZWlvcw0KPiA8VmFzaWxlaW9zLkJpbXBpa2FzQGFuYWxvZy5jb20+
OyBHYXNrZWxsLCBPbGl2ZXINCj4gPE9saXZlci5HYXNrZWxsQGFuYWxvZy5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjYgMi8zXSBJbnB1dDogYWRwNTU4OC1rZXlzIC0gYWRkIHN1cHBvcnQg
Zm9yIHB1cmUgZ3Bpbw0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gVGh1LCAyMDI0LTA3LTA0
IGF0IDExOjQ1ICswMTAwLCBVdHNhdiBBZ2Fyd2FsIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiBG
cm9tOiBVdHNhdiBBZ2Fyd2FsIDx1dHNhdi5hZ2Fyd2FsQGFuYWxvZy5jb20+DQo+ID4NCj4gPiBL
ZXlwYWQgc3BlY2lmaWMgc2V0dXAgaXMgcmVsYXhlZCBpZiBubyBrZXlwYWQgcm93cy9jb2x1bW5z
IGFyZSBzcGVjaWZpZWQsDQo+ID4gZW5hYmxpbmcgYSBwdXJlbHkgZ3BpbyBvcGVyYXRpb24uDQo+
ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBVdHNhdiBBZ2Fyd2FsIDx1dHNhdi5hZ2Fyd2FsQGFuYWxv
Zy5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5
cy5jIHwgMjcNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gwqAxIGZpbGUgY2hh
bmdlZCwgMjcgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5w
dXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMNCj4gPiBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQv
YWRwNTU4OC1rZXlzLmMNCj4gPiBpbmRleCAwOWJjZmM2Yjk0MDguLjU3MjMzNWM4ZWYwZiAxMDA2
NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+ID4g
KysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4LWtleXMuYw0KPiA+IEBAIC0xODgs
NiArMTg4LDcgQEAgc3RydWN0IGFkcDU1ODhfa3BhZCB7DQo+ID4gwqAJdTMyIGNvbHM7DQo+ID4g
wqAJdTMyIHVubG9ja19rZXlzWzJdOw0KPiA+IMKgCWludCBua2V5c191bmxvY2s7DQo+ID4gKwli
b29sIGdwaW9fb25seTsNCj4gPiDCoAl1bnNpZ25lZCBzaG9ydCBrZXljb2RlW0FEUDU1ODhfS0VZ
TUFQU0laRV07DQo+ID4gwqAJdW5zaWduZWQgY2hhciBncGlvbWFwW0FEUDU1ODhfTUFYR1BJT107
DQo+ID4gwqAJc3RydWN0IGdwaW9fY2hpcCBnYzsNCj4gPiBAQCAtNjMyLDYgKzYzMywyMSBAQCBz
dGF0aWMgaW50IGFkcDU1ODhfZndfcGFyc2Uoc3RydWN0IGFkcDU1ODhfa3BhZA0KPiAqa3BhZCkN
Cj4gPiDCoAlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0ga3BhZC0+Y2xpZW50Ow0KPiA+IMKg
CWludCByZXQsIGk7DQo+ID4NCj4gPiArCS8qDQo+ID4gKwkgKiBDaGVjayBpZiB0aGUgZGV2aWNl
IGlzIHRvIGJlIG9wZXJhdGVkIHB1cmVseSBpbiBHUElPIG1vZGUuIFRvIGRvDQo+ID4gKwkgKiBz
bywgY2hlY2sgdGhhdCBubyBrZXlwYWQgcm93cyBvciBjb2x1bW5zIGhhdmUgYmVlbiBzcGVjaWZp
ZWQsDQo+ID4gKwkgKiBzaW5jZSBhbGwgR1BJTlMgc2hvdWxkIGJlIGNvbmZpZ3VyZWQgYXMgR1BJ
Ty4NCj4gPiArCSAqLw0KPiA+ICsJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoJmNsaWVu
dC0+ZGV2LA0KPiA+ICsJCQkia2V5cGFkLG51bS1yb3dzIik7DQo+ID4gKwlyZXQgfD0gZGV2aWNl
X3Byb3BlcnR5X3ByZXNlbnQoJmNsaWVudC0+ZGV2LA0KPiA+ICsJCQkia2V5cGFkLG51bS1jb2x1
bW5zIik7DQo+ID4gKwkvKiBJZiBwdXJlbHkgR1BJTywgc2tpcCBrZXlwYWQgc2V0dXAgKi8NCj4g
PiArCWlmICghcmV0KSB7DQo+ID4gKwkJa3BhZC0+Z3Bpb19vbmx5ID0gdHJ1ZTsNCj4gPiArCQly
ZXR1cm4gMDsNCj4gPiArCX0NCj4gPiArDQo+ID4gwqAJcmV0ID0gbWF0cml4X2tleXBhZF9wYXJz
ZV9wcm9wZXJ0aWVzKCZjbGllbnQtPmRldiwgJmtwYWQtPnJvd3MsDQo+ID4gwqAJCQkJCcKgwqDC
oMKgICZrcGFkLT5jb2xzKTsNCj4gPiDCoAlpZiAocmV0KQ0KPiA+IEBAIC03NzUsNiArNzkxLDEx
IEBAIHN0YXRpYyBpbnQgYWRwNTU4OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0K
PiA+IMKgCWlmIChlcnJvcikNCj4gPiDCoAkJcmV0dXJuIGVycm9yOw0KPiA+DQo+ID4gKwlpZiAo
a3BhZC0+Z3Bpb19vbmx5ICYmICFjbGllbnQtPmlycSkgew0KPiA+ICsJCWRldl9pbmZvKCZjbGll
bnQtPmRldiwgIlJldi4lZCwgc3RhcnRlZCBhcyBHUElPIG9ubHlcbiIsDQo+ID4gcmV2aWQpOw0K
PiA+ICsJCXJldHVybiAwOw0KPiA+ICsJfQ0KPiANCj4gWW91J3JlIHN0aWxsIG1pc3Npbmcgc29t
ZXRoaW5nIHJlZ2FyZGluZyBpbnRlcnJ1cHRzLiBJZiB0aGVyZSdzIG5vIGNsaWVudC0+aXJxDQo+
IHRoZW4geW91IHNob3VsZCBub3Qgc2V0dXAgdGhlIGdwaW9faXJxX2NoaXAuIEhlbmNlLCBpbiBh
ZHA1NTg4X2dwaW9fYWRkKCksDQo+IHlvdQ0KPiBzaG91bGQgaGF2ZToNCj4gDQo+IGlmIChrcGFk
LT5jbGllbnQtPmlycSkgew0KPiAJZ2lycSA9ICZrcGFkLT5nYy5pcnE7DQo+IAlncGlvX2lycV9j
aGlwX3NldF9jaGlwKGdpcnEsICZhZHA1NTg4X2lycV9jaGlwKTsNCj4gCWdpcnEtPmhhbmRsZXIg
PSBoYW5kbGVfYmFkX2lycTsNCj4gCWdpcnEtPnRocmVhZGVkID0gdHJ1ZTsNCj4gfQ0KPiANCj4g
LSBOdW5vIFPDoQ0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LCBJIHdpbGwgYWRk
IHRoZSBzYW1lLg0KDQpUaGFua3MsDQpVdHNhdg0K

