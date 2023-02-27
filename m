Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228AF6A3B9F
	for <lists+linux-input@lfdr.de>; Mon, 27 Feb 2023 08:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229777AbjB0HRi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Feb 2023 02:17:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0HRh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Feb 2023 02:17:37 -0500
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F831C30D
        for <linux-input@vger.kernel.org>; Sun, 26 Feb 2023 23:17:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3EtZ9+zDlP7I2RkFN3rEeq0F+ebiu1gkaC3ZkMHhEsDD0qlY4iaBKG9KrWz3Bym5nzqV4HVJU2ixEVTmEZASV1enaj+ysNZEd1hKWKcDGbTIBmZruR0chRxiOMH4vtnR8E+ly/BsHWXfbgd8g/fjsYPnExxLufRnTaKivs5gNFke8zqCjQJ+Ipaxc5ACZqtoyccXWC1qfaRSOftFXH63dCSceFWhWjeiG3dKzQbwstFenHy1SDUBecIltkDPg4ftthXA7Rua006pV9B3fNgNTygbpQ7VzTfLu7/Iy6z/LwERdvD/bPEvdadajgAVgayro9cCy4236SPCxAZEdWxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kX/xMObPFGaqmFmU9oafeA1TkDvbp8N+wdI+5gKZtx0=;
 b=ISsOQpH/tXRhNogwrEufMJ0ELFlEHylb0swunUJat9390q8d8vDhz8A9PwnNTw7d4vzEsZRHufKpR5EA77VHDQI4JfKmt/+4OjtywFeS+cgPcG2V2kpYC53qrSgrwtjY5LcTaOBNwMxrQXlNxb4qqnZvAxFAdA2C9bXEcIPROdSPiDJ8Q63mmE64HHXiwQxLNXR9anAN8cDiGjRMO46FYoTWxgmMXVUTd7RqDSITTzkvw0vFwHN4WrFfktIbkkjaxhnnfl4qCaGtn6vcDyvEzrXwxJFaRSPgAbyZ2a1igjvOLCjvWEzWAL7ZQpJy2NRLh3mAEqfAGyig/Lz8NDEZcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kX/xMObPFGaqmFmU9oafeA1TkDvbp8N+wdI+5gKZtx0=;
 b=AF7cUAE3AmRgCeKh7N+fO/TgCyCrYLp37iyFVqvy9Ob5g9FZUy+GOjop5wstLGBmWtQ5PNPP57cM4AK4WAjN1PPFZalA8IklYClo0SEIQEG1loN5NCzbtcM44jHKBMTony1eBSElYHqle0KhpfJo30/HERQgNVWSVQWq3MtAUQE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA4PR04MB7903.eurprd04.prod.outlook.com (2603:10a6:102:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 07:17:33 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::1793:79b4:2cb7:4db%7]) with mapi id 15.20.6134.029; Mon, 27 Feb 2023
 07:17:33 +0000
From:   Jacky Bai <ping.bai@nxp.com>
To:     dmitry.torokhov@gmail.com, will@kernel.org,
        catalin.marinas@arm.com, shawnguo@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-imx@nxp.com
Subject: [PATCH 1/2] input: snvs_pwrkey: Move snvs pewrkey to misc dir
Date:   Mon, 27 Feb 2023 15:19:12 +0800
Message-Id: <20230227071913.334617-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::13) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PA4PR04MB7903:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f0afb9-56fa-403a-81f7-08db1892b1f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G/JCBCilLayc7VRtXfIE+nH7ytk+z8tOvoXugsePxuCfXGEXLLv/BWDWCK0ktGOcWWtK9zn7t5xlaq4U8AeuWyi4gftUsSTMiUJN3ssixbkgL57JxVeRHjyfxKJHU5oNqm2qiWKQypOuF8CjBdMSW67sCCqL3wBln0vlHe1J9deDFMstcte94UWSTTPnCK5ZFV4n7z2QVuOZ4Cxf8/CX921SscZ3IWqmOGqIP1xYcSpur51XVL70juh5K7tvhcSdFNh8cgdR05KEjdN2+1dLmU+m3AEgwmWlNzryoaRojkBjcGp8Lt4GC6Gxe1Xngu4uYp7UjtwWYK/Lraa1LOAWdrv0rnc7OPRacrJHMdYBSHOmY7EDseFu/Fcdtt0VB+uFRxakiQJmRbjZ9an9SxmP8mV3bTGfhG5a/qMOgM6EkW48o3zq/+pZyMaqp0wL3lazCQxnoRqRQtiN3oCDD5iqiKBm2bUrxQK5aBt7f/QT+bsHe4RsdUNoykbIWxOYOP1Wt0Q63paWNUem8IQS/SWKkii3KLUqOcpmlLWFcg+si94WOpAUN+7H3O5IiRJJSrAQwGtQyeYk040n4cgXPG9OE9/Qg942OdJkT7ALWr1XM2zw/ha1Sp6p1Xe/9lshRDH98RmjKpMrrg6NISDClaRw0kone/2N4p9DAGQTF0gHR/fmEkPy0NFkLB9mwuGfbBirrsvZXg5Q2h2kH2r4ktnKVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(451199018)(316002)(36756003)(86362001)(38350700002)(38100700002)(1076003)(6666004)(6506007)(83380400001)(2616005)(186003)(26005)(6512007)(5660300002)(52116002)(8936002)(2906002)(6486002)(478600001)(4326008)(41300700001)(8676002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rD2rUNnM2ogyHOrpQRqcMKtyFaNDno9qRRVcjRhfTiOMdyV8yoJ/wOvjmlrF?=
 =?us-ascii?Q?WDzKLVAtfGHoUtL5PTuZlBuIiYrDGNc1fPOdUGX0wzhzKCBKiU25NouWQCEB?=
 =?us-ascii?Q?RACWv+Z4uglnk5rUojfCSEMjxU/IwjIqgVpdlS7M95SR6xNsDbzNFmmMTgMs?=
 =?us-ascii?Q?Xn5j7XiDsQ3nSHc9MQk5h4hl7ruSI9BJI8kuH5keGLck8QKgRaGjQj8pHvhh?=
 =?us-ascii?Q?e6mFsqT6/urtQTr4tWYc6gNKV8QuUq24DSG6yVYP7ZKjhZk/df5LXjitm6w1?=
 =?us-ascii?Q?7AoaDIETPaTXlIWMCWw2uZMggVVpb9pid0G5MLyEkm0jjCFb1flQESu/RTVv?=
 =?us-ascii?Q?zBk4xG3NxIem93L+Z5qbiXZKqRuta3batVCzLoeyA+F12M0sne/DsWMECKHK?=
 =?us-ascii?Q?hSYg+ve3hYkyQvjw/CNQPQVAABAKQBnI8kFePmf4wo84CeWOhzmmSa3bSeoh?=
 =?us-ascii?Q?I1XUz9NmAD6obXNm7y2fNikcsPQqxphKRhpJJ3AzxtQr/veodoFCJjD4d2Gi?=
 =?us-ascii?Q?SPGYhoFHZCs9+Vh9lRJ446D9LHyajOb2o7m7ZpqcHvnWs9Nwn6950UIeDam/?=
 =?us-ascii?Q?BZCRhuPRlcsRjucVwa8hjWFK2KQcy/cw4ctbfmIMkiW398LPmfUAg0GQfegb?=
 =?us-ascii?Q?Uhw3OJnv+MRq5YJNGINUG//hQlGNEqqVBR7ueAHCb3Noq7LwM20ZBTg3BepR?=
 =?us-ascii?Q?Lmdwq1kpdbdGVqwbT7eOZgLnLQ6Fxkd2908IqJjToLH1T2zAZOFqCm4JaeXf?=
 =?us-ascii?Q?kVre7xxjacNj7BpcmA+3fcOHgQSkPfa3OT8xgM3790fUK7KycpKUhiqSWDrr?=
 =?us-ascii?Q?esP68YCHcd7bFTZZuNXDD/dKIaz8u9Rakrzg5/3EHaLgt56HO47QSO4m5Rnc?=
 =?us-ascii?Q?YpSnEFwP5HsdfpwvrTOhPnbmmvZvvykct3sDC5s5so+5G/eY6EaDAeyYpvq8?=
 =?us-ascii?Q?JpxhGK8CJKySKy/Kh3dyJ19LjKxFMH1n0pdLRHuVaEvaVUdMBxXwjixXWQf9?=
 =?us-ascii?Q?iSHTVbmf6Je5vZX4DZnMz74l8kbFj/iWIpaj7eVj0UPmB+puDh26KN4fBTpg?=
 =?us-ascii?Q?Qg2q9OIwk1329CKvZjmIzzikCS9KOELKKgu6feYnRaJvAtk27Wp6rrYbI8sm?=
 =?us-ascii?Q?TX1jfuNgYr0wypdNIohvc+wXOSs01/wWi7wXKm3y8cJQ3sava5jD6dwmLhtr?=
 =?us-ascii?Q?3bAWRDv0gudc3VZOgV49tzZLaZ+h5UQpxigzPTaIaeOBw2Nj6PKAArXc+gyq?=
 =?us-ascii?Q?gBu7+LEf1C/oeAnQSTRKqZ5TwbVefwzxXLD8aUwkg1f0IxbdYPW02WuscIuF?=
 =?us-ascii?Q?fTT9o0BSHQPZkd5247Z6ldERZ2OSugJ9efqkLxfGL5/c95aEzY62CGMVQzI8?=
 =?us-ascii?Q?E5uS34waHMKJuqutEQwiiOrJ/xLx+IqMIoVWl8XntFU+TWlNFToUDZ6pNM1B?=
 =?us-ascii?Q?1kTlvykEDfdd3N2bOfvh1f5UDM5q2C7NIB/V0Bx0dqAIWiue98KraanmLgUz?=
 =?us-ascii?Q?FKuap0fBMQVKxzhRuhMBHFwahmJqSiiu3xnx2zGmlAeMuGBCaAu/bwVFv3OD?=
 =?us-ascii?Q?uD3Pm0Tz1EO0If5Xgm/ANY7FyZ8292H0PrdUBMbm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f0afb9-56fa-403a-81f7-08db1892b1f4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 07:17:33.4949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Dg9Sntmg8C11EQ3N5vxOlANVqbrwL1mhPJWrIhdruZ23HXOsSlVgJLPx+WvBQx0nQzPvpExs7Z9PVUCMmHt0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7903
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

snvs pwrkey is not a traditional keyboard device,
more sense to move it into input/misc as other
pwrkey drivers.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
---
 drivers/input/keyboard/Kconfig                 | 11 -----------
 drivers/input/keyboard/Makefile                |  1 -
 drivers/input/misc/Kconfig                     | 11 +++++++++++
 drivers/input/misc/Makefile                    |  1 +
 drivers/input/{keyboard => misc}/snvs_pwrkey.c |  0
 5 files changed, 12 insertions(+), 12 deletions(-)
 rename drivers/input/{keyboard => misc}/snvs_pwrkey.c (100%)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 1d0c5f4c0f99..3d58d0457103 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -445,17 +445,6 @@ config KEYBOARD_MPR121
 	  To compile this driver as a module, choose M here: the
 	  module will be called mpr121_touchkey.
 
-config KEYBOARD_SNVS_PWRKEY
-	tristate "IMX SNVS Power Key Driver"
-	depends on ARCH_MXC || (COMPILE_TEST && HAS_IOMEM)
-	depends on OF
-	help
-	  This is the snvs powerkey driver for the Freescale i.MX application
-	  processors.
-
-	  To compile this driver as a module, choose M here; the
-	  module will be called snvs_pwrkey.
-
 config KEYBOARD_IMX
 	tristate "IMX keypad support"
 	depends on ARCH_MXC || COMPILE_TEST
diff --git a/drivers/input/keyboard/Makefile b/drivers/input/keyboard/Makefile
index aecef00c5d09..80eeb02aaf79 100644
--- a/drivers/input/keyboard/Makefile
+++ b/drivers/input/keyboard/Makefile
@@ -59,7 +59,6 @@ obj-$(CONFIG_KEYBOARD_QT1070)           += qt1070.o
 obj-$(CONFIG_KEYBOARD_QT2160)		+= qt2160.o
 obj-$(CONFIG_KEYBOARD_SAMSUNG)		+= samsung-keypad.o
 obj-$(CONFIG_KEYBOARD_SH_KEYSC)		+= sh_keysc.o
-obj-$(CONFIG_KEYBOARD_SNVS_PWRKEY)	+= snvs_pwrkey.o
 obj-$(CONFIG_KEYBOARD_SPEAR)		+= spear-keyboard.o
 obj-$(CONFIG_KEYBOARD_STMPE)		+= stmpe-keypad.o
 obj-$(CONFIG_KEYBOARD_STOWAWAY)		+= stowaway.o
diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index 81a54a59e13c..35cb522b51cb 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -939,4 +939,15 @@ config INPUT_STPMIC1_ONKEY
 	  To compile this driver as a module, choose M here: the
 	  module will be called stpmic1_onkey.
 
+config INPUT_SNVS_PWRKEY
+	tristate "IMX SNVS Power Key Driver"
+	depends on ARCH_MXC || (COMPILE_TEST && HAS_IOMEM)
+	depends on OF
+	help
+	  This is the snvs powerkey driver for the Freescale i.MX application
+	  processors.
+
+	  To compile this driver as a module, choose M here; the
+	  module will be called snvs_pwrkey.
+
 endif
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index 04296a4abe8e..33de0a3b5f6a 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -90,3 +90,4 @@ obj-$(CONFIG_INPUT_WM831X_ON)		+= wm831x-on.o
 obj-$(CONFIG_INPUT_XEN_KBDDEV_FRONTEND)	+= xen-kbdfront.o
 obj-$(CONFIG_INPUT_YEALINK)		+= yealink.o
 obj-$(CONFIG_INPUT_IDEAPAD_SLIDEBAR)	+= ideapad_slidebar.o
+obj-$(CONFIG_INPUT_SNVS_PWRKEY)		+= snvs_pwrkey.o
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/misc/snvs_pwrkey.c
similarity index 100%
rename from drivers/input/keyboard/snvs_pwrkey.c
rename to drivers/input/misc/snvs_pwrkey.c
-- 
2.34.1

