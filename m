Return-Path: <linux-input+bounces-5623-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B18B9557F6
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 15:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CDA1282AC4
	for <lists+linux-input@lfdr.de>; Sat, 17 Aug 2024 13:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9394B143C70;
	Sat, 17 Aug 2024 13:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="edBpqspN"
X-Original-To: linux-input@vger.kernel.org
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (mail-me3aus01olkn2083.outbound.protection.outlook.com [40.92.63.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848FF11187
	for <linux-input@vger.kernel.org>; Sat, 17 Aug 2024 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.63.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723899731; cv=fail; b=aLMg1JxERjfn1WjOTathWQRJFAGVpWLOL1kf24IyVLe6QAsj8tLwCvP+RIC0MacdrH/xLwb5B5/A3XSdkwSez2dqYYtpXtkcwOPKuFepEsRHnhSYo3Sq3uqvWkCdzuoGOoS7B9fpHm4dKdZcdyRtulO7pP4+5Kxvq8ixtJiyGXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723899731; c=relaxed/simple;
	bh=ozotVxqnrLQBMNVolI0YYv5OsI5yU19vf+wiONVqRmw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gesjU18r2DG/rAxzN4gt1WfeJTXsYe9buuo7LjvSEx3le7eljKPRPTFw1DVbJ8r5lW0QLe13mLct0KoTIrt5YJqygHdJ/FFxeEAqDm/1WOQZZEvjfZpPGjv8oa0iEeYM5gdlMnixV7d/HxxauxPPjeMW4ZSMSFZhGRAicNxfG6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=edBpqspN; arc=fail smtp.client-ip=40.92.63.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=users.sourceforge.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZ/P+wkjPM/SZOH6xBtHJdrM9/Aw7wfRdyNVh3guXShr9pcfdLQNZV+sOAtoEUBdV95bJKd7HRkk13JUopEIXOkjQ55q3aV3LyPN/VyekYFdCs3Bby2b8p9yXYnDCFhImIgQvdqRaVYUpKJID5/H3KOhyxA8G0IDZnsteOGu7K9zQaSkpXvRYRttxCOFZpgGobWzBrIrcVahlZxYjUDfjAxxT9CNrWiHCoWFuJXKRlintmNb3v8FODkJ+9mQu1maifmYTnGEShhoPAiBiDgSzuGxLlZC3cWzjp87sG1IHrlZLNLHby3eXxet3hfctXGlMJHG0/sTVmLecEum0R/W8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8UF6tPopIrjD0YyNaybbKBdzkLAy8ILJ1ngQL8In0I=;
 b=hzjQguvA25emXPOb/M/d3K/FRj/dZgAMqPmP2Wv8Z+uZ6wvoAMkQx6Apx7DpE7OceqsGblfgAu6+yjQuTwRmL7U9JFQUczCE3VJ95oq0XFkjXgzoTLs+HRqH1R50IxovDsOksJe9pQ4/bZtxRYBtw2gSpGTy1iD0v3uZNLNutfprmlfodeLBudO2MiZvl9TheWphN9EDUAzCVnsg2Z99ywuJ35NuOHIV15j7l1UpXbVLluFoWcmKYGG348Qmc7EPSqvcTWiiByjAbKV/jdB2W7jtSj0e/HN9jq7DH++bx9vag3RIIKkRQsF1hDCjiQoOvzRd3AlybKlSnlDgLfUQzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8UF6tPopIrjD0YyNaybbKBdzkLAy8ILJ1ngQL8In0I=;
 b=edBpqspN5VJoPP815J/lckPuAn/IKfe0REFKOX0q/G+K4dj78Z1EUwUocukEe44QUokQwFLU+4kryct7rdJUaQ5vOs3hAt7lNXV+xyt1hYZHc2rKR2u3V9BRcKEhht4KDPHh1HzBCx9zBd/+QiHJn0BLRuu54NGz3HvCFuPPWYR6zh0Nk5/hePBe4snZVns1nm1FirjiTckj+dtP/U5SXENJ5SBrWlpo84FH7TWMio175E2b/JRtWny3q9k6PEF8FwFz2L7Fvak+6qLjL4j7tXqMkJMvRQcjQjZS7+HcIbgUj4BLyWqj9PSGnwE/FEtAOiXobHxuo0KiL76mNnAAYw==
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:150::12)
 by ME4P282MB1334.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:93::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Sat, 17 Aug
 2024 13:01:36 +0000
Received: from ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8]) by ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 ([fe80::a309:11d6:4508:99f8%4]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 13:01:36 +0000
From: Joshua Leivenzon <hacker1024@users.sourceforge.net>
To: linux-input@vger.kernel.org
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Joshua Leivenzon <hacker1024@users.sourceforge.net>
Subject: [PATCH] HID: Ignore battery for ELAN touchscreens on ASUS Zenbook Duo 2024 UX8406
Date: Sat, 17 Aug 2024 23:00:58 +1000
Message-ID:
 <ME3P282MB3003F909C26E93990148A82AA4822@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [eI2a1+fcmzHsU9h1eZJZc7ZRU4z7TD/K]
X-ClientProxiedBy: SY6PR01CA0122.ausprd01.prod.outlook.com
 (2603:10c6:10:1b8::23) To ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:150::12)
X-Microsoft-Original-Message-ID:
 <20240817130058.15108-1-hacker1024@users.sourceforge.net>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Josh Leivenzon <joshleivenzon@outlook.com>
X-MS-Exchange-MessageSentRepresentingType: 2
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB3003:EE_|ME4P282MB1334:EE_
X-MS-Office365-Filtering-Correlation-Id: efbec8c6-fbf3-4fc3-36fd-08dcbebcb9b8
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799003|19110799003|8060799006|461199028|5072599009|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	bhLW0ARhyno3TktmkJnTaKEJpCblcVRo7PcDs7TV+Wqzs0emXrDXtnLO5YJWM9nCimSTjswu8ZtwJbEF4nHZo0MgMWKxK+uAK1MS+cB9GABOgkykm2KTT4VdUJDBW+m5IK6mFT0vzubXPN+Ke3zG9vfHx4xcQMiifpZucM49Egj5gcGe6/o6X/hzg4TIIXz/QwhIcZEYJ0L6+m21Wtlw/Xb5faVymO/UVFHTtU9PTecrIiXxx0QxM+LfP3ze5ihrPyReOfdTvNoJQdT+7kXctmwKWVatLzbHrZ/WTpOFcHIdE4vRQCxTNYs8IfKA5D6RqgnjwnZUqGiYK7KCBsPNOAROMnztX1495x4nj9onF3+mtR3DE9bjrUQ90MaTbx0RXyfnGXk9MV+R0cpuhPpecPhz+8oSBlnOz0no2NURjV6cs+hm9ah2udr6sSJfbUXJRosPwyc8Yy4F2bs3wFmQHg1soGaA/Ndon4+FqlW05AoiA4BwEDQNhgJDd8Y81niGNXCOsHGG0rDhckrMgb345Hsfih+2LFXiodQitGUSPdC46RxuPtqAfHJ0y7xdFwAYrp0PxxjuUhyY1FeLhl8lNNmChcrHGsbGAOGLya1cFm959oCfOQ8v6eJvVbsXFUt3qHM7dkCXk3dKLmberakWZmlRhKWg5FKBWzA7+Xu8jKCQzYAp2aAdQ9bhO85lQ6MegOpzm3SdE3cR06n9rFB1Gy7TVtw7sFPzgKGfKiTNxEU=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CJd79fcNdsMz71uP6VBZgij6kEijzx4u0Xr9oZLGwYE3Z/DsVFvtvD4lh93E?=
 =?us-ascii?Q?GicJNSgxPk6Gt/du29nnaFIOokB9QvpwQCkLAkvCyVQtE5NrAyBiQSoIc5wa?=
 =?us-ascii?Q?+dvUn6U6KL59wfRkcf9SdTgHyDGhxu84Fej/ZG3FwsVXBd3rX03qNmHvc/ph?=
 =?us-ascii?Q?eVQaUSko68fqubEGooTwHFGk8HFTppdgkOrYf/sntyzHNvv4+Cax2afZ4Lw9?=
 =?us-ascii?Q?ToFkinwOp2TCqWcVT7CmXsCx8oeXc+jfBUZAkH7pHFmeRHSoygTk4d54tNIn?=
 =?us-ascii?Q?LZiPNugQxfAtok17NMaTfe4qkgG0hqSeXlnJDJup4lJpRpKmYJyvJzgmjgSB?=
 =?us-ascii?Q?nkguA7/uf7xq+rAS8P6y3NPz02328OFI/oDtjQ8WezsMe2WCTu4PP0rr3aoK?=
 =?us-ascii?Q?+yycHQ+1A9sAeE6gu5j39w8+ilkB+ibuKNpfXJKYXedOaICjSQmMgbymvnI4?=
 =?us-ascii?Q?u/z29iLwBjo27QMRsGNaMjLkZnPPueuExD0d7pYMK9ta/NcP7X9iPF+9yqeq?=
 =?us-ascii?Q?5DZc2lOZ8rvfdaJ+OxZ3p6gZ+Pn73akKCYKKEAY0N61/VHL+k40kM0tZHv3s?=
 =?us-ascii?Q?NWWBmzQQ8g1cjrYo19+SRTdfZ7W0RXJzsCBCd22A+HyfD92Z04+/+W9Ldcpj?=
 =?us-ascii?Q?H8lo6vdBSSDUowI73yxOH5QyApFBKfGdKPVy26QqkDvJrhkDwPUUfJTUpiJg?=
 =?us-ascii?Q?aJbuEO6F9gCJtbgtIyoZythl223vUncwrsE1sWJiJM7yQqDpozqstXMVnU+O?=
 =?us-ascii?Q?A8toW3FmY2V9gBAIfv4VJyWF/INQPkxyfHalwf3mWc64Dl/Ao8SjWLOeikSN?=
 =?us-ascii?Q?kGgg3pKBrgnM0qqKE4tbuNeKrqaCOefcZ6uAxs345jsRVZXS64cgZOg4HVUS?=
 =?us-ascii?Q?2F77BpfK9RjFK4+fjV/WFCsMa/qH9X8TqefhfJ4c9Gmm5lenHWp1u1tT7P/g?=
 =?us-ascii?Q?i+RYe1gwMjywXUfSlUEvI39pu9YhNAMwZrawBlm/mRYcp4As74mzr9YOvbwr?=
 =?us-ascii?Q?vTtlL0PNB8eRVr9gqAW8UWiBdNPLe+1aJ5I0BTpBrxjHMxMCwjIaLEScettj?=
 =?us-ascii?Q?/v4lO0TRjxDeQx1oL55Ymueb/nzUAb0j+H2o/4fB5HMCjPAxnPf8WviBY0Ib?=
 =?us-ascii?Q?tBwxm9q7cxprRmczWWOdijJIVUUmTULbnUo5Lu8Mgl5FhCLoAbnbHGVfcjki?=
 =?us-ascii?Q?ervMveAMEmgasyHbcKhXCTq4Q3AbvWkfLaTXdEkN7mlDIoWMyG9ZXXt/WCOW?=
 =?us-ascii?Q?tmoalQwklAaYPgLTq1FK?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efbec8c6-fbf3-4fc3-36fd-08dcbebcb9b8
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 13:01:36.1090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME4P282MB1334

As with other ELAN touchscreens, both screens on the Zenbook Duo 2024 report
false battery status.

Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
---
 drivers/hid/hid-ids.h   | 2 ++
 drivers/hid/hid-input.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 72d56ee7ce1b..e707519689d7 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -425,6 +425,8 @@
 #define I2C_DEVICE_ID_ASUS_GV301RA_TOUCHSCREEN 0x2C82
 #define I2C_DEVICE_ID_ASUS_UX3402_TOUCHSCREEN 0x2F2C
 #define I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN 0x4116
+#define I2C_DEVICE_ID_ASUS_UX8406_TOUCHSCREEN_UPPER 0x425B
+#define I2C_DEVICE_ID_ASUS_UX8406_TOUCHSCREEN_LOWER 0x425A
 #define USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN	0x2544
 #define USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN	0x2706
 #define I2C_DEVICE_ID_SURFACE_GO_TOUCHSCREEN	0x261A
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index c9094a4f281e..f10ce7fab072 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -381,6 +381,10 @@ static const struct hid_device_id hid_battery_quirks[] = {
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX6404_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX8406_TOUCHSCREEN_UPPER),
+	  HID_BATTERY_QUIRK_IGNORE },
+	{ HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, I2C_DEVICE_ID_ASUS_UX8406_TOUCHSCREEN_LOWER),
+	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550_TOUCHSCREEN),
 	  HID_BATTERY_QUIRK_IGNORE },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_ELAN, USB_DEVICE_ID_ASUS_UX550VE_TOUCHSCREEN),
-- 
2.45.2


