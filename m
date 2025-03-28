Return-Path: <linux-input+bounces-11342-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD42BA74C93
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9480188B2D0
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7175D21764B;
	Fri, 28 Mar 2025 14:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="j86fGDBR"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011030.outbound.protection.outlook.com [52.103.68.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586F921421B;
	Fri, 28 Mar 2025 14:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172014; cv=fail; b=IvwCQNqCh82fJU/X09Ph/0Bz03gP4xGSqa8CGMH0XwehVCKa1L1LwLTybIk0JTdJ/LNKlPvGhij/Sk8UB50HurT469Awbin6smLPdynr1JJ2pTuI+ZajgKgJPwuuWPhq2FI0SvFA0jsKGyurcbuVt5exeotq4aN4CWr8kE3e8m0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172014; c=relaxed/simple;
	bh=b37/FPgu82P/p+dt7dm6jL8PHu/l3c16LCQ7H8Wt1xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IytCKKsGGXfkoNqM9Q4Fz3keSC+/bFGLv4lPcypyzhJjECSy1IsuyPZfQwBjyrIaeq6UQMwCoWT4rlR1OW/vBEieC1lG3NAmDnrHCinMPK1Dgwy3VvpshP3A2z0Dp3j5JBIx1xqFgwk8xCPfUhEwwfqHRVL06GnmmFzr0QJn0Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=j86fGDBR; arc=fail smtp.client-ip=52.103.68.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5Pu6yz4QiCDbS6UiAUKHqG0Tzgfzii3hgzEs5llsLTK90CjKVEnHse/M/jDheAZwijPkV8dl8DOWwCBrj754DIgZ/xKL8z7Bklce52asurAff1IKkKe58ROrW+nJzAilhnxxepRdeAbqfVrac084yzniuMOKDJFR8ZvV4v/YVJk506phl5neVUU/Ew/kI4jWiimxVquQA5aSmBn5VOWnO5b3ZGAm2UjKAWQOL0WQ7fsKxsKtheLyHN5I5Gf1v0FpZg2ZISyTudGK57NIXpopWeZ5XRKl7Xk1YaYJDvuDpg/8JANZB2j1wCeOOzM33kjieATQx/yP3W5zrSCDgZxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNC7MN9Y10OcKnn4KzodRFpVn3mMlPo87kxfSqxr340=;
 b=Da9jSUppjEeolr4HQst6yXLnbmGE798RImL/aqYoIwDe0V/bB3oPF5I2w1jxBlbR8GMQIpsycbkVC4b2VXflKS66jh//iYn2ZdaPoYr5f9uTsAxWy01neqMuzzHn/VQRzEUW9bSta/PDg0zdFYNw02kAeXECj/DCqZBvWIIcIYSoCsU9k7bIK1FEq35zgZZPeyjsu3fw2tqCp+IL9lVyim/Ca6flSuzWfaftaCxaEPIYPoTHBN/6H1hLlWc3aY37ewWPIpLGxVB34iHMIF10o2kky7PgVUT5YrwIN8kFv8gx/NCZLGqxQ8dByNOdnnvcCYBw6oDf4LGqqtgXkR3DNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNC7MN9Y10OcKnn4KzodRFpVn3mMlPo87kxfSqxr340=;
 b=j86fGDBR3vZSW9FjJdk9dSkM5xNEneUiblCSFmmeu71HrEvNOZqF8TeEoKjCU8uKKb2g2vBcrfhzdibfDNulIIfNwdY77e0dZD50QQIVPcNpgg4nLE5sY5+vFK+hB6c/MfPBYvfRFp0s5f6K4Y/nHiSKRoy3EnzFndip+MmOU7y6uRQRZkI4WV3eSh8HHNFpEA/KeyzA80QHu9WK2rFthbkpuQ5QST3paTagFyWYCLYcrn1Nz5Vs1lfGmM3r3puagNOZlup5iTSHTD1iUCsVAiazT718Y9NTAWl8YJBMnx8LWvWDWsjQwcxkkMEnc1lSWFMDbtIjzPl5dWiQra6iWQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9447.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:47 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:47 +0000
From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 4/5] HID: apple: Add Apple Magic Keyboard A3118 USB-C support
Date: Fri, 28 Mar 2025 19:48:26 +0530
Message-ID:
 <PN3PR01MB9597912C84CA93A317E425F2B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328142625.12980-1-gargaditya08@live.com>
References: <20250328142625.12980-1-gargaditya08@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0086.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::26) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-5-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: f796f87e-34b7-4d63-b26c-08dd6e04929d
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YVUg2yQTi3TDVwcpbr7xa01R57KsqSzZJG5mYrp1S+8fIegHH+w4ooAevn6C?=
 =?us-ascii?Q?/rof1TLQnrKFzXPkyhQvcEh5dpvJ0SazNwHCy8Ocu4YioLWkIlOETpikoyDb?=
 =?us-ascii?Q?hd+J7fEknyJiNItRObo47MhDBiPR6BJD+zxtxc5gCrBKYthhtrqyxTb6W5BA?=
 =?us-ascii?Q?amoPr5/opXlc8cti89q0BRVmQEpU6aMAmwlju/L6RLmX4qw95wWNETsV9B6t?=
 =?us-ascii?Q?UmYCBWGGZUUPaMShHOovsr8x+orSii9FI2LfVlfMsWVJPcSyGUzM3Ey8dZV+?=
 =?us-ascii?Q?OfarcnpPKcmSqC6xM+RdIntQgEzUkyzl65rvONFH21P0buv67VifX6d1jI1B?=
 =?us-ascii?Q?kYCaQ8/MZPzcxPXxJZF/R5c7+S14GYE+6bkWBKyXyLXbRbvBrhGft8mhCmGq?=
 =?us-ascii?Q?kH6Cf62D5SeKiUzAZzV+1GSq8EZKP5fmaxZ/q61rvw2efW0Z+8IAPHYFfnxe?=
 =?us-ascii?Q?O3h5e9ZS8h6PuwKuGpjIfpaasC58Da+ZL3s5ZK3C5rRRb4INeoIBcMkAim/m?=
 =?us-ascii?Q?/rMfPG5CK9fia3QpAXmVZm2PcoVi55cmxs1YeXh3Ttns7mWBnIwZX9n/DM7U?=
 =?us-ascii?Q?Hg+iSY8KaVg0jEnyGjgtoo9CWXbST2TvJFIq4mi0gq5x4wE4A/i5fSsw4dQ5?=
 =?us-ascii?Q?2NH/E59kOoz/nXCD5RFXQ+NnMstF+VA1FpJHVseHbJceN/3WHowpL+NSVnX5?=
 =?us-ascii?Q?dhnWXIZVCKAX44hGYcsUSXGsu4uIVYpz2dpJmI6OlWorpU+ZXIdEhCGQaHmw?=
 =?us-ascii?Q?AjC5jpJX99SXWFgelKBv/B+Azo9OnvCpwOYXSxsEI91a64fX0nWZ7Bs+cepl?=
 =?us-ascii?Q?hTnZ9qcdRuPxtJ8YNcbvke76Z+8fSJuIDcYBd1VQdOowIdXtCJGRwQTOgOsb?=
 =?us-ascii?Q?TQ93AuATvDtizgtMF8oSl3CyGZMoi8D4MYfsq/6TgphJ9f3OQQem6r/gizFv?=
 =?us-ascii?Q?+kuz13eyPm/uUxEQC/o2+A2RRhInyquaw5wZ5t8zG3ujGyQF7WEpBNeUJ+mN?=
 =?us-ascii?Q?Fs0oipaKpF1dNIUHyi/5ORBzoQgw6Fk9+zKVP8RP60Pb3R3FPhnaSNA61nvh?=
 =?us-ascii?Q?G/SoppJwvdaWcC3/WYbY2WHtJOPVnGMGXbXpCmBlt36Swv5CoP/7iB8OPo0M?=
 =?us-ascii?Q?pGz5vR4N1UUqDP5E65tDbZxrYpSSWKGYsQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iTjrUQJKAqqLhhzx9IFkTidUIZa7mmpjGZd89Nb5gXBfpP5VWa8UKAlBDkpN?=
 =?us-ascii?Q?27BDm64dCI92qg+vUq9AsxDS/PS9qeku6gqI5mNtdCqgyUVNZQzmDjlnflrk?=
 =?us-ascii?Q?4/B8xHwdoyxXBec/5JxQDXTjQ8sL+uOU/02JGh6E62wblAs4u/kfIWLIu4EA?=
 =?us-ascii?Q?WFIjm1uhQ7l49nJ0/S3d/Hn2ZtjZbO5vWBJnLpDje5SJnEI+Hapy3MjeodhM?=
 =?us-ascii?Q?KEZQPTnwNRUgwjrxeFL6dR1yN22ChDkuZ3RRcjAA4Mzc0P8rzkH/JKZgRjSo?=
 =?us-ascii?Q?u8LWIbYH7zeIpygy0lOyh+hV2mbGrdj7my/EhzIll5u3YZhks80sr/jh0obN?=
 =?us-ascii?Q?79/rsMf9hh4YnkKtq0D9AIgq77R7NP5xyTthHsHgnq+xyxBzF4fiMaILSGK+?=
 =?us-ascii?Q?6prQug/p+9XdcTyOXfcIawjBf/RGy4hLAo5dz7eFpn/BLvQlhu5TbVQqS/mG?=
 =?us-ascii?Q?Y6R9KhUk3KRxdolpyhf5b+NrNDBOzENpgBrEIMQ0ZyyaPrVDhTlYtFjJag3m?=
 =?us-ascii?Q?8Nm2ztd7zVqiekQqCCFzky1afaSaTjk/YNZlWodMqp0wEtpdIEoCvhtZ2z/t?=
 =?us-ascii?Q?lGZn0QhjmZ+3FlZ8TyYlnObgndrXXx7LYqrTt9CHvbiODNhT9yCgV/WhACUt?=
 =?us-ascii?Q?OmS+nxbo6VCEqgkLbYjsXExceU5Z6912XZNPyYJWeVBBRAqB4y8Cj/nWiyb+?=
 =?us-ascii?Q?xCXtT+jgpy2pUmIbJxuCeV46reKzKDDioYkrcYW+agX9ZA72S3WkA8dxaQ5C?=
 =?us-ascii?Q?OOCAXyDWPjHx4S9SZ3Oy91RzWoinJXtX2l1pZ6EZcyBy7R8nkhOT5TElwzEu?=
 =?us-ascii?Q?cKa7JZmgfG1ZNERmXqNogG9A27G5EV8Qha6XTAeOGIMspVtojjPTvj+2Yguy?=
 =?us-ascii?Q?MXyQk5kXiyxh6KAONkBaJuvG72HoS7vbczJk+xN/y5XSJJIEivRKXSwrsoi9?=
 =?us-ascii?Q?ff4RunwW+2qufWtunfViUkFtfnPTJ+hGfJipqlPGPJgVmo45c5mHFsiEi8qa?=
 =?us-ascii?Q?xofOOHv7TIr350qgoZ5RTKDSSRfBZSp2ewxjPODR65KNVzFhu15np/Df2K2s?=
 =?us-ascii?Q?6hbt3D1a7lBX0BZbiy0TSJaCL80wJPl8s4Zw+UaPUOpXjCVxyg07uCbsSAea?=
 =?us-ascii?Q?RlQ8ofa0+XoLPR27yZNI71+vWLT4GKf8iajXAUQQ/8bgaoCqjMJRsZB2EKdi?=
 =?us-ascii?Q?TyzNxDThacYG41kbhGwu6IAH65WMnyDU8e80D5ustN+G/QA5PriXpg7tGZ+h?=
 =?us-ascii?Q?lJC123Ui/kD4MSgLngdwlleBjGuW38zUH1OQ9oSKWPyRxATGMTjek+Cq+JKy?=
 =?us-ascii?Q?j6Y=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f796f87e-34b7-4d63-b26c-08dd6e04929d
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:47.8383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9447

From: Grigorii Sokolik <g.sokol99@g-sokol.info>

Add Apple Magic Keyboard 2024 with Touch ID device ID (05ac:0321) to
those recognized by the hid-apple driver. Keyboard is otherwise
compatible with the existing implementation for its earlier 2021 model.

Signed-off-by: Grigorii Sokolik <g.sokol99@g-sokol.info>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 21 +++++++++++++--------
 drivers/hid/hid-ids.h   |  9 +++++----
 2 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index fde438bee..e95a54113 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -165,7 +165,7 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-static const struct apple_key_translation apple2021_fn_keys[] = {
+static const struct apple_key_translation magic_keyboard_2021_and_2024_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
 	{ KEY_F1,	KEY_BRIGHTNESSDOWN, APPLE_FLAG_FKEY },
@@ -482,10 +482,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 			table = magic_keyboard_2015_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
-		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
 		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
-			table = apple2021_fn_keys;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024:
+			table = magic_keyboard_2021_and_2024_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
@@ -690,7 +691,7 @@ static void apple_setup_input(struct input_dev *input)
 	apple_setup_key_translation(input, apple_iso_keyboard);
 	apple_setup_key_translation(input, magic_keyboard_alu_fn_keys);
 	apple_setup_key_translation(input, magic_keyboard_2015_fn_keys);
-	apple_setup_key_translation(input, apple2021_fn_keys);
+	apple_setup_key_translation(input, magic_keyboard_2021_and_2024_fn_keys);
 	apple_setup_key_translation(input, macbookpro_no_esc_fn_keys);
 	apple_setup_key_translation(input, macbookpro_dedicated_esc_fn_keys);
 }
@@ -1165,10 +1166,6 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
-	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
-	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
-		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021),
@@ -1177,6 +1174,14 @@ static const struct hid_device_id apple_devices[] = {
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
 	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021),
 		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK | APPLE_RDESC_BATTERY },
+	{ HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024),
+		.driver_data = APPLE_HAS_FN | APPLE_ISO_TILDE_QUIRK },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT),
 		.driver_data = APPLE_MAGIC_BACKLIGHT },
 
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index 288a2b864..8682e1b11 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -162,6 +162,11 @@
 #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS   0x0257
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015   0x0267
 #define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015   0x026c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
+#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2024   0x0321
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ANSI	0x0290
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_ISO	0x0291
 #define USB_DEVICE_ID_APPLE_WELLSPRING8_JIS	0x0292
@@ -183,10 +188,6 @@
 #define USB_DEVICE_ID_APPLE_IRCONTROL3	0x8241
 #define USB_DEVICE_ID_APPLE_IRCONTROL4	0x8242
 #define USB_DEVICE_ID_APPLE_IRCONTROL5	0x8243
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021   0x029c
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024   0x0320
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021   0x029a
-#define USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021   0x029f
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_BACKLIGHT 0x8102
 #define USB_DEVICE_ID_APPLE_TOUCHBAR_DISPLAY 0x8302
 
-- 
2.43.0


