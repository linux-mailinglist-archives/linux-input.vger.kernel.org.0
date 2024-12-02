Return-Path: <linux-input+bounces-8319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4B9DFA9C
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 07:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A651631BB
	for <lists+linux-input@lfdr.de>; Mon,  2 Dec 2024 06:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F26A1E231E;
	Mon,  2 Dec 2024 06:07:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11olkn2039.outbound.protection.outlook.com [40.92.20.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641C1D5CF9;
	Mon,  2 Dec 2024 06:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.20.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733119620; cv=fail; b=Ut2XsppDUMnuSKlspDIUk4twEXN0WLM72kXL84yfiClwy7NHqIcGnHKwiLjtbczBgFk1AWlng/Up04EQIyre+569Y0m6bO+L2hlKeiqqkEQtbSko21IjwdadzM9rODuKsAyI7vEDAgaaX/Ufn/KJEVj9WoJxQ4hPIHVwqqYaAFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733119620; c=relaxed/simple;
	bh=7J0PDYvc1Yfn1UqAvdgZKtBa30jFyF8x+q5ck6zWO8g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QjHd60lEvL/clX83Qj609ZD98sxVcSL9gQtmy4sxXe9fHHl56X9pq/1eQo57g17RRYLwOD/FIH+AyDUXA6SjgFH2aPrT6xRFct6DHExevZ8tm/owXMyYgO+sWv2F6Syr6oA6BhlBVmh93kZ+nAznGWFJVDOQxmhaBC0l/ATQaWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soragoto.io; spf=pass smtp.mailfrom=soragoto.io; arc=fail smtp.client-ip=40.92.20.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soragoto.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soragoto.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8hc/atiU1ViLeVewCBW+yq531YCM7xar2CHcxymOBlVFx0OR+QGk6TZYZP/qeClTDysWhUKIuPHEqPK+lxycirEko0/yoeRKhEjDJLhbRN8m91rkIk69hG2QpBtGtJo++eJv0FmlF6ycPnMzx16nc/c43wpXCZ4g/Zjn9xDWNTD6agTitL9F20oXJq2TQXICAEziYNFcN/FxZPZ4aTtBFBD7KAjlv7ftBu1lFKGAIdxwdJFka1WCrSg7WwQPBWMBnAAhFMgooLoBTLn0ZTlg6NIeXYTbB9sDqE7wFESXd7HdJGRQUx1f6WOf/Vc3QWajIk53vsfRD5h9PIIqAuKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7J0PDYvc1Yfn1UqAvdgZKtBa30jFyF8x+q5ck6zWO8g=;
 b=JZjFaTUYS98NwNd6/ZTHnfi259ryTO0XINluY2SklqUPxPF1W+wV6oTTOA/Ac8vH7Re9A2xBtCTAL9oDqYaSjk/GWVbHLAUdLb/UD4Qd/Ni/Izef5C140m0zZZPtD6804NWbqkDUwwmscfkG+sYP1btpcyT70e4W9b2b9Nq/l/VMehSp3q1YUiUyDNIPNpmOShYg6u20cb/KRzyQJq9dueXavWNbovHmyreQAPGorhycZGazAIF+3Fgp71U53lYtriqix3EQMpFcMGhkQpcyX2bGe94Nw2Ev64NGRzGF/BISwzPp4Bb5HbmRX2OmEi9Z49V0fCgv+eCvREYPQXjwPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BN8PR14MB3441.namprd14.prod.outlook.com (2603:10b6:408:7c::23)
 by CH2PR14MB3723.namprd14.prod.outlook.com (2603:10b6:610:62::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Mon, 2 Dec
 2024 06:06:56 +0000
Received: from BN8PR14MB3441.namprd14.prod.outlook.com
 ([fe80::1538:64af:c2aa:e23d]) by BN8PR14MB3441.namprd14.prod.outlook.com
 ([fe80::1538:64af:c2aa:e23d%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 06:06:56 +0000
From: =?big5?B?p0EgqKWopQ==?= <soragoto@soragoto.io>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
CC: =?big5?B?p0EgqKWopQ==?= <soragoto@soragoto.io>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] HID: magicmouse: Update device name for Apple Magic Trackpad
Thread-Topic: [PATCH] HID: magicmouse: Update device name for Apple Magic
 Trackpad
Thread-Index: AQHbRIBkLUc6MOTpSUC7jabUFegOeQ==
Date: Mon, 2 Dec 2024 06:06:56 +0000
Message-ID: <20241202060545.21193-1-soragoto@soragoto.io>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR14MB3441:EE_|CH2PR14MB3723:EE_
x-ms-office365-filtering-correlation-id: 5b43a6ea-e80b-469b-b877-08dd12978685
x-microsoft-antispam:
 BCL:0;ARA:14566002|38102599003|15080799006|19110799003|8062599003|8060799006|461199028|102099032|440099028|3412199025|1710799026;
x-microsoft-antispam-message-info:
 =?big5?B?d2lYcCtyQk5YTXBDc05IUjluNTZ5bTIrLzBnaFNZV3cyeER2VjBLejRwVFhGNlUr?=
 =?big5?B?SnZxVmFuZmNoUi9DUWtMcm90eXU0dXVxRTFoZmFLZ3B4T0VhYk9RRmtuTHFRbEti?=
 =?big5?B?ZFNpVThjT2tSZDdOM0l4VnFzN1BxTFRHTDJnNFU2bEQwaUlWQUFkbE02TUU5QThi?=
 =?big5?B?YWZLNHl4YXA4ZlFWbytnci9tNktaUlpiMXByMGY3Q3ErTXhrYld0eDVnV2ZGUGtz?=
 =?big5?B?MmFnTjJVTnlBKzdwUGw5V0ZSTHFCVWZRbExXU0lvWEpYRjJwdjB3QlNPZUhnMzBU?=
 =?big5?B?NUtNK3FLT2hjMnNRdEtRS0NuakcrQ2pRWnZ1R2o4b3ZzOFhKM20vR2VsTUZnclQz?=
 =?big5?B?dnRneXZQQjQ5N2dKSVlRK0Z5aE1KZ2xFZi81cmZDcnR0QythWlAvVEludkphVzdj?=
 =?big5?B?TFBDcTEvZmVtMFZsMnNLV0tTRjU2YUNoVVA1azYyVmVLekJEcFpHaS84Y1J0Tm9K?=
 =?big5?B?VVM0M0RtMTk2ZXZBVTVta1U3cFBvUW0wWUpoS0U5N0VTTXFRNEsxUk4wVE5YTkJu?=
 =?big5?B?Ylhsa3hpV2Q2YkdSRTU0OWJyNUM2NFN4SzViL2o1eFN5ZTR2ZTBMM1hleGc1V3B4?=
 =?big5?B?eEwvMi84VWhoYlZ3QnRjeU52bml6cDQxUEpyeDdPQ21OdmZLUFhJeEcvc3lFZGcw?=
 =?big5?B?WVFCUnh2czF3ZHpBc2dKOUF1Q3B6SUxUTmxYY1VNWW4ybWl6ZHZZS0V2b1dJbG93?=
 =?big5?B?VGRBeDU1aFFHaGlGOE9EazJNTmVPM0Mra0ZKdGVvMy93dktEb3hlcE9UaEdvYjJX?=
 =?big5?B?VHg5K3MrNUpwbVpHamY4cTFJZnN0TG9oUmlyWkQ1YTlCR1JaRzA5dEFyVXlWZFBH?=
 =?big5?B?d2tDcjJKY2tRb3ZRM2Q1SlRGby95REU0OVN4aFdodjI4S21BYVF6VjNCNzMwYTBZ?=
 =?big5?B?TUcwaFl2Vjh5MFo0OHRQYWdHdUVRRUxQcDVmZDQwRGJ5czZSNlhZa01oOTVpY1Zo?=
 =?big5?B?em96YnhoamR5T0ZLY0V2ZjBXWVc3Nk5yWUVZZEJVaU1VcW5KVXF0RytkVFF3MXdM?=
 =?big5?B?QUtTeXh1WWE0QUdPTUZ3bngxUGFOenlVZUo2dm8vc0FZWEZDK3gvYkp5SEgySTg0?=
 =?big5?B?cncwQjVqekEzNGFxeitkMjZrb2FrdHl2WW56Vm0vc0dneUdnaTNnQnYrdGkvdWs5?=
 =?big5?B?K2p3Wk5FdFA2UldkZ0ZFTitoS0Z1L1owcENRSHlDb25MdWgxUkpTMzNQK1NYVzY0?=
 =?big5?B?ZjhKNFlkbmJVcWRhMkVnMHRuRHJ1c2t0QU1WMnVQNmRJU2RXN2g1Y2NMeFVqRlFI?=
 =?big5?B?bTlnb3gvYU9rWktwL3RwSERoODU4YUpsa0xoS2ExUVRNWlEzc3JKYXYxc282V29y?=
 =?big5?Q?8WzCGzj8qkUP1MChQxRNgv1G55SHHpCq?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?WkExTDF4bENEeE1PckU5ZU9mWFI2cjZSK1Bhazd4TGxBYzBabk8vemVoWENiK3Uz?=
 =?big5?B?bGs0ejVYSUxZcFhWcWVtZ21XTkRmMUY2RzI2QXo3M2NlTnkvbTVXUWpCcWo1M000?=
 =?big5?B?QzBCbWF1RExOK09ZTlJMUGsrWVdMWnl4VmlHeEZDd2w5encrSmtWc1BXbkdqUkxi?=
 =?big5?B?NWlvNkpDeTlrK0laR0U5dGZlQ3IrNGJZMjdLNDl3UlVKY1RrYWFGM3Iyd1M0SmdE?=
 =?big5?B?aWlFeXdVSDVmUE9McWpUOXN1dUlTME1zSy9pclJzQklYZ2llVWhQM2c5SkE2eWFF?=
 =?big5?B?cDVhdGxwWkZ5aHZick1GNjVSdVhNM2Q0blJtZ3d3alkrOGJ2N0U2cDAyN2Zpc1hR?=
 =?big5?B?U3BFNjBaUS9YVWxWUE1HWWdRbHdKSkJMc3pGZFRIRVlYcEs4bTFLcUZESWM5TUFJ?=
 =?big5?B?a0ovUG9WS1gvK0xpQmE3ak9kSVRSK2N3Z2Nkb0hwSEpBN1NKQ3A3azRYakExWDhh?=
 =?big5?B?cWs4d3JOL2tGNWVqcVl5MWx3dEpNc3dCT2oybm1IT1h0eHJLZzYzWkZUWU1kK3Y2?=
 =?big5?B?alc5cnY4UUJXZEU1ekZHZVhmOGd4L01BVG4zckNrUm4vY0RRcVg2ZlhFUFB1NlF3?=
 =?big5?B?RU83QVpPcHlvL2VTb1haUWUwOXFNRHFieURObVdwKzVzVmVJRk9MMFE2TXF4Zm1a?=
 =?big5?B?a3d4a2VxUTdEaDA5eU1Fck5OOGE0Q21renRrNlVDUlcwRkthR0p0MGVJdkhkczlG?=
 =?big5?B?MmhRK1lMK3JYTG5rQnVyclQwMFN4YTNEUDJhU3A0SWdzMHhXZWhVQ1o5VGlJZWY1?=
 =?big5?B?WnQzKy9SdUd1aUtHZE9iVFM0QmJxZ3ZKZDJ6UDh5aHZ0MDhPS2gwR0M0QVVnMEZu?=
 =?big5?B?dWRSMjg0dVM2enM4Q1FvTXBIQlVoVGdIWWJPVlozWlQ2YmRtWmZ2Y0ZmVHpSaGx5?=
 =?big5?B?QTdQSERsZW1RdFN0dXA1QnB4b0x3OFRxL0V1SlI0V2tPSzlsdDBvZkF6M3k4RWtx?=
 =?big5?B?aFowbEtFNEx2RnI5VFRUNHZHU3lmYS94OWRkcG11SzlqYW83RXQwelV5R0M5UnFN?=
 =?big5?B?VFRPZ2Rsc2w2WUN5Z2p6cEo0WTNTUjhLZmxkU1kvTDVmUnNXRTZwUmRsWnR1RGFl?=
 =?big5?B?QTAvYkQ5RnppbXNiWEpKSkxjZ2hLQTd0UmcvbXdhUW44Q3RHQUk3WVgrcngwV28z?=
 =?big5?B?UE04V0JNbWx2Uy84RDZYYXEwbTljWlhuVzZ6b05laWp2elQ5VE1tM3Nna1BQUnh0?=
 =?big5?B?UWp3eFZOT3h3MmJoNDJlbzlrM1lOMXJUbnJhaXlJSm9kQ1laNUpWaHFFN1VWejNt?=
 =?big5?B?VVdEWFhkYk53MGNKODNFZTFRdUJRSXJldjRlS3p1ZlY0SlVPb21oNG92WXAzU0xh?=
 =?big5?B?TkVUaFpYQ1Q1ZmVkT0c1K0ltWHlYdURZSHZoREY4SU94SnBmSFFhdy9SZ05URHpt?=
 =?big5?B?MWMzS2p2aXVNbmdUeHRKTDhOcGFTWjc4djJBMVQyZmRDcWllbUlmRFR4aWdteFpU?=
 =?big5?B?eUZkbVNrWVY0di96TUNYcnhZWnRROS9qYThYdWY5NS8wK0VqVSswRzNPNlYxdkhJ?=
 =?big5?B?YTBTV3JhYXA0bTBPeXdHdmNOdWwvQW0wQ2tuMHh6YTVvKzh4a1E9PQ==?=
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-19-msonline-outlook-e4812.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR14MB3441.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b43a6ea-e80b-469b-b877-08dd12978685
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 06:06:56.2657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR14MB3723

VXBkYXRlZCB0aGUgZGV2aWNlIG5hbWUgZm9yIEFwcGxlIE1hZ2ljIFRyYWNrcGFkIFVTQi1DIHdo
ZW4gY29ubmVjdGVkIHZpYQ0KQmx1ZXRvb3RoLg0KDQpUaGlzIGNoYW5nZSBlbnN1cmVzIHRoZSBj
b3JyZWN0IHJlY29nbml0aW9uIG9mIHRoZSAyMDI0IFVTQi1DIHRyYWNrcGFkIGFuZA0KaW1wcm92
ZXMgdXNlciBleHBlcmllbmNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBRaW5neWFuIExpIDxzb3JhZ290
b0Bzb3JhZ290by5pbz4NCi0tLQ0KIGRyaXZlcnMvaGlkL2hpZC1tYWdpY21vdXNlLmMgfCA4ICsr
KysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkN
Cg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hpZC1tYWdpY21vdXNlLmMgYi9kcml2ZXJzL2hp
ZC9oaWQtbWFnaWNtb3VzZS5jDQppbmRleCBlYzExMGRlYTg3NzIuLmE3NmYxNzE1ODUzOSAxMDA2
NDQNCi0tLSBhL2RyaXZlcnMvaGlkL2hpZC1tYWdpY21vdXNlLmMNCisrKyBiL2RyaXZlcnMvaGlk
L2hpZC1tYWdpY21vdXNlLmMNCkBAIC01Miw2ICs1Miw3IEBAIG1vZHVsZV9wYXJhbShyZXBvcnRf
dW5kZWNpcGhlcmVkLCBib29sLCAwNjQ0KTsNCiBNT0RVTEVfUEFSTV9ERVNDKHJlcG9ydF91bmRl
Y2lwaGVyZWQsICJSZXBvcnQgdW5kZWNpcGhlcmVkIG11bHRpLXRvdWNoIHN0YXRlIGZpZWxkIHVz
aW5nIGEgTVNDX1JBVyBldmVudCIpOw0KIA0KICNkZWZpbmUgVFJBQ0tQQUQyXzIwMjFfQlRfVkVS
U0lPTiAweDExMA0KKyNkZWZpbmUgVFJBQ0tQQURfMjAyNF9CVF9WRVJTSU9OIDB4MzE0DQogDQog
I2RlZmluZSBUUkFDS1BBRF9SRVBPUlRfSUQgMHgyOA0KICNkZWZpbmUgVFJBQ0tQQUQyX1VTQl9S
RVBPUlRfSUQgMHgwMg0KQEAgLTU2Nyw5ICs1NjgsMTIgQEAgc3RhdGljIGludCBtYWdpY21vdXNl
X3NldHVwX2lucHV0KHN0cnVjdCBpbnB1dF9kZXYgKmlucHV0LCBzdHJ1Y3QgaGlkX2RldmljZSAq
aGQNCiAJCSAqLw0KIAkJaWYgKGhkZXYtPnZlbmRvciA9PSBCVF9WRU5ET1JfSURfQVBQTEUpIHsN
CiAJCQlpZiAoaW5wdXQtPmlkLnZlcnNpb24gPT0gVFJBQ0tQQUQyXzIwMjFfQlRfVkVSU0lPTikN
CisJCQkJaW5wdXQtPm5hbWUgPSAiQXBwbGUgSW5jLiBNYWdpYyBUcmFja3BhZCAyMDIxIjsNCisJ
CQllbHNlIGlmIChpbnB1dC0+aWQudmVyc2lvbiA9PSBUUkFDS1BBRF8yMDI0X0JUX1ZFUlNJT04p
IHsNCisJCQkJaW5wdXQtPm5hbWUgPSAiQXBwbGUgSW5jLiBNYWdpYyBUcmFja3BhZCBVU0ItQyI7
DQorCQkJfSBlbHNlIHsNCiAJCQkJaW5wdXQtPm5hbWUgPSAiQXBwbGUgSW5jLiBNYWdpYyBUcmFj
a3BhZCI7DQotCQkJZWxzZQ0KLQkJCQlpbnB1dC0+bmFtZSA9ICJBcHBsZSBJbmMuIE1hZ2ljIFRy
YWNrcGFkIDIiOw0KKwkJCX0NCiAJCX0gZWxzZSB7IC8qIFVTQl9WRU5ET1JfSURfQVBQTEUgKi8N
CiAJCQlpbnB1dC0+bmFtZSA9IGhkZXYtPm5hbWU7DQogCQl9DQotLSANCjIuNDcuMQ0KDQo=

