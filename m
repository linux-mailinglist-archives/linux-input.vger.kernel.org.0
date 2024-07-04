Return-Path: <linux-input+bounces-4844-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FD8927265
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4E351C24091
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 08:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C18E1ABC28;
	Thu,  4 Jul 2024 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="DHFGVy6C"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2042.outbound.protection.outlook.com [40.92.103.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5501AB903;
	Thu,  4 Jul 2024 08:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083485; cv=fail; b=XZdSDk3e6K1GB66L88DwFKVGGvsiQ90bIP4ACX/cpPzkvwFQxrqio5eKX/BA4sPBz6pNSCQaNZ2V9YtXTF/PypsTw2FOap6kJkoKZ+6+fTaCI5tiDcXgZOj8EW+RYojTowdCymbBJ3dCNBWQaYOwsx6fDz8YHV2r0iu/h/SaRI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083485; c=relaxed/simple;
	bh=yMkVwvnjJdSI1va7AI/8MJB9GMK/1a/Jr2wpPBYCrIc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U7BXuQKMO65HHEbZ1XjoRhKqlAHApA6Cual0rQSu2uIun3A8QfKLw8F9bgACeIYKBv084/RBBDF5yRzIHRqwkYlYD34v5KqxPmC7+ogDWh+cYM0YgcshiSUlYIhH7F228oy0+Ayag/by4yDUb/xRrAs5lQbI3K8GnTaaENOI8LY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=DHFGVy6C; arc=fail smtp.client-ip=40.92.103.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwCTfv2M6Oqy+WrCXoGGUXM1qJ3jYuoGjK+cIcRl5mCf0EbjZzmj7bHCT5FVu2lTPpmOl7ryN5IBzhZhFdkdyWWr37OWu8XXLbznxSqNf3jn+Y+7o3fLkZogirt3qtVorwaWhAWtZ5e6IOr79TN1TM35JpL6tH0Td0NWU+/EDDGFcNkcWAHm28GuKHPG2hwdOdpe6I7gRRAk9wJqX2bY066kOpu7A+ZPiQd4Olqi+64jMFKMp6XGpr4axLdnPai64gyWt1Gt2skIkzXQ62mKXZKz895eRJErRRR6cKYaN8usonklH18PdPNkpWiWvaaPcWURuRTy66/ueZlDzidfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMkVwvnjJdSI1va7AI/8MJB9GMK/1a/Jr2wpPBYCrIc=;
 b=bPXgjaSOeNWkldiU8Z4hGjZow5w69v4mHAaTBK/rFLgsji19XkQG14YCU4Oh01MozfD5lpl28VjFFY7375PEvbLQqWMYfTvlN1K9VnPN4xnEB+0qbYOrvosKYvn7DrQHdn6mMSEDF6Z5QWRTwSDV2DnqI1IJUCpe2oafkm2LL+uGFauEiAdQdesh3/dVgmPOiYMs2iI1qd5kld8j3/8qrNpHSu4eTsiEeIRMyNxnntriG7AIcu0N8BMHOWw2WQhJcDzXBQoTLIh0DFnYJQCln2dXZB1GeA0H/ATue8/BhoHbdev82cmPOXZhiNjF1UDkgANl7MvoaPj8V7Yl25vJCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMkVwvnjJdSI1va7AI/8MJB9GMK/1a/Jr2wpPBYCrIc=;
 b=DHFGVy6CDSEhsnQznJH5qmF02KbwTRNSs+CkNm7rwFs/WibzXRUr4q2xcgjdOTeRyeVJJDaEt3ArIz6B/MY1/6hoQy06mqeMGKeADZoZZxgETUrpH+iDWuG28MO0Vrfn3Z06RnpmhsKbxXMWnlmlUiOzVOTvNjVBZxWDEWzQxUqMb4gQ3NNUpWvBPRPIAjE6H/TW5QOXfsEZdCwk4+UsyWaazGX7CVHPE5MJl5XirP5FVXHg8qRp6Kf8kpMkYAGx/GbdYdBHW9h78fgoV47CN3cjS/VBceqMXmxIqQbt9dbTcwI+63SBMRA1t9+N+LDa+MNRU2SVQP2JW33fG3M9Uw==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN3P287MB1070.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:173::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Thu, 4 Jul 2024 08:57:57 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.027; Thu, 4 Jul 2024
 08:57:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Benjamin Tissoires <bentiss@kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Topic: [PATCH v3] HID: apple: Add support for magic keyboard backlight
 on T2 Macs
Thread-Index: AQHazXICmE7N541aCEubCM7ljDry1bHmRIgAgAABG88=
Date: Thu, 4 Jul 2024 08:57:57 +0000
Message-ID:
 <MA0P287MB021787375884DF8FFF3634C0B8DE2@MA0P287MB0217.INDP287.PROD.OUTLOOK.COM>
References: <E1D444EA-7FD0-42DA-B198-50B0F03298FB@live.com>
 <172008324081.1517774.10367638592868266446.b4-ty@kernel.org>
In-Reply-To: <172008324081.1517774.10367638592868266446.b4-ty@kernel.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [R7gzqFNc9I1XysvfirVq4ZJ09grqn/LdqFuYqIWs0AmOlMQ0lRy1RBBbN9brV0aaT4yZqOoDOt0=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN3P287MB1070:EE_
x-ms-office365-filtering-correlation-id: 2c4759c8-292f-440b-4f62-08dc9c07668b
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|4302099013|440099028|3412199025|102099032|1602099012;
x-microsoft-antispam-message-info:
 tLCLmvS7Ou1a9hVp9VHo1j5w1MPv38QfqJt0v9adQyg2R9mkeu41JE6volW5Ue72fANSuXCX5kYOKQL7XB/76qefYQA3MxPttxYw2AHI5pZhi2C7/CxQmL14iMuRkB1TcWyNjtquPSxlVZxYqbv1VcRi/n9Orn+14lUXjrA9oVvB7Thsw2s82S6bisiJEZxeZN6B+VdcZoCI2mTBtblWu/pAwp6J+Un+Uan1R8YNyuAIKyedukBxmT6joLTKgMkccCZhU7L1ESCg5Ev7KLnOKwJt6DcqaWHqRVS29PxlDaRBwfHKu6YlPmHHSp5887pJ+tvL0sJ0Ns6JoQYsUFCLQ9xO3NXfUoniojQ9jxWPWu4gCv/bPLE76Ui+D4iCniAFcEI40ZDj7yU2Dj0ZvNW9/NgS/2fIodSuHnvrAFRAUJg+D0i+cFF47EfJxg9N3Zn6nHMsYQevPeIH3wXZHJmtrfIcL6UbBMYy8x3SooKzcu7/EW8EnCu0vxKo9L2g5paU8J88dzNEnrao8DYRzoCcHExg57horbCIX+czyI5YqfAGY+ErE+0pI3NIWI5/b0KT1l+37qlAFxxamPNMcq8rRPEn3fYOZnXZ3oQB2S8rN/r4hwsJJA07e4rpcVuEed8VHAtrP6/khB6CHS+5YrNqBEy3rGGhWE+ZCrrVQi7n1qMWqqXcze3mRCK2+GZPSrjjpRNivESx9rPKafPhl5U0u1AyKscx1ziXxUgc2OelNWU=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1Vtb3FwaDdHQzk2cmtkT3lyM1o0UzFIYVdDQ3pXY2tXd0pFL1c4UjFZaU9R?=
 =?utf-8?B?YVhIc210S3pIRFV6dHdOMHByMi9acUxQdEFXbTdIL0orL3hVemIrNmYweGd0?=
 =?utf-8?B?eUlKUVorcURzWlROYU9pQkc2RytISWY4SDFDYlBuYzlkWVdzMzczcVZONXQ1?=
 =?utf-8?B?OGNZZ1l6S3VFZlZHZDNxbGYrM2hPV3c2a0dxQU03S0JJQldkNjhNUmE3MHpz?=
 =?utf-8?B?Y0ljVExza1VwYVVIZUdCd0loWlNZcjFMSWpUSUIybldoeFVZbHpBaWpFVmhZ?=
 =?utf-8?B?OGdUV1FwbldPYi9YL0t2ZHhrOExFMDlBczRlOTcxb0NNYzlXMnJ6OHJod2ti?=
 =?utf-8?B?Z0c4NmNibUowN0I1cXJyZzR0VExqRHhlZDJMankxYUdIeXo1c29PMnZJN2tv?=
 =?utf-8?B?MjFHMlpWamNCMGxQQlRUUHVUUmVKZWY2VXI2ZWpDNkR6cVNtSmhVUS81QTVh?=
 =?utf-8?B?dFRIOUdFQUVRTmk5OVdlaUxhUUFPeVI0b2JGNGhNL3JNQlM4aG50SlIwT2pp?=
 =?utf-8?B?ek45blNTeGVGTmV2Q0tPMUNQTEo0WnNvSmhHclNhUmpLZmlMWFZzL3RWeGY3?=
 =?utf-8?B?Y3EyTHhQa2JEbnZtS3R6cU5lQUtLdVlPcmdodzdOQk1YYmtibTdmYU5XeHdG?=
 =?utf-8?B?ZkZ0bWZCeVA3aEZtbGFzWWszd0xjNmpYaStTZEtmSk5DeXB1UitjR2JiTGpV?=
 =?utf-8?B?eXJuTFRrc2FIWGNheDZMcG1HeGt0cGUrZ2JXLzJNMEdla1c1R3RTSkg0bTRT?=
 =?utf-8?B?S0V4b3dEUDVEa2locERKbFk3NnpLUFEzc0NQeXFNa21YcVNIYlpUSTRuQ0t2?=
 =?utf-8?B?Zk1Eb2ZiZWR1TzZ2L2I4UjFCUGRsTHVlSzlKUFYrbTUrRktMU3BWckdIY2dv?=
 =?utf-8?B?SU5vRmdCRVBXZWlIS2pkbFp2a05BMC85bzdvYUlTV1d4b3FwdGR3RFluK2hH?=
 =?utf-8?B?cUpkeU9EQ3BSaEoyaERFajgwNjRzS3NjcC9haGN4VUpoRFpWT1JDNTU4VU5q?=
 =?utf-8?B?V0VnL2lQbTJ2QlA4c3A2T0RlVi9id3d6OU54K0thbkJSY3Y5OU9jU3R1M1Vl?=
 =?utf-8?B?bHdtbmhtRWhBNXVmSmZKYVN6OUMvU0Nad1o1OEhHUk5ibkVvdmRFaDNVUXNY?=
 =?utf-8?B?WW9OY2l0ays4QUpzeVdGL21TcGcxQ1oraUg3TmJRekpvMCtrck1BeUI3SnVO?=
 =?utf-8?B?dFNqTVMxWk9SV3lzMVBzamJnSUZrUzdpOW1Sc0RiSk1YT205WitFMGE0SWpw?=
 =?utf-8?B?SzBlNFhJamNFVTF4TGRjYlhGZjN6WUgvWDVCeXdJZWlZT3JMektnbDg4eWZE?=
 =?utf-8?B?d2plMWtwU0JUSjN1WTZIckg3NnFjMk9ORFFjWXF0cHJseTlkaFJNZDl4bVdt?=
 =?utf-8?B?OUpCR0l1eWhGNXlKRDZZNWhndmlCSUVkWmV1UGQrRm42Q3JWVGxWWXcyMlBT?=
 =?utf-8?B?YmI3Qm9jT2VFVUVEbW1QNHZpSlVTRkhsYU9INFVCNGtPWHBhSm1yRjVLYkN3?=
 =?utf-8?B?RzU3YU1Xb3FBUVAyRStYcVViU1JzNG12R2NBR2YzSkxoU3FJZld2aS81Tmh6?=
 =?utf-8?B?VldrWkhiTUxJaVd6Q1hMY05RSFZudkQxWFhpeGVYTk1zdGNnOHpoa0NaeXhy?=
 =?utf-8?B?d2lxa1U1N0NtVXhBRkdPaUd0NVcwNTBzenBTNzlDZWRHOCtxdUMyV0JDd2hO?=
 =?utf-8?B?K3hBZitMTU1ONUR3VVMrU2VxbXBZQnlubTQzYndRTzA3M3JSR01oK0RkWXZw?=
 =?utf-8?Q?LWaki3/aSwhYAyknGY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c4759c8-292f-440b-4f62-08dc9c07668b
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 08:57:57.8276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1070

DQoNCj4gT24gNCBKdWwgMjAyNCwgYXQgMjoyNOKAr1BNLCBCZW5qYW1pbiBUaXNzb2lyZXMgPGJl
bnRpc3NAa2VybmVsLm9yZz4gd3JvdGU6DQo+IA0KPiDvu79PbiBXZWQsIDAzIEp1bCAyMDI0IDE3
OjU0OjExICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+IFVubGlrZSBUMiBNYWNzIHdpdGgg
QnV0dGVyZmx5IGtleWJvYXJkLCB3aG8gaGF2ZSB0aGVpciBrZXlib2FyZCBiYWNrbGlnaHQNCj4+
IG9uIHRoZSBVU0IgZGV2aWNlIHRoZSBUMiBNYWNzIHdpdGggTWFnaWMga2V5Ym9hcmQgaGF2ZSB0
aGVpciBiYWNrbGlnaHQgb24NCj4+IHRoZSBUb3VjaGJhciBiYWNrbGlnaHQgZGV2aWNlICgwNWFj
OjgxMDIpLg0KPj4gDQo+PiBTdXBwb3J0IGZvciBCdXR0ZXJmbHkga2V5Ym9hcmRzIGhhcyBhbHJl
YWR5IGJlZW4gYWRkZWQgaW4gOTAxOGVhY2JlNjIzDQo+PiAoIkhJRDogYXBwbGU6IEFkZCBzdXBw
b3J0IGZvciBrZXlib2FyZCBiYWNrbGlnaHQgb24gY2VydGFpbiBUMiBNYWNzLiIpLg0KPj4gVGhp
cyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIHRoZSBNYWdpYyBrZXlib2FyZHMuDQo+PiANCj4+IFsu
Li5dDQo+IA0KPiBBcHBsaWVkIHRvIGhpZC9oaWQuZ2l0IChmb3ItNi4xMS9hcHBsZSksIHRoYW5r
cyENCj4gDQpUaGFua3MhDQo+IFsxLzFdIEhJRDogYXBwbGU6IEFkZCBzdXBwb3J0IGZvciBtYWdp
YyBrZXlib2FyZCBiYWNrbGlnaHQgb24gVDIgTWFjcw0KPiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvaGlkL2hpZC9jLzM5NGJhNjEyZjk0MQ0KPiANCj4gQ2hlZXJzLA0KPiAtLQ0KPiBCZW5q
YW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCj4gDQo=

