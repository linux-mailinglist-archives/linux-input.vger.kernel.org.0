Return-Path: <linux-input+bounces-12602-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 66344AC545A
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051408A43A8
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65255281370;
	Tue, 27 May 2025 16:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="IxXnceBs"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26D283FD2;
	Tue, 27 May 2025 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364894; cv=fail; b=trwnhosCZ6Zvl7zIEogi+qgUZzxZRYMOdE4+CKMZELMy3+WmtrPYmbm+MCPPd8TapQKlZ0POPu+0liG0ywj6YZroZhWe6E6nhyIXipXetr1Kxqr7wuv3HKGj2fKPl45U/NKhe7/FBVeHiDaBrRdRma2cEjzx/37MkUXh3atabkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364894; c=relaxed/simple;
	bh=5FBbF0iZK6CBds/IbZvEvcRyjXM9iTAjuJ6W71u8zEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bknq+wJTzaklQ2J6cgAs6yNGWjyo+SI3PFI3/z1BZo2JMdiqODC8eyKaoW7oHwhRjQP+iKkfHo+XfRDMxUxLDuVVg9fP3pIi1L8+oDgziv3DHDrCimfSQop0mNoAk36+EhjcBbLjPfILk7aFyC5XkyxgeDz+9PCu8epdsxPemNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=IxXnceBs; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qEAmEfq38kGczn+w1mn/PSlWFDf4+iJvjmQt1Td19sRR+CCDRp7jcs2QP2LfEfDN4Q7xGHzdfMe8m7Lw8V+HSxwHX0+uO6qs35Y5s6Ap8BAK2CCzrGfECFOdn/QORS9KPrvQI1520TvVrPTzCYs4FUK5scTk6p+3v1TG5RaT/DEPQDlatu8Fkpzy5n1CwXVdtqBeiLtmPUbi5b6OBDAZ5wLC2UgVJQbyrJnxEnSvc4rX8mWNg6JpXw2Qgc4gmC9rMIIoMP5UdMGDVNad03dFexv3AVgm2Y3tsxDRsHZR/HgQ8s7Lisnu9Gcs/99XBdB5qEKnTfjnEiu7Bvh41OJKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iOPsGbGQJUQdavfQJXSvUDnbYK0WIC1lX0NKCy2ZrA=;
 b=KOZrDANv+d31fidkfiHHIk7DPa+CA+iMT8H/eADyc5VLRGpfzOKWk++19QnSW45xbhooK0F0uv8R/XfAeCTZ+J1zxst9i/3+PJTF7dEix+5Id7PwTxqB6MrOeQm9kSB0OEOwo6CxpTNNkMnQIwRkM/IkyWklceEUEAjGWmVeWk1FB37i3MD5O1T/9zWPdc8RA7Gm37/0GTcIJ5cvpLiS8sXCxISFe1X4gskl928bdRy20NHjRFYkq0xYEhuElMBYEmRKk5PvuhEiKNSH6und5vCE8Z5Ea5mDh1zgHZ46/uGhvsQtsEYs29a/2j55xmHthxFKegRwJPKnlDnGBhmLgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iOPsGbGQJUQdavfQJXSvUDnbYK0WIC1lX0NKCy2ZrA=;
 b=IxXnceBsLI6nICZN9mNe015GW+pjqBHvTQWwBsbg/ljPWJQ1pleRnrv7CcGnxLEo/mUJRlMj8CbOfRF2nO6CGaHiT909aLmGaPFXM1ltMWvKatw1KBVHmPb+LChyx6NxW/MqBU+yyNtyb8MIwRPoempSFwIPbWqZPnbZegpsyZ4PG4W7GFKL2v1fvAY5qwEe7PyciSOV4DBa2fARLIW67FeG3dGHamklAkDT5uBjREAL1M0osyUuWHo7EXTpMEgrYDG9s/m/aWohh5zGAJNKj3+yk19Ko4Mp+fAIRuIh+xb8MP9bdgDLVzGJiY2S55q+q3n8UJ65k6isPIltGXMV3A==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:42 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 5/5] HID: multitouch: add device ID for Apple Touch Bar
Date: Tue, 27 May 2025 22:13:17 +0530
Message-ID:
 <PN3PR01MB9597E63CB9387C5C4C705606B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-6-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 34cd052c-4245-4c90-5970-08dd9d3f2d21
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8060799009|19110799006|15080799009|7092599006|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YfGdAvRW0ti1R3NgsiH1tPgXiF+oalPRXtaZFVjzMcBeJinEmd4/iKPJT8V0?=
 =?us-ascii?Q?NwyorhdGmm1QHbpkwPvq5HGGyq6S8Ko9CMQh0Xi1bv6SkhHfnBpzN/XTMxUd?=
 =?us-ascii?Q?WA/9E+z+fPnz5LiK5w/Kercbh5iVYBBfyYkWjiFVPyM1rC0jQw2HMGslAg8E?=
 =?us-ascii?Q?I60TxOF9T2Y+bSHpvgVZOcahVFWOudKc2vdUPmcXfmnftUHyQJbjsMOKUq9/?=
 =?us-ascii?Q?oo7V/cwVYXlSl2gv9txC3F44llXOU3CbSQyGTQohc1kRx6cef6HQYkxoyrXY?=
 =?us-ascii?Q?HMTXfDi0zsY2O7WmAtlcb56bUMEvDXoh7u52Aaq0UTqFCkmXSxv5XU3WJFm2?=
 =?us-ascii?Q?+7edy/BGzcZF6qTeNpzlFN1EjjAvFdPHbUhdiX/FOcHYTy6cVol2LvSzJDCp?=
 =?us-ascii?Q?DHy4Q7gJ2/MROWdx1ZDtHEKOBmnkyHZvjf5c9lRvtqagidlk+mekZJGkVPAW?=
 =?us-ascii?Q?pM4QPHhk3/v8sEu+JJe/zKmeH7EGZoGspCn8UBVpm6shpvJwHXkhwFA0pJ2u?=
 =?us-ascii?Q?nZr+B+bvDTum68z0A+Uj/kikbdkcukYGOZcXU9iVjhLCbIB0ZPfmYtugoKHg?=
 =?us-ascii?Q?536oncY1aYd6d+Ycxo71f8emFGXy3e++C4mas4UVp/uDWL85aJr7s16T9yF/?=
 =?us-ascii?Q?s2/hZ2DvBcvpQeSjvTy485IIpzJsQ80h7rFlO0FCtTCXF1nOe8pEqO8PNwRi?=
 =?us-ascii?Q?LczM9WqMw7s8dpw8eJKGA0G1Yt9e2/yU26LbQWDhlxo6lR6agmiWshGsOvQo?=
 =?us-ascii?Q?+T4yHYAD9mVM4ZUWLhjS1Im5paVkWIEsQt0WMOgwrGm1CdZ7ym7l2lQs5EWn?=
 =?us-ascii?Q?2neBdmPpm6VYUEv1v2cQDmPaGtcByfbyLJgAjNVTFiOj3shdGSq9p9gL5KOx?=
 =?us-ascii?Q?mQPK9EqZLTHPHQI2kjg0/bk/1Ux4sIf/4HhLjU4cqR/NhOH97gOh0ZfbrEvc?=
 =?us-ascii?Q?aITMtVe8IV9FAWyQyhMxnJO14HYWH3veGLUheXQCvD0fI7q0GLrOqKR+VbIR?=
 =?us-ascii?Q?Ud2V+erPAgZuoHJSMQCaHQUsAcZN5W8fSUsIL9UKyP+Q6vKC20CYs3eY2qx8?=
 =?us-ascii?Q?cWfNFNM7sVSUqzu7AINx9E1lYNyjpSc8eIS2uEt3jMzL3WyViALjRZbSZ8Kl?=
 =?us-ascii?Q?gY0m86z6pDMh+o6PzyWUWO8g23tYofMZOw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h7/Z+QgDXAVuiRWiAmA4y+JFB8SLGOdHbQefrS8oZSUCS5YNZ1qLTV6OTqfF?=
 =?us-ascii?Q?oGF5MD9HXc77DjLZFDm/CxQ3MBxGwuA8EFUXPxkWhha+FLgKJhlRASgbM5+g?=
 =?us-ascii?Q?Z3/FnU9C4/054QPx5wCnkpbyEsOdhPH62SOaa2uawnu0r3QWglJ5bZSe7jJN?=
 =?us-ascii?Q?uGBINFACIx88fFGEjJeiKbBUQuHCqLGdnsvMRhyG6TwXxk71xAmkdAeJwueH?=
 =?us-ascii?Q?qYWklluVgKEEDNI1B3E1WNQ+Z+x2z3P+7Ki/8A0XAOpdmqI1IXoN0X06XYFj?=
 =?us-ascii?Q?fpU/QUHXitC+Y5wKc8ym+4pi+PEPGmjMjO8+KDLSNlr8J44QcSlpobu8wl3i?=
 =?us-ascii?Q?IOCEGsdvxTwXULLEGhyprwRx3XwJEnls5uf/oGpR9Z+3pDRNurJPR4AUZ83i?=
 =?us-ascii?Q?vEgVSr2ojrOZEWBlnbteIN+SbnSnjIQwFnAtWO/VXCUsoc3kDf9yZYBaB9jQ?=
 =?us-ascii?Q?T28b2LSU4+a84drX99vn91TqTfXBfBB3PqqHu1CcJ5W8cIfMRXGSKV+lNWHF?=
 =?us-ascii?Q?Cx8IviItCnYLAf9Qo+3Y3yST5BazgMNmfMmYHG0btZTROCHmZE3gzEFRyMKO?=
 =?us-ascii?Q?yvjWMRuhLD7yal8cxZQ75IUUF5TtAdUG85J37OlN8UAgWU45VUYtUrfWItiR?=
 =?us-ascii?Q?wML3KL1/TS0v06M7oOIFQJtUoUiZRgl+e89+ZkL8rnplZSk1zjaihcEzFVfb?=
 =?us-ascii?Q?C6L7+gipvkhrWHkda/CxLEWTiDFW6tglT/A34d3uCviIWm16KkKAkH/M94Qi?=
 =?us-ascii?Q?OuAl2r1za+j4Kr/ydhXgP5K/dVKjdfqkfKr3KK0bD59Xy4etfktgwb96axc/?=
 =?us-ascii?Q?GxaLcM3PdCgcWa/lUCWJuykwX48yffYmiMpkKjWt+iCQFmdVl7v0EH5txlHO?=
 =?us-ascii?Q?P1LdQi0dHHHxNZghEK/p2j0UrbP5IfHuzckfL6smgeRYzGu0ef6N4VSH7jQu?=
 =?us-ascii?Q?6RP5NcXnLAcFX4CaKqlvOyV2b9ux4+/DrP7yZtXz30pXq4KEGSR298G390p3?=
 =?us-ascii?Q?8gbhZUF0hmuxF1/ltBJ5N8akC2f5oz+YEQs6JUDgzoQuDgAhPETQbG49ABfB?=
 =?us-ascii?Q?xdaB9FzHu1EH69zSVdcOsUMD4D255CQqoisOrJ61qKWF+TfQlNUADanev1iz?=
 =?us-ascii?Q?imX26Xj1kLR+F6j/3tsKnJ2OwKqbA69AN0HBfbghqxDEZN2rHX8I5MmW1yFp?=
 =?us-ascii?Q?CEuoUa/duCFJlHEsca62Io3FUDPTsUuY6V26lwM/h4GEjhBFQ+yqFXDqjmvp?=
 =?us-ascii?Q?KWgON3PSHHmer3UoCvXxBv7NGSOanE4kM2Z/RduZ7I+DJejj2bd8EbBhQ1To?=
 =?us-ascii?Q?SxQ=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cd052c-4245-4c90-5970-08dd9d3f2d21
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:42.6278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

From: Kerem Karabay <kekrby@gmail.com>

This patch adds the device ID of Apple Touch Bar found on x86 MacBook Pros
to the hid-multitouch driver.

Note that this is device ID is for T2 Macs. Testing on T1 Macs would be
appreciated.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/Kconfig          |  1 +
 drivers/hid/hid-multitouch.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a50325270..403f4517f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -769,6 +769,7 @@ config HID_MULTITOUCH
 	  Say Y here if you have one of the following devices:
 	  - 3M PCT touch screens
 	  - ActionStar dual touch panels
+	  - Apple Touch Bar on x86 MacBook Pros
 	  - Atmel panels
 	  - Cando dual touch panels
 	  - Chunghwa panels
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 81c02138f..a1b251ea6 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -221,6 +221,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
 #define MT_CLS_GOOGLE				0x0111
 #define MT_CLS_RAZER_BLADE_STEALTH		0x0112
 #define MT_CLS_SMART_TECH			0x0113
+#define MT_CLS_APPLE_TOUCHBAR			0x0114
 #define MT_CLS_SIS				0x0457
 
 #define MT_DEFAULT_MAXCONTACT	10
@@ -406,6 +407,12 @@ static const struct mt_class mt_classes[] = {
 			MT_QUIRK_CONTACT_CNT_ACCURATE |
 			MT_QUIRK_SEPARATE_APP_REPORT,
 	},
+	{ .name = MT_CLS_APPLE_TOUCHBAR,
+		.quirks = MT_QUIRK_HOVERING |
+			MT_QUIRK_SLOT_IS_CONTACTID_MINUS_ONE |
+			MT_QUIRK_APPLE_TOUCHBAR,
+		.maxcontacts = 11,
+	},
 	{ .name = MT_CLS_SIS,
 		.quirks = MT_QUIRK_NOT_SEEN_MEANS_UP |
 			MT_QUIRK_ALWAYS_VALID |
@@ -1858,6 +1865,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret != 0)
 		return ret;
 
+	if (mtclass->name == MT_CLS_APPLE_TOUCHBAR &&
+	    !hid_find_field(hdev, HID_INPUT_REPORT,
+			    HID_DG_TOUCHPAD, HID_DG_TRANSDUCER_INDEX))
+		return -ENODEV;
+
 	if (mtclass->quirks & MT_QUIRK_FIX_CONST_CONTACT_ID)
 		mt_fix_const_fields(hdev, HID_DG_CONTACTID);
 
@@ -2339,6 +2351,11 @@ static const struct hid_device_id mt_devices[] = {
 		MT_USB_DEVICE(USB_VENDOR_ID_XIROKU,
 			USB_DEVICE_ID_XIROKU_CSR2) },
 
+	/* Apple Touch Bar */
+	{ .driver_data = MT_CLS_APPLE_TOUCHBAR,
+		HID_USB_DEVICE(USB_VENDOR_ID_APPLE,
+			USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY) },
+
 	/* Google MT devices */
 	{ .driver_data = MT_CLS_GOOGLE,
 		HID_DEVICE(HID_BUS_ANY, HID_GROUP_ANY, USB_VENDOR_ID_GOOGLE,
-- 
2.43.0


