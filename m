Return-Path: <linux-input+bounces-5391-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC11949230
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 15:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B757E1F27293
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 13:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6266A20012C;
	Tue,  6 Aug 2024 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ZQiHBpfy"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2102.outbound.protection.outlook.com [40.92.102.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D81D47C5;
	Tue,  6 Aug 2024 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722952298; cv=fail; b=lZhGlzRzs3/ui16akFSsU8LZAtgTZIWp5nArq8fPHToWX+iltlplSFXLLncB5wrA5Z7DulSAbAyBnjQPhuwQHoXE8p4hqCiqiBYIdCe8VOHwEYc2oZzBke/I504i5yWoswCXT0rJcENq+NrOcIODodXgjyahkJOGpzJcKUUZsQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722952298; c=relaxed/simple;
	bh=DSIn0rCuzaMxDHKXX705h12J8fR+BBIGU0iKhvR3YOs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jFCipF4d7pcsk+Kcl2bdMTxRcwgNUzPfJ/udOy7qYKglsGwM0UcW84JTja/w+m3ZzscVn4l/E7R4BqfKkszOWPta28EAPBKmcfM5duihAnJbJX4qvscl5Rl3atEZjo+VD3d+SCZQfuAMiXCm9ycLb3w7XEu0sXgH55h7EEJdpYU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ZQiHBpfy; arc=fail smtp.client-ip=40.92.102.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uBaZfmIhAfOlnH28Pme6QwttPvaxeHE/jhC20Bz4VhUvDb2T+FzYIHZJi9ASPHutvh2djrMVt5i1ZmKJrDMop99c8QtgeIQEucgCS00cTRxoBc9w+g73/ImCTnAerxB1RfGe2/PqNpd+Ii5UlJ4fyAF2LRt8e2Ffko8o8AOB+c3/3+ytFe0l2Tf3GPvHouddsYjiL9lsy4mUjzD7OvipjOM7LGaKtjnbXYIsWPza6wi9qRRmtBlZ57N5q0PuTnhrKNev5+eTWPTc8Vp3KjX2+0Y0PetfHIaP4ZUM0um06LBp3JnvtJKI1AE902nMsdLpfsiC0p3OgzZEqOXPkZvTrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=J3H+1PAelmH3RLaDFEuokOKQkF48/Q2pHWa8NO4F34nXcdRB8JAq47K/91l6V0133dbXVqXVNvu+WJC+QBY7sYwLOKP3ppxMZ/zyLtch8GqNG06KF8t7D5zglNBj7BiF/sTHjPMWrDaH2ABBvkBc9ZaWx06fiTLAG0w6i8MtKKYDVKz2NhEUOc/DXXH4Xakb1T34e2j9n65QcH9nNwRNSthO7xKQIiaUhr2wtnBuqpsIYTA30FyIDlJNFuXbow/LiMvkisAA44Ecp5VOgC6l639HNTa5lcvg18Bxg9hCMDgbOTvZFFVP1Ft4SoLGbzBNebLPmUKpWoLMAxaHKu9H5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=myY17nFmSwRYTFKqjQNWGfiM/kNxDYUsRpGSdEJLqhY=;
 b=ZQiHBpfyi2EzFF3N83nlXJE0SydzK1od/cYDIjoHADui3Dh8E4FUwyNNCO66NqMFmi2dnYsaFZMJ43QCNrjhZM/PexGE7dNXXJdD5hRRZorZ5zQl8PGeZtdBOk1K9RcM4JfAXUn1ilO5S4CYcyJVlraMqRoVvvs7V1ULV86wfFGXkLTcwJTmiK3vNzpBwcsL4LJG/Smml4QffNmEz2elJ8UHkj5vC63yquF163VuTc9iGvTDd9cUkFayxqIKWPYRD1OLZ6KvHJsABkjWerfKit53qvdZmhBvEq1ETnBNVVJ62pv6Z+OmSCv6DofuivGj0IPBsqd5AFoF1qs72o+QlQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB1046.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:139::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Tue, 6 Aug 2024 13:51:30 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 13:51:30 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <gargaditya08@live.com>
CC: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>
Subject: [PATCH 5/9] HID: multitouch: take cls->maxcontacts into account for
 devices without a HID_DG_CONTACTMAX field too
Thread-Topic: [PATCH 5/9] HID: multitouch: take cls->maxcontacts into account
 for devices without a HID_DG_CONTACTMAX field too
Thread-Index: AQHa6Ae9lThwy2qR6ES/p9QYwNVDxw==
Date: Tue, 6 Aug 2024 13:51:30 +0000
Message-ID: <BDCA0457-7A04-4705-892F-CC8DF493DBC7@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
 <C0F2E161-BBAD-4AF7-B39F-015A5A609CD4@live.com>
 <C687A5C0-9922-4CDB-85C1-096CE9D82847@live.com>
 <9223E804-286F-4692-9726-2306361F1909@live.com>
 <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
In-Reply-To: <C2CAAA64-500A-4D76-905B-DC3E2A884941@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [ME6FHIqE93f3ulqQe1URnSohVGDukH1UIXhoGLEliZfxBIWzYIwlKSobRwdfpNU/bjO7uj9axPw=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB1046:EE_
x-ms-office365-filtering-correlation-id: 4efbd294-8adb-4a40-f1e8-08dcb61edff5
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799003|461199028|8060799006|102099032|3412199025|440099028|1710799026;
x-microsoft-antispam-message-info:
 LYS2b7Yza0fDIyz7thDkNSiKAOFWevibpyg4qa5yOqsdRoksS78Ba17s7dOuWcK0fiSVC1mQGNFQ07zY68eM3WZfqidCLdZnP1KK2JYZE3SSOAJ7A4QrQhIhVrY0Z4toU1TJTI0+eqTkN3vwZ9UVjawDYLlcIkACCP/6KPZSTku9QHLpO2JeweuEwG6nQgCMayqdex4lYRokGhiciIyjHApJXXP6iwXOExwwfADcqDg1pechm3A00nmqAo36ttUMJ581vl9mQT0PszaDNpQQGl1RfxXVEmLNhYRxBiWvHTSUAseyZJs91lUuV4ZVmeId714QksgmY1m8pTB3o96/lSkM/qJhJvU6/fs8jxZhMamvrNfVN6nRRuORZK1SVYDdYEEYIxMbJRrTSMGLRTVbphVzSrms7DPz3daljEU29SU4sANnur4j0msAA3lmOXKfDzH87oy8tfL7R21SFKFXhPDOMYWsvnpwIK3Tk8fPO4Xgh0KCj/MmLCvACGaHszuzXwPMA0j4kQ5ALpLJg1n6noW4cP5Rc73E60kEG55mX1h04vULbapcTrecEQCM6l7znmDDL5qDKsPqcBjE8aEBm2qrU1/PX7nTMxg1kXrlUAUdxtY1kPL5cz1jwaZqfZdsE0kDe50SMHlgIMRmcfqzG8z4fbKOrdi+gaHhMWN4iZDJSR+XjQNNqjhVr26p6oyl
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?OQ8nq2jyO+IZipT3jX4HYaoScS6RkzhycgbT5knfy5487g9y5PquPEfFbBRW?=
 =?us-ascii?Q?zgRYvpQq5BQrOxwcOkz9p70eqzqSR9+s6qmVf6pWkmiOLoZ0JnCa8/HBs1Fi?=
 =?us-ascii?Q?pEkAr/WViUk0/btHPkr7eaexuKD97d74pAj4pYqDXHlWNrhviVHbFsOKVv/6?=
 =?us-ascii?Q?o2zWiXNe6VwPfgfC17lai7iziFpVEDgimaZRm0o4KL6rIoJ4EM5CErh5ejsf?=
 =?us-ascii?Q?vwd7NCgvhzj7G7p/AUY1hkNSHKAd8cMFHPFhyyeFY1r+6/KnUl3kq3NqeyTJ?=
 =?us-ascii?Q?NNo0/bJdNZeb5nS6vOWogxdc6n5zE02yLPO2r68ZNzzoYFhJeDFDjA0XutI3?=
 =?us-ascii?Q?s67PhuXh5ym5lGRkUQBkEKpRNae6tXRethA5v/i6ipJJp/ZeZNqrXZK8kOj2?=
 =?us-ascii?Q?mmjB7Xnk2GrfC5kKFRDIu9/C2OaSBKC51VU0XirLDN9SXsaAJt74sLJiLBgI?=
 =?us-ascii?Q?mx/THGDb1GfaYoP+G6QD9d5w3NVJncBN/BtZIy/byNkwsv1uJczZPmKRaJTS?=
 =?us-ascii?Q?gvEH4Q+unKQeahhtTlQVSwUtLm3DpklsaJe1ExD8Fk1ide85dMy8Qq3xJ275?=
 =?us-ascii?Q?ln6F0UnI9Q5hFhMtYXt9GL8b8vCKKBeeMxZobe3BW8Gm4sNEc3s+UEQSEu76?=
 =?us-ascii?Q?cZLEhDQaa1GPQqZqk/y6dW9CucgbKRpBUi8R/Ga5LPIUfZgFqWxjzuf4LHNz?=
 =?us-ascii?Q?7aGwk1hNgcW3LsJKYYwK58A/+j2uSF/HCzO/s5d0ew7p7c9zBH7tIjRRCFve?=
 =?us-ascii?Q?Mhc4cG5vg5hpqLrmOpx+bF9pqpcNlv62MelI3Jg5lYeBe3KvkQk8ApY8lNU+?=
 =?us-ascii?Q?C14L4McqHbpDWcEgOR7qskiI4WL916qvKamQxVUeZisZb+rkAy5TJ6JQmA4z?=
 =?us-ascii?Q?cT+FgXcf6UYUozwJhdN0L7Tz5kTRSyPdfDRYZ59epnyqMjfIzmez6xgvxArT?=
 =?us-ascii?Q?CO7nUtViq5dt4eviTsxmJghDT33eyxJHbst07IKHZ1oGALBuiE4idnQkNuvw?=
 =?us-ascii?Q?UHEOVOGesGAx17fILqRvWM3HfFcWKcjXJ47iN51B3eUqEFa4S2xzaJa07+Vd?=
 =?us-ascii?Q?ofjb+ajo8Mb6x8Ana+4klSMSTWPMh3uwWNj+DJdDOBFl2nR+9N4a93Cdcqix?=
 =?us-ascii?Q?RfSOmNhdby+VRV3nvdAANr+FvpAXcXA/y2EXMKGxC6nUICLP8RHfGzemsLOD?=
 =?us-ascii?Q?9LKFkyFVeNWcoSVhh+CgBgz9Gandokhq0Ugj3zbmMmur0TxJXag6dkadBF5V?=
 =?us-ascii?Q?PBCF9mr49AmO5gs+a4vD5bR694oGJe86G+NO7Je1B3QZJuk6UBbzaVICe6en?=
 =?us-ascii?Q?qMvphpMEW8JOqXlgZXlvrBt1?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C1C98785BE008B4690C6D924F88B47C5@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4efbd294-8adb-4a40-f1e8-08dcb61edff5
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 13:51:30.2334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB1046

From: Kerem Karabay <kekrby@gmail.com>

This is needed for Apple Touch Bars, where no HID_DG_CONTACTMAX field is
present and the maximum contact count is greater than the default.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 571435da5..60b675cd1 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -490,9 +490,6 @@ static void mt_feature_mapping(struct hid_device *hdev,
 		if (!td->maxcontacts &&
 		    field->logical_maximum <=3D MT_MAX_MAXCONTACT)
 			td->maxcontacts =3D field->logical_maximum;
-		if (td->mtclass.maxcontacts)
-			/* check if the maxcontacts is given by the class */
-			td->maxcontacts =3D td->mtclass.maxcontacts;
=20
 		break;
 	case HID_DG_BUTTONTYPE:
@@ -1309,6 +1306,10 @@ static int mt_touch_input_configured(struct hid_devi=
ce *hdev,
 	struct input_dev *input =3D hi->input;
 	int ret;
=20
+	/* check if the maxcontacts is given by the class */
+	if (cls->maxcontacts)
+		td->maxcontacts =3D cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts =3D MT_DEFAULT_MAXCONTACT;
=20
--=20
2.43.0


