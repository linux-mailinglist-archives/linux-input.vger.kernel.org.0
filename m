Return-Path: <linux-input+bounces-5441-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BF94BED6
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 15:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F89E1F21D91
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 13:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6468618DF7A;
	Thu,  8 Aug 2024 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RjPwogfC"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2092.outbound.protection.outlook.com [40.92.102.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DD118C33B;
	Thu,  8 Aug 2024 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125194; cv=fail; b=ISUVLSb0OaKBz2QIf5wlyDq188vUE0fR0emhUixpu1HaNnc0WEaqcelzBsXCqnio5A6yWmGrgcrR/klJ7AX7q8MFIZz+TPAnHTS3cWXIbvuDe+F/cRasKXV8bxlZFbcSvxlt95yw/E0guOkl4o0paVYENU+DR6lzq8MC4BgLNtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125194; c=relaxed/simple;
	bh=Dh7ljb8d1FIk9yN7/+oa+AyXM21NVwE0NDEBbkhNouk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZqdXRdHLBvjmLW+YGIAmK2I/YDyCDfx6ihXwyDx6GQu6/85lUNJHhTBv6hpblj3bRylxarFk8qlMIOWlL5wLqUQkyIa1hI3ESzxmQ7cBC1odnO5Of6yXZdNuGmjQqiR/5ZlHGZ56cEUUgYpwqfwQI3h3ohp0Y4fJxTAoSs0D9fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RjPwogfC; arc=fail smtp.client-ip=40.92.102.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UejA/jTKEO0VX50wtMXI1ua4A4nzfi5tD8jGMVrUA+1goXcTtZ/UevVVxEWylLblNYi5lAckQa3rtDob65cPy4lKuMLKaZp0+YIUaNgq+bjleDY0WmlYcPtFwPIMtMsRQEFPCS+634lZ0+9vCIYtFSFgozQMUYjbmL0MsrF7tzuz/+u+4rZLSOHZhsKw8PyfsHFAO5ZPCnRqXhCO+rnfU9tnCqtFO+aeRqF8WKmBliF0urMZDjoPUjyGaP//3BLsY5JVxG6aNrhMmkpCrH4CzLAz0/DNmMKMbRGtRtdldFRr/7z8QSqOSzaND/APcn9Q0Ra+KvtIVFb/JsTARgX6+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=h/M4++iAmn1Gaoqm3MUsaJ8DQ9c9IraC/WVg+YJZvGzNgPUEEZQ/ZAJyPlp2UYcK9uGRWt92yI01k+KeddfJWL5pt/N1/4Yfd1d4BArZ4Xgn7+3njw5Xr3cRpLfZBV42akDYlGTlY+xpO9HTJ/EVuiLxT1u4X9EAVZqR5JbBpP6rQxi5bOKKWtdCpiQWNXTLk+m1AjwM9TZwmEpsAf2ocoe5mlftEr1dx6agOz7AgcZ+SahtcUFoEjXfOEWo+XbbJcvsDHstK/KRXr/9p/80sIrl+x9oh/y29SMZmzaTwAVOgDTFlKXbzO19XaJoTOJnH3LL28mNuSblvjk1juKVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RoSZyiqImFZSicR28oGP/RkEpGdNrnqOstKFEqFyhjY=;
 b=RjPwogfCBDle2MYcRVhRPP8C+4ir/iaq5i+MGqbvfAsN9V5b/EKyKosxXnDPo2EqU0wmxFkK2HXAph5iw1vcgRmjS2aU5s/yM2PqqdqJmnQmmoBHHD2fI5j3otxnILd3bwxgb/7WI5PeDTttn+IIoBi0PQvdAjpbRnVeJ48KnhFHou4AKWXwH2OzO0dyeu0zQNAUEuqa5VOOcbc878ZUH7fKd5cJcYYADQvw14SXIsRF6NhZqMOgIweZQWkcJn6jxGYJbPwL11cdLKJmWH8+rbY3B5FtT2gKQBN8kBEqMXYZxGekSSw9A7d4CxvcueKWjLYxxO3sZ12L6arKKlQcLg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN2P287MB2013.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 13:53:02 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 13:53:02 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 4/9] HID: multitouch: support getting the tip state from
 HID_DG_TOUCH fields
Thread-Topic: [PATCH v3 4/9] HID: multitouch: support getting the tip state
 from HID_DG_TOUCH fields
Thread-Index: AQHa6ZpJi1XsIfPSFEmTHJbeKBGApg==
Date: Thu, 8 Aug 2024 13:53:02 +0000
Message-ID: <7EF8DEE8-61F5-4BF7-875D-FB71B97D8BD2@live.com>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
In-Reply-To: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [Y7GMhV0wAi5NTFmeaZWGqNPbgNhmc+xeMJG8KyuvviJBtulQAGwaCptFrI0Y3X0Uh1y7OFdFDy8=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN2P287MB2013:EE_
x-ms-office365-filtering-correlation-id: b6248076-4704-4dc9-6736-08dcb7b16ba4
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799003|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 5AOtTEaCJFC57aaw5nR4mcbUkFg1FGsK7ROM+G3UBmPAPEh00r41DEBYpm8zayvbssKEhI7hDcmR3W8RcvvpwsNC42DKy60av6JV0DFy14OwZZBSd0t607MeOzdrankpVO+nwuOogOO0CGGZ+Al9jIIfMRc0+4SKWejPyUQgW40a9WXFriR//fdHyAuvP4iwlkMHhmqJ66VDnLGOK80Vik4n3yXsfZB4vWI2cxVuvH1xXWo0JBCbqqTE9AufJMqAEay93JxBuDeEamiUkbbQCD+CUVnGZA5XxuSgF1E9UqIpZxF2B4nGbVAvsMJiBMZ94Jhgj+xJEqDV7tumrQna4/FKcQMVhAZ6T0Yyq0tCsm2Rs+vW3gMa6WJaUGvAfZsm1O2rL2kj4RgAGpRp3IH3ogDo2M77oVG/pQ0GIOqVFGbXNFtbZhUTILUG1fuiTmsywP8oCweqqmhvbSG3vckERYC1rsb2CD8HLNEYp0brODyoEeCcBjOp5vVrFHDr6vaICNEhGVjnvIRnVNl6vgEXzWs81C9eucVLkyEswT1EpIEN1S9lG4lWmWzh42a6+C4bj6BMdT1RYy2BJ6QP9/V7jg8gLZlmR5SlUv2h4yLOP40ULuGV4eiUJTH7fT4CjZ7ChRoY/BAZa0LRtYPuDP0zr1XR46s4jFe7UV+CaQYo3BuMCfUgwicF8OJb/RT23iSr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bk6byxcV5c6m3z4cGiYYXEXxkP4C3cDRc8h1C+aeampaX6Dyg+QOzyNBEvDS?=
 =?us-ascii?Q?wS1lYHJxw+a2vmZToJV+9zvb7lZiYUCRv6FOo+opHBY3T5y1OFC4Xhc9Ayuf?=
 =?us-ascii?Q?ZhUDD5vx0LN8IcL5rumlSX2OvS8HhKsQ3L84i8h6zS9qBwyW5GvE94tN2Eo5?=
 =?us-ascii?Q?m5pTJ46XmGLrTj2IDL7JlAiziWRWJO4hZLLU/TVZ03ZhIMbNZejnadAgnp8t?=
 =?us-ascii?Q?vfYJFwomXNlKy8SUN3jSjkJTHse2zrSUkCqMsvGdIvd9/9D0heLRRbsMUIvP?=
 =?us-ascii?Q?arZdqD/+P6lee7wNObyUXlvxqa3nKS54nd1fhfGIftA4l2wjf3Dipcf0yQOZ?=
 =?us-ascii?Q?BZRX9sXTeaqTzkBPY0eF6Wlfx8Lo7hDbaQ6lVFT7U1ApVS6D4w0glRyvo/Gz?=
 =?us-ascii?Q?zsf+cFbn+xnAZ83GsDvzTObmO2en8VXFUSTWraOIZ5f2N1opCDg//oFa49X2?=
 =?us-ascii?Q?DB1YVegMdGrkYc31bqYuKKd7HR7WytKgjoTLKDM0GfIgqCif3X15nkUSogra?=
 =?us-ascii?Q?J4lZN+Z3pOY3rTG35F7/jZYc7x/ugegzuos6TMvtNM4lX+8vEmqsF4HA5cZy?=
 =?us-ascii?Q?qmehCbJp9OlnZH4yoGsx+oLsu2GoJG09TNzgfg7q8SCpKyG3CPzawjrVmtdx?=
 =?us-ascii?Q?aiE0FTMrhwE8Egt2W2jZns0MmRbXjvRLWdUrLxMJL7R5m1EpHw84t/AGAAcF?=
 =?us-ascii?Q?mDDtLVStPvW7XtzflBf9sYDWjz5c+G05mq6ByWNohnKKmwUoMoe8pNeO/xHx?=
 =?us-ascii?Q?bZWi6VhEOC+Lp9O72Qqr6NoEo8YJg9Sx+3uIzHkhMTPOmrejeZHdQjxO8gpy?=
 =?us-ascii?Q?7CfWhKxukVvfWMcIeKgcdn08r36Ac0LnQPKzT0Wd94f0Pa/9KdO9n1n/LFH5?=
 =?us-ascii?Q?hVmwQ11sMsdXuNxNuOKPyY6sWRykoBR0Tm7DeRAM482WNuAoD2wUjZgPhzyT?=
 =?us-ascii?Q?iIhz9tsxF+hchniHHwVMI6Q36/B+f23eDPWo2cJou+mgsq3Q6gzIAlNMqysb?=
 =?us-ascii?Q?jM+VErDHzE4/fJc2Yqt+afCdtpfuZ8dHh7ZGX5UMUdotIK/mu0FPELHIUCFS?=
 =?us-ascii?Q?xIBl6E/hRqa8bkjSrKhmYECquLPAPZnrk7b3C53mL8Ss+xPHbS2ff0M3QR6Y?=
 =?us-ascii?Q?DLJW83QjqwAcN2KSRrHGZrBGlapQnbxP0++wZ1XnELh6j769dIdijyZFEAKU?=
 =?us-ascii?Q?XKoz3zY77v5sR7e+IPV7qmsPwoh2X3XsOKcsqyIkj0cWb3A4G+635lus3+I4?=
 =?us-ascii?Q?6ctiVY/adiI3j1Rw7RPu8tPCahw9FDmLJJYdSXtJ9IrVUB3x21j0OcpeNrxg?=
 =?us-ascii?Q?4UhIFNWpQcWwZV4tYqtWw9dJ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1FC39766D3F9F9478B80AF62C779BB21@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b6248076-4704-4dc9-6736-08dcb7b16ba4
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 13:53:02.2451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2013

From: Kerem Karabay <kekrby@gmail.com>

This is necessary on Apple Touch Bars, where the tip state is contained
in fields with the HID_DG_TOUCH usage. This feature is gated by a quirk
in order to prevent breaking other devices, see commit c2ef8f21ea8f
("HID: multitouch: add support for trackpads").

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 3e92789ed..571435da5 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -72,6 +72,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_TOUCH_IS_TIPSTATE	BIT(23)
=20
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -809,6 +810,15 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
=20
 			MT_STORE_FIELD(confidence_state);
 			return 1;
+		case HID_DG_TOUCH:
+			/*
+			 * Legacy devices use TIPSWITCH and not TOUCH.
+			 * Let's just ignore this field unless the quirk is set.
+			 */
+			if (!(cls->quirks & MT_QUIRK_TOUCH_IS_TIPSTATE))
+				return -1;
+
+			fallthrough;
 		case HID_DG_TIPSWITCH:
 			if (field->application !=3D HID_GD_SYSTEM_MULTIAXIS)
 				input_set_capability(hi->input,
@@ -872,10 +882,6 @@ static int mt_touch_input_mapping(struct hid_device *h=
dev, struct hid_input *hi,
 		case HID_DG_CONTACTMAX:
 			/* contact max are global to the report */
 			return -1;
-		case HID_DG_TOUCH:
-			/* Legacy devices use TIPSWITCH and not TOUCH.
-			 * Let's just ignore this field. */
-			return -1;
 		}
 		/* let hid-input decide for the others */
 		return 0;
--=20
2.43.0


