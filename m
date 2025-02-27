Return-Path: <linux-input+bounces-10416-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21079A486B9
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 18:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6A53B2B21
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2025 17:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543AC1DDC0B;
	Thu, 27 Feb 2025 17:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="aZh7svt8"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011027.outbound.protection.outlook.com [52.103.67.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8D1D63CF;
	Thu, 27 Feb 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740677709; cv=fail; b=d2UrdubDmlexa6zsMCVEBdMvER8xNQnycECSsVfvjI27z9Lpww24hyxq9jWGDX7EqJrGDEBl+m5KfuIASx7qNaZrSZQD2Pr7l9+B1vHPz/tWUda/SI6VfWk7KgKJteWoExOqiLUUpSS59uVY2Lff877cwW4FPse4thC2MBodQAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740677709; c=relaxed/simple;
	bh=eFqnGs/8/i44OtRFQ+w//BfIyVvfgW6k1ilbQIKRSF4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iC77zP3eeBQYFUw6nOqTVE8uDFbxTl+YK6gc/1c1S2TtOzUmSAiWQO8tPFT+PcLfn7GgaqvJvxUxkeY9mY95c70EK2Mh88tJV+ccUNhgmFod1sDWIZuJUZBr3PRy4JU0AjJHn/8wTdzi9KKs4w+ahLTiEeuUm86Tyt4cYiTpdvQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=aZh7svt8; arc=fail smtp.client-ip=52.103.67.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qdYrnVEJsu7uRKdRNKQsqO3tueFU1SsyP4G0pQ2OahnsT40El4jm3YHkTqw/dvCzG6LPvk7HOkYQNAzIKZiigM9fOqveRo+OlzApI24e/uh4/H4viukr57VDHC9voMqck8UWQfLDCyQcpmaZBqyw05ns6bxUkEhEw+3bNGwzkWiqZzLFYlzyoL5hyto74GGoEpH2o93kQYZjtbgf+/5pjHdIl0vbSZbGmLOSBaNA+y3XKuVn3tR74jOkI7zO1npvZRKP+3ZzCknIfWWNDYTrgYP2GiTAFmXIB1dUnRjD8etTkxO7FuBhNGN+QZF+je0ZWFsMQeS+ODwWDuSkQGtdsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjSltGec9qsTH8QrOjYyF6dlhYH67W89spYjkatgt+8=;
 b=gch2zmSokrdHGMtcFAVzteCZuhFdM8sFWGETAUpowSVVBPISnZ1pgyUu9TwmAUWYBmNe0QvRP+5Aj7fV5ZPuRqPSX5W1j+33qAL+w1M/pANnuvy0AYaNOgg1xLYrkWjQvPehqWISNAkIEuWg3ttCFg2AnCSonoKq61kc+NNfEmI5Svq+/AWMLXmJDOORoGXKXjUusi0RsZB+CVBvTR2rIXwQ8L03bBeaUifwJ+eC6A4+x0tTVS2UJbSs67NmhAr7tGP3uHVtutkvnSuJoK2KV9hXoX0uLwJr9xtda80J8Vlq0/S/jGuORSffP+vvugKPMsnelsad5vNR/x42HG5dfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjSltGec9qsTH8QrOjYyF6dlhYH67W89spYjkatgt+8=;
 b=aZh7svt85IqCftuYjHZ7Jtq21Du2rkcRfcXRAeLyhA1NTDqzt4uhzKyhiiw58NxfW9zCyKam3UhercWfUHWDYx4Rr5nCvRs3IV6vjJdMa+l370E8gY0E9p5/0MNtj7sD4IcDM/Ik+gIH8ooSQzzXwsXDm23etyprKILc6lfCUR0pUPk3lKI05Iy7IQ3MExr26AIcuw4RvZ13GxI+qbUNSFKbVB9qYExNcL+lVec6rj+bluK62KdDfd1RYyxR41R0CKFDYvhulRep3QOB6PEh7Te7I0bZ4Es36AA5FhDP25dAuG/OBGkSkuZkj1C73lMDnCqhvYeOBpNbuVyeODpFOA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB7281.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:34::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Thu, 27 Feb
 2025 17:35:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.021; Thu, 27 Feb 2025
 17:35:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH 3/5] HID: multitouch: take cls->maxcontacts into account for
 Apple Touch Bar even without a HID_DG_CONTACTMAX field
Thread-Topic: [PATCH 3/5] HID: multitouch: take cls->maxcontacts into account
 for Apple Touch Bar even without a HID_DG_CONTACTMAX field
Thread-Index: AQHbiT3ulHkDk4jwuEGhkRU3zGWpBg==
Date: Thu, 27 Feb 2025 17:35:03 +0000
Message-ID: <F648B94F-AF64-49B1-AC91-EFBD0F8E216E@live.com>
References: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
In-Reply-To: <4C367CCA-2994-46EA-A139-7B4E23E33ADF@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB7281:EE_
x-ms-office365-filtering-correlation-id: 2399d519-5f52-49e2-242d-08dd5755115b
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|461199028|7092599003|8062599003|19110799003|8060799006|102099032|3412199025|440099028|21061999003|12071999003|11091999006;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CImvZB9JwQfiyOHDjuEGqt8greztP1bM2OJ20tvIecqlyrlnR+YRqKG6ztLM?=
 =?us-ascii?Q?e3V2UyLW3X0IXH+sftQc5EIXwi5d3Xs0ya7DrehIZy7rDjmtSzMAzuI1rJEu?=
 =?us-ascii?Q?HTHCAGWG6nDEGl14nCLkkCbmCIwPEid12K0dA/KzFvUKanKBGaxQ6fHg+3k4?=
 =?us-ascii?Q?sWL7gMkVWzbtCXmkcM/MM+XlGY/o9VTxxnhR/DxzcN+IM+HSmY7G42NPhcwy?=
 =?us-ascii?Q?WsEdW/UXwaO4RJW13LMbhZZ7fxQ3u96GwI2rZEIfw1EeNoS2dVOGVsQTIwjr?=
 =?us-ascii?Q?PCnVcp9+i9PklnFsuqfOI0GfewVtgp/yZpuPSZj+09lLIPMLZkSlb0mU70Hh?=
 =?us-ascii?Q?EaIWEbv27Sh8RUILPTDZJsSHew/oJ2WnW/cbmgc8toBCJeWK0Y8NjArlWbvv?=
 =?us-ascii?Q?i330E0gQ6w0r7IDEl4/1dis6egKFT4CojD0oqc/cJaWdn8Bu1HlyPOVnPiKC?=
 =?us-ascii?Q?xTS57Fz6YQxpuKTYzWc9tmg08OTRWTLNnAp4d9VSQnjFC1o9UUtVM94O+rW+?=
 =?us-ascii?Q?JZXp+lvs9Y28zbNjYwgEBovS1Vt3fVe0yDkebt2cWARXHk9ufI01xoNM+8yx?=
 =?us-ascii?Q?i/kBsJftaiPYcd6yS0CL585oHJAEPGKUcy5CsBk8xw7J65FPvRYPY8iANyBY?=
 =?us-ascii?Q?0jqUyBj0zO/JgZK17EsBWV/gVgGZmoPyToBqMI8e9O/c0NpqZzQ08XpYdVJ4?=
 =?us-ascii?Q?lZi681JuvW2kQaFX0SznTSzoaZH7B4LOPhkZC3hq1ffbam9LNceOoU7BxGcg?=
 =?us-ascii?Q?wcuk8U1y91oY4UqS3VXm1huxCh6C2c5pkPRrYKnffV5itlK0tS9igvbJfAq+?=
 =?us-ascii?Q?u3Wf1L8kLnUzjnC+YhdOmrLXbEVFQQF3vzH2gzlDSdzsu7oRs49awWknRQKY?=
 =?us-ascii?Q?Je5H8BOMQN6fUFmjn3WAIAoCokWkmn2GsdxURr7s7u4cMjlhIpNQZi7w0JZi?=
 =?us-ascii?Q?U/2rMFFKNnQ0tLAFf8HNn2HtXp6wPPJVhQTgnGtUcY0qXFNKyObe2zade6HA?=
 =?us-ascii?Q?hSvqAtp6ygJIKOvpYl9isGf3brtU/6jdkK10XtPPHHTGX7MtnhEsQ8ZRjR+l?=
 =?us-ascii?Q?wBimbV6K54FcF5ONp6iJ69u5C3LqUUhyvzpFkUCuHyMSGL3jLRFwxeS0kVAu?=
 =?us-ascii?Q?rSkbfnkwkdypM8E8eYp9gaHWqyrio3AeGAZCmxk4jgQD/OqcDAoT5O4=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1Rw+7g/kdgr0PYeRyH3peZ6i/Ttdn+nGycDyvAegdALmRPH5ekvynXdDTzej?=
 =?us-ascii?Q?KHq13S1y6QTkYjBWmqAiYfAhkeHAjKjhD83jrjAmAqRMWg8e5lHsJaR59D1H?=
 =?us-ascii?Q?e1Lme480aXfK8ZLYDvN2bBmEwJccV3XLCp8GSDF4FRMJeD2OY+efSjuP/6hp?=
 =?us-ascii?Q?m8xy4sCeIzbp1C2wrOpCKPe4+Ddpy7JTDnr/2X3uJ08v8szxhQV6mxfsNjeg?=
 =?us-ascii?Q?ZtVN551ZTJUH/cI1DcKeRtrKbe4vkNlNDk/YupeuW1zW8eRdmoqSV41J1pfj?=
 =?us-ascii?Q?mUNqPOLIYeLhYVW3T93mGeE+YNuGeNMMl7fDqTb89e0jZNRwsfDfIPgrC+kg?=
 =?us-ascii?Q?ZVQoo+TD/UA4TAMG/rOQxc3XvDRWyP3GVzLahW0DVutZ6JYFuEookJnSXGzN?=
 =?us-ascii?Q?FwuMZFo5ExhK4QNPwaKKtP5FJRGLyd/iwUKb/gtXMXfn6yeHc0Nncnz9ORvz?=
 =?us-ascii?Q?g+4iiHELXH+bPxNCORNK/FfQHxgVeskjjcAv3HiqPPaL53vglmdRbehbvEZN?=
 =?us-ascii?Q?LqN9SuWXJ8xCEWYcyigyPzUAOdLVcm1i/7BuYyimZiCvIviWk7fthuShhCmY?=
 =?us-ascii?Q?k5tUhEj9u6tx9FR9prZNo+jP/HbitLouIC+Z/xUkZIBB2lBDRGBvEJrNxsMu?=
 =?us-ascii?Q?R3dwpAGgn961Yq0nPTepMR5xCn2xCqw3uIHqt8vw7Kfo8/SF4GHRbuSrUkIR?=
 =?us-ascii?Q?zU/w3R03MYPcV9OHb+ybTL7w++gPj9JMpK0ReyOFCC8XHqqd/Scd7pEFzniq?=
 =?us-ascii?Q?bhaKVVOC3EsgHFkHD23dPL05IQf1BWL8GwayEIxvpem6DIUGyFgmO4z940F0?=
 =?us-ascii?Q?dlhxKyLI2mfeofeisxeJ1ExmzE5qo/ZQGr7NHm3v+U2opFXSTZ88zZAQGURK?=
 =?us-ascii?Q?p1DbCPi4SD4O1JbZ8XZDtFmpSZkhFU+UL/cIn+o3OOLmafbG7Q1rvaViygvr?=
 =?us-ascii?Q?F5tqiYVXPEN7rtpQSIo1o17sOKjKH1OkFtScnQ2xDOWV6EP+bR0fQAyk+F2v?=
 =?us-ascii?Q?Ua9pF1ALNJcVhtErn3mjQ/excB5vGRn2FOEyh01Z92PRExL92SvU+ewE4XN7?=
 =?us-ascii?Q?SmNiXSgEc9kP8QtBd54vq8960xtuRn8QcuJXMTsBtTqPYiiRrnHMvy6GTvUb?=
 =?us-ascii?Q?XhZyz10Dl059e4qo3P/CGa8vk6ovHre8XxdI7F0F+j/9F2mjGwZncVV7bLK2?=
 =?us-ascii?Q?vu7ANQHFsL4YlQoi/IvM7LociqZkUTQfuMSl01Y8lI4Zw96qXN2/+RHurHA8?=
 =?us-ascii?Q?8b5TTUqBvjA5+4Mz7y4noC8yfJ+PchP/LxhT9Dm/xKgI9GNcLKnmsCLYZl6V?=
 =?us-ascii?Q?i7NdYlDJOPjhOWtQBaIb0BRi?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <733DB41099EC54418A21AB886B6E9FE8@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2399d519-5f52-49e2-242d-08dd5755115b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 17:35:03.0961
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB7281

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 70fdd8cf9..f7fe6aab8 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.43.0


