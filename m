Return-Path: <linux-input+bounces-11250-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB57A707A2
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9F6F7A2871
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 17:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683CF25E806;
	Tue, 25 Mar 2025 17:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="bE2B3gk4"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011028.outbound.protection.outlook.com [52.103.67.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264B259C9A;
	Tue, 25 Mar 2025 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922318; cv=fail; b=QdV78rYqu92MQWeBh/L+TbL6Esg5HEHpo6y2ihRXQusm+Z9wx1kn/Gi3xeysBGHRavdYHwz2n9W31af1ZStXEPyO33fVsQ38dWPJ5/KVFraol3WLSWrIQIPg0AUivSpYw25cmZSeWfNI3/9Uv0nWufZ249pym+uEAGHyRh2Klo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922318; c=relaxed/simple;
	bh=nXEWSQ9KD/ip0myXbN1Bg7kDtF3BANPVvfI5RovNB/s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dMQur/QFhm5/ciy80voD8ZHofKmSlQG+TtLUSyGRoAIl1dhpDCjaF+U6/IQw7nQUaCXRF3C1/jFccFeO4jvN3WQcQXashavuruc9p/E9WwRdrOqfQCqDCELNkcuEqEK/ZiSVK39Zu6+0yQoTfMnKjAGA+fyubydJ/fFdpZiDFH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=bE2B3gk4; arc=fail smtp.client-ip=52.103.67.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CS/6uyF9JICpvD9BldRxSW0HzVuc+egkZpdKYZWt8xPh1dfSpB/NWPfIRGrTZFtoJd8x8EBMz6DbKzM+wL/BxYSPCFeAjAG9KoLhhXHOwg+TBRCZXrXC/e5Kagf5iWqk23Fr0O3sBd8giNG/LW1ROASb4K/pcdbjL0oCeTKKDOPGLBGppnJba47tDYyxWDIwtkcpVRfzlX1hI0jaE7QgEA+RY0oh0Fufi2vZ7uqPJklPotsqZ1/vpAStKvbSCZY8+rDCE7nqi8uASG6w2LSI6l9OnhEaNwrPYW2VVJF+OF3npqMW0/+UYZKZMT/T1Zd+awMqBlkP6n34/7rnFvwc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXEWSQ9KD/ip0myXbN1Bg7kDtF3BANPVvfI5RovNB/s=;
 b=Z46fgplO1uUL3KLc+87dtmbtsCBc4/Xx+VfnjjPZCBNOd0WNNToX56ex3nRp++d4tW728L4+vcjfddVzQYfaMPIwztshls1oeczS/BPCEQzXuGi2OVlGVah50Fb3SVPK1ebiltVfdPhEyg7K0zfU1RuPJmJdWTOxPju7ouw+eLGEAVNqAfRJ7JI+vD/ckvy62RJ/NahMAf1rwK+F2Ra2WwNDlfMQuA38o8T9KIaVB/xvrTDdf9oyYfKUve5M9GgXfWiwezHzQiWhArlwuIyk/7jAceIKO4cI1WcEizZPyE2Du+K4fE1gfVWgI+eyU6zaVAGCaHajZCkmUiMZNtiSfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXEWSQ9KD/ip0myXbN1Bg7kDtF3BANPVvfI5RovNB/s=;
 b=bE2B3gk4q6sy3LSRZ2y5JPONfFklXdgTZdb4uBuYwEtPNwlTQKK5PtAkLENGDEkYM0vPqv+e3ODOJHDeZ7RIDOhwqpJ8Y3MCksRYQLmglt/84m4jPIsNbUY531F2MxO14+O+PckclGwVMj3HM7HcQO99uyIoD4bRRPJbG+TgmmT6EpJJ9hvpCVqsPbvKxtJyHSecEelvb/5K+FOAjZoSbCBrvWt1shmUnV8zkK6KGZoXN0XRHsQA3+PJ1xH/uAb11fZcCg6YdKu0/VTyH8RYPhDZN6IWL0Jhbkm7o0dSd4acpprOS8WQor00dvtxA0rQV3S6uICZbOr0KzssCnXRGQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB8766.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:113::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:05:10 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 17:05:10 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <adityagarg1208@gmail.com>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "admin@kodeit.net"
	<admin@kodeit.net>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"jkosina@suse.com" <jkosina@suse.com>, "kekrby@gmail.com" <kekrby@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"orlandoch.dev@gmail.com" <orlandoch.dev@gmail.com>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch
 Bar
Thread-Topic: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Thread-Index: AQHbnaejyRTa7AKUGEm3B1dg6BjKzLOEFMKA
Date: Tue, 25 Mar 2025 17:05:10 +0000
Message-ID:
 <PN3PR01MB95970CFD8025C832BE6C6DDDB8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <02F14282-87DB-4EF8-80EA-3D0887F3C30E@gmail.com>
In-Reply-To: <02F14282-87DB-4EF8-80EA-3D0887F3C30E@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB8766:EE_
x-ms-office365-filtering-correlation-id: 9d36b138-3837-428e-35fc-08dd6bbf336e
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|12121999004|15080799006|6072599003|8062599003|19110799003|7092599003|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?NnNQUWNiMFh3N0k0RHZKMFpSVEhLM1diNUExOFJtcWtVaGdZVGV3TDRGK21v?=
 =?utf-8?B?RHVLTExLSWs0VGRpSXA0Ly9RTkJ3THVPVnpTNnloblo2YmdjTzhBT3FLcFR2?=
 =?utf-8?B?QTd5elF1Mmd3VS9SWVI4ZnQ3cTk0S1JDZjRiZGVRVm1pM2w4NndHTFFoLzR3?=
 =?utf-8?B?NGdwZE03a2ZLSHRzTG1tc3Y0b2lmMVpyb3I0TVVMK25wZDE1aWZCNVViUWla?=
 =?utf-8?B?dGFiTENHYzB2dStidFNnbDJYenBHckdEcXBOVlRMRXRDN3lBa1BERXVjdWRp?=
 =?utf-8?B?SkxqQVBTRjJ4V1BpUis5MjFCM3hIWGpHNEhETEdKUVdpbnI4ekQ5YVVTRVNS?=
 =?utf-8?B?QnN1RnR2Tms5ZDRGQ3V4NnNpUnRpUW1PN0htckhiWHVHTGxZcXBDZHVyWHYr?=
 =?utf-8?B?bldkK1kwZUhEMmhXWDFCS2htVkREZ0V2eXBWS0I4S0VxT0RIam9WL2dld0Fu?=
 =?utf-8?B?YjR4ZDFPeVBFS3JFaXp0VDFLUlY0MGxjUUx0d0UyTVpnZnlQdHlJc09QOWJx?=
 =?utf-8?B?S1FNRVI3S0tuWmQxa3JTWlArUGJ4amFpOVo5bXUvdGNLejUwRDdvaWNlTUti?=
 =?utf-8?B?QlI4WmFqNUExazJsMUZoNjZOaHVmeWdBSDI0dm44VHF4ZlpWVUhDNGNPbFpj?=
 =?utf-8?B?bHkvNlBEMjRoME4zNG50cjBKbmZEcEpmb1NUdnJOd2ZnK3ZxalFlTGVGVGN2?=
 =?utf-8?B?Q1Z0RlhzUDVyU0c4T1JoS1BHUXRQMDBieTUvRDl5eGFBZnNLbjkvaXRpN3dz?=
 =?utf-8?B?VEhsQUpXSGRiUWhvS1RTZ2FDSHQ3Ukdycjl5eDgvQ0xUc01vMW55QnlNYy9B?=
 =?utf-8?B?VEh6Yy85V0xRMWsvUFZNd01pS01WVlBpVThaaEFFMnFQTU1ubG5valJ1Uk1G?=
 =?utf-8?B?eVQrU21HNTUrSFNCSnVZYnpCRFFwaWdlcTAxT1ZpVi9LRlc3YnNmUHdtTkRn?=
 =?utf-8?B?MDRSL3FTUkVyQzBIV0FOY2ppbCt3WTFjWUphdmJPSlVGek1vS1Y1TnQyWmc2?=
 =?utf-8?B?dUxxNGx2UzFnOFozMjIyang4djJiQURFSUxEbkZNU0d1Z3l5UHV4aXhwcEJX?=
 =?utf-8?B?ejI3d1hiNDRTQVVITWZMU3RYRU5SSFV2cGVLd2o3SU1pL3c1VmprZHljVHBP?=
 =?utf-8?B?OGhkb1J0alRKbng0QkNOWVJ1bmNVaEg0aWRqcG9tSlRRNFRmS3lVTHltVjVa?=
 =?utf-8?B?ck53Rjh4b1l6WkF6UmxnVTR0MXE0ZEpPTzE1dldLUHcrQzZnY285d3RyQWk5?=
 =?utf-8?B?Z2ZlcU9NcWRyQzBRY0VuQURrZjdmRkhMK05IUTZScjdCcjdNSGtoTC9pVjd5?=
 =?utf-8?B?d2FTNWx1czFZZTAzbW8wMFFRZlhRY0R5MzExOFRiMmNST092VDRyQ0xsL3dm?=
 =?utf-8?B?alVmQUZtYmlQb0ZwbnVENzdZbEZ6VWdUK3Y5aHE5ZmFtU2hZRmRYMkdobXhG?=
 =?utf-8?B?Nk1DT2s3S2l3YU1UdS84dVdOaGozRGIwQXlGbFZybFhneGlTK0Y2L2lsaUoy?=
 =?utf-8?B?ZnBhYjdtRm1YYitRMmdCa3J4S2hCY3dkNFZ1QTJYUENWWlV6ejh4MW1Oellv?=
 =?utf-8?Q?TIvfnGLMCJK1V9fuW4Y2lYfAs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WmNiMXBuR3dGYXdRbmx5bm5UZUxnaTFxd3c3YVFFcXRNVi9FMlcxaExCcHQx?=
 =?utf-8?B?a1V4ZEFNdU9FMFh2a280UHJwQjAvRTNCWk90anNZdFJiMUFUa0FSVkhLY1Nm?=
 =?utf-8?B?Nnd5M085V0E2V0N0c2xLZmJPbFNzbkdINi9ONXFNUUhzTzM2Mjg2Mk9KTjZB?=
 =?utf-8?B?T3BYTTdLUXJzSzJqK001dTRVcTlqeUNVUHRCV1ArM3dUbUd2Ukk4YURyc1JO?=
 =?utf-8?B?bmJpd0JBdGlKcitiYlR2NGJBTEc1SVhiSGtGbmUyNi9hMmhBWk5peDN4cyth?=
 =?utf-8?B?eXJIL2F3YkExOGIxOTF3ektDTnJnNHh1K0ZBSE5UQlczT0hxSXRKSUZndFA1?=
 =?utf-8?B?TWR0L0YyV3BBR2d2c3RHOHBab3hqaUtwWDZpNGhHU2J1ODZ1RzBtQ2VJMFVJ?=
 =?utf-8?B?aGtBKyt3N3VZTkVjVnZ6QmZTRjRCcTVucGk4d1ZYNzBTM0dJYm56c0lTOFNp?=
 =?utf-8?B?dFVTM2pkQmdnVGNsY1RoR0JscXpEdElLU0d4ZHdhVktTQlF1QklndzZ1a0Fu?=
 =?utf-8?B?eVI4aUpqQXB1dGV5RjFKU1pzOWlyeWtiZVF3dEgyZ3hoczRWblMwS3lqeFpx?=
 =?utf-8?B?THhmckdPSnlERXhxZFV0NXlEM0VEaVRaaVFuNUZqc1pkQmlKSEN1VnlxQ0VM?=
 =?utf-8?B?WjJadk5Kd3pxZkxGZzZGYkVHKy9KRHRzM2FKRXNCRE1IVnRsMlBJTWcvUUdv?=
 =?utf-8?B?YmtOQWdrR3JMendPTko1VmV2VU11T29NdlhmdTJ4dHdya1ZnS1pGZ2ZRdTBy?=
 =?utf-8?B?bllyRDIvREUvNmlqblFDVFBIdzgwSkFoSkYzZ2NXV3pWL1RUNHFKNmV0WEF1?=
 =?utf-8?B?ditLOGpmaFBkVjYrc280SjY1NFNad2xYN3RQVkxaclI0RnlHOUZJcVdJWmoz?=
 =?utf-8?B?V1NnVTMwRXVhWUpLWWc5SE5Cc0V3SWdPL3M4Qi9ZU21hdlhZM1BBMlI1elFx?=
 =?utf-8?B?S1J0TDNYRmdzVXNYcFZ3ejlqRWFtUGFFQTBLT2VVSUpGRUhsaXpaQnM3TEpz?=
 =?utf-8?B?NnVyNjdTUnh4SkIrL0ZZdEVZcWhTZkk0VGlkQlBkTEo5WWk3LzZwd0I3a2Er?=
 =?utf-8?B?Q1JlTjY2QkRsWElvOTVGeGxqMWlaNTNZNG9ldVlwUjFOTTMyTUxqRTNxZVdX?=
 =?utf-8?B?WkFtTlJ3ZVoxYlhUUHc5QWtuYWVwS1pnbTZhN2lyMmlTeCt6d1hReXNvQU1v?=
 =?utf-8?B?amZVRFZEbFZKSGR0TGphUGM5SzlxbTVRZFdXeFJqR0RGTE00VkswRk81RW1M?=
 =?utf-8?B?YlF2RWxSLytmckQwK0xmMWdPN0dhOTBRelBiTVEyZHVlcVVaUy81WVhjdHR3?=
 =?utf-8?B?MEVCbG4zT1ZCMVhXQitXTmk5MHF5eWZ1czFOVHhEc2Q3cWZUbDNaS214V3R6?=
 =?utf-8?B?UTIwNjBMQkpJdUV5cGhRZVJRNFRGVFJaODRWRVVCZURjd1ZNQTFFWnN5T3NJ?=
 =?utf-8?B?YnJWR0tDcXVoNnErcll2WG5mZkRZb094YTd1RFpHQTQxdGV0cGNMcEFDOFJn?=
 =?utf-8?B?NlhzZFJWbHRxSEVRMWpnbmlxc2o5TEFZU3gvUld0bTVqcTNwa0l5Y1Fld2VU?=
 =?utf-8?B?cWlwaDd0dlpBdkI5WkhqRVdtY3UzSXVZM2Y2VUk1cUR1NFpnR3JPMGxvSEJh?=
 =?utf-8?B?WmROckJ1MWpmS09lVS9qL0wwakJtYWhMcXpUN2YwWUhmSEdCbDRoZnc4M0Vp?=
 =?utf-8?B?azhaRlJaTUdUYUF0M3N6MGpZR0NqMmJKZWZhVmRvYlMxUGV6YTFRY2tBQ2t1?=
 =?utf-8?Q?+8jt4ffvgUWMoDEpwc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID:
 <A8A68A710AE3FC46A44452970E52323E@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d36b138-3837-428e-35fc-08dd6bbf336e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 17:05:10.1725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB8766

RldJVywgdXNpbmcgbXkgYWx0IGdtYWlsIGFjY291bnQsIHNpbmNlIG91dGxvb2sgaXMgbm90IHNl
bmRpbmcgbWUgYWxsIHRoZSBtYWlscyBmb3Igc29tZSByZWFzb24uDQoNCj4gT24gMjUgTWFyIDIw
MjUsIGF0IDEwOjMy4oCvUE0sIEFkaXR5YSBHYXJnIDxhZGl0eWFnYXJnMTIwOEBnbWFpbC5jb20+
IHdyb3RlOg0KPiANCj4g77u/WWVzIEkgY2FuIG1vdmUgaGlkX2ZpbmRfZmllbGQgdG8gdGhlIG9y
aWdpbmFsIGxvY2F0aW9uIGFzIHdlbGwuIEJ1dCwgSSB3b3VsZCBub3Qgd2FudCB0byBkZXZtX2t6
YWxsb2MgYXMgd2VsbCB1bm5lY2Vzc2FyaWx5IGlmIHRoZSB0b3VjaGJhciBpcyBpbiB0aGUgYmFz
aWMgbW9kZSBpbnN0ZWFkIG9mIGRybSBtb2RlIHdoaWNoIHdpbGwgY2F1c2UgdGhpcyAtRU5PREVW
IHRvIGJlIGV4ZWN1dGVkIHJpZ2h0Pw0K

