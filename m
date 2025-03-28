Return-Path: <linux-input+bounces-11341-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F850A74C8F
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:27:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3379E7A4F80
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BCC31C3BE6;
	Fri, 28 Mar 2025 14:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="uLjDYJbw"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011025.outbound.protection.outlook.com [52.103.68.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772321DF257;
	Fri, 28 Mar 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172010; cv=fail; b=c3kmNVv3rxmv0OUxFNldwuPdOSYl9jmTrR+I2vw8NKUiWigDYv5rRJTD05aGV0LKzkA26jozVlqseLY/3jUyP9i2HT8Ww+qKqPt8p5VfBfgRecxS/cqAMi8xLTxA+TOM5uhlgNn5WSa2rWAIZhQyeBR88VPGdin4ad/htmEU+CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172010; c=relaxed/simple;
	bh=Xk+sX8o4vd7iZbOU2Fje3IolpO/Ahx0RSAjG+eufW9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T7sV1JPa4a3VZe3MxS57LDAXH5hYMZsYAf3jXdW+AlsXMU73tcg6YP4eFsRIHqo6DlaNw27NaZuTz2yWGG30ajnVw+DomaCcbaiKxRY+74ZVR4QUSx4SiHJwPRjeZflDxxNYxbmiv2TV4g9oFNFEqHTbdWaz43QGOJjWw4jBh9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=uLjDYJbw; arc=fail smtp.client-ip=52.103.68.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uL6zExnis5wuwuADImdYzVL5+UbUBRxIL1nHR7vXqnga5Ga4LYN2wwWdRc/ATEbFFKbCg+UM1hH0wJYtgVcIPP2jGe7Y6EPADeiOi7xsU9URdZeUbxCgGJ7/vRAw1MzH20UDou0HiMskDLauAs6h0v2jZjzymFRO0EgYVucQSfccrR10asZf+aiadGonjxVSS2lDXvSBO/68MeeBtEHBC+WUndp4yujo6r0RW0nN2iMYVr5dwl3Jc3hHVVRatK8cy7eMNRZsL8GMnE78aFSNDWqXiGtTwal36Qwip+WHiBdWijG7fHTfO1j1T/9mXJs7Atj1FXxBTbYtmHVTAliZfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbyjMLFYmKZ5m4fcaEQ4TBzxn+otuHcOhtsOd9NdxhM=;
 b=Pa4L/Pr2qSU9Ee50dW74wkj6XLleAJ/mAQdHsb99JjoDlpQrOBJYWiOzhX00Gmoqr73jIkivdJiPHa+kXfAiTXVwZrv/rAgVssgRcOWaHH44IYwH23vj/uGf0M56DZvZ8DMJBo4Unb6RP72CwNNEoL3ph96D0sDFOdVXebhG86xidNN6W2n23W0OEVYO8xqdkte7nwTm0AF7Cq3urEh/EDcSkDMEuKhgVpK70OoRImX0ldg+3FlKIs6ryFgH8uVQGX2QXsYjgSBJ+4B+l8tUSBMNWxQdGD94hhSVDTgugquq/+04ytN2Hqo/jWP+w7zpqKUNailYzZ8NbcE4BKSiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbyjMLFYmKZ5m4fcaEQ4TBzxn+otuHcOhtsOd9NdxhM=;
 b=uLjDYJbwF4rka/sLXfs00trRY0Ow9Duyf2V7/VmyEcco6BeHQaTnLLqbxlLM1/lA0o+zhYG0qaGipdLan/wK0EKh/O/Wq0rp8R+1/7chgz2na54FnXmb4OzYJJP49q40sDjMyfB9Fe7RI0d+IVS2GUkgX/WnWI2lGmdMK5hPN9UatboyQ5ZIf7+cHBboJJghZ7d6UG5sYIpweIKKrp2LaIrj1kzfTlIfxEPn7MKvz5CgZKd++Tfn+FUusAMYNdoBS82TTLMdGrPWxneHuhzUDCrYWjFzoY3JI2gXbH5kYtVKLeqSqijNbI8MrCf3zdx2JJvvJpwIOCqroBMXtQ16SA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9447.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:44 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:43 +0000
From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aditya Garg <adityagarg1208@gmail.com>,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 3/5] HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
Date: Fri, 28 Mar 2025 19:48:25 +0530
Message-ID:
 <PN3PR01MB95974B0A3A09448CC25E0E42B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328142625.12980-1-gargaditya08@live.com>
References: <20250328142625.12980-1-gargaditya08@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::20) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-4-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: 25905a1c-80e5-4d8c-b671-08dd6e049053
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YHrWZstvc+pWd0lskk1UawiHWSLophaAJsUm5C6oLWBWy7q8fvO8cV9f97Ws?=
 =?us-ascii?Q?SAfrr2Vqo76nn9r1hMhPZ0PEr4Wisb/lWqfBPjiXkwf0458CrL+DliFa28oM?=
 =?us-ascii?Q?AKoR3M/2hQjgf9CthiK8UE0Z/vOOvA+CelI5Ojp9YlS5qBcTzqWboDT/3OGn?=
 =?us-ascii?Q?0yflz4DL2BW9EJspQmDb5CiyrLnUPl5+ST1T2WZNzPeKGsQTJgX0vEAFAFij?=
 =?us-ascii?Q?5z1BtZodF1yw/oieHygd/GtzHzUyZo5e2eX3zBNzcxCAF+UCerFrfJrP0kEF?=
 =?us-ascii?Q?k2ZAPnNjtNr7jNrCHO4Q6TxZCmLUnL+Ep9/bXeOhUe9bOUp3WcyxOJ6hPL2Y?=
 =?us-ascii?Q?pVsK/jWhDTQN7ScW03f2s47ymsZV3p8aMPxIrRN2f3pX+PE9J2eIO63CLnZz?=
 =?us-ascii?Q?AknI54r/dlvMdxj6RuqmRiKiXCexcWfkCJIkUC0gnYBScVxzsWprOct6jt1X?=
 =?us-ascii?Q?djhpXi0D+MmeG98Jh52Aa9l3nm8FR4ZfMPW3ZyNlbBYprXHtKWyHhICNUSxq?=
 =?us-ascii?Q?lLZIOmHJ+/KL2SLPuZQTVieC3P7FK9FgLnnSijWexxCeA1DK1i+TqE0lxphB?=
 =?us-ascii?Q?zBR63W1uaLKkqHO60PTFAvHSogUCR2nDO8DlIma+hTBjLTiJKOaO1IicS9jx?=
 =?us-ascii?Q?BaWXtGlaHCCxwF8+SA3QFydPvEmBDsmuv05u6owGBGQRK555o8m3XPbIKInk?=
 =?us-ascii?Q?Em0G1UyE1RwQeObyrUH5mZTO9RGrm32jwJRd47PJA+EIB+LFEIIv+M5ddnqg?=
 =?us-ascii?Q?nRM80AGMpPwiHApxFV3LW/fr1R8u5m7FSv6RMhVbJ5WlHD6VenqTI5lGQf93?=
 =?us-ascii?Q?uUtHT8/UKkx9Kg8RnQTI+RGj3k4NIzy36FfqXbx3necsjS6DdebUfSnJGurE?=
 =?us-ascii?Q?ThxHQUNYWLDMIaFMQK85Y1kDCTwGFV/QrkhOwwVWZjg8Upc4pbtbr7+ttWGX?=
 =?us-ascii?Q?lLWF7IvI3hpZaNJ69JG98BltLM1rLm84045qk3eb1BEVtJhE4/zU6VJ4A50x?=
 =?us-ascii?Q?lPgDvybGb0/nKy/OLZXd/Sa4pe7PvoBx+ROrVA4x8g2fcHqY1wOHEDX2mqap?=
 =?us-ascii?Q?DQsFA7RAv2pjbojsBSY+igNA8kGpNdQZoLYD5u9tJv3QTYsPg/NKLffB5co1?=
 =?us-ascii?Q?Qx04hBUGv/p0f5y+6+oQAZOPetcPS1fwUQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9jjbKf9qP9Wlnxc36POfaTlZvgoi0Lu9ulKGFXO/P7SLcZhkw7REfa//OAOy?=
 =?us-ascii?Q?Om2+F5L4Ca1pSMd6+zITujVf0TNRvnebS/iJOBIHdmLetvbgNTTE+9GMVGrs?=
 =?us-ascii?Q?LsAr/9NOvAfRkWdZFsZeESDHszxZgpKGGfz3zo/G0S5Mmpkrn+sU5xdexuQp?=
 =?us-ascii?Q?7ceGcfQvrrPRmaTus1GdEKBbRafZ5zmOcBelMwFYdxy26b395La2gbFCLG0j?=
 =?us-ascii?Q?FXFCc7my9LylBmeLXboLCw0AvlzMXnFR0e8C8dNhdwHYigsABsMZrJaGKHNG?=
 =?us-ascii?Q?ZbmUVjbvra7okJqUI7R4OC8QAeHilCpBjFHgfbFH7SjZnF/NZT5I687OxOE8?=
 =?us-ascii?Q?NKrdq5ZqTOWc29jGdv615Q67wPnMJNsatyuSFB3xmBVnP/iPfQVvt8rWN6r2?=
 =?us-ascii?Q?VO2FDraX6UBYu+7bRICL5qc6bdkhLijFLPT6KrT9CX+r33dk9+WTjEaW20Yc?=
 =?us-ascii?Q?JIxRfyGeiZ1ShDkZNskScUPOeQl0AAScF6IQ5kb/XBwVWb4yXvLq3T8Vq1sT?=
 =?us-ascii?Q?9vI+IIPudFmbTde/FQ0mnq7GhOn8yBUDXVwnwvzr1BrJc/6arbxsAZNcuDt+?=
 =?us-ascii?Q?k4R/hdXJzcoIhMPFi0tYg0C+P6GMMfR2bw3j9mQxI285Agx5+rS4q/MG6Jdq?=
 =?us-ascii?Q?zcAi7LkMKvicd58SfG33HInZFEyLKct/11J67I5lhn99CTIaRSR7pl1jz5/j?=
 =?us-ascii?Q?mR4gPNQmgCNbSv3BxNa+Kt/+OlDsmq7fA1YeVkEt7N6PvlPpFe2IbC+f4JKC?=
 =?us-ascii?Q?SNPXTpMwDNGug4ZSDU2qZOQKCMWdQZkOpM6GBpSJ2zfDYd3Bd9ftgPk78zZX?=
 =?us-ascii?Q?Moz9X32jMioZ64/CV2sj4a7qqzlL4Kn6sxa/fwQVIjzkQGb9ViTNtYn8NoyX?=
 =?us-ascii?Q?EAz9k9gwHU6hpt82IiP/piTCgrJMotlDDmYW3Zk2v8LejTMUqKnIS8Lq5iwk?=
 =?us-ascii?Q?+jKQD3zj4FoAZWfAKT8KHPeVwSVBAERw7Dwx6VYKo6wbdoySNbGpG5CrKsmf?=
 =?us-ascii?Q?X3Z3eyFI4YOXyfLWEGg3SngDiB0AjeZ+A0weB+WAvM0qpm/sey8lztGNxOqi?=
 =?us-ascii?Q?JB15zxPRyHafYUo+6jll5Mo92qSu+n4PUXHlecGN4VL2nQoqYHPsknarOjnW?=
 =?us-ascii?Q?oXM0e5oPfrmVVzQOYZelmsJBmNmbyy1fVPZpCe8apznWUdj8WOJ3NtDoB5Ls?=
 =?us-ascii?Q?ki4RqY0REepXJkEGwSDHUxMMsGfJQFX9SP+Ka8eDlEsNqadJsWZtVBfk99FJ?=
 =?us-ascii?Q?PJRYbousjuYRnRUx8GTraoOrFegyUk08rIFnUUnwBx/u4MfGeFIrNBtfc2vR?=
 =?us-ascii?Q?gJI=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 25905a1c-80e5-4d8c-b671-08dd6e049053
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:43.9617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9447

From: Aditya Garg <adityagarg1208@gmail.com>

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
 
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
-- 
2.43.0


