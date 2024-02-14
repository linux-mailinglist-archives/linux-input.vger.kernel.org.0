Return-Path: <linux-input+bounces-1919-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F178554F1
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 22:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12AF28E342
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 21:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4374713EFF5;
	Wed, 14 Feb 2024 21:36:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2102.outbound.protection.outlook.com [40.92.91.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7846B1B7E2
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 21:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707946613; cv=fail; b=gUpTBbzydb5FRN7edbTE7/3W/EpH0vz8cYcgWOlkxzvLezkKYfKzdLeO2uvqcQCSZs89jSB10Mjcs62ofu01ISaY0dZ0byVno5YCuGjuxxH6eoWzohZphiLvhCX2KnNqklgG770MzstmB44x376Pm+qyGaCRi8S7dAP6C4yx7lQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707946613; c=relaxed/simple;
	bh=AzbLSvqRf3/n9L5mVtCa2M+nIoEQJ2bnKIZ1sD4vJ48=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Ca6Rv44RR/9kRdAS1JDlkdvJx8Sm8ZtDj3SpQcPW4zdv94G24pBgohpEg5gz9eXJDjIMZYYZXnwVZ+jz1ZJ1G8/iReboNYAqByIc9oUyb1CF8cppyu7JjExkNl2oYMLFrIDQyRF4z2zu+cUwhzKNH2JDYRfcsT+MPM/fTC42DZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt; spf=pass smtp.mailfrom=outlook.pt; arc=fail smtp.client-ip=40.92.91.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.pt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kU+ca4k5cxAfFXwoc7BIrUSg7YvLeNmLDe2/HhMwBeHaMK6gpwyI80pjB6oMQkg/UdHaastIskJP3fhjACnx37rUKrwvEDIrHyL8ubgqBpLlOem4xqXvs9EHP7naM3HhKgufdyrsWjLjkzXJL3DoxD9OIG9MlUR5DJHwxZjWFginBDJtvWQ1Y+M74oSKmsALupuWzDoYQl5DxhbN2l+p+Imf4Dw5k/timbUXSMr/bavwjgt2uQ2+sryEOPWI0LXGDwPUWPILIAKSsedZw0XU17oW322JlpFjcGQzfFIwih7lYfW7MtOW+RCqEPCRYMjDAn/ngeF00g5rIm72EwvcJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9LIZlvlePVN9O9xFUns1txwT1KWqSK2z9tulbdI9jI=;
 b=lcgFvn1nNnSCMZ0krw+x8GM0317wYyhzrrGgRXuA/0nKTlBxIPg5DPzeS+x50dRoaW3TJTrzJnN+CfdXWuqUXUOWyNj7qpaNYGVIANKyX97BqFm0giXkH1CshZplPPdtZdHmZbSOn0HIdDxAodkzwlZ7zGYAlGKrVBk/TLjRROpdUlJiFkhy5awVTmr1Wh+xLfqQKHcKEWYb64hlUnxtxJ9xpPQ+mnJzpnXYHCwhaEmKFdzgx62nO+xelKOLPAQMMPE8/QDfWCy7MY/hrku+58xBME3k1xVJF6bMJ8/3JpkF4HzaGDwTeQKuCElQhBuQuwQfIsL5qvwlgpK+xxgZPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3bc::10)
 by AM9P189MB1474.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 21:36:49 +0000
Received: from DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::d8d4:7065:fa11:ba45]) by DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
 ([fe80::d8d4:7065:fa11:ba45%4]) with mapi id 15.20.7270.036; Wed, 14 Feb 2024
 21:36:49 +0000
From: Nuno Pereira <nf.pereira@outlook.pt>
To: Daniel Ogorchock <djogorchock@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH] HID: nintendo: Fix N64 controller being identified as mouse
Thread-Topic: [PATCH] HID: nintendo: Fix N64 controller being identified as
 mouse
Thread-Index: AQHaX42VyViQiBbPC0CPbTAD+/Hm0Q==
Date: Wed, 14 Feb 2024 21:36:49 +0000
Message-ID:
 <DU0P189MB204428CB8C2D669B4315552EFD4E2@DU0P189MB2044.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [OMKn1wF4CJB2KiAYOXwDFGDQmiAISB3i]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0P189MB2044:EE_|AM9P189MB1474:EE_
x-ms-office365-filtering-correlation-id: 7b0731ed-d695-445c-1751-08dc2da50cfb
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 dQoyl/yeEFgSL1lbARMoM0bZiIKX7Ve0aPhzcOIPiEQozQ8D9RXOzFjCMNmID2cy/4gOHO3WwTkk69bPjItyS3zJXNLhELdxZJMH+2WwNJLvBp3Jj8Zk6IAuFDQT5CRDOs8s3eKg0k3iK1qz8xQefc2iI9s/+HINGANMEjxs0wUAKjeUKwiMiwC53mPkOKTCYSQCnYgdgUU4C8Ei/xzJSQPQw9xC31RZ0AfzQyLKM1YKr2AhIfMCOZdsTnQMPayk/tTD1YJfBJJwC7W4y0FhycIZ0o6ZXOktOgisV/2aWvjYJzL7nuVRFmQl0HAZy/njXh8MuFxU3DmsA4xUnBuTUoSIjw08utAALhSwDgj6eCeSs5A3CHFcms3agHOZMSQGa5KDrCuk72wL3viGN25SVdo1Flqnalh8OaS/JpecWAryDQhJIo5mHh5DYPSj7h0qXaJQDARvc/n0i0Eiw/eVn7mcjOqKlRo9CSw/n2n823Ou4PLb+zXONGx2OIOHE4RZGRfNf3FzUHlQbEd75Ou/z1tOiwa79v1ez5/wpfvXhKXHRwgvw23drgfNiB60igdG
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?f+wHPl5erugbG4yTY1MV0eeaoQYUrNCZbTSywIy5HupNLe0nVrY61Iuonn?=
 =?iso-8859-1?Q?LwNIvxdHnp1FwEMWQy/HDRVwf+QtdlejMwI94lD29PtuP5RiB74qs6vM6e?=
 =?iso-8859-1?Q?jwpMrVwD5zchgPkfX2TpxgHm0NSLyoOaAD3RTM2KpNcYAGl7UNAA3W1jAs?=
 =?iso-8859-1?Q?Bnyplc5x5U/rXlSdg39WyG461PN/TsLmYBpeUSoZOgA9mb/lcXHUXcUvzS?=
 =?iso-8859-1?Q?B/kX9Q3gZCvEdiyKtHudd6yfoGGfU6YbhdThmiHHUv0EeMSahPJw/eCsEr?=
 =?iso-8859-1?Q?FLXxwRLyV+Zm6RHneN5UIcRvv5BwxLTZedbtV3Jjrwu713d1KfHaOSMvn7?=
 =?iso-8859-1?Q?pEi6zjkumGdeu9MuSkQeh0yeWMw+cjWVS9/jRU2czRSRdTcDqYbP+78QoL?=
 =?iso-8859-1?Q?luTABylrulb04TlucSiCIS+63vn2yEfjQ3DfCzov+nay8pnQYmELwvemN5?=
 =?iso-8859-1?Q?hz7ogb/qNE3/65dGMbY/Hzp98uxQVaubfZXq/cxvAZDJ/otaCwJLVuyZfo?=
 =?iso-8859-1?Q?9Cf2i9M1KwehY8Z7rIxHTnfjOXtGMl0i4udvcGf+T23Y63m2K971/QwP35?=
 =?iso-8859-1?Q?pGToIfOPuJlLJx950DRI/4NYNBnGJzP/f0SuO5dXAL79IW+V5rPg8L0x7Z?=
 =?iso-8859-1?Q?8k6MuTHT6XmvezxFg8xjDjQscvzI0iFsphdfR3Fzbv+SrzR/Hao4HCRfO0?=
 =?iso-8859-1?Q?vlSJUxGPqoSMB1P82Lu3yXAKWt0/r9NKybBmtNz/Ab7xWNJBbpMQ25lgh0?=
 =?iso-8859-1?Q?9aF2l8gcD3zKv29XVC1McHnRLXrdEIiilNT3ibXXOebq0QcWOjzccq9bRL?=
 =?iso-8859-1?Q?rw5Emz5pc/I6b/GgW8VDLbgjBYzfdtMz2NQSoQOY3hLDLplbJInksUl8pJ?=
 =?iso-8859-1?Q?K3NoE9OdODTUSYGO1ILIyWQUBM1CPDeYSLYutL7K9TiuTIyaOl9IE6Q5b7?=
 =?iso-8859-1?Q?XAc0xQwAWNKBCjuUPTyfveiNZlH688BJA0ffJ5t6W0PhDOPmOaADNKwa1o?=
 =?iso-8859-1?Q?XSzI2WZ/2zspqquzhvw2lnCF8Mrq39/Uvjbvj0COADksLoTeYwwnjkKhgk?=
 =?iso-8859-1?Q?HWX1SsI9tZLxK3OnVFt8/vJCoQcLgLixrI5CVlYULvdvPkSvLQLQsVGYs7?=
 =?iso-8859-1?Q?JRthap8XAmuaS5VFXr9Aezetx2iDh1ghRY8yOPJgs+ibrq0hh2GgyuV6Hj?=
 =?iso-8859-1?Q?NXlPZ0VqclC8EchGRXMqj5uNoUyro2mqqfkH8jHv1CRXTWWg18GuIhdskK?=
 =?iso-8859-1?Q?8z7Mxv8A2mHAZtGWxTFA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0P189MB2044.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0731ed-d695-445c-1751-08dc2da50cfb
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 21:36:49.0262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P189MB1474

This patch is regarding the recent addition of support for the NSO controll=
ers to hid-nintendo.=0A=
All controllers are working correctly with the exception of the N64 control=
ler, which is being identified as a mouse by udev. This results in the joys=
tick controlling the mouse cursor and the controller not being detected by =
games.=0A=
=0A=
The reason for this is because the N64's C buttons have been attributed to =
BTN_FORWARD, BTN_BACK, BTN_LEFT, BTN_RIGHT, which are buttons typically att=
ributed to mice.=0A=
=0A=
This patch changes those buttons to controller buttons, making the controll=
er be correctly identified as such.=0A=
=0A=
Signed-off-by: Nuno Pereira <nf.pereira@outlook.pt>=0A=
---=0A=
 drivers/hid/hid-nintendo.c | 8 ++++----=0A=
 1 file changed, 4 insertions(+), 4 deletions(-)=0A=
=0A=
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c=0A=
index ccc4032fb2b0..4b2c81b49b80 100644=0A=
--- a/drivers/hid/hid-nintendo.c=0A=
+++ b/drivers/hid/hid-nintendo.c=0A=
@@ -481,10 +481,10 @@ static const struct joycon_ctlr_button_mapping n64con=
_button_mappings[] =3D {=0A=
 	{ BTN_TR,		JC_BTN_R,	},=0A=
 	{ BTN_TR2,		JC_BTN_LSTICK,	}, /* ZR */=0A=
 	{ BTN_START,		JC_BTN_PLUS,	},=0A=
-	{ BTN_FORWARD,		JC_BTN_Y,	}, /* C UP */=0A=
-	{ BTN_BACK,		JC_BTN_ZR,	}, /* C DOWN */=0A=
-	{ BTN_LEFT,		JC_BTN_X,	}, /* C LEFT */=0A=
-	{ BTN_RIGHT,		JC_BTN_MINUS,	}, /* C RIGHT */=0A=
+	{ BTN_SELECT,		JC_BTN_Y,	}, /* C UP */=0A=
+	{ BTN_X,		JC_BTN_ZR,	}, /* C DOWN */=0A=
+	{ BTN_Y,		JC_BTN_X,	}, /* C LEFT */=0A=
+	{ BTN_C,		JC_BTN_MINUS,	}, /* C RIGHT */=0A=
 	{ BTN_MODE,		JC_BTN_HOME,	},=0A=
 	{ BTN_Z,		JC_BTN_CAP,	},=0A=
 	{ /* sentinel */ },=0A=
-- =0A=
2.43.0=0A=
=0A=

