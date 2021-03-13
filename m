Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44ABB33A03A
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234377AbhCMTOG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:06 -0500
Received: from mail-mw2nam10hn2231.outbound.protection.outlook.com ([52.100.157.231]:19535
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234071AbhCMTNZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARD86VctSTuMY7/rAnr1u1oyG4f/yEQ9nAffaA4+vqv0PFZYO+IfBDHKDHOk28Sm9SYlzfRgtgGQMVnxjLPr+O0M+530Mdf4qeFByEuYtrXGuVNjFrjOwV4e3apQwbw1VsRHWbQAcIqyh/6zTWoUhXXCM9NnAAaRRiaq5FeY+/c3J+1s1gAEIOUkPvksGAXEFuecBMVQ5JvUnNNEKXwEK40obU8MLquyAWEO9X36A4vUBhlTWETrfIrhSTGWNm9fnScW3Q4SsFxNDDZcNa332I1DWQJGmgS6vFWbTRrNr4ct+YnMQKTpZ8R4xdFLQ2owlzc80YXhSxVgR5+qfg4itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH0i1UDyHeNOZyUtxLkDiNiLMUm/TbXQdW5dCfArzMc=;
 b=Fki5daiwIGgBw8SfwFQ3hZbcpcn5iHURsc92uq2uh4mjj/TskmkdrGbu3Q+EYboJDLUUk2DSz/Lh+LlDqkrimS15f2SWs5THOz8gKKyKn5CXplnbVbWdxvEDz+I2lPeXYeoWwPndXxr4uSEL4Kt0p9RMCJRsToWDTrEfmn7t10Svcd9CqM/+AOCo/1MLRkIxSco5ZIvlEU6N4H7lAy2+e8+F0vTiXp8xKwh1Kizedrp4aVKAUEEZP5R14jOdbkKvFz9ROHNEeJWlQSJ4oKQtUmq2rdevbYXrHPp6965qPii3ahIrKEpmwB2uQ7la2wui5Il0HTfsuK0SlGsmPYuufA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH0i1UDyHeNOZyUtxLkDiNiLMUm/TbXQdW5dCfArzMc=;
 b=p9AiAklGP+g8ZgAcXhfwQ1f5f19wNL+Ih6DCUHiKLakUbv5kyzluqdkhbeS9kTA3pRi843LR/qIkv2K/RZX+Yzrcr8f10Dt4tToNe+P3pVJGVi7F0elCTA/VxZpv1CYFX4pZ+GE7wWgMPpyuohqHEEVseSeIOxjyNye/a6zeuLI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:24 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:24 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 4/9] Input: iqs5xx - remove superfluous revision validation
Date:   Sat, 13 Mar 2021 13:12:31 -0600
Message-Id: <20210313191236.4366-5-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dd664148-60ee-4566-e26c-08d8e65412f9
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56943559517A54D751CC1F06D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jf6BE/iIKWjYa/d3Euha56BQgtaI72MxTQdt08IEJ1mKEKbOZRx6siGPKVEX?=
 =?us-ascii?Q?T5YORJfH+2C8OoC0pBovoFLbdToyHa5I6P9+3P+pqLbTFEBDA9FxTUpEqFhX?=
 =?us-ascii?Q?5MJ2JEay7Bx+OBxYYlPeFCx9qtYkPrqiy2kqubnolkkYelqS/WURi7FvvLoH?=
 =?us-ascii?Q?U/jr8nt658xT+K6j6Uy3pNKqyv/RABlyzYAONH91GXttZdJp4hDDSIRICkpW?=
 =?us-ascii?Q?VJkLZ1c7BooxE6NZIXuhnk3VOTJ0HXUeOCo4J4t1knhm/eF113qh6CIsAkve?=
 =?us-ascii?Q?NxasCR+RDUQaKowWrOT5VzEzmBYjPpF+f0gPCq1I0s88GT0HF7jng2csj6VV?=
 =?us-ascii?Q?+XhHMXTI4JF5PH19oshl8jK9wf/tdqkXyz73ZGqTXtkgzvxEl2CfEwon/wxN?=
 =?us-ascii?Q?9omduG6EdD7dpqFnB/FdGmZpQwftLzmrqQr3yP5ey0Fa7OvujYkVhqTizQiE?=
 =?us-ascii?Q?e8MXbxHbwUdAvfvu+t5X09Rb3VHRn9V2Tf//ZuSjGia3kvcm1EWQWk/kmxcP?=
 =?us-ascii?Q?9t8p8y7XQFsJe1+DHsUrw0wVf33RNUBQaTkhAj3mPonjRAi80Ic7/llR7c5f?=
 =?us-ascii?Q?DsC232QxfBsMZopT7yNj61BZR2r5JSqsSSkiBeItmY1ooDktNpWRgyjLuj3D?=
 =?us-ascii?Q?sHij/s5cWbCrHCXA4RSMzmxhQ5BsNAXSgehwUg41WS8iCV269XvfxxAFpdJV?=
 =?us-ascii?Q?4Z+KegxiRMM5LtNbhQ7YQ45BVHeTWfLbz5iIu1Rr0JbYzJm95zsE8jWV/U/u?=
 =?us-ascii?Q?llrK35y64Lu3ZB9fLRHzfCZaumjg7YY2VceyWE1ROR3MhVP6tDfYYwA3BUx8?=
 =?us-ascii?Q?y3nmzgzdglOSTLXIiZpxytMhz+GJRzOBIOJ6kyPzigd3O35KOTjanLEcAIlo?=
 =?us-ascii?Q?/ilOjhquiFeCxPWA4Y9AxQ7+4t6+O/BJoZi6kE57RQ0BMv8O4TeaRJEnnHwG?=
 =?us-ascii?Q?oweV80MznLaFIlqQuWRghw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5W2jVX9L906sCOT2H70aaW1Fru9VkgQChG1D5AEAf8g8zIQ5lvUAcStCtEUA?=
 =?us-ascii?Q?314tJi06SyjuffCCMwqPgrWIjwMvR2TqD53NObdg69J2+KvlbCMbbIp3GtFE?=
 =?us-ascii?Q?YcErAoZG+J6g5ZB/FyZMHkpZa1w1ggBxt0Qqa9aSQKpYA5d1+Wc7uIFWzWrt?=
 =?us-ascii?Q?Jko7BaGgyNm43XK30ZttNfwBLhYfBHZU3vfST6jSg6UCqMZ4GilPxP6A88yJ?=
 =?us-ascii?Q?8656K6l++IgRZ44HfEZ8GHup0oJFKts9Zw6BLYeP8dbBmxEC9iDLK+ykxVKf?=
 =?us-ascii?Q?FiuKM2/LxaRRqvYje6mxk1Q7cjkMEIUNqAlI+YXq29QX2r7NVgeWR5n4b0GY?=
 =?us-ascii?Q?30PKATopY3Fbsqa38M95yGr/ABBe++y9Gt36p3Jq7VI1r1XdghV7kTBMzSrc?=
 =?us-ascii?Q?Zj5UeLTIQHsENGC1MobEw8mUj/5S8R6MjrRlXl7cWYeSh6Q1iZ/YRcQMdvoi?=
 =?us-ascii?Q?Zc2kuEuar8RTz/3BQdb8vAHXCQt5J/+/ORA/vIJQ/DfyqpIWn/FUPtYmiylu?=
 =?us-ascii?Q?4pQMeCCG6NMe4S/P2+MIyZEDluXAIcXKNsPRqm2ktK8Dt4eRachmymNPhEq9?=
 =?us-ascii?Q?3/uv0RfNt1uaRTDZuybfT2T9q43pYLsP4i3MmIJUS05XfnoFU/GPxw654pu5?=
 =?us-ascii?Q?FuKrrufXUXYzGncBuJsLLNDOEitLiAzkd0L3zYiZCI++ruhLAfUzhE058zwI?=
 =?us-ascii?Q?Ap5boj3GElpFDR01awpuMWQ78DOEUvzS1sl493+vhlLSRIiu0mEnECcXp3mD?=
 =?us-ascii?Q?QEVALZU96C/vTKC6P7VomGXIGyN0yPefNzG63XQ1uggp6IvoR9Pf4sj9HXUN?=
 =?us-ascii?Q?rv/UwueK34CvRQEGrDZBfOQGrSmhlGFOzo6qlIAYzonmYy+QjA7Yy+xARxNS?=
 =?us-ascii?Q?O21XvMud7xa5x4oQpxRJjIW+jdEn5UTjmsUnEEW/DAFj8LYQusGkI+01hE/t?=
 =?us-ascii?Q?V9RDKteZ3VyjbJu9J9KNVGqh3o/AHvm5NWxFJPwWP8hgIPxpVbnnNN/Z2Yeo?=
 =?us-ascii?Q?q9IjpunbQP1nLzYF+qlR+UXS64e1C2kzEoTBukGp/s/AFTPCH66Zm3phbJ+1?=
 =?us-ascii?Q?z1T1nPnO6GGVgzVb5aMfULx2Q+2lbfaxHAHbELG3WhfKIf1FTWGeBvBUcZLP?=
 =?us-ascii?Q?gkS7Zg0AATS6+MVLVOPiClwgdZLUw/7CVovkDb4LlkcXvC22v2/mvDbKa2of?=
 =?us-ascii?Q?tYfaSB2DicAi9YflUccnroXUhrJaG1BUaB72TWyVsRQB8U4OOnteG5v8OSLx?=
 =?us-ascii?Q?4ikkFZZF6WSVZkIZZ6kIci5AyR9N4GTpLNWp6VXk3+cPi21skZT2TIyvN1Qv?=
 =?us-ascii?Q?WSyx8v6pFMEwiyyjx/89h6Z+?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd664148-60ee-4566-e26c-08d8e65412f9
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:24.4222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8rmLCWRFdzYl4+btJC4uG6f4FrVlAoWajJLcaP/R+4wFTSVfurDTdXwb9Oar5HxUYpC8RhR1hQWo8X0Im0fgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The vendor-assigned firmware project number is restricted to the
generic project number (15); however the vendor may assign other
project numbers to specific applications and customers.

These custom project numbers may be based on forwards-compatible
firmware revision 1.x. However, the driver unnecessarily rejects
anything older than firmware revision 2.0.

To support other applications, remove these unnecessarily strict
checks and enter the bootloader only for truly incompatible A000
devices.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 40 ++++++------------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index f36d170e14b2..0920516124c7 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -36,9 +36,6 @@
 #define IQS5XX_PROD_NUM_IQS550	40
 #define IQS5XX_PROD_NUM_IQS572	58
 #define IQS5XX_PROD_NUM_IQS525	52
-#define IQS5XX_PROJ_NUM_A000	0
-#define IQS5XX_PROJ_NUM_B000	15
-#define IQS5XX_MAJOR_VER_MIN	2

 #define IQS5XX_SHOW_RESET	BIT(7)
 #define IQS5XX_ACK_RESET	BIT(7)
@@ -87,7 +84,6 @@
 #define IQS5XX_BL_CMD_CRC	0x03
 #define IQS5XX_BL_BLK_LEN_MAX	64
 #define IQS5XX_BL_ID		0x0200
-#define IQS5XX_BL_STATUS_AVAIL	0xA5
 #define IQS5XX_BL_STATUS_NONE	0xEE
 #define IQS5XX_BL_CRC_PASS	0x00
 #define IQS5XX_BL_CRC_FAIL	0x01
@@ -573,7 +569,7 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 	 * the missing zero is prepended).
 	 */
 	buf[0] = 0;
-	dev_id_info = (struct iqs5xx_dev_id_info *)&buf[(buf[1] > 0) ? 0 : 1];
+	dev_id_info = (struct iqs5xx_dev_id_info *)&buf[buf[1] ? 0 : 1];

 	switch (be16_to_cpu(dev_id_info->prod_num)) {
 	case IQS5XX_PROD_NUM_IQS550:
@@ -586,36 +582,16 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 		return -EINVAL;
 	}

-	switch (be16_to_cpu(dev_id_info->proj_num)) {
-	case IQS5XX_PROJ_NUM_A000:
-		dev_err(&client->dev, "Unsupported project number: %u\n",
-			be16_to_cpu(dev_id_info->proj_num));
-		return iqs5xx_bl_open(client);
-	case IQS5XX_PROJ_NUM_B000:
-		break;
-	default:
-		dev_err(&client->dev, "Unrecognized project number: %u\n",
-			be16_to_cpu(dev_id_info->proj_num));
-		return -EINVAL;
-	}
-
-	if (dev_id_info->major_ver < IQS5XX_MAJOR_VER_MIN) {
-		dev_err(&client->dev, "Unsupported major version: %u\n",
-			dev_id_info->major_ver);
+	/*
+	 * With the product number recognized yet shifted by one byte, open the
+	 * bootloader and wait for user space to convert the A000 device into a
+	 * B000 device via new firmware.
+	 */
+	if (buf[1]) {
+		dev_err(&client->dev, "Opening bootloader for A000 device\n");
 		return iqs5xx_bl_open(client);
 	}

-	switch (dev_id_info->bl_status) {
-	case IQS5XX_BL_STATUS_AVAIL:
-	case IQS5XX_BL_STATUS_NONE:
-		break;
-	default:
-		dev_err(&client->dev,
-			"Unrecognized bootloader status: 0x%02X\n",
-			dev_id_info->bl_status);
-		return -EINVAL;
-	}
-
 	error = iqs5xx_read_burst(client, IQS5XX_EXP_FILE,
 				  iqs5xx->exp_file, sizeof(iqs5xx->exp_file));
 	if (error)
--
2.17.1

