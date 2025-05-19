Return-Path: <linux-input+bounces-12439-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D497ABBDC0
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 946311684DA
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 963252798ED;
	Mon, 19 May 2025 12:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="H65rVh3K"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F53A27978A;
	Mon, 19 May 2025 12:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657694; cv=fail; b=QheoqdGs98aZV8tIcX4waLqwTML/4Gnr1VJw3pyY3bJLl2zPsKFXXT+QCot/1iZE145B3jTWjVo+vx4r9fZr4JfZWHiheM/Q7epBvx6F1dWbHCkd4W/HUbuz7VYHTyvRVXZxJ2z6etdXUewgohz1pOj3JkrdoxEq87ZKw+vRixo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657694; c=relaxed/simple;
	bh=zDf7n/9yCBVn4GdYr/PLvtgswwfG25N8GcSHqVVY2ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RwjN4yDg57zxENHKMmITdgRauFvQ4KxkC5VQuPHAhwXmfIxmWOzXYeO88WIik9qHMUwVpY77KDf638gRWEK8HkHx6UlYMCcfLmld4b5uPaw2rbJmVKsFde4JMdLD5uqNhkwlr7IIaZgTQVhD2W8kR8EAypsWKBMwk4wQBO3KD4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=H65rVh3K; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh0LIRBYT4CU38Hyfh92b78zb0wRGjNzqaacfq36kN+Le/YigcpnfVNlnGcf0B7SoomibHzh6I447mwAy61ZpCfywiYWweBRED+TTAmnwJ9fMb9Tg5bA9EsiPOpQCBEA41TjOLleCP/JXXcKZkSAI7Xl0wW7e++99GQspPh5ZxGLlFiOZ04h1ZFrz6t8r9xqODqQNbEZCZxdnPLfmw+35Z7f7uuKeGE6XB9FDGlidEUe0/lZaZlLjYlQQ1/xkw63tPKIsahIcMCNHi0pmTO4yLSBvOvyUy5SfQSZPXvj9EYdmbsGeswN1wwah6h4r6W3GvFQYRezdvh3aE5swfrxsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vwV05rv9KfsVa4olYULAWyGrvhkZsJ5w7DDvuy5uHno=;
 b=atKrYiYFT5EMSEzH6fplolitsVCMFQIxtwAdczap/yf4Mt6BmEdhjKGowVvosO+Q7qTfa9owiTUkoavatE/7oucRse9gu1guiDzDEKe11AwO8noam/snT12CC2J5qcOj5HzpAiHO9HkO3FCJ9fP53XrumN3DgXFpT5/5fxxCrOX30xNqWKsBaMEyb/iTpJOJgKv8EiIsf9kzGWxIbHhXVXQYaiFcAhYFvkKcNOaUwsksFUgULcfRvxsl6uGXyiY95o1d4HU+trID7rCpso3xaN1Grx8V2F9nQi2wmWVar7GieaLvuuyVUTKr9SForkBxQgAa+wAmMNAEoElQfaKE2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vwV05rv9KfsVa4olYULAWyGrvhkZsJ5w7DDvuy5uHno=;
 b=H65rVh3Kzy/GGse2BhMcM163V3TwoqY/5uQMxXO08pw+0ixlVZ6F0irkUn7+G9gav73qtuasiU6Oi3NskWJmAuMadcx+OiSgXDfGdHjVtX9Xes2w675qVfCHKHMs7PQn0Ur4HOFEJLgSg/oNsN2lUhWQtzltTMz3lYyFllRDsMRLprun6Nj4apodAJEvrb2qsfCwJBaN2tR0IHq8hNIUdnCul6RdUOvE3ZBTDCxBK0dG760rcRzsmafGacUY8PPH1M12BHHrqy5JcbaPv+lNahykLRHdc7iJwwkYPQFnJ/uA18KafLY8GN8ORZNj1VtdOAd8eHcIjbmip6JyBx/fEw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:28:02 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:28:02 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 8/8] HID: apple: Add necessary IDs and support for replacement trackpad on MacBookPro15,1
Date: Mon, 19 May 2025 17:46:23 +0530
Message-ID:
 <PN3PR01MB959782D4F37ACFCE7005AE4FB89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-9-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 323290b2-e626-45b7-2e34-08dd96d098e6
X-MS-Exchange-SLBlob-MailProps:
	YfhX3sd/0TV79KLUZXH6jYsApOyagGvS/gyiBWHIzcXDuFeErcaWYvda1cL5hNQQzBRb4Gu5Tay6JihPAz6xgwOQ/Cg7GqFBMCgkBDpeBeMjiurC+cgY6cbLxlHUJBSYG73Bqc0BILppz5VON9AtSieRCaqgY+3ppNgXtz+uhpj4F4awKB12shtBf0D40oy7z+0QjBy2VDFPk8L08I1DjId6ydi160ao9T9hU7M3zouzaP9tlItyF8lfJROdSthJ+H4FxofilNAd9MvpQI2zlohsTiLsSbTO3owc8K2w3Fj+zOmGrMSV6i/HLthtaihckXqPxWVmBzMKC/PXwNCPBsDenSfGQ4QYYa5anUB0nqSulr0t7dhVhZ7uvxNpzwtFzBkzqHIOLV1XTsc9ARh/yosq8tKGptM23XTWaqCmGSR5kveOVB4WCpjQXDbX1jOSshQY4cfCDmT1Qkv1bs6hzIwKHwV5DxOtKXrzhq+QZiu3BIRFpQlGIJNqI/F1gevtmdYKE0C9OSapmN4KbkAx6dQs5aIVhGmyItOXYDt5gMdOEJEmXCHmtUszgWhGlBxxmcreFSpAdcZDXCp7gpTESrMrOMbT9xAvjV2eCI2TtCGxTZd3xapgn+iS23KeIDHFEkfTMGMcutNklcAbdVHytLiZra7drkzsfEQOg3bKiq3U2fLHog+eiLQ1yyeJO4PxQGvVYL+ZyNf6pqxc9NAtFennt9Hq38U3g3nGUo7KoCOyhqNpKJCEWHh2RL0nLvjD0ZMFWxf6M4UgAM/IwIbZqQFEyBghQOWbvR2cejDiAnI=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XiTLaASGkBz3RoAUYwsY716j5QKIqAw7zAdVRgrbLZIx/8E999Xcsmk0tt0E?=
 =?us-ascii?Q?fbPTGU7S07eDY7fmI/4TiUH42aWEYqctfpurYpfCii1KWVvdwPkmgKaFh4QN?=
 =?us-ascii?Q?LWpVarKe1azqp/uMe/YOY6msK7pe+VHxE5LWtZY3AEEehqgjLcsmjf2yuoaq?=
 =?us-ascii?Q?LcZzDeQkX0yDmkyqvn703QOgfVx9BM3W+K0/FXLTIDP0+D4s+1S4ucOZAHnW?=
 =?us-ascii?Q?ogGGS/I40fg2QQjk6VG/n4UP2QkCZZWVTP+zFKVbUw4ZJPpYsEgW4FqjWpK+?=
 =?us-ascii?Q?xyuwuhRnkbRQTZNz3fUFc/SRul44M1YcGbjO9ztOcvzedwU+q0mMLWCvGEOA?=
 =?us-ascii?Q?mOfy00kaF+cNcpcFO3POShnJdPY4Kf21pj3SSBGnrjsWdm+fXvPOZZM7aoHG?=
 =?us-ascii?Q?FPoQgiAIvbUzhddmEu9OoHKKl/8z1a6lxdNsb7aoGaMR9Nh/V72ijbl5wV+o?=
 =?us-ascii?Q?Hat44C3A6NZwkh8razqs0trWBKbZovkry6eYZdXc6PzQMFoOojXIyl3UhrMh?=
 =?us-ascii?Q?EVF6cjKvNVh9uGe2l/n+PZ46ifNaswJK1pIAxc5IgocpLnDkew0msAZXPW0m?=
 =?us-ascii?Q?CbUUrcMFrX5mXpObxoYCrifd0FCMRrsFGJ9EiSjqBj5BLeqOZ8cRCPGAsCDQ?=
 =?us-ascii?Q?QWAFAIHRzZzu4pANrOeDk7K31Y2tqAe8UCJH2K6xGrO3xeNdOzSVPuNHWXyo?=
 =?us-ascii?Q?7CFhqBb0KDl9NDlJTLBttJpdIeGDw/Zkbmp6lB38eLM2wte+vgY+5HugQkD/?=
 =?us-ascii?Q?RhAqhAzQVaCgh81NDJoqBEbJTczAX3yWixidTZNzVMS7AUTnsfByC0crFv5g?=
 =?us-ascii?Q?92q3nhtSmPtJ0QRXF4UlUhF64i1O2mpMUzlfGIZYYLmk4s8N49MoGcHAVbII?=
 =?us-ascii?Q?qT4BCuLpwjNfEkQou5jQxAupIDWbm3FunbSpWbJYDJXLaprMXC2TnX0qw4a5?=
 =?us-ascii?Q?SPcVizOSP81HdnjaFGEh4Pg/1inqz8Z499WsJdV6byU23s9OxtjPiwuTWWok?=
 =?us-ascii?Q?lMO6p85aqkISuQzMsqqcwN7ZA5V5it4HxmKud6EwfDvRmzmXYMy1tlecMFA0?=
 =?us-ascii?Q?mvNp/20PKGESOdgSKhBbj1UX5VllxUguwC7O/uj8GTAgrzlmmN0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OP28Q90DZxF/9RiwAxeZUi7K1ZEZBbngRvuwhXdW9wg+Y3NzLf66IJCIiOz/?=
 =?us-ascii?Q?FMW9FByh/HEYAKa7daqceLWPOvphJmUS1bAkwkGzLkNxF2CZ/cLEoNEl68kg?=
 =?us-ascii?Q?v+Y+2up2eKKzNF/gZTLbQzz4K4jtlW7KtKc3XfKhyPzqrXxZ1/PjxQ4SKUrM?=
 =?us-ascii?Q?1tlMmEfN3qZ0+Ke21cMFeZZF2bA+0BmngLjdsTZrbJZh8rPjs6q7aDLn5fiI?=
 =?us-ascii?Q?EDy91Bkx0Uyts2sDbK/LYcHh1Kx+EEEek7ZJJQa/l00qRNvS8pLSk/r4mJvn?=
 =?us-ascii?Q?wZADXF6pKVyCydVXXq6gvs68EUwlnodKfhc5ZqVVRK4lF5orq4w5f/993LKv?=
 =?us-ascii?Q?GxaHth2lrQKk1dH+4V2OMCajisXRCW+uA4yW+OH7eVn/T6k4lRrSTgzGAMLy?=
 =?us-ascii?Q?nntfH5CBEYKAIM+/mOyODkjgmaTbTHIaOK0Z/ftMBN6sD59F2Dy5f0WshsNB?=
 =?us-ascii?Q?ZU8M4sQ8/oSobkpWFZWLU2hcqy4np2YswnC1Aoc5gGqzwQvU/gg+cjwI6EVm?=
 =?us-ascii?Q?GZ9K1GotfRObMT48+y83FAHSl+2RLmYWQf3FiZCX2HA/KlUJq77zj1jaDHDH?=
 =?us-ascii?Q?Y6HWF3GBlsOv6b0pOIKD9LaiSEeJ1g5gpwZUz1LQ8y5+791nuWgDVss/iw6C?=
 =?us-ascii?Q?m36dct+B1d5d9ovRHlqwnKSNyKVEWzgcGWMVYSd++HwGDLTszVqSdqMBXzzb?=
 =?us-ascii?Q?+A7ldb8/89iB5/UDfisFzk8YwG4kmpwcNNZhAGH6c5wL94AvdmGJ3MrN6/x9?=
 =?us-ascii?Q?KhnP0CFfsnf859ZCuVyshaow0nte00TkWSy6FHn6obyzctHqg/3rUDtbU1+A?=
 =?us-ascii?Q?dF8SrdewrOjgv4hJ3XVkXcfO1wIVv74AMeGbuOlb7w+6PhZNE+iMyhI5AGZA?=
 =?us-ascii?Q?r1FJG4Ep5OKp0gHUzELCzIQ+irvRCK4aUyDaGhsx622ULd+JyCY9g0C94fg7?=
 =?us-ascii?Q?xu5Kj3zOkkaonV3e4VuGI/KYUHHCmDjwgvkFpPaljVGtuJToOIc86vaFD94Q?=
 =?us-ascii?Q?q3FP9UNPB76Cs7PtFcZI3ViMi6MeL2UP/MBYsb0vG2pqX019Z3YV2z/BrzAV?=
 =?us-ascii?Q?vsPgySvD4FyO0bsljWkNYRifsjOPoq2z/iWChb92ffnTyeqvh0mBdLamqapb?=
 =?us-ascii?Q?6hReGP/l8iXC/r1pNPa+0R1Tbjsc2Q4wZzLPmhG7YiMBvFVs0rZ4YkMA9kqR?=
 =?us-ascii?Q?AoHTooNpiUhO3CUNG1sBx54ZzKPfg6m6l+hfnPgFJ5CUoKamEgZ1BJN++OHJ?=
 =?us-ascii?Q?noTLhb+wwfzdMzK/mtkwPT5OsESkQwHUC2AhIirSoLe8OGxns+mzgqyC4Iy0?=
 =?us-ascii?Q?H8U=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 323290b2-e626-45b7-2e34-08dd96d098e6
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:28:02.1812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

Some third party trackpad replacements like that of HAWSON may have a
different PID than the stock trackpad. This commit adds one such trackpad
to hid-apple, available for MacBookPro15,1

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c  |  4 ++++
 drivers/hid/hid-ids.h    | 17 +++++++++--------
 drivers/hid/hid-quirks.c |  1 +
 3 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index b6a48845d..43bec1a2e 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -499,6 +499,7 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680_ALT:
 			table = macbookpro_no_esc_fn_keys;
 			break;
 		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
@@ -1159,6 +1160,9 @@ static const struct hid_device_id apple_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680),
 		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
 			APPLE_DISABLE_FKEYS },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680_ALT),
+		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
+			APPLE_DISABLE_FKEYS },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213),
 		.driver_data = APPLE_HAS_FN | APPLE_BACKLIGHT_CTL | APPLE_ISO_TILDE_QUIRK |
 			APPLE_DISABLE_FKEYS },
diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
index dd0a48595..041b80bf3 100644
--- a/drivers/hid/hid-ids.h
+++ b/drivers/hid/hid-ids.h
@@ -179,14 +179,15 @@
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_ANSI	0x0272
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_ISO		0x0273
 #define USB_DEVICE_ID_APPLE_WELLSPRING9_JIS		0x0274
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K	0x027a
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132	0x027b
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680	0x027c
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213	0x027d
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K	0x027e
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223	0x027f
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K	0x0280
-#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F	0x0340
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K		0x027a
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132		0x027b
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680		0x027c
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680_ALT	0x0278
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213		0x027d
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K		0x027e
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223		0x027f
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K		0x0280
+#define USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F		0x0340
 #define USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY	0x030a
 #define USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY	0x030b
 #define USB_DEVICE_ID_APPLE_IRCONTROL	0x8240
diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
index 8a418f487..1fba3b7f6 100644
--- a/drivers/hid/hid-quirks.c
+++ b/drivers/hid/hid-quirks.c
@@ -314,6 +314,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680_ALT) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223) },
-- 
2.43.0


