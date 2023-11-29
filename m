Return-Path: <linux-input+bounces-353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E98247FE313
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 23:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64BB2B20FF3
	for <lists+linux-input@lfdr.de>; Wed, 29 Nov 2023 22:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB493B1A4;
	Wed, 29 Nov 2023 22:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DNeDLQXz";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EgdRE/z5"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFC81BDC;
	Wed, 29 Nov 2023 14:23:15 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3ATJWvuq017362;
	Wed, 29 Nov 2023 16:22:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=IW2g8xxb5X1w0BIAcH3uXdfybLI7xPt4bdMOBupyn
	5Y=; b=DNeDLQXz3bjekTgwM89VOrNseKDYiG6g0hB7ohjfDJD4H+ZIN29lnEN5c
	AXKeCTBskFmPvJjOcBVK2PNW0fJjTBZl6ji/IbZ3R/QbhaYLUHyyJsxQHdBNkO+t
	DXkl1zYlkcUzIoT++iOocZt4HyvtwPYHjzkOhhuY46sIq7Zh4bwFrtzQh17eGxGn
	QnZggl+AsrsDgs8+kGr7KDeuOfrK6T+BjpDv4YvMybRXOSEKjnbLcheeaFQhH8/v
	pMp5/6NQ8+UQch3GEgDVGgAAxpKlXJfFjCLEMnjruZd+4oc42MSuTnZcfary7MbU
	F7KX1JUJhXPiQpqFLnv1nqkpSo3Eg==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3unvprs420-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 16:22:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kl3af5Z8NwkMjus0/ySyslz4mqv9wjLCGTiQ2mYi4nu53Euq2IzEfsfKDgG/ROA0pm866RFR2YBEstLvIsKn0t1xRbSJN9+BKLO5vjAjxeCHTuOP+rPdKlYUk5zzQuyuRbp5ktx10A11IzsXmK4ZhfXX2QLtGYdDt0UG2vR+zBwjKN77p1mP4VejxhKSkE1cxsAv+ufvfiUQeWK6KZaLtkZM9MBTrECyrkZMiRr4AbvqjkGgPp1BqVzFscOf6esfnYQAqWLtuB6Uo57IbFeZ2K4v0mAzWQwhV5RWM+AhjLDg3PNX7+1Vhp/Ekm5FuI74BPDtT5nmCmWBRMzVKtgwFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW2g8xxb5X1w0BIAcH3uXdfybLI7xPt4bdMOBupyn5Y=;
 b=Kzsi5zYfbt2B8KMAi9iOKq1sSZNNhu3KGoJ//oT3B58lYjzBtkQxMtb/KFIpoIoRq0QcrghAN/YTS/1LzTobGKMDtJ9NZIyzKyqVX7zuDZQqSrudQ9s8lR1m/qaNbztBFIE9kmEtpXBTOUIOG5/U+YETjBWzett/M5OiT6qd8XrsYDlSYX2rCvvNymWZgF/IJwJTAeLMXoP0lvY00v42mAniw6vxcsZ61kQJUF4fyj99h3Sz7PyI4wnXHMJknehRHuiznQW3LJIUCCUocoqN4/nVS8EWwerHXCSwTJmNgIc4pHWpJ+wufFQ3KFMaBFF4q0emi56sbLl5PgJV5FpUCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW2g8xxb5X1w0BIAcH3uXdfybLI7xPt4bdMOBupyn5Y=;
 b=EgdRE/z5leJ2k3nH7fWaytn2enrwQNHbR0A3xbxmVub2ymJGiv7cpQBbJylqYBWQ7NdyyVCz9u9TinY8/QX57UNHCm6CYb36B/C0ulIw6qxu2G2Gr+13AKXctAc7hrQealUQ2lVlLeqdoKijaA8CZPGuJNXPq4xO5f6+C3bMcUQ=
Received: from BN8PR19MB3057.namprd19.prod.outlook.com (2603:10b6:408:95::13)
 by DM6PR19MB3994.namprd19.prod.outlook.com (2603:10b6:5:24d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 22:22:16 +0000
Received: from BN8PR19MB3057.namprd19.prod.outlook.com
 ([fe80::afe5:fe4:70fd:e67f]) by BN8PR19MB3057.namprd19.prod.outlook.com
 ([fe80::afe5:fe4:70fd:e67f%5]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 22:22:16 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <james.ogletree@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Fred Treven <Fred.Treven@cirrus.com>,
        Ben Bright <Ben.Bright@cirrus.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] Input: cs40l50 - Add cirrus haptics base support
Thread-Topic: [PATCH v4 2/4] Input: cs40l50 - Add cirrus haptics base support
Thread-Index: AQHaAeyc67vZbjzw6EmetgoqQ2lrbrBZy3KAgAw5jgCAJfzwAIAGHy8A
Date: Wed, 29 Nov 2023 22:22:16 +0000
Message-ID: <95C3C010-DA09-4848-A5AB-635AD93DCDC3@cirrus.com>
References: <20231018175726.3879955-1-james.ogletree@opensource.cirrus.com>
 <20231018175726.3879955-3-james.ogletree@opensource.cirrus.com>
 <ZTh3qSAjIaj/oonc@nixie71> <6DECA9DD-B464-446A-B6A1-5EECD4FF5E0B@cirrus.com>
 <ZWKW6BY9C3a9covT@nixie71>
In-Reply-To: <ZWKW6BY9C3a9covT@nixie71>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR19MB3057:EE_|DM6PR19MB3994:EE_
x-ms-office365-filtering-correlation-id: cebe5f6b-11e3-45a3-ca3b-08dbf129a4f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m/oyBXk2o3J8t2iS/ZqoungSAaPK9HKBP/zqifMWINpPj/ig/EPwZmwVNgTacCtlA6sj+MwQ0Mw6W3BLMi4TEVP0XRrBQORf2oywtl3V1Mnwvn1iSO+O4DudR84k0iNkB6QDH8qIU0aBokGSDqT9f60a0bBPuUFM7zeojl8EwGQYjK8ohPWKcQCEMRoir9S7Pw+abfL8oK7fovMFAqmkp50bEtgY7favPTWHicvBuspsnuUjMb6R0RLYVSPP2hryQwAcJyzn+1OA29QKCVN20Qy0IXlW6z3YytqEdeYKtvgkXkV/aVrZPmCPq3Qc0OHr3ailt86XEHfoleHWADZ686jGaMH/1qicnJNwoPQQyhRkrk2QjFQUh3lNQ67co232v5aY9DaUM3vSFD6iIfr3lct9KfB1YhaqVdLewKqg4OK9sQwcVwECykqKQuCbIT6rPhX38125bF6Ydq49NIqkqsjl+Tc36jfqIC+YYj8MAOBZVOOUzJMaZcGQftWqZlZSQ5E4RvTDbIKPfJeq6ap/adcFGLS39s4mt0vJCF9B0xixeYWCyjzgwGiUWTzvmUgQclnU3W4YKlcFka0ktReWNv1YXn1GeCRfUs+CrckMu512jWIxprBDn64w9Wguxs++84ck/LeDrVhJHTQWYbAsgwPcE19fiidEUH9CBQ6EvaZiTRqaKtSx+KXZrqdlkOGu
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR19MB3057.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39850400004)(136003)(396003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(30864003)(5660300002)(2906002)(4326008)(8676002)(8936002)(41300700001)(54906003)(64756008)(76116006)(66446008)(91956017)(66556008)(66946007)(66476007)(316002)(6916009)(478600001)(202311291699003)(6486002)(86362001)(122000001)(6512007)(6506007)(36756003)(26005)(2616005)(71200400001)(33656002)(83380400001)(38100700002)(38070700009)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Wk9vMWhhWk45ZlNER3U0VmlJVmh4MkYxRURIOEdQVFhyK2V3VUxEZ3VPcUh1?=
 =?utf-8?B?c3UrV3E2RWkrbUt5eUs0bDRKdFQ0dFMwc2FaS25nL3Y4YlNQbkgvTFlzeFJN?=
 =?utf-8?B?MTlWSmpnTG16d2VQdmdDY01NaDJna2hDZDV5YlBKeXF5bnNoT1M3REtiTTM2?=
 =?utf-8?B?NUx5MDgyUGc0NThHdkI2Rk12RjMyNFBOeHM5M3hpcGhLdURqeHpURVc3T3Iz?=
 =?utf-8?B?T3RsRkJhbHRrTzVMVTFDK3hJQS9ud2pjSjdxYi9obS9OVE1qZVNzZGVUQ3c3?=
 =?utf-8?B?QUw2Nkd6TWg4ZnlEdTdmYjFzWm0wYnVKU2FEY3hTQVo2OTMxWG9BdHlQY01x?=
 =?utf-8?B?MkNJcVprcjZtcUhvdGpsRFQ3YVd4MHcwNUM4WDlzV0l6OTVhYjIwSlYrSU5I?=
 =?utf-8?B?Rm11WCtpSWFsUkh5R2pKSENyZjQ3NE1iVWlMbW1Qc0RJV3dTZU9vcTliZzBl?=
 =?utf-8?B?UzFVVzA2aFFXOHdIYUxWSTl1Vmt6ak4xWUQzbHVHMWhzVUFOWG50aFFVNG40?=
 =?utf-8?B?Ykd5Uk5oc3NCdmlyUk45RFpaMTJDaXN0eFB4bnU5b00vQ2tFZWhwakd4dFVI?=
 =?utf-8?B?THdTcy9vVzRzWVBOUld5U3ZWK1ByZnd6ZEk0Uk1TdzdaSUNPRjBpYnptZWdW?=
 =?utf-8?B?UldTdmhsMmhVRjd1NitOUDJaNmVud04yN29tQU9Fa3llOE1PRTBlN1VuNGFL?=
 =?utf-8?B?WDJzS0QzcXN5aVNDNTZtUlk4SDU2Q2pQSFBtRk5Da0k0dGFCUXl5ekFzRUxC?=
 =?utf-8?B?MU4wVFpkRnVIOTJTZ05mSGQxUDZNb3V0L2ttN1RrT1pJVnh6YzcyZE1KUXgr?=
 =?utf-8?B?K0JJVm9UcGlMOUZ3djl1bHozQVZ4WVdTY3hLWTk3V3pPTjU2bUpBSEJaUDJJ?=
 =?utf-8?B?Q09RekNORWt6bU0rZjhtMHRTVmFXaGYwbFdaMGFEZlMvUDJhcGd2WC8wTU55?=
 =?utf-8?B?djc0TVhNWlpKSENld2JWODFOTVl1ZDAyNEJxYWdBZkw5cmVDeGJKN3dONTM5?=
 =?utf-8?B?d2NEQjNRbzlGWUpzM3VaR3NET3hFbHlSckdEQUd1Y21UdGYvb2ZyYUNQdFc0?=
 =?utf-8?B?SFFQWUd3WTlxUmdEek9QdW85Tk5yMEFlaVlxSURmUFdVVjNOUTlKMDlHMXg3?=
 =?utf-8?B?VUYzT3JTY1BWSVBSb1ZKS2N5YW9YeENOYm52d0k0MnVrQzB3Y3dmUVg5V0hL?=
 =?utf-8?B?cVFZUSt4dEZtK0NFaTJxQUlJN1dSZE0wcWR1eUR6N1RXS3ptWmUyWmZyczBy?=
 =?utf-8?B?UVR4YWpPdyt5NUIrb1VFTmNibys0eE1WbDVJUlhmZ1ZuaGdwWHNHck0xSzRT?=
 =?utf-8?B?WkdjamVyanl2dGpTZWExbzdGR0YvcEh2TjZDa3ZZb3FRRVNkZ0ZwMWFOSFQ0?=
 =?utf-8?B?WFlseXNSTlNNYmlrK08wc3MyeUdRZXl4eWlXTFVsalRDQk1FOVRRekxoTnBS?=
 =?utf-8?B?UUNHMGVjbFpRMGZoYzdJMHZqbUErOVpKeXpkS1JuRGxHUytqa1V0TWlUY1h2?=
 =?utf-8?B?NS9XaDlsR1JyS1B1WlBQemthcGVsUldMeEtBN0xsSzJHaW9qL3FWdk11SDls?=
 =?utf-8?B?OVV5UnNGZDZ6dGMzRzc0K1U2MGNFcTJHR21KZWFxYUFkL1RacDY1bmZGa2h3?=
 =?utf-8?B?YmtBUkM1UGU4K0RRY2UyKzZJWTFWSTQwOFMvRi9PVDFoMjJ0eHl2VkhEajRw?=
 =?utf-8?B?R2RWYVpTaHZTaTBiYWNNbUgyOVVnVEQ5MkQ3ZmlGZFhEM2NWT1o5L0E4YmR4?=
 =?utf-8?B?UUVRT2o0UEI1Z1JmY3pnWVVIcDU1c3VUYklOTW9jRlgrcmZsY1N2aTJiR1l2?=
 =?utf-8?B?UElDd01SaEJTa3h5V0k5bjFhUlY3RG1BeEJIVENhRlF1RTgzS3p6YlY3UVlO?=
 =?utf-8?B?OFpBWU5ZekpnOTJmTGpBNmlmSHRVV2pzNVVGN09WRE4vN3hJK0ttdHFYWC9o?=
 =?utf-8?B?a1B4c2xUQlIweTJtNGpVUmFXMi9LL3NQelRjK1pkUHBET0EyWHhCdXo1Ymh3?=
 =?utf-8?B?VDZiSm1oRW1pT0dJOEk2UXdDQVBQVGMxcGgrZENVK2hoT3o2WHdVSmhIR2xU?=
 =?utf-8?B?dmtmTWIzUGVZQUgvNDAwT3RDSXB5RlVpUE5OSHp6WWFaQ1J5b0Y5ZzZVUytL?=
 =?utf-8?B?NTZQV00yWTB3S0ZTaStkRm8vQXZUNWFqMm54WW5pUU83eFlZVU9KSFJSaWw3?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D43A1C4E771563418C8CBEBF5827772B@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR19MB3057.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebe5f6b-11e3-45a3-ca3b-08dbf129a4f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 22:22:16.6215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kO6gufE7J0Ufu0AGv5sPIxagzsGUlQMM6bPdgAXT5Xtx/c4gRIVlUJGj8xrtelERLlhJKoZ9erO01zSecDw6k/G48mHn22JCSI7KdqmP/LQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3994
X-Proofpoint-ORIG-GUID: rjzpzvUMaT6eDMJq8szamv7O_A09lVQR
X-Proofpoint-GUID: rjzpzvUMaT6eDMJq8szamv7O_A09lVQR
X-Proofpoint-Spam-Reason: safe

DQo+Pj4+ICsNCj4+Pj4gKyB3b3JkcyA9IGtjYWxsb2MoaGFwdGljcy0+ZHNwLnBzZXFfc2l6ZSwg
c2l6ZW9mKHUzMiksIEdGUF9LRVJORUwpOw0KPj4+PiArIGlmICghd29yZHMpDQo+Pj4+ICsgcmV0
dXJuIC1FTk9NRU07DQo+Pj4+ICsNCj4+Pj4gKyBlcnJvciA9IHJlZ21hcF9idWxrX3JlYWQoaGFw
dGljcy0+cmVnbWFwLCBoYXB0aWNzLT5kc3AucHNlcV9yZWcsDQo+Pj4+ICsgIHdvcmRzLCBoYXB0
aWNzLT5kc3AucHNlcV9zaXplKTsNCj4+Pj4gKyBpZiAoZXJyb3IpDQo+Pj4+ICsgZ290byBlcnJf
ZnJlZTsNCj4+Pj4gKw0KPj4+PiArIGZvciAoaSA9IDA7IGkgPCBoYXB0aWNzLT5kc3AucHNlcV9z
aXplOyBpICs9IG51bV93b3Jkcykgew0KPj4+PiArIG9wZXJhdGlvbiA9IEZJRUxEX0dFVChQU0VR
X09QX01BU0ssIHdvcmRzW2ldKTsNCj4+Pj4gKyBzd2l0Y2ggKG9wZXJhdGlvbikgew0KPj4+PiAr
IGNhc2UgUFNFUV9PUF9FTkQ6DQo+Pj4+ICsgY2FzZSBQU0VRX09QX1dSSVRFX1VOTE9DSzoNCj4+
Pj4gKyBudW1fd29yZHMgPSBQU0VRX09QX0VORF9XT1JEUzsNCj4+Pj4gKyBicmVhazsNCj4+Pj4g
KyBjYXNlIFBTRVFfT1BfV1JJVEVfQUREUjg6DQo+Pj4+ICsgY2FzZSBQU0VRX09QX1dSSVRFX0gx
NjoNCj4+Pj4gKyBjYXNlIFBTRVFfT1BfV1JJVEVfTDE2Og0KPj4+PiArIG51bV93b3JkcyA9IFBT
RVFfT1BfV1JJVEVfWDE2X1dPUkRTOw0KPj4+PiArIGJyZWFrOw0KPj4+PiArIGNhc2UgUFNFUV9P
UF9XUklURV9GVUxMOg0KPj4+PiArIG51bV93b3JkcyA9IFBTRVFfT1BfV1JJVEVfRlVMTF9XT1JE
UzsNCj4+Pj4gKyBicmVhazsNCj4+Pj4gKyBkZWZhdWx0Og0KPj4+PiArIGVycm9yID0gLUVJTlZB
TDsNCj4+Pj4gKyBkZXZfZXJyKGhhcHRpY3MtPmRldiwgIlVuc3VwcG9ydGVkIG9wOiAldVxuIiwg
b3BlcmF0aW9uKTsNCj4+Pj4gKyBnb3RvIGVycl9mcmVlOw0KPj4+PiArIH0NCj4+Pj4gKw0KPj4+
PiArIG9wID0gZGV2bV9remFsbG9jKGhhcHRpY3MtPmRldiwgc2l6ZW9mKCpvcCksIEdGUF9LRVJO
RUwpOw0KPj4+PiArIGlmICghb3ApIHsNCj4+Pj4gKyBlcnJvciA9IC1FTk9NRU07DQo+Pj4+ICsg
Z290byBlcnJfZnJlZTsNCj4+Pj4gKyB9DQo+Pj4+ICsNCj4+Pj4gKyBvcC0+c2l6ZSA9IG51bV93
b3JkcyAqIHNpemVvZih1MzIpOw0KPj4+PiArIG1lbWNweShvcC0+d29yZHMsICZ3b3Jkc1tpXSwg
b3AtPnNpemUpOw0KPj4+PiArIG9wLT5vZmZzZXQgPSBpICogc2l6ZW9mKHUzMik7DQo+Pj4+ICsg
b3AtPm9wZXJhdGlvbiA9IG9wZXJhdGlvbjsNCj4+Pj4gKyBsaXN0X2FkZCgmb3AtPmxpc3QsICZo
YXB0aWNzLT5wc2VxX2hlYWQpOw0KPj4+PiArDQo+Pj4+ICsgaWYgKG9wZXJhdGlvbiA9PSBQU0VR
X09QX0VORCkNCj4+Pj4gKyBicmVhazsNCj4+Pj4gKyB9DQo+Pj4+ICsNCj4+Pj4gKyBpZiAob3Bl
cmF0aW9uICE9IFBTRVFfT1BfRU5EKQ0KPj4+PiArIGVycm9yID0gLUVOT0VOVDsNCj4+Pj4gKw0K
Pj4+PiArZXJyX2ZyZWU6DQo+Pj4+ICsga2ZyZWUod29yZHMpOw0KPj4+PiArDQo+Pj4+ICsgcmV0
dXJuIGVycm9yOw0KPj4+PiArfQ0KPj4+IA0KPj4+IE15IGZpcnN0IHRob3VnaHQgYXMgSSByZXZp
ZXdlZCB0aGlzIHBhdGNoIHdhcyB0aGF0IHRoaXMgYW5kIHRoZSBsb3QNCj4+PiBvZiBwc2VxLXJl
bGF0ZWQgZnVuY3Rpb25zIGFyZSBub3QgbmVjZXNzYXJpbHkgcmVsYXRlZCB0byBoYXB0aWNzLCBi
dXQNCj4+PiByYXRoZXIgQ1M0MEw1MCByZWdpc3RlciBhY2Nlc3MgYW5kIGhvdXNla2VlcGluZyBp
biBnZW5lcmFsLg0KPj4+IA0KPj4+IEkgc2VlbSB0byByZWNhbGwgb24gTDI1IGFuZCBmcmllbmRz
IHRoYXQgdGhlIHRoZSBwb3dlci1vbiBzZXF1ZW5jZXIsDQo+Pj4gaS5lLiBQU0VRLCBpcyBtb3Jl
IG9yIGxlc3MgYSAidGFwZSByZWNvcmRlciIgb2Ygc29ydHMgaW4gRFNQIG1lbW9yeQ0KPj4+IHRo
YXQgY2FuIHBsYXkgYmFjayBhIHNlcmllcyBvZiBhZGRyZXNzL2RhdGEgcGFpcnMgd2hlbiB0aGUg
ZGV2aWNlDQo+Pj4gY29tZXMgb3V0IG9mIGhpYmVybmF0aW9uLCBhbmQgYW55IHJlZ2lzdGVycyB3
cml0dGVuIGR1cmluZyBydW50aW1lDQo+Pj4gbXVzdCBhbHNvIGJlIG1pcnJvcmVkIHRvIHRoZSBQ
U0VRIGZvciAicGxheWJhY2siIGxhdGVyLiBJcyB0aGF0IHN0aWxsDQo+Pj4gdGhlIGNhc2UgaGVy
ZT8NCj4+PiANCj4+PiBBc3N1bWluZyBzbywgdGhlc2UgZnVuY3Rpb25zIHNlZW0gbGlrZSB0aGV5
IGJlbG9uZyBpbiB0aGUgTUZELCBub3QNCj4+PiBhbiBpbnB1dC1zcGVjaWZpYyBsaWJyYXJ5LCBi
ZWNhdXNlIHRoZXkgd2lsbCBwcmVzdW1hYmx5IGJlIHVzZWQgYnkNCj4+PiB0aGUgY29kZWMgZHJp
dmVyIGFzIHdlbGwsIHNpbmNlIHRoYXQgZHJpdmVyIHdpbGwgd3JpdGUgcmVnaXN0ZXJzIHRvDQo+
Pj4gc2V0IEJDTEsvTFJDSyByYXRpbywgZXRjLg0KPj4+IA0KPj4+IFRoZXJlZm9yZSwgSSB0aGlu
ayBpdCBtYWtlcyBtb3JlIHNlbnNlIGZvciB0aGVzZSBmdW5jdGlvbnMgdG8gbW92ZSB0bw0KPj4+
IHRoZSBNRkQsIHdoaWNoIGNhbiB0aGVuIGV4cG9ydCB0aGVtIGZvciB1c2UgYnkgdGhlIGlucHV0
L0ZGIGFuZCBjb2RlYw0KPj4+IGNoaWxkcmVuLg0KPj4gDQo+PiBJIHRoaW5rIHRoZSBwcm9ibGVt
IHdpdGggbW92aW5nIHRoZSB3cml0ZSBzZXF1ZW5jZXIgY29kZSB0byB0aGUgTUZEDQo+PiBkcml2
ZXIgaXMgdGhhdCBpdCB3b3VsZCBnbyB1bnVzZWQgaW4gYSBjb2RlYy1vbmx5IGVudmlyb25tZW50
LiBXZSBvbmx5DQo+PiBuZWVkIHRvIHdyaXRlIHRvIHRoZSBQU0VRIHdoZW4gd2Ugd2FudCB0byBt
YWludGFpbiByZWdpc3RlciBzZXR0aW5ncw0KPj4gdGhyb3VnaG91dCBoaWJlcm5hdGlvbiBjeWNs
ZXMsIGFuZCBpdCBpc27igJl0IHBvc3NpYmxlIHRvIGhpYmVybmF0ZSB3aGVuDQo+PiB0aGVyZSBp
cyBkYXRhIHN0cmVhbWluZyB0byB0aGUgZGV2aWNlLiBTbyB0aGUgUFNFUSB3aWxsIG5ldmVyIGJl
IHVzZWQNCj4+IGluIHRoZSBjb2RlYyBkcml2ZXIuDQo+IA0KPiBJIGFncmVlIHRoYXQgaW4gcHJh
Y3RpY2UsIHRoZSB3cml0ZSBzZXF1ZW5jZXIgd291bGQgdGVjaG5pY2FsbHkgZ28gdW51c2VkDQo+
IGluIGEgY29kZWMtb25seSBpbXBsZW1lbnRhdGlvbi4gSG93ZXZlciwgdGhhdCBpcyBiZWNhdXNl
IHRoZSBBU29DIGNvcmUNCj4gaGFwcGVucyB0byB3cml0ZSBhbGwgcGVydGluZW50IHJlZ2lzdGVy
cyBhaGVhZC1vZi10aW1lIGVhY2ggdGltZSBhIHN0cmVhbQ0KPiBzdGFydHMuIFRoYXQgaXMgYSBw
cm9wZXJ0eSBvZiB0aGUgQVNvQyBjb3JlIGFuZCBub3QgTDUwOyBteSBmZWVsaW5nIGlzIHRoYXQN
Cj4gdGhlIGRyaXZlciBzaG91bGQgbm90IGJlIHN0cnVjdHVyZWQgYmFzZWQgb24gd2hhdCBvbmUg
b2YgdGhlIHN1YnN5c3RlbXMNCj4gYXNzb2NpYXRlZCB3aXRoIGl0IGhhcHBlbnMgdG8gZG8sIGJ1
dCByYXRoZXIgdGhlIG5hdHVyZSBvZiB0aGUgaGFyZHdhcmUuDQo+IA0KPiBTb21lIHNwZWNpZmlj
IHJlYXNvbnMgSSB0aGluayB0aGUgTUZEIGlzIGEgYmV0dGVyIGhvbWUgZm9yIHRoZSBwc2VxIGNv
ZGU6DQo+IA0KPiAxLiBUaGUgd3JpdGUgc2VxdWVuY2VyIGlzIGEgaG91c2VrZWVwaW5nIGZ1bmN0
aW9uIGRlcml2ZWQgZnJvbSB0aGUgd2F5DQo+IHRoZSBoYXJkd2FyZSBpbXBsZW1lbnRzIGl0cyBw
b3dlciBtYW5hZ2VtZW50OyBpdCBkb2Vzbid0IGhhdmUgYW55dGhpbmcNCj4gdG8gZG8gd2l0aCBo
YXB0aWNzLiBNeSBvcGluaW9uIGlzIHRoYXQgZmFjaWxpdGllcyBzdXBwb3J0aW5nIGFwcGxpY2F0
aW9uLQ0KPiBhZ25vc3RpYyBmdW5jdGlvbnMgYmVsb25nIGluIHRoZSBNRkQsIGZvciBhbGwgY2hp
bGRyZW4gdG8gYWNjZXNzLCBldmVuDQo+IGlmIG9ubHkgb25lIGhhcHBlbnMgdG8gZG8gc28gdG9k
YXkuDQo+IA0KPiAyLiBPdmVyIHRoZSBjb3Vyc2Ugb2YgdGhlIElDJ3MgbGlmZSwgeW91IG1heSBi
ZSByZXF1aXJlZCB0byBhZGQgZXJyYXRhDQo+IHdyaXRlcyBhZnRlciB0aGUgSUMgaXMgdGFrZW4g
b3V0IG9mIHJlc2V0OyB0aGVzZSBwcmVzdW1hYmx5IHdvdWxkIG5lZWQNCj4gdG8gYmUgInNjaGVk
dWxlZCIgaW4gdGhlIHdyaXRlIHNlcXVlbmNlciBhcyB3ZWxsLiBUaGVzZSB3b3VsZG4ndCBtYWtl
DQo+IGxvZ2ljYWwgc2Vuc2UgdG8gYWRkIGluIHRoZSBpbnB1dCBkcml2ZXIsIGFuZCB0aGV5IHdv
dWxkIGJlIG1pc3NlZCBpbg0KPiB0aGUgdGhlb3JldGljYWwgY29kZWMtb25seSBjYXNlLg0KPiAN
Cj4gMy4gVGhpcyBkZXZpY2UgaGFzIGEgcHJvZ3JhbW1hYmxlIERTUDsgaXQgd291bGRuJ3QgYmUg
dW5oZWFyZCBvZiBmb3IgYQ0KPiBjdXN0b21lciB0byBhc2sgZm9yIGEgbmV3IGZ1bmN0aW9uIGRv
d24gdGhlIHJvYWQgdGhhdCBiZWdldHMgYSB0aGlyZA0KPiBjaGlsZCBkZXZpY2UuIFBlcmhhcHMg
YSBjdXN0b21lciBhc2tzIGZvciBhIHNwZWNpYWwgLndtZncgZmlsZSB0aGF0DQo+IHJlcHVycG9z
ZXMgdGhlIFNET1VUIHBpbiBhcyBhIFBXTSBvdXRwdXQgZm9yIGFuIExFRCwgYW5kIG5vdyB5b3Ug
bXVzdA0KPiBhZGQgYSBwd20gY2hpbGQuIFRoYXQncyBhIG1hZGUtdXAgZXhhbXBsZSBvZiBjb3Vy
c2UsIGJ1dCBpbiBnZW5lcmFsIHdlDQo+IHdhbnQgdG8gc3RydWN0dXJlIHRoaW5ncyBpbiBzdWNo
IGEgd2F5IHRoYXQgcmlwLXVwIGlzIG1pbmltYWwgaW4gY2FzZQ0KPiByZXF1aXJlbWVudHMgY2hh
bmdlIGluIHRoZSBmdXR1cmUuDQoNCkdyZWF0IHBvaW50cy4gSSBhZ3JlZSBub3cgdGhhdCB0aGUg
d3JpdGUgc2VxdWVuY2VyIGNvZGUgb3VnaHQgbm90IHRvIGdvIGluDQpjaXJydXNfaGFwdGljcy5j
LiBBZnRlciB0YWxraW5nIGl0IG92ZXIgd2l0aCB0aGUgaW50ZXJuYWwgdGVhbSwgSSBhbSBjb25z
aWRlcmluZw0KbW92aW5nIHRoZSB3cml0ZSBzZXF1ZW5jZXIgaW50ZXJmYWNlIHRvIGNzX2RzcC5j
LiBJdOKAmXMgYW4gYWxyZWFkeSBleGlzdGluZw0KbGlicmFyeSB3aXRoIGJvdGggQ2lycnVzIGhh
cHRpY3MgYW5kIGF1ZGlvIHVzZXJzLiBJdCBzZWVtcyB0byBkb2RnZSB5b3VyDQpjb25jZXJucyBh
Ym92ZSBhbmQgYXZvaWRzIGEgbmV3IGNvbW1vbiBsaWJyYXJ5IGFzIHlvdSBzdWdnZXN0ZWQNCmJl
bG93LiBEbyB5b3UgaGF2ZSBhbnkgY29uY2VybnMgb24gdGhpcyBhcHByb2FjaCBvdmVyIHB1dHRp
bmcgaXQgaW4gTUZEPw0KDQoNCj4+PiBUaGlzIGxlYXZlcyBjaXJydXNfaGFwdGljcy4qIHdpdGgg
b25seSBhIGZldyBmdW5jdGlvbnMgcmVsYXRlZCB0bw0KPj4+IHN0YXJ0aW5nIGFuZCBzdG9wcGlu
ZyB3b3JrLCB3aGljaCBzZWVtIHNwZWNpZmljIGVub3VnaCB0byBqdXN0IGxpdmUNCj4+PiBpbiBj
czQwbDUwLXZpYnJhLmMuIFByZXN1bWFibHkgbWFueSBvZiB0aG9zZSBjb3VsZCBiZSByZS11c2Vk
IGJ5DQo+Pj4gdGhlIEwzMCBkb3duIHRoZSByb2FkLCBidXQgaW4gdGhhdCBjYXNlIEkgdGhpbmsg
d2UnZCBiZSBsb29raW5nIHRvDQo+Pj4gYWN0dWFsbHkgcmUtdXNlIHRoZSBMNTAgZHJpdmVyIGFu
ZCBzaW1wbHkgYWRkIGEgY29tcGF0aWJsZSBzdHJpbmcNCj4+PiBmb3IgTDMwLg0KPj4+IA0KPj4+
IEkgcmVjYWxsIEwzMCBoYXMgc29tZSBvdmVyaGVhZCB0aGF0IEw1MCBkb2VzIG5vdCwgd2hpY2gg
bWF5IG1ha2UNCj4+PiBpdCBoYWlyeSBmb3IgY3M0MGw1MC12aWJyYS5jIHRvIHN1cHBvcnQgYm90
aC4gQnV0IGluIHRoYXQgY2FzZSwNCj4+PiB5b3UgY291bGQgYWx3YXlzIGZvcmsgYSBjczQwbDMw
LXZpYnJhLmMgd2l0aCBpdHMgb3duIGNvbXBhdGlibGUNCj4+PiBzdHJpbmcsIHRoZW4gaGF2ZSB0
aGUgTDUwIE1GRCBzZWxlY3RpdmVseSBsb2FkIHRoZSBjb3JyZWN0IGNoaWxkDQo+Pj4gYmFzZWQg
b24gZGV2aWNlIElELiBUbyBzdW1tYXJpemUsIHdlIHNob3VsZCBoYXZlOg0KPj4+IA0KPj4+ICog
ZHJpdmVycy9tZmQvY3M0MGw1MC1jb3JlLmM6IE1GRCBjZWxsIGRlZmluaXRpb24sIGRldmljZSBk
aXNjb3ZlcnksDQo+Pj4gSVJRIGhhbmRsaW5nLCBleHBvcnRlZCBQU0VRIGZ1bmN0aW9ucywgZXRj
Lg0KPj4+ICogc291bmQvc29jL2NvZGVjcy9jczQwbDUwLmM6IGNvZGVjIGRyaXZlciwgdXNlcyBQ
U0VRIGxpYnJhcnkgZnJvbQ0KPj4+IHRoZSBNRkQuDQo+Pj4gKiBkcml2ZXJzL2lucHV0L21pc2Mv
Y3M0MGw1MC12aWJyYS5jOiBpbnB1dC9GRiBkcml2ZXIsIHN0YXJ0L3N0b3ANCj4+PiB3b3JrLCBh
bHNvIHVzZXMgUFNFUSBsaWJyYXJ5IGZyb20gdGhlIE1GRC4NCj4+PiANCj4+PiBBbmQgZG93biB0
aGUgcm9hZCwgZGVwZW5kaW5nIG9uIGNvbXBsZXhpdHksIG1heWJlIHdlIGFsc28gaGF2ZToNCj4+
PiANCj4+PiAqIGRyaXZlcnMvaW5wdXQvbWlzYy9jczQwbDMwLXZpYnJhLmM6IGFub3RoZXIgaW5w
dXQvRkYgZHJpdmVyIHRoYXQNCj4+PiBpbmNsdWRlcyBvdGhlciBmdW5jdGlvbmFsaXR5IHRoYXQg
ZGlkbid0IHJlYWxseSBmaXQgaW4gY3M0MGw1MC12aWJyYS5jOw0KPj4+IGFsc28gdXNlcyBQU0VR
IGxpYnJhcnkgZnJvbSwgYW5kIGlzIGxvYWRlZCBieSwgdGhlIG9yaWdpbmFsIEw1MCBNRkQuDQo+
Pj4gSWYgdGhpcyBkcml2ZXIgZHVwbGljYXRlcyBzbWFsbCBiaXRzIG9mIGNzNDBsNTAtdmlicmEu
YywgaXQncyBub3QgdGhlDQo+Pj4gZW5kIG9mIHRoZSB3b3JsZC4NCj4+PiANCj4+PiBBbGwgb2Yg
dGhlc2UgZmlsZXMgd291bGQgI2luY2x1ZGUgaW5jbHVkZS9saW51eC9tZmQvY3M0MGw1MC5oLiBB
bmQNCj4+PiBmaW5hbGx5LCBjaXJydXNfaGFwdGljcy4qIHNpbXBseSBnbyBhd2F5LiBTYW1lIGlk
ZWEsIGp1c3Qgc2xpZ2h0bHkNCj4+PiBtb3JlIHNjYWxhYmxlLCBhbmQgY2xvc2VyIHRvIGNvbW1v
biBkZXNpZ24gcGF0dGVybnMuDQo+PiANCj4+IA0KPj4gSSB1bmRlcnN0YW5kIHRoYXQgaXQgaXMg
YSBjb21tb24gZGVzaWduIHBhdHRlcm4gdG8gc2VsZWN0aXZlbHkgbG9hZA0KPj4gZGV2aWNlcyBm
cm9tIHRoZSBNRkQgZHJpdmVyLiBJZiBJIGNvdWxkIHN1bW1hcml6ZSBteSB0aG91Z2h0cyBvbiB3
aHkNCj4+IHRoYXQgd291bGQgbm90IGJlIGZpdHRpbmcgaGVyZSwgaXTigJlzIHRoYXQgdGhlIEwy
NiBhbmQgTDUwIHNoYXJlIGEgdG9uIG9mDQo+PiBpbnB1dCBGRiByZWxhdGVkIHdvcmssIGFuZCBu
b3QgZW5vdWdoIOKAnE1GRCBjb3Jl4oCdIHJlbGF0ZWQgd29yay4NCj4+IEJldHdlZW4gZXJyYXRh
IGRpZmZlcmVuY2VzLCBwb3dlciBzdXBwbHkgY29uZmlndXJhdGlvbnMsIHJlZ21hcA0KPj4gY29u
ZmlndXJhdGlvbnMsIGludGVycnVwdCByZWdpc3RlciBkaWZmZXJlbmNlcywgaXQgd291bGQgc2Vl
bSB0byBtYWtlIGZvcg0KPj4gYSB2ZXJ5IGF3a3dhcmQsIHNjcmFtYmxlZCBNRkQgZHJpdmVyLiBN
b3Jlb3ZlciwgSSB0aGluayBJIHdpbGwgYmUgbW92aW5nDQo+PiBmaXJtd2FyZSBkb3dubG9hZCB0
byB0aGUgTUZEIGRyaXZlciwgYW5kIHRoYXQgYWxvbmUgY29uc3RpdHV0ZXMgYQ0KPj4gc2lnbmlm
aWNhbnQgaW5jb21wYXRpYmlsaXR5IGJlY2F1c2UgZmlybXdhcmUgZG93bmxvYWRpbmcgaXMgY29t
cHVsc29yeQ0KPj4gb24gTDI2LCBub3Qgc28gb24gTDUwLg0KPj4gDQo+PiBPbiB0aGUgb3RoZXIg
aGFuZCwgSSB3YW50IHRvIGVtcGhhc2l6ZSB0aGUgYW1vdW50IHRoYXQgTDI2IGFuZA0KPj4gTDUw
IHNoYXJlIHdoZW4gaXQgY29tZXMgdG8gdGhlIElucHV0IEZGIGNhbGxiYWNrcy4gVGhlIHdvcmtl
cg0KPj4gZnVuY3Rpb25zIGluIGNpcnJ1c19oYXB0aWNzLmMgYXJlIGJhcmUtYm9uZXMgZm9yIHRo
aXMgZmlyc3QNCj4+IHN1Ym1pc3Npb24sIGJ1dCB3ZXJlIGRlc2lnbmVkIHRvIGJlIHRvdGFsbHkg
Z2VuZXJpYyBhbmQgc2NhbGFibGUgdG8NCj4+IHRoZSBuZWVkcyBvZiBMMjYgYW5kIGFsbCBmdXR1
cmUgQ2lycnVzIGlucHV0IGRyaXZlcnMuIFdoaWxlIGl0IG1pZ2h0IGFwcGVhcg0KPj4gdG9vIHNw
ZWNpZmljIGZvciBMMjYsIGV2ZXJ5dGhpbmcgY3VycmVudGx5IGluIGNpcnJ1c19oYXB0aWNzIGlz
IHVzYWJsZSBieQ0KPj4gTDI2IGFzLWlzLg0KPj4gDQo+PiBGb3IgdGhlIGFib3ZlIHJlYXNvbnMg
SSBmYXZvciB0aGUgY3VycmVudCBhcHByb2FjaC4NCj4+IA0KPiANCj4gTGlrZXdpc2UsIGlmIHRo
ZSBpbnB1dC1yZWxhdGVkIGZ1bmN0aW9ucyBvZiBMMjYgYW5kIEw1MCBhcmUgbmVhcmx5IGlkZW50
aWNhbCwNCj4gdGhlbiBpdCdzIGFsc28gcGVyZmVjdGx5IGFjY2VwdGFibGUgZm9yIGJvdGggZHJp
dmVycy9tZmQvY3M0MGwyNi5jIGFuZA0KPiBkcml2ZXJzL21mZC9jczQwbDUwLmMgdG8gbG9hZCBk
cml2ZXJzL2lucHV0L21pc2MvY3M0MGw1MC12aWJyYS5jLCB3aGljaA0KPiBzdXBwb3J0cyBib3Ro
IEwyNiBhbmQgTDUwIGhhcHRpY3MtcmVsYXRlZCBmdW5jdGlvbnMuIFlvdSdyZSBhbHJlYWR5IGRv
aW5nDQo+IHNvbWV0aGluZyBzaW1pbGFyLCBidXQgSSBkaXNhZ3JlZSBvbiB0aGUgZm9sbG93aW5n
Og0KPiANCj4gMS4gUmF0aGVyIHRoYW4gaGF2ZSBhIGxpYnJhcnkgcmVmZXJlbmNlZCBieSB0d28g
ZHJpdmVycyB0aGF0IHN1cHBvcnQgY2hpbGRyZW4NCj4gd2hpY2ggYXJlIGxhcmdlbHkgdGhlIHNh
bWUgaW4gYSBsb2djaWFsIHNlbnNlLCBqdXN0IGhhdmUgYSBzaW5nbGUgZHJpdmVyIHRoYXQNCj4g
c3VwcG9ydHMgdHdvIGNoaWxkcmVuLg0KDQpZb3VyIHBvaW50IGhlcmUgaXMgY2xlYXIgYW5kIG1h
a2VzIHNlbnNlIHRvIG1lLCBlc3BlY2lhbGx5IG5vdyB3aXRoIHRoZSB3cml0ZQ0Kc2VxdWVuY2Vy
IGludGVyZmFjZSBtb3Zpbmcgb3V0LiBBZnRlciBjb25zaWRlcmluZyB0aGUgc2ltaWxhcml0aWVz
IGFuZA0KZGlmZmVyZW5jZXMgY2xvc2VyLCBJIGFtIHN0aWxsIGEgbGl0dGxlIHdhcnkuIE1heWJl
IHlvdSBjYW4gaGVscCBtZSB3aXRoIHRoZXNlDQpjb25jZXJuczoNCg0KMS4gSW4gdGhlIGN1cnJl
bnQgaW1wbGVtZW50YXRpb24sIGRyaXZlcnMgd291bGQgYmUgYWJsZSB0byBjb25maWd1cmUgdGhl
aXIgb3duDQppbnB1dCBGRiBjYXBhYmlsaXRpZXMsIGFuZCBzZWxlY3RpdmVseSByZWdpc3RlciB0
byBpbnB1dCBGRiBjYWxsYmFja3MuIEw1MCBkb2VzDQpub3QgcmVnaXN0ZXIgdG8gdGhlIHNldF9n
YWluIGNhbGxiYWNrLCB3aGVyZWFzIEwyNiBkb2VzLiBJIGFudGljaXBhdGUgZnV0dXJlDQpkaXZl
cmdlbmNlcywgc3VjaCBhcyBvbmUgZHJpdmVyIHN1cHBvcnRpbmcgZGlmZmVyZW50IGVmZmVjdCB0
eXBlcyAoc2VlDQp0aGUgTDUwLXNwZWNpZmljIGVycm9yIGNoZWNraW5nIGluIGNzNDBsNTBfYWRk
KCkpLiBUaGlzIHdvdWxkIGJlIGV4YWNlcmJhdGVkDQpieSBhbnkgZnV0dXJlIGFkZGl0aW9uYWwg
Y2hpbGRyZW4uDQoNCjIuIFRoaXMgbWF5IGJlIG15IGxhY2sgb2YgaW1hZ2luYXRpb24sIGJ1dCBp
biB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBpdA0Kc2VlbXMgbXVjaCBlYXNpZXIgdG8gZGV2
ZWxvcCBuZXcgaGFwdGljIGZlYXR1cmVzIHRoYXQgZG9u4oCZdCBhcHBseSB0byBhbGwgdGhlDQp1
c2VycyBvZiB0aGUgbGlicmFyeS4gT25lIHdvdWxkIHNpbXBseSB3cmFwIHRoZSBmZWF0dXJlIGlu
IGEgYm9vbGVhbiBpbg0KY2lycnVzX2hhcHRpY3MsIHdoaWNoIGNsaWVudHMgY2FuIHRha2Ugb3Ig
bGVhdmUuIEluIHRoZSBvbmUgZHJpdmVyDQppbXBsZW1lbnRhdGlvbiwgaXQgc2VlbXMgeW91IHdv
dWxkIGhhdmUgdG8gZmluZCBzb21lIGNsZXZlciwgZ2VuZXJhbGl6ZWQNCndheSBvZiBkZXRlcm1p
bmluZyB3aGV0aGVyIG9yIG5vdCBhIGZlYXR1cmUgY2FuIGJlIHVzZWQuIFRoaXMgd291bGQgYWxz
bw0Kc2VlbSB0byBiZSBleGFjZXJiYXRlZCBieSBhbnkgZnV0dXJlIGFkZGl0aW9uYWwgY2hpbGRy
ZW4uDQoNCjMuIFRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uIHByb3ZpZGVzIGZvciB0aGUgaW5k
aXZpZHVhbCBkcml2ZXJzIHRvIHNldHVwDQp0aGUgaGFwdGljcyBpbnRlcmZhY2UgaW4gd2hhdGV2
ZXIgd2F5IHBlY3VsaWFyIHRvIHRoYXQgZGV2aWNlLCB3aGV0aGVyIHRoYXQNCmludGVyZmFjZSBi
ZSBzdGF0aWMgKEw1MCkgb3IgZGVwZW5kZW50IG9uIHRoZSBsb2FkZWQgZmlybXdhcmUgKEwyNiku
DQoNClNpbmNlIEkgYW0gbW92aW5nIGFyb3VuZCBhIGxvdCBvZiBjb2RlIGluIGFuZCBvdXQgb2Yg
Ym90aCAtdmlicmEuYyBhbmQgdGhlDQpsaWJyYXJ5IGZvciB0aGUgbmV4dCB2ZXJzaW9uLCBJIHRo
aW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwgZm9yIG1lIHRvIHdhaXQgdW50aWwgdGhlDQpuZXh0IHZl
cnNpb24gaXMgc3VibWl0dGVkIHRvIGRlY2lkZSBvbiB0aGlzLiBXb3VsZCB0aGF0IGJlIGFjY2Vw
dGFibGU/DQoNCj4gDQo+IA0KPj4gDQo+Pj4+ICtzdGF0aWMgdm9pZCBjc19oYXBfdmliZV9zdG9w
X3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+Pj4+ICt7DQo+Pj4+ICsgc3RydWN0
IGNzX2hhcCAqaGFwdGljcyA9IGNvbnRhaW5lcl9vZih3b3JrLCBzdHJ1Y3QgY3NfaGFwLA0KPj4+
PiArICAgICAgIHZpYmVfc3RvcF93b3JrKTsNCj4+Pj4gKyBpbnQgZXJyb3I7DQo+Pj4+ICsNCj4+
Pj4gKyBpZiAoaGFwdGljcy0+cnVudGltZV9wbSkgew0KPj4+PiArIGVycm9yID0gcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldChoYXB0aWNzLT5kZXYpOw0KPj4+PiArIGlmIChlcnJvciA8IDApIHsN
Cj4+Pj4gKyBoYXB0aWNzLT5zdG9wX2Vycm9yID0gZXJyb3I7DQo+Pj4+ICsgcmV0dXJuOw0KPj4+
PiArIH0NCj4+Pj4gKyB9DQo+Pj4+ICsNCj4+Pj4gKyBtdXRleF9sb2NrKCZoYXB0aWNzLT5sb2Nr
KTsNCj4+Pj4gKyBlcnJvciA9IHJlZ21hcF93cml0ZShoYXB0aWNzLT5yZWdtYXAsIGhhcHRpY3Mt
PmRzcC5tYWlsYm94X3JlZywNCj4+Pj4gKyAgICAgIGhhcHRpY3MtPmRzcC5zdG9wX2NtZCk7DQo+
Pj4+ICsgbXV0ZXhfdW5sb2NrKCZoYXB0aWNzLT5sb2NrKTsNCj4+Pj4gKw0KPj4+PiArIGlmICho
YXB0aWNzLT5ydW50aW1lX3BtKSB7DQo+Pj4+ICsgcG1fcnVudGltZV9tYXJrX2xhc3RfYnVzeSho
YXB0aWNzLT5kZXYpOw0KPj4+PiArIHBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGhhcHRpY3Mt
PmRldik7DQo+Pj4+ICsgfQ0KPj4+PiArDQo+Pj4+ICsgaGFwdGljcy0+c3RvcF9lcnJvciA9IGVy
cm9yOw0KPj4+IA0KPj4+IFRoaXMgc2VlbXMgbGlrZSBhbm90aGVyIGFyZ3VtZW50IGZvciBub3Qg
c2VwYXJhdGluZyB0aGUgaW5wdXQvRkYgY2hpbGQNCj4+PiBmcm9tIHRoZSBtZWF0IG9mIHRoZSBk
cml2ZXI7IGl0IGp1c3Qgc2VlbXMgbWVzc3kgdG8gcGFzcyBhcm91bmQgZXJyb3INCj4+PiBjb2Rl
cyB3aXRoaW4gYSBkcml2ZXIncyBwcml2YXRlIGRhdGEgbGlrZSB0aGlzLg0KPj4gDQo+PiBJIHJl
bW92ZWQgdGhlIHN0YXJ0X2Vycm9yIGFuZCBzdG9wX2Vycm9yIG1lbWJlcnMuIEhvd2V2ZXIgSSB0
aGluayB0aGUNCj4+IGVyYXNlX2Vycm9yIGFuZCBhZGRfZXJyb3IgbmVlZCB0byBzdGF5LiBJIHRo
aW5rIHRoaXMgaXMgbW9yZSBvZiBhIHN5bXB0b20NCj4+IG9mIHRoZSBJbnB1dCBGRiBsYXllciBy
ZXF1aXJpbmcgZXJyb3IgcmVwb3J0aW5nIGFuZCBoYXZpbmcgdG8gdXNlIHdvcmtxdWV1ZXMNCj4+
IGZvciB0aG9zZSBJbnB1dCBGRiBjYWxsYmFja3MsIHRoYW4gaXQgaXMgdG8gZG8gd2l0aCB0aGUg
c2VwYXJhdGlvbiBvZiB0aGVzZQ0KPj4gZnVuY3Rpb25zIGZyb20gdGhlIGRyaXZlci4gUG9pbnQg
YmVpbmcsIGV2ZW4gaWYgdGhlc2Ugd2VyZSBtb3ZlZCwgd2Ugd291bGQgc3RpbGwNCj4+IG5lZWQg
dGhlc2UgKl9lcnJvciBtZW1iZXJzLiBMZXQgbWUga25vdyBpZiBJIHVuZGVyc3Rvb2QgeW91IHJp
Z2h0IGhlcmUuDQo+IA0KPiBTdXJlLCBidXQgd2h5IGRvIGFkZGluZyBhbmQgcmVtb3Zpbmcgd2F2
ZWZvcm1zIHJlcXVpcmUgd29ya3F1ZXVlcz8gVGhlIERBNzI4MA0KPiBkcml2ZXIgZG9lc24ndCBk
byB0aGlzOyB3aGF0IGlzIGRpZmZlcmVudCBpbiB0aGlzIGNhc2U/IChUaGF0J3MgYSBnZW51aW5l
DQo+IHF1ZXN0aW9uLCBub3QgYW4gYXNzZXJ0aW9uIHRoYXQgd2hhdCB5b3UgaGF2ZSBpcyB3cm9u
ZywgYWx0aG91Z2ggaXQgc2VlbXMNCj4gdW5pcXVlIGJhc2VkIG9uIG15IGxpbWl0ZWQgc2VhcmNo
KS4NCg0KVGhlIHJlYXNvbiB3aHkgd2UgaGF2ZSB3b3JrZXIgaXRlbXMgZm9yIHVwbG9hZCBhbmQg
ZXJhc2UgaW5wdXQgRkYgY2FsbGJhY2tzIGlzDQpiZWNhdXNlIHdlIG5lZWQgdG8gZW5zdXJlIHRo
ZWlyIG9yZGVyaW5nIHdpdGggcGxheWJhY2sgd29ya2VyIGl0ZW1zLCBhbmQgd2UgbmVlZA0KdGhv
c2Ugd29ya2VyIGl0ZW1zIGJlY2F1c2UgdGhlIElucHV0IEZGIGxheWVyIGNhbGxzIHBsYXliYWNr
cyBpbiBhdG9taWMgY29udGV4dC4NCg0KQmVzdCwNCkphbWVzDQoNCg0K

