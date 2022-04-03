Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 291F94F0CC3
	for <lists+linux-input@lfdr.de>; Mon,  4 Apr 2022 00:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358225AbiDCWUF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Apr 2022 18:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354871AbiDCWUE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Apr 2022 18:20:04 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1anam02on2050.outbound.protection.outlook.com [40.107.96.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCCF39832;
        Sun,  3 Apr 2022 15:18:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RaISrDWcQ72Uhz6QDh9dvuiRBGRkQE47FJSh+i23JPQR0ktO7APV9f26Zda3rhuQZpC9l8RSQlJRdmPCw3sFl7nB8csyQin5lxFNqgwwaTIB3uxe5H16Z6vuQPH6JVyM4Y4nCtV6r4E6tTCCT8nzA2Dr3taN4mvPQz23CP7o1QhaOiyJAzBgezSpjdlr62HxJymMtQ9M18p9U0jpCw5s8eSLXKIeNHud9BF8XGgWzLcHqhLOASqBv1mW40AbZnYVRnMprCJU7VHHOmt5P5ow5cOQZz2aUehQpeAlK7VDT5nP+5II+HxiMnlvqwKCMJdMCJ9MtxbkuSB1L1xAd13m5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75LEB4Wqc3nFtZRRKTjsPtH6dVvHd83VvoAJKvn9fpY=;
 b=VJ/WLXv9UgLYuzyO5WOaNQ26CWS8vOer3lqA/grI/kJaetqEE8HQXGSztz98p96HpOddyQnKg740o28CLcz9WbXS9FMHv52O8IwRi5dgd7GOf4Bd95HZ1PU81u9qV0z60VvREHwxUIU4NXJr47ZaWBmY+gGkugBs4LggdMEe+jVshYMBbElJ+Z3vKoE5bQWlUdteJqWnxEFv/xifVcmxiHmOycxg86b10+py+mTl7kyK5P8CrUzqSczQnjx+f7ZVqCmHhIvrVMrgMyoZqMB0/XWrLZEtd0sfwbo9MtQ/ZUHFcIdM0sXoZEwIcg3G7M9MUjyNxlP+2IA7JDTsSeg9hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75LEB4Wqc3nFtZRRKTjsPtH6dVvHd83VvoAJKvn9fpY=;
 b=ywk8aE0WVXcrwhYUEjqNHMOFptmJYpX0d5TM3RcaLZ2HAHqG6KjhkGWofTac6aHvLCd8i59rYUbJxn18S25C04sKX7qbz5YgDRtHOvuJzSHtUadxkA2g0u4QF29ReYlAn/RX7dIkV7zlu/WpUO/E9wu8MOb/NhmRfGyjNHKnnFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by CY4PR0801MB3796.namprd08.prod.outlook.com (2603:10b6:910:8f::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Sun, 3 Apr
 2022 22:18:05 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::a007:fd2d:e5a6:8591%3]) with mapi id 15.20.5123.031; Sun, 3 Apr 2022
 22:18:05 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 2/2] Input: add support for Azoteq IQS7222A/B/C
Date:   Sun,  3 Apr 2022 17:16:59 -0500
Message-Id: <20220403221659.865997-3-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220403221659.865997-1-jeff@labundy.com>
References: <20220403221659.865997-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:6e::27) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80fe2614-7040-42fb-4b31-08da15bfd2f7
X-MS-TrafficTypeDiagnostic: CY4PR0801MB3796:EE_
X-Microsoft-Antispam-PRVS: <CY4PR0801MB3796DB4AA3F651EFBE2547BED3E29@CY4PR0801MB3796.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wJ+ODyXFw2zLMH67ACPRA8QRzyxeonPKWZ2rnFWRujhNpSdauNTZIgf7m9DEb+n6qWEiqmtmjqvzDCU3a/9EVCVwrybK8EdVc5RkyI1uFgX2aVXirnM80YkkAMiwSoMyQZK7kdKyrn9E1N9wv6FwbG04k+JGL7wUg3gpEGgx8SrT4UFyMILi6oDpJy1WnLJNaBlqfxGYGD5nuSVCrb3rb6Go6bmNuzd4tlrbtTw4iEf5XoeA2sKusdZG3UtDKBDUIXBGSC8n33hLYTpInT8TOBMnQeqyWO5WKtYU+zcMa2kg2WexCiU4ru5x2DVt+4D3nHRcSMvdXlG5AJJbeEO8Qp7m93XiZZUDiwsSEOnZutdKsQ4W/x4CfIm5/Nrye3T1lan6gYjOy07fRZftum0bsME75AFZwFmXXRo/gVlAYJUkImhxuBRd7jPfujVFy+71N2iyUygk1RGGzRfNGxX+By/aSnB/j1EurM1zl2I2gBibCfdgXPuiEIKOHNP72cpMxPNPVnSMiKjx2dfidClLXEa83fkK/trC0AzwueGRUrErugtXDxTI2zV020XObVZiRNL7abgJbwC7IdIpPYwIq2DMe3eGkOVq4ofDCIUItkYMLz0pQb7Soq0rcxEQn0s5DzuC/H8SZnwPUuytv0HuRIXNOiO41/r6k5d41WY+WPMvscYsQiKZ4xTPWs8q/enkKyTX1Zvj6oFmdw9OmKi9xwf1AdB7mFkPttzHIcDnWWIXIucni0VfDcuoEusXf9D9
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(136003)(396003)(376002)(39830400003)(366004)(346002)(26005)(186003)(86362001)(52116002)(6506007)(2906002)(8936002)(316002)(6666004)(6486002)(5660300002)(30864003)(38350700002)(38100700002)(83380400001)(6512007)(1076003)(107886003)(508600001)(66476007)(36756003)(66556008)(2616005)(66946007)(8676002)(4326008)(579004)(559001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmMTqPz1KlnJyRmwoO/OLLIYrGFmE2HtxTFTnDxi0pTLxiRUpW/Z0LqjYIeR?=
 =?us-ascii?Q?MQWEc5/FnRhcPsJAU7DN7V1XYORgJU2XWXPdPKc+p7PXUCbC+QnliOLPLWFk?=
 =?us-ascii?Q?jKwbAFnuc2ijDuH+xPOsbb0eZfiga0DmwCDjIkY1RJZGMVQlN56shN2eK8G8?=
 =?us-ascii?Q?QrvCSrUn3OnQF7NvXpZ6hYauSrBQaVsDFCq9iwfzyk4MT9lJ2nb8qNAuoj7v?=
 =?us-ascii?Q?ets/RuGMPKQN9zy/ZMLyD2PxxjLW9gKxrjpCenTjwakRdeuNR7qUr9W+y6X3?=
 =?us-ascii?Q?kfNkuRFeRzxo31/5yQKbxtRZvm/8RvWRzwgFKvpsi2Es5eOQpi928D27w5qv?=
 =?us-ascii?Q?uZCK2q9/lO2uZMpk7Vm+iq5XWdzjw4sVuTdUyNl44pfy5pw1vKTePs6qdvfd?=
 =?us-ascii?Q?ZzM4NLPnIaVaQ+31eVBU0N2YlK56eybPor35YJXJo5Xsz8uL50AxOpK5T+k/?=
 =?us-ascii?Q?OXm0+4HogHPlC50HjKB+y9HO7GLAoRQ3jixT4zTBFUhh09TQKLhC+iqx4DSB?=
 =?us-ascii?Q?NS8XD5AZUakLtIjsZjQ0qaPBzSuG5yXKlzP+R5FmJwpHf66tVtJiZCJoW7FJ?=
 =?us-ascii?Q?m0EmiBKAqEdbiOyDvGLtaj7wMUeHTK4juvu6dbzty4unkoeoJ/+obRCuybrL?=
 =?us-ascii?Q?R5lewM1K6TyNvnjn9xH6lw9SRJeZ+6FUii9oyBGUaWRBqL9bcHVr8ZGjqPg3?=
 =?us-ascii?Q?2EmPWrQHiI5oGYAKv33z1aDEZ3A2LklI1kMVC9JCg3Sow4N3kW3m72xAbINv?=
 =?us-ascii?Q?gkZDZcAXfs5ToczoP1Se5DECAkQ68HUFqVIkNNmxgCSJsl/ckO0I6jjL2mnM?=
 =?us-ascii?Q?HbZ8bH3d64FrZ2YOrcFbo+Ti5w03+xKpmkOXK7DM/h2BnWJRVTUiH09LYNgW?=
 =?us-ascii?Q?CA2XwlmBDYKlxzkpXTjtstT0ep+4qzDtlWy9AZdRU6HVbenEdtpSC3kkDQDb?=
 =?us-ascii?Q?rGCvWKEEgS+ULJgKdXmxMwC4DWip91k1N6hIsK0NpbGrSx/h6B7mB+z4Yzdo?=
 =?us-ascii?Q?esSj43d+TuuWrs/QGtoIFN/vPWxyKvqbTEE25OArlIG5egxx3ccBLUiCUmih?=
 =?us-ascii?Q?D+e7auPUgzAKZn0rejx9cel4u/ZqQwa8WUTNoja7nHfCB89guStBWGecGULU?=
 =?us-ascii?Q?zzU1aULHcVV2r7u+vJd7BCsPozhLRsGxh3PjfowUFDZrPqgz9P81bp65K881?=
 =?us-ascii?Q?QVzUr4eSINWEsL5obc/Bey079plFA0k+NZqI3WN5cfU1i+jKdaGxhr65EZ77?=
 =?us-ascii?Q?RPNzQHabfTYQD2ekqffGGr1i5yvzLXyMvqb0qKNEHK39EDg4tFU30lKjbYot?=
 =?us-ascii?Q?Y5No13M+emT0tvAV0/aNThIDqg0yfTMZJwudhMMjF5kr5AR3V+xyQ4VuAyXo?=
 =?us-ascii?Q?q5e0F6Rf9DWHGJx++ryFxhYhaCCficIzJqyxzSJ+gQe1c8TzH1p4oMAiRoHX?=
 =?us-ascii?Q?9kVwfid7olnhZ9O3rJtGmRfZlvuImJFHbmyPz4q/lZr2njfzG8rePJBkF2Kb?=
 =?us-ascii?Q?Tvj3H+K74ayrh2t+vX/dUw4GzRMWrVTvtDvrrs1svaOu6WlbAjgs4LVgpF7n?=
 =?us-ascii?Q?znDN/lqsQxFTBAGlKizJ3AMDDLOTq7zbDNShCG0LDfJiohRb1zRwQ5uPUkY7?=
 =?us-ascii?Q?EqsmEnSoyrABxCNEFHigKFuVeuAK+eC2hvfVTavEui1DDuZ/FM7Y/kr0Fbt3?=
 =?us-ascii?Q?RKyIQ7xO5uPYJQepiuGJQbTdfqX7cm4lnsih72a0PcjT4Ufs+Do3Wcn8g4Hq?=
 =?us-ascii?Q?JoM37xjVvw=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80fe2614-7040-42fb-4b31-08da15bfd2f7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2022 22:18:05.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hKlrK2bgOMW9Xdz3YtIBLjoIEDrmo+/YOKnujHob6HUSeAX3jxrkpJNWx+bB0y4ospjoY1nVE78pCzpA3mOzFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0801MB3796
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Azoteq IQS7222A/B/C family of
capacitive touch controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Corrected implicit sign conversion in error paths of iqs7222_force_comms()
   and iqs7222_read_burst()
 - Updated iqs7222_read_burst() and iqs7222_write_burst() to accept number of
   registers rather than number of bytes
 - Updated iqs7222_write_burst() to use a DMA-safe buffer
 - Updated iqs7222_irq_poll() to accept a variable timeout
 - Moved ATI handling to iqs7222_ati_trigger()
 - Added more helpful error messages throughout

Changes in v2:
 - Added support for IQS7222B v1.43+ and IQS7222C v2.06+
 - Added I2C retry erratum
 - Simplified logic in iqs7222_dev_info()

 drivers/input/misc/Kconfig   |   10 +
 drivers/input/misc/Makefile  |    1 +
 drivers/input/misc/iqs7222.c | 2445 ++++++++++++++++++++++++++++++++++
 3 files changed, 2456 insertions(+)
 create mode 100644 drivers/input/misc/iqs7222.c

diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
index dd5227cf8696..a18ab7358d8f 100644
--- a/drivers/input/misc/Kconfig
+++ b/drivers/input/misc/Kconfig
@@ -762,6 +762,16 @@ config INPUT_IQS626A
 	  To compile this driver as a module, choose M here: the
 	  module will be called iqs626a.
 
+config INPUT_IQS7222
+	tristate "Azoteq IQS7222A/B/C capacitive touch controller"
+	depends on I2C
+	help
+	  Say Y to enable support for the Azoteq IQS7222A/B/C family
+	  of capacitive touch controllers.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called iqs7222.
+
 config INPUT_CMA3000
 	tristate "VTI CMA3000 Tri-axis accelerometer"
 	help
diff --git a/drivers/input/misc/Makefile b/drivers/input/misc/Makefile
index b92c53a6b5ae..28dfc444f0a9 100644
--- a/drivers/input/misc/Makefile
+++ b/drivers/input/misc/Makefile
@@ -44,6 +44,7 @@ obj-$(CONFIG_HP_SDC_RTC)		+= hp_sdc_rtc.o
 obj-$(CONFIG_INPUT_IMS_PCU)		+= ims-pcu.o
 obj-$(CONFIG_INPUT_IQS269A)		+= iqs269a.o
 obj-$(CONFIG_INPUT_IQS626A)		+= iqs626a.o
+obj-$(CONFIG_INPUT_IQS7222)		+= iqs7222.o
 obj-$(CONFIG_INPUT_KEYSPAN_REMOTE)	+= keyspan_remote.o
 obj-$(CONFIG_INPUT_KXTJ9)		+= kxtj9.o
 obj-$(CONFIG_INPUT_M68K_BEEP)		+= m68kspkr.o
diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
new file mode 100644
index 000000000000..d800f71043a5
--- /dev/null
+++ b/drivers/input/misc/iqs7222.c
@@ -0,0 +1,2445 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Azoteq IQS7222A/B/C Capacitive Touch Controller
+ *
+ * Copyright (C) 2022 Jeff LaBundy <jeff@labundy.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/ktime.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <asm/unaligned.h>
+
+#define IQS7222_PROD_NUM			0x00
+#define IQS7222_PROD_NUM_A			840
+#define IQS7222_PROD_NUM_B			698
+#define IQS7222_PROD_NUM_C			863
+
+#define IQS7222_SYS_STATUS			0x10
+#define IQS7222_SYS_STATUS_RESET		BIT(3)
+#define IQS7222_SYS_STATUS_ATI_ERROR		BIT(1)
+#define IQS7222_SYS_STATUS_ATI_ACTIVE		BIT(0)
+
+#define IQS7222_CHAN_SETUP_0_REF_MODE_MASK	GENMASK(15, 14)
+#define IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW	BIT(15)
+#define IQS7222_CHAN_SETUP_0_REF_MODE_REF	BIT(14)
+#define IQS7222_CHAN_SETUP_0_CHAN_EN		BIT(8)
+
+#define IQS7222_SLDR_SETUP_0_CHAN_CNT_MASK	GENMASK(2, 0)
+#define IQS7222_SLDR_SETUP_2_RES_MASK		GENMASK(15, 8)
+#define IQS7222_SLDR_SETUP_2_RES_SHIFT		8
+#define IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK	GENMASK(7, 0)
+#define IQS7222_SLDR_SETUP_3_CHAN_SEL_MASK	GENMASK(9, 0)
+
+#define IQS7222_GPIO_SETUP_0_GPIO_EN		BIT(0)
+
+#define IQS7222_SYS_SETUP			0xD0
+#define IQS7222_SYS_SETUP_INTF_MODE_MASK	GENMASK(7, 6)
+#define IQS7222_SYS_SETUP_INTF_MODE_TOUCH	BIT(7)
+#define IQS7222_SYS_SETUP_INTF_MODE_EVENT	BIT(6)
+#define IQS7222_SYS_SETUP_PWR_MODE_MASK		GENMASK(5, 4)
+#define IQS7222_SYS_SETUP_PWR_MODE_AUTO		IQS7222_SYS_SETUP_PWR_MODE_MASK
+#define IQS7222_SYS_SETUP_REDO_ATI		BIT(2)
+#define IQS7222_SYS_SETUP_ACK_RESET		BIT(0)
+
+#define IQS7222_EVENT_MASK_ATI			BIT(12)
+
+#define IQS7222_COMMS_HOLD			BIT(0)
+#define IQS7222_COMMS_ERROR			0xEEEE
+#define IQS7222_COMMS_RETRY_MS			50
+#define IQS7222_COMMS_TIMEOUT_MS		100
+#define IQS7222_RESET_TIMEOUT_MS		250
+#define IQS7222_ATI_TIMEOUT_MS			2000
+
+#define IQS7222_MAX_COLS_STAT			8
+#define IQS7222_MAX_COLS_CYCLE			3
+#define IQS7222_MAX_COLS_GLBL			3
+#define IQS7222_MAX_COLS_BTN			3
+#define IQS7222_MAX_COLS_CHAN			6
+#define IQS7222_MAX_COLS_FILT			2
+#define IQS7222_MAX_COLS_SLDR			11
+#define IQS7222_MAX_COLS_GPIO			3
+#define IQS7222_MAX_COLS_SYS			13
+
+#define IQS7222_MAX_CHAN			20
+#define IQS7222_MAX_SLDR			2
+
+#define IQS7222_NUM_RETRIES			5
+#define IQS7222_REG_OFFSET			0x100
+
+enum iqs7222_reg_key_id {
+	IQS7222_REG_KEY_NONE,
+	IQS7222_REG_KEY_PROX,
+	IQS7222_REG_KEY_TOUCH,
+	IQS7222_REG_KEY_DEBOUNCE,
+	IQS7222_REG_KEY_TAP,
+	IQS7222_REG_KEY_AXIAL,
+	IQS7222_REG_KEY_WHEEL,
+	IQS7222_REG_KEY_NO_WHEEL,
+	IQS7222_REG_KEY_RESERVED
+};
+
+enum iqs7222_reg_grp_id {
+	IQS7222_REG_GRP_STAT,
+	IQS7222_REG_GRP_CYCLE,
+	IQS7222_REG_GRP_GLBL,
+	IQS7222_REG_GRP_BTN,
+	IQS7222_REG_GRP_CHAN,
+	IQS7222_REG_GRP_FILT,
+	IQS7222_REG_GRP_SLDR,
+	IQS7222_REG_GRP_GPIO,
+	IQS7222_REG_GRP_SYS,
+	IQS7222_NUM_REG_GRPS
+};
+
+static const char * const iqs7222_reg_grp_names[] = {
+	[IQS7222_REG_GRP_CYCLE] = "cycle",
+	[IQS7222_REG_GRP_CHAN] = "channel",
+	[IQS7222_REG_GRP_SLDR] = "slider",
+	[IQS7222_REG_GRP_GPIO] = "gpio",
+};
+
+static const unsigned int iqs7222_max_cols[] = {
+	[IQS7222_REG_GRP_STAT] = IQS7222_MAX_COLS_STAT,
+	[IQS7222_REG_GRP_CYCLE] = IQS7222_MAX_COLS_CYCLE,
+	[IQS7222_REG_GRP_GLBL] = IQS7222_MAX_COLS_GLBL,
+	[IQS7222_REG_GRP_BTN] = IQS7222_MAX_COLS_BTN,
+	[IQS7222_REG_GRP_CHAN] = IQS7222_MAX_COLS_CHAN,
+	[IQS7222_REG_GRP_FILT] = IQS7222_MAX_COLS_FILT,
+	[IQS7222_REG_GRP_SLDR] = IQS7222_MAX_COLS_SLDR,
+	[IQS7222_REG_GRP_GPIO] = IQS7222_MAX_COLS_GPIO,
+	[IQS7222_REG_GRP_SYS] = IQS7222_MAX_COLS_SYS,
+};
+
+static const unsigned int iqs7222_gpio_links[] = { 2, 5, 6, };
+
+struct iqs7222_event_desc {
+	const char *name;
+	u16 mask;
+	u16 val;
+	u16 enable;
+	enum iqs7222_reg_key_id reg_key;
+};
+
+static const struct iqs7222_event_desc iqs7222_kp_events[] = {
+	{
+		.name = "event-prox",
+		.enable = BIT(0),
+		.reg_key = IQS7222_REG_KEY_PROX,
+	},
+	{
+		.name = "event-touch",
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_TOUCH,
+	},
+};
+
+static const struct iqs7222_event_desc iqs7222_sl_events[] = {
+	{ .name = "event-press", },
+	{
+		.name = "event-tap",
+		.mask = BIT(0),
+		.val = BIT(0),
+		.enable = BIT(0),
+		.reg_key = IQS7222_REG_KEY_TAP,
+	},
+	{
+		.name = "event-swipe-pos",
+		.mask = BIT(5) | BIT(1),
+		.val = BIT(1),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-swipe-neg",
+		.mask = BIT(5) | BIT(1),
+		.val = BIT(5) | BIT(1),
+		.enable = BIT(1),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-pos",
+		.mask = BIT(5) | BIT(2),
+		.val = BIT(2),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+	{
+		.name = "event-flick-neg",
+		.mask = BIT(5) | BIT(2),
+		.val = BIT(5) | BIT(2),
+		.enable = BIT(2),
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+	},
+};
+
+struct iqs7222_reg_grp_desc {
+	u16 base;
+	int num_row;
+	int num_col;
+};
+
+struct iqs7222_dev_desc {
+	u16 prod_num;
+	u16 fw_major;
+	u16 fw_minor;
+	u16 sldr_res;
+	u16 touch_link;
+	u16 wheel_enable;
+	int allow_offset;
+	int event_offset;
+	int comms_offset;
+	struct iqs7222_reg_grp_desc reg_grps[IQS7222_NUM_REG_GRPS];
+};
+
+static const struct iqs7222_dev_desc iqs7222_devs[] = {
+	{
+		.prod_num = IQS7222_PROD_NUM_A,
+		.fw_major = 1,
+		.fw_minor = 12,
+		.sldr_res = U8_MAX * 16,
+		.touch_link = 1768,
+		.allow_offset = 9,
+		.event_offset = 10,
+		.comms_offset = 12,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 8,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 7,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8700,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 12,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 12,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAC00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SLDR] = {
+				.base = 0xB000,
+				.num_row = 2,
+				.num_col = 11,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 13,
+			},
+		},
+	},
+	{
+		.prod_num = IQS7222_PROD_NUM_B,
+		.fw_major = 1,
+		.fw_minor = 43,
+		.event_offset = 10,
+		.comms_offset = 11,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 10,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8A00,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 20,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xB000,
+				.num_row = 20,
+				.num_col = 4,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xC400,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 13,
+			},
+		},
+	},
+	{
+		.prod_num = IQS7222_PROD_NUM_B,
+		.fw_major = 1,
+		.fw_minor = 27,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 10,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8A00,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 20,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xB000,
+				.num_row = 20,
+				.num_col = 4,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xC400,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 10,
+			},
+		},
+	},
+	{
+		.prod_num = IQS7222_PROD_NUM_C,
+		.fw_major = 2,
+		.fw_minor = 6,
+		.sldr_res = U16_MAX,
+		.touch_link = 1686,
+		.wheel_enable = BIT(3),
+		.event_offset = 9,
+		.comms_offset = 10,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 5,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8500,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 10,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 10,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAA00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SLDR] = {
+				.base = 0xB000,
+				.num_row = 2,
+				.num_col = 10,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 3,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 12,
+			},
+		},
+	},
+	{
+		.prod_num = IQS7222_PROD_NUM_C,
+		.fw_major = 1,
+		.fw_minor = 13,
+		.sldr_res = U16_MAX,
+		.touch_link = 1674,
+		.wheel_enable = BIT(3),
+		.event_offset = 9,
+		.comms_offset = 10,
+		.reg_grps = {
+			[IQS7222_REG_GRP_STAT] = {
+				.base = IQS7222_SYS_STATUS,
+				.num_row = 1,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_CYCLE] = {
+				.base = 0x8000,
+				.num_row = 5,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_GLBL] = {
+				.base = 0x8500,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_BTN] = {
+				.base = 0x9000,
+				.num_row = 10,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_CHAN] = {
+				.base = 0xA000,
+				.num_row = 10,
+				.num_col = 6,
+			},
+			[IQS7222_REG_GRP_FILT] = {
+				.base = 0xAA00,
+				.num_row = 1,
+				.num_col = 2,
+			},
+			[IQS7222_REG_GRP_SLDR] = {
+				.base = 0xB000,
+				.num_row = 2,
+				.num_col = 10,
+			},
+			[IQS7222_REG_GRP_GPIO] = {
+				.base = 0xC000,
+				.num_row = 1,
+				.num_col = 3,
+			},
+			[IQS7222_REG_GRP_SYS] = {
+				.base = IQS7222_SYS_SETUP,
+				.num_row = 1,
+				.num_col = 11,
+			},
+		},
+	},
+};
+
+struct iqs7222_prop_desc {
+	const char *name;
+	enum iqs7222_reg_grp_id reg_grp;
+	enum iqs7222_reg_key_id reg_key;
+	int reg_offset;
+	int reg_shift;
+	int reg_width;
+	int val_pitch;
+	int val_min;
+	int val_max;
+	bool invert;
+	const char *label;
+};
+
+static const struct iqs7222_prop_desc iqs7222_props[] = {
+	{
+		.name = "azoteq,conv-period",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 0,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "conversion period",
+	},
+	{
+		.name = "azoteq,conv-frac",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 0,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "conversion frequency fractional divider",
+	},
+	{
+		.name = "azoteq,rx-float-inactive",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 1,
+		.reg_shift = 6,
+		.reg_width = 1,
+		.invert = true,
+	},
+	{
+		.name = "azoteq,dead-time-enable",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 1,
+		.reg_shift = 5,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,tx-freq-fosc",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 1,
+		.reg_shift = 4,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,vbias-enable",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 1,
+		.reg_shift = 3,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,sense-mode",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 3,
+		.val_max = 3,
+		.label = "sensing mode",
+	},
+	{
+		.name = "azoteq,iref-enable",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 2,
+		.reg_shift = 10,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,iref-level",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 2,
+		.reg_shift = 4,
+		.reg_width = 4,
+		.label = "current reference level",
+	},
+	{
+		.name = "azoteq,iref-trim",
+		.reg_grp = IQS7222_REG_GRP_CYCLE,
+		.reg_offset = 2,
+		.reg_shift = 0,
+		.reg_width = 4,
+		.label = "current reference trim",
+	},
+	{
+		.name = "azoteq,rf-filt-enable",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 0,
+		.reg_shift = 15,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,max-counts",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 0,
+		.reg_shift = 13,
+		.reg_width = 2,
+		.label = "maximum counts",
+	},
+	{
+		.name = "azoteq,auto-mode",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 0,
+		.reg_shift = 2,
+		.reg_width = 2,
+		.label = "number of conversions",
+	},
+	{
+		.name = "azoteq,ati-frac-div-fine",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 1,
+		.reg_shift = 9,
+		.reg_width = 5,
+		.label = "ATI fine fractional divider",
+	},
+	{
+		.name = "azoteq,ati-frac-div-coarse",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 5,
+		.label = "ATI coarse fractional divider",
+	},
+	{
+		.name = "azoteq,ati-comp-select",
+		.reg_grp = IQS7222_REG_GRP_GLBL,
+		.reg_offset = 2,
+		.reg_shift = 0,
+		.reg_width = 10,
+		.label = "ATI compensation selection",
+	},
+	{
+		.name = "azoteq,ati-band",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 12,
+		.reg_width = 2,
+		.label = "ATI band",
+	},
+	{
+		.name = "azoteq,global-halt",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 11,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,invert-enable",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 10,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,dual-direction",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 9,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,samp-cap-double",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 3,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,vref-half",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 2,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,proj-bias",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 0,
+		.reg_shift = 0,
+		.reg_width = 2,
+		.label = "projected bias current",
+	},
+	{
+		.name = "azoteq,ati-target",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 1,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 8,
+		.label = "ATI target",
+	},
+	{
+		.name = "azoteq,ati-base",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 1,
+		.reg_shift = 3,
+		.reg_width = 5,
+		.val_pitch = 16,
+		.label = "ATI base",
+	},
+	{
+		.name = "azoteq,ati-mode",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 3,
+		.val_max = 5,
+		.label = "ATI mode",
+	},
+	{
+		.name = "azoteq,ati-frac-div-fine",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 2,
+		.reg_shift = 9,
+		.reg_width = 5,
+		.label = "ATI fine fractional divider",
+	},
+	{
+		.name = "azoteq,ati-frac-mult-coarse",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 2,
+		.reg_shift = 5,
+		.reg_width = 4,
+		.label = "ATI coarse fractional multiplier",
+	},
+	{
+		.name = "azoteq,ati-frac-div-coarse",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 2,
+		.reg_shift = 0,
+		.reg_width = 5,
+		.label = "ATI coarse fractional divider",
+	},
+	{
+		.name = "azoteq,ati-comp-div",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 3,
+		.reg_shift = 11,
+		.reg_width = 5,
+		.label = "ATI compensation divider",
+	},
+	{
+		.name = "azoteq,ati-comp-select",
+		.reg_grp = IQS7222_REG_GRP_CHAN,
+		.reg_offset = 3,
+		.reg_shift = 0,
+		.reg_width = 10,
+		.label = "ATI compensation selection",
+	},
+	{
+		.name = "azoteq,debounce-exit",
+		.reg_grp = IQS7222_REG_GRP_BTN,
+		.reg_key = IQS7222_REG_KEY_DEBOUNCE,
+		.reg_offset = 0,
+		.reg_shift = 12,
+		.reg_width = 4,
+		.label = "debounce exit factor",
+	},
+	{
+		.name = "azoteq,debounce-enter",
+		.reg_grp = IQS7222_REG_GRP_BTN,
+		.reg_key = IQS7222_REG_KEY_DEBOUNCE,
+		.reg_offset = 0,
+		.reg_shift = 8,
+		.reg_width = 4,
+		.label = "debounce entrance factor",
+	},
+	{
+		.name = "azoteq,thresh",
+		.reg_grp = IQS7222_REG_GRP_BTN,
+		.reg_key = IQS7222_REG_KEY_PROX,
+		.reg_offset = 0,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.val_max = 127,
+		.label = "threshold",
+	},
+	{
+		.name = "azoteq,thresh",
+		.reg_grp = IQS7222_REG_GRP_BTN,
+		.reg_key = IQS7222_REG_KEY_TOUCH,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "threshold",
+	},
+	{
+		.name = "azoteq,hyst",
+		.reg_grp = IQS7222_REG_GRP_BTN,
+		.reg_key = IQS7222_REG_KEY_TOUCH,
+		.reg_offset = 1,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "hysteresis",
+	},
+	{
+		.name = "azoteq,lta-beta-lp",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 0,
+		.reg_shift = 12,
+		.reg_width = 4,
+		.label = "low-power mode long-term average beta",
+	},
+	{
+		.name = "azoteq,lta-beta-np",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 0,
+		.reg_shift = 8,
+		.reg_width = 4,
+		.label = "normal-power mode long-term average beta",
+	},
+	{
+		.name = "azoteq,counts-beta-lp",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 0,
+		.reg_shift = 4,
+		.reg_width = 4,
+		.label = "low-power mode counts beta",
+	},
+	{
+		.name = "azoteq,counts-beta-np",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 0,
+		.reg_shift = 0,
+		.reg_width = 4,
+		.label = "normal-power mode counts beta",
+	},
+	{
+		.name = "azoteq,lta-fast-beta-lp",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 1,
+		.reg_shift = 4,
+		.reg_width = 4,
+		.label = "low-power mode long-term average fast beta",
+	},
+	{
+		.name = "azoteq,lta-fast-beta-np",
+		.reg_grp = IQS7222_REG_GRP_FILT,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 4,
+		.label = "normal-power mode long-term average fast beta",
+	},
+	{
+		.name = "azoteq,lower-cal",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_offset = 0,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "lower calibration",
+	},
+	{
+		.name = "azoteq,static-beta",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_NO_WHEEL,
+		.reg_offset = 0,
+		.reg_shift = 6,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,bottom-beta",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_NO_WHEEL,
+		.reg_offset = 0,
+		.reg_shift = 3,
+		.reg_width = 3,
+		.label = "bottom beta",
+	},
+	{
+		.name = "azoteq,static-beta",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_WHEEL,
+		.reg_offset = 0,
+		.reg_shift = 7,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,bottom-beta",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_WHEEL,
+		.reg_offset = 0,
+		.reg_shift = 4,
+		.reg_width = 3,
+		.label = "bottom beta",
+	},
+	{
+		.name = "azoteq,bottom-speed",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_offset = 1,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "bottom speed",
+	},
+	{
+		.name = "azoteq,upper-cal",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "upper calibration",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_TAP,
+		.reg_offset = 9,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 4,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-min-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_TAP,
+		.reg_offset = 9,
+		.reg_shift = 3,
+		.reg_width = 5,
+		.val_pitch = 4,
+		.label = "minimum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+		.reg_offset = 10,
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 16,
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_grp = IQS7222_REG_GRP_SLDR,
+		.reg_key = IQS7222_REG_KEY_AXIAL,
+		.reg_offset = 10,
+		.reg_shift = 0,
+		.reg_width = 8,
+		.val_pitch = 4,
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "drive-open-drain",
+		.reg_grp = IQS7222_REG_GRP_GPIO,
+		.reg_offset = 0,
+		.reg_shift = 1,
+		.reg_width = 1,
+	},
+	{
+		.name = "azoteq,timeout-ati-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 1,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.val_pitch = 500,
+		.label = "ATI error timeout",
+	},
+	{
+		.name = "azoteq,rate-ati-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 2,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "ATI report rate",
+	},
+	{
+		.name = "azoteq,timeout-np-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 3,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "normal-power mode timeout",
+	},
+	{
+		.name = "azoteq,rate-np-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 4,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.val_max = 3000,
+		.label = "normal-power mode report rate",
+	},
+	{
+		.name = "azoteq,timeout-lp-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 5,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "low-power mode timeout",
+	},
+	{
+		.name = "azoteq,rate-lp-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 6,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.val_max = 3000,
+		.label = "low-power mode report rate",
+	},
+	{
+		.name = "azoteq,timeout-ulp-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 7,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.label = "ultra-low-power mode timeout",
+	},
+	{
+		.name = "azoteq,rate-ulp-ms",
+		.reg_grp = IQS7222_REG_GRP_SYS,
+		.reg_offset = 8,
+		.reg_shift = 0,
+		.reg_width = 16,
+		.val_max = 3000,
+		.label = "ultra-low-power mode report rate",
+	},
+};
+
+struct iqs7222_private {
+	const struct iqs7222_dev_desc *dev_desc;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
+	struct i2c_client *client;
+	struct input_dev *keypad;
+	unsigned int kp_type[IQS7222_MAX_CHAN][ARRAY_SIZE(iqs7222_kp_events)];
+	unsigned int kp_code[IQS7222_MAX_CHAN][ARRAY_SIZE(iqs7222_kp_events)];
+	unsigned int sl_code[IQS7222_MAX_SLDR][ARRAY_SIZE(iqs7222_sl_events)];
+	unsigned int sl_axis[IQS7222_MAX_SLDR];
+	u16 cycle_setup[IQS7222_MAX_CHAN / 2][IQS7222_MAX_COLS_CYCLE];
+	u16 glbl_setup[IQS7222_MAX_COLS_GLBL];
+	u16 btn_setup[IQS7222_MAX_CHAN][IQS7222_MAX_COLS_BTN];
+	u16 chan_setup[IQS7222_MAX_CHAN][IQS7222_MAX_COLS_CHAN];
+	u16 filt_setup[IQS7222_MAX_COLS_FILT];
+	u16 sldr_setup[IQS7222_MAX_SLDR][IQS7222_MAX_COLS_SLDR];
+	u16 gpio_setup[ARRAY_SIZE(iqs7222_gpio_links)][IQS7222_MAX_COLS_GPIO];
+	u16 sys_setup[IQS7222_MAX_COLS_SYS];
+};
+
+static u16 *iqs7222_setup(struct iqs7222_private *iqs7222,
+			  enum iqs7222_reg_grp_id reg_grp, int row)
+{
+	switch (reg_grp) {
+	case IQS7222_REG_GRP_CYCLE:
+		return iqs7222->cycle_setup[row];
+
+	case IQS7222_REG_GRP_GLBL:
+		return iqs7222->glbl_setup;
+
+	case IQS7222_REG_GRP_BTN:
+		return iqs7222->btn_setup[row];
+
+	case IQS7222_REG_GRP_CHAN:
+		return iqs7222->chan_setup[row];
+
+	case IQS7222_REG_GRP_FILT:
+		return iqs7222->filt_setup;
+
+	case IQS7222_REG_GRP_SLDR:
+		return iqs7222->sldr_setup[row];
+
+	case IQS7222_REG_GRP_GPIO:
+		return iqs7222->gpio_setup[row];
+
+	case IQS7222_REG_GRP_SYS:
+		return iqs7222->sys_setup;
+
+	default:
+		return NULL;
+	}
+}
+
+static int iqs7222_irq_poll(struct iqs7222_private *iqs7222, u16 timeout_ms)
+{
+	ktime_t irq_timeout = ktime_add_ms(ktime_get(), timeout_ms);
+	int ret;
+
+	do {
+		usleep_range(1000, 1100);
+
+		ret = gpiod_get_value_cansleep(iqs7222->irq_gpio);
+		if (ret < 0)
+			return ret;
+		else if (ret > 0)
+			return 0;
+	} while (ktime_compare(ktime_get(), irq_timeout) < 0);
+
+	return -EBUSY;
+}
+
+static int iqs7222_hard_reset(struct iqs7222_private *iqs7222)
+{
+	struct i2c_client *client = iqs7222->client;
+	int error;
+
+	if (!iqs7222->reset_gpio)
+		return 0;
+
+	gpiod_set_value_cansleep(iqs7222->reset_gpio, 1);
+	usleep_range(1000, 1100);
+
+	gpiod_set_value_cansleep(iqs7222->reset_gpio, 0);
+
+	error = iqs7222_irq_poll(iqs7222, IQS7222_RESET_TIMEOUT_MS);
+	if (error)
+		dev_err(&client->dev, "Failed to reset device: %d\n", error);
+
+	return error;
+}
+
+static int iqs7222_force_comms(struct iqs7222_private *iqs7222)
+{
+	u8 msg_buf[] = { 0xFF, 0x00, };
+	int ret;
+
+	/*
+	 * The device cannot communicate until it asserts its interrupt (RDY)
+	 * pin. Attempts to do so while RDY is deasserted return an ACK; how-
+	 * ever all write data is ignored, and all read data returns 0xEE.
+	 *
+	 * Unsolicited communication must be preceded by a special force com-
+	 * munication command, after which the device eventually asserts its
+	 * RDY pin and agrees to communicate.
+	 *
+	 * Regardless of whether communication is forced or the result of an
+	 * interrupt, the device automatically deasserts its RDY pin once it
+	 * detects an I2C stop condition, or a timeout expires.
+	 */
+	ret = gpiod_get_value_cansleep(iqs7222->irq_gpio);
+	if (ret < 0)
+		return ret;
+	else if (ret > 0)
+		return 0;
+
+	ret = i2c_master_send(iqs7222->client, msg_buf, sizeof(msg_buf));
+	if (ret < (int)sizeof(msg_buf)) {
+		if (ret >= 0)
+			ret = -EIO;
+
+		/*
+		 * The datasheet states that the host must wait to retry any
+		 * failed attempt to communicate over I2C.
+		 */
+		msleep(IQS7222_COMMS_RETRY_MS);
+		return ret;
+	}
+
+	return iqs7222_irq_poll(iqs7222, IQS7222_COMMS_TIMEOUT_MS);
+}
+
+static int iqs7222_read_burst(struct iqs7222_private *iqs7222,
+			      u16 reg, void *val, u16 num_val)
+{
+	u8 reg_buf[sizeof(__be16)];
+	int ret, i;
+	struct i2c_client *client = iqs7222->client;
+	struct i2c_msg msg[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = reg > U8_MAX ? sizeof(reg) : sizeof(u8),
+			.buf = reg_buf,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = num_val * sizeof(__le16),
+			.buf = (u8 *)val,
+		},
+	};
+
+	if (reg > U8_MAX)
+		put_unaligned_be16(reg, reg_buf);
+	else
+		*reg_buf = (u8)reg;
+
+	/*
+	 * The following loop protects against an edge case in which the RDY
+	 * pin is automatically deasserted just as the read is initiated. In
+	 * that case, the read must be retried using forced communication.
+	 */
+	for (i = 0; i < IQS7222_NUM_RETRIES; i++) {
+		ret = iqs7222_force_comms(iqs7222);
+		if (ret < 0)
+			continue;
+
+		ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+		if (ret < (int)ARRAY_SIZE(msg)) {
+			if (ret >= 0)
+				ret = -EIO;
+
+			msleep(IQS7222_COMMS_RETRY_MS);
+			continue;
+		}
+
+		if (get_unaligned_le16(msg[1].buf) == IQS7222_COMMS_ERROR) {
+			ret = -ENODATA;
+			continue;
+		}
+
+		ret = 0;
+		break;
+	}
+
+	/*
+	 * The following delay ensures the device has deasserted the RDY pin
+	 * following the I2C stop condition.
+	 */
+	usleep_range(50, 100);
+
+	if (ret < 0)
+		dev_err(&client->dev,
+			"Failed to read from address 0x%04X: %d\n", reg, ret);
+
+	return ret;
+}
+
+static int iqs7222_read_word(struct iqs7222_private *iqs7222, u16 reg, u16 *val)
+{
+	__le16 val_buf;
+	int error;
+
+	error = iqs7222_read_burst(iqs7222, reg, &val_buf, 1);
+	if (error)
+		return error;
+
+	*val = le16_to_cpu(val_buf);
+
+	return 0;
+}
+
+static int iqs7222_write_burst(struct iqs7222_private *iqs7222,
+			       u16 reg, const void *val, u16 num_val)
+{
+	int reg_len = reg > U8_MAX ? sizeof(reg) : sizeof(u8);
+	int val_len = num_val * sizeof(__le16);
+	int msg_len = reg_len + val_len;
+	int ret, i;
+	struct i2c_client *client = iqs7222->client;
+	u8 *msg_buf;
+
+	msg_buf = kzalloc(msg_len, GFP_KERNEL);
+	if (!msg_buf)
+		return -ENOMEM;
+
+	if (reg > U8_MAX)
+		put_unaligned_be16(reg, msg_buf);
+	else
+		*msg_buf = (u8)reg;
+
+	memcpy(msg_buf + reg_len, val, val_len);
+
+	/*
+	 * The following loop protects against an edge case in which the RDY
+	 * pin is automatically asserted just before the force communication
+	 * command is sent.
+	 *
+	 * In that case, the subsequent I2C stop condition tricks the device
+	 * into preemptively deasserting the RDY pin and the command must be
+	 * sent again.
+	 */
+	for (i = 0; i < IQS7222_NUM_RETRIES; i++) {
+		ret = iqs7222_force_comms(iqs7222);
+		if (ret < 0)
+			continue;
+
+		ret = i2c_master_send(client, msg_buf, msg_len);
+		if (ret < msg_len) {
+			if (ret >= 0)
+				ret = -EIO;
+
+			msleep(IQS7222_COMMS_RETRY_MS);
+			continue;
+		}
+
+		ret = 0;
+		break;
+	}
+
+	kfree(msg_buf);
+
+	usleep_range(50, 100);
+
+	if (ret < 0)
+		dev_err(&client->dev,
+			"Failed to write to address 0x%04X: %d\n", reg, ret);
+
+	return ret;
+}
+
+static int iqs7222_write_word(struct iqs7222_private *iqs7222, u16 reg, u16 val)
+{
+	__le16 val_buf = cpu_to_le16(val);
+
+	return iqs7222_write_burst(iqs7222, reg, &val_buf, 1);
+}
+
+static int iqs7222_ati_trigger(struct iqs7222_private *iqs7222)
+{
+	struct i2c_client *client = iqs7222->client;
+	ktime_t ati_timeout;
+	u16 sys_status = 0;
+	u16 sys_setup = iqs7222->sys_setup[0] & ~IQS7222_SYS_SETUP_ACK_RESET;
+	int error, i;
+
+	for (i = 0; i < IQS7222_NUM_RETRIES; i++) {
+		/*
+		 * Trigger ATI from streaming and normal-power modes so that
+		 * the RDY pin continues to be asserted during ATI.
+		 */
+		error = iqs7222_write_word(iqs7222, IQS7222_SYS_SETUP,
+					   sys_setup |
+					   IQS7222_SYS_SETUP_REDO_ATI);
+		if (error)
+			return error;
+
+		ati_timeout = ktime_add_ms(ktime_get(), IQS7222_ATI_TIMEOUT_MS);
+
+		do {
+			error = iqs7222_irq_poll(iqs7222,
+						 IQS7222_COMMS_TIMEOUT_MS);
+			if (error)
+				continue;
+
+			error = iqs7222_read_word(iqs7222, IQS7222_SYS_STATUS,
+						  &sys_status);
+			if (error)
+				return error;
+
+			if (sys_status & IQS7222_SYS_STATUS_ATI_ACTIVE)
+				continue;
+
+			if (sys_status & IQS7222_SYS_STATUS_ATI_ERROR)
+				break;
+
+			/*
+			 * Use stream-in-touch mode if either slider reports
+			 * absolute position.
+			 */
+			sys_setup |= test_bit(EV_ABS, iqs7222->keypad->evbit)
+				   ? IQS7222_SYS_SETUP_INTF_MODE_TOUCH
+				   : IQS7222_SYS_SETUP_INTF_MODE_EVENT;
+			sys_setup |= IQS7222_SYS_SETUP_PWR_MODE_AUTO;
+
+			return iqs7222_write_word(iqs7222, IQS7222_SYS_SETUP,
+						  sys_setup);
+		} while (ktime_compare(ktime_get(), ati_timeout) < 0);
+
+		dev_err(&client->dev,
+			"ATI attempt %d of %d failed with status 0x%02X, %s\n",
+			i + 1, IQS7222_NUM_RETRIES, (u8)sys_status,
+			i < IQS7222_NUM_RETRIES ? "retrying..." : "stopping");
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	int comms_offset = dev_desc->comms_offset;
+	int error, i, j, k;
+
+	/*
+	 * Take advantage of the stop-bit disable function, if available, to
+	 * save the trouble of having to reopen a communication window after
+	 * each burst read or write.
+	 */
+	if (comms_offset) {
+		u16 comms_setup;
+
+		error = iqs7222_read_word(iqs7222,
+					  IQS7222_SYS_SETUP + comms_offset,
+					  &comms_setup);
+		if (error)
+			return error;
+
+		error = iqs7222_write_word(iqs7222,
+					   IQS7222_SYS_SETUP + comms_offset,
+					   comms_setup | IQS7222_COMMS_HOLD);
+		if (error)
+			return error;
+	}
+
+	for (i = 0; i < IQS7222_NUM_REG_GRPS; i++) {
+		int num_row = dev_desc->reg_grps[i].num_row;
+		int num_col = dev_desc->reg_grps[i].num_col;
+		u16 reg = dev_desc->reg_grps[i].base;
+		__le16 *val_buf;
+		u16 *val;
+
+		if (!num_col)
+			continue;
+
+		val = iqs7222_setup(iqs7222, i, 0);
+		if (!val)
+			continue;
+
+		val_buf = kcalloc(num_col, sizeof(__le16), GFP_KERNEL);
+		if (!val_buf)
+			return -ENOMEM;
+
+		for (j = 0; j < num_row; j++) {
+			switch (dir) {
+			case READ:
+				error = iqs7222_read_burst(iqs7222, reg,
+							   val_buf, num_col);
+				for (k = 0; k < num_col; k++)
+					val[k] = le16_to_cpu(val_buf[k]);
+				break;
+
+			case WRITE:
+				for (k = 0; k < num_col; k++)
+					val_buf[k] = cpu_to_le16(val[k]);
+				error = iqs7222_write_burst(iqs7222, reg,
+							    val_buf, num_col);
+				break;
+
+			default:
+				error = -EINVAL;
+			}
+
+			if (error)
+				break;
+
+			reg += IQS7222_REG_OFFSET;
+			val += iqs7222_max_cols[i];
+		}
+
+		kfree(val_buf);
+
+		if (error)
+			return error;
+	}
+
+	if (comms_offset) {
+		u16 comms_setup;
+
+		error = iqs7222_read_word(iqs7222,
+					  IQS7222_SYS_SETUP + comms_offset,
+					  &comms_setup);
+		if (error)
+			return error;
+
+		error = iqs7222_write_word(iqs7222,
+					   IQS7222_SYS_SETUP + comms_offset,
+					   comms_setup & ~IQS7222_COMMS_HOLD);
+		if (error)
+			return error;
+	}
+
+	if (dir == READ)
+		return 0;
+
+	return iqs7222_ati_trigger(iqs7222);
+}
+
+static int iqs7222_dev_info(struct iqs7222_private *iqs7222)
+{
+	struct i2c_client *client = iqs7222->client;
+	bool prod_num_valid = false;
+	__le16 dev_id[3];
+	int error, i;
+
+	error = iqs7222_read_burst(iqs7222, IQS7222_PROD_NUM, dev_id,
+				   ARRAY_SIZE(dev_id));
+	if (error)
+		return error;
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_devs); i++) {
+		if (le16_to_cpu(dev_id[0]) != iqs7222_devs[i].prod_num)
+			continue;
+
+		prod_num_valid = true;
+
+		if (le16_to_cpu(dev_id[1]) < iqs7222_devs[i].fw_major)
+			continue;
+
+		if (le16_to_cpu(dev_id[2]) < iqs7222_devs[i].fw_minor)
+			continue;
+
+		iqs7222->dev_desc = &iqs7222_devs[i];
+		return 0;
+	}
+
+	if (prod_num_valid)
+		dev_err(&client->dev, "Unsupported firmware revision: %u.%u\n",
+			le16_to_cpu(dev_id[1]), le16_to_cpu(dev_id[2]));
+	else
+		dev_err(&client->dev, "Unrecognized product number: %u\n",
+			le16_to_cpu(dev_id[0]));
+
+	return -EINVAL;
+}
+
+static int iqs7222_gpio_select(struct iqs7222_private *iqs7222,
+			       struct fwnode_handle *child_node,
+			       int child_enable, u16 child_link)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	struct i2c_client *client = iqs7222->client;
+	int num_gpio = dev_desc->reg_grps[IQS7222_REG_GRP_GPIO].num_row;
+	int error, count, i;
+	unsigned int gpio_sel[ARRAY_SIZE(iqs7222_gpio_links)];
+
+	if (!num_gpio)
+		return 0;
+
+	if (!fwnode_property_present(child_node, "azoteq,gpio-select"))
+		return 0;
+
+	count = fwnode_property_count_u32(child_node, "azoteq,gpio-select");
+	if (count > num_gpio) {
+		dev_err(&client->dev, "Invalid number of %s GPIOs\n",
+			fwnode_get_name(child_node));
+		return -EINVAL;
+	} else if (count < 0) {
+		dev_err(&client->dev, "Failed to count %s GPIOs: %d\n",
+			fwnode_get_name(child_node), count);
+		return count;
+	}
+
+	error = fwnode_property_read_u32_array(child_node,
+					       "azoteq,gpio-select",
+					       gpio_sel, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read %s GPIOs: %d\n",
+			fwnode_get_name(child_node), error);
+		return error;
+	}
+
+	for (i = 0; i < count; i++) {
+		u16 *gpio_setup;
+
+		if (gpio_sel[i] >= num_gpio) {
+			dev_err(&client->dev, "Invalid %s GPIO: %u\n",
+				fwnode_get_name(child_node), gpio_sel[i]);
+			return -EINVAL;
+		}
+
+		gpio_setup = iqs7222->gpio_setup[gpio_sel[i]];
+
+		if (gpio_setup[2] && child_link != gpio_setup[2]) {
+			dev_err(&client->dev,
+				"Conflicting GPIO %u event types\n",
+				gpio_sel[i]);
+			return -EINVAL;
+		}
+
+		gpio_setup[0] |= IQS7222_GPIO_SETUP_0_GPIO_EN;
+		gpio_setup[1] |= child_enable;
+		gpio_setup[2] = child_link;
+	}
+
+	return 0;
+}
+
+static int iqs7222_parse_props(struct iqs7222_private *iqs7222,
+			       struct fwnode_handle **child_node,
+			       int child_index,
+			       enum iqs7222_reg_grp_id reg_grp,
+			       enum iqs7222_reg_key_id reg_key)
+{
+	u16 *setup = iqs7222_setup(iqs7222, reg_grp, child_index);
+	struct fwnode_handle *reg_grp_node = *child_node;
+	struct i2c_client *client = iqs7222->client;
+	char reg_grp_name[16];
+	int i;
+
+	switch (reg_grp) {
+	case IQS7222_REG_GRP_CYCLE:
+	case IQS7222_REG_GRP_CHAN:
+	case IQS7222_REG_GRP_SLDR:
+	case IQS7222_REG_GRP_GPIO:
+	case IQS7222_REG_GRP_BTN:
+		/*
+		 * These groups derive a child node and return it to the caller
+		 * for additional group-specific processing. In some cases, the
+		 * child node may have already been derived.
+		 */
+		if (*child_node)
+			break;
+
+		snprintf(reg_grp_name, sizeof(reg_grp_name), "%s-%d",
+			 iqs7222_reg_grp_names[reg_grp], child_index);
+
+		reg_grp_node = device_get_named_child_node(&client->dev,
+							   reg_grp_name);
+		if (!reg_grp_node)
+			return 0;
+
+		*child_node = reg_grp_node;
+		break;
+
+	case IQS7222_REG_GRP_GLBL:
+	case IQS7222_REG_GRP_FILT:
+	case IQS7222_REG_GRP_SYS:
+		/*
+		 * These groups are not organized beneath a child node, nor are
+		 * they subject to any additional processing by the caller.
+		 */
+		reg_grp_node = dev_fwnode(&client->dev);
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_props); i++) {
+		const char *name = iqs7222_props[i].name;
+		int reg_offset = iqs7222_props[i].reg_offset;
+		int reg_shift = iqs7222_props[i].reg_shift;
+		int reg_width = iqs7222_props[i].reg_width;
+		int val_pitch = iqs7222_props[i].val_pitch ? : 1;
+		int val_min = iqs7222_props[i].val_min;
+		int val_max = iqs7222_props[i].val_max;
+		bool invert = iqs7222_props[i].invert;
+		const char *label = iqs7222_props[i].label ? : name;
+		unsigned int val;
+		int error;
+
+		if (iqs7222_props[i].reg_grp != reg_grp ||
+		    iqs7222_props[i].reg_key != reg_key)
+			continue;
+
+		/*
+		 * Boolean register fields are one bit wide; they are forcibly
+		 * reset to provide a means to undo changes by a bootloader if
+		 * necessary.
+		 *
+		 * Scalar fields, on the other hand, are left untouched unless
+		 * their corresponding properties are present.
+		 */
+		if (reg_width == 1) {
+			if (invert)
+				setup[reg_offset] |= BIT(reg_shift);
+			else
+				setup[reg_offset] &= ~BIT(reg_shift);
+		}
+
+		if (!fwnode_property_present(reg_grp_node, name))
+			continue;
+
+		if (reg_width == 1) {
+			if (invert)
+				setup[reg_offset] &= ~BIT(reg_shift);
+			else
+				setup[reg_offset] |= BIT(reg_shift);
+
+			continue;
+		}
+
+		error = fwnode_property_read_u32(reg_grp_node, name, &val);
+		if (error) {
+			dev_err(&client->dev, "Failed to read %s %s: %d\n",
+				fwnode_get_name(reg_grp_node), label, error);
+			return error;
+		}
+
+		if (!val_max)
+			val_max = GENMASK(reg_width - 1, 0) * val_pitch;
+
+		if (val < val_min || val > val_max) {
+			dev_err(&client->dev, "Invalid %s %s: %u\n",
+				fwnode_get_name(reg_grp_node), label, val);
+			return -EINVAL;
+		}
+
+		setup[reg_offset] &= ~GENMASK(reg_shift + reg_width - 1,
+					      reg_shift);
+		setup[reg_offset] |= (val / val_pitch << reg_shift);
+	}
+
+	return 0;
+}
+
+static int iqs7222_parse_cycle(struct iqs7222_private *iqs7222, int cycle_index)
+{
+	u16 *cycle_setup = iqs7222->cycle_setup[cycle_index];
+	struct i2c_client *client = iqs7222->client;
+	struct fwnode_handle *cycle_node = NULL;
+	unsigned int pins[9];
+	int error, count, i;
+
+	/*
+	 * Each channel shares a cycle with one other channel; the mapping of
+	 * channels to cycles is fixed. Properties defined for a cycle impact
+	 * both channels tied to the cycle.
+	 */
+	error = iqs7222_parse_props(iqs7222, &cycle_node, cycle_index,
+				    IQS7222_REG_GRP_CYCLE,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	if (!cycle_node)
+		return 0;
+
+	/*
+	 * Unlike channels which are restricted to a select range of CRx pins
+	 * based on channel number, any cycle can claim any of the device's 9
+	 * CTx pins (CTx0-8).
+	 */
+	if (!fwnode_property_present(cycle_node, "azoteq,tx-enable"))
+		return 0;
+
+	count = fwnode_property_count_u32(cycle_node, "azoteq,tx-enable");
+	if (count > ARRAY_SIZE(pins)) {
+		dev_err(&client->dev, "Invalid number of %s CTx pins\n",
+			fwnode_get_name(cycle_node));
+		return -EINVAL;
+	} else if (count < 0) {
+		dev_err(&client->dev, "Failed to count %s CTx pins: %d\n",
+			fwnode_get_name(cycle_node), count);
+		return count;
+	}
+
+	error = fwnode_property_read_u32_array(cycle_node, "azoteq,tx-enable",
+					       pins, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read %s CTx pins: %d\n",
+			fwnode_get_name(cycle_node), error);
+		return error;
+	}
+
+	cycle_setup[1] &= ~GENMASK(7 + ARRAY_SIZE(pins) - 1, 7);
+
+	for (i = 0; i < count; i++) {
+		if (pins[i] > 8) {
+			dev_err(&client->dev, "Invalid %s CTx pin: %u\n",
+				fwnode_get_name(cycle_node), pins[i]);
+			return -EINVAL;
+		}
+
+		cycle_setup[1] |= BIT(pins[i] + 7);
+	}
+
+	return 0;
+}
+
+static int iqs7222_parse_chan(struct iqs7222_private *iqs7222, int chan_index)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	struct i2c_client *client = iqs7222->client;
+	struct fwnode_handle *chan_node = NULL;
+	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
+	int ext_chan = rounddown(num_chan, 10);
+	int error, i;
+	u16 *chan_setup = iqs7222->chan_setup[chan_index];
+	u16 *sys_setup = iqs7222->sys_setup;
+	unsigned int val;
+
+	error = iqs7222_parse_props(iqs7222, &chan_node, chan_index,
+				    IQS7222_REG_GRP_CHAN,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	if (!chan_node)
+		return 0;
+
+	if (dev_desc->allow_offset) {
+		sys_setup[dev_desc->allow_offset] |= BIT(chan_index);
+		if (fwnode_property_present(chan_node, "azoteq,ulp-allow"))
+			sys_setup[dev_desc->allow_offset] &= ~BIT(chan_index);
+	}
+
+	chan_setup[0] |= IQS7222_CHAN_SETUP_0_CHAN_EN;
+
+	/*
+	 * The reference channel function allows for differential measurements
+	 * and is only available in the case of IQS7222A or IQS7222C.
+	 */
+	if (dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_col > 4 &&
+	    fwnode_property_present(chan_node, "azoteq,ref-select")) {
+		u16 *ref_setup;
+
+		error = fwnode_property_read_u32(chan_node, "azoteq,ref-select",
+						 &val);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read %s reference channel: %d\n",
+				fwnode_get_name(chan_node), error);
+			return error;
+		}
+
+		if (val >= ext_chan) {
+			dev_err(&client->dev,
+				"Invalid %s reference channel: %u\n",
+				fwnode_get_name(chan_node), val);
+			return -EINVAL;
+		}
+
+		ref_setup = iqs7222->chan_setup[val];
+
+		/*
+		 * Configure the current channel as a follower of the selected
+		 * reference channel.
+		 */
+		chan_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_FOLLOW;
+		chan_setup[4] = val * 42 + 1048;
+
+		if (!fwnode_property_read_u32(chan_node, "azoteq,ref-weight",
+					      &val)) {
+			if (val > U16_MAX) {
+				dev_err(&client->dev,
+					"Invalid %s reference weight: %u\n",
+					fwnode_get_name(chan_node), val);
+				return -EINVAL;
+			}
+
+			chan_setup[5] = val;
+		}
+
+		/*
+		 * Configure the selected channel as a reference channel which
+		 * serves the current channel.
+		 */
+		ref_setup[0] |= IQS7222_CHAN_SETUP_0_REF_MODE_REF;
+		ref_setup[5] |= BIT(chan_index);
+
+		ref_setup[4] = dev_desc->touch_link;
+		if (fwnode_property_present(chan_node, "azoteq,use-prox"))
+			ref_setup[4] -= 2;
+	}
+
+	if (fwnode_property_present(chan_node, "azoteq,rx-enable")) {
+		/*
+		 * Each channel can claim up to 4 CRx pins. The first half of
+		 * the channels can use CRx0-3, while the second half can use
+		 * CRx4-7.
+		 */
+		unsigned int pins[4];
+		int count;
+
+		count = fwnode_property_count_u32(chan_node,
+						  "azoteq,rx-enable");
+		if (count > ARRAY_SIZE(pins)) {
+			dev_err(&client->dev,
+				"Invalid number of %s CRx pins\n",
+				fwnode_get_name(chan_node));
+			return -EINVAL;
+		} else if (count < 0) {
+			dev_err(&client->dev,
+				"Failed to count %s CRx pins: %d\n",
+				fwnode_get_name(chan_node), count);
+			return count;
+		}
+
+		error = fwnode_property_read_u32_array(chan_node,
+						       "azoteq,rx-enable",
+						       pins, count);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read %s CRx pins: %d\n",
+				fwnode_get_name(chan_node), error);
+			return error;
+		}
+
+		chan_setup[0] &= ~GENMASK(4 + ARRAY_SIZE(pins) - 1, 4);
+
+		for (i = 0; i < count; i++) {
+			int min_crx = chan_index < ext_chan / 2 ? 0 : 4;
+
+			if (pins[i] < min_crx || pins[i] > min_crx + 3) {
+				dev_err(&client->dev,
+					"Invalid %s CRx pin: %u\n",
+					fwnode_get_name(chan_node), pins[i]);
+				return -EINVAL;
+			}
+
+			chan_setup[0] |= BIT(pins[i] + 4 - min_crx);
+		}
+	}
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_kp_events); i++) {
+		const char *event_name = iqs7222_kp_events[i].name;
+		u16 event_enable = iqs7222_kp_events[i].enable;
+		struct fwnode_handle *event_node;
+
+		event_node = fwnode_get_named_child_node(chan_node, event_name);
+		if (!event_node)
+			continue;
+
+		error = iqs7222_parse_props(iqs7222, &event_node, chan_index,
+					    IQS7222_REG_GRP_BTN,
+					    iqs7222_kp_events[i].reg_key);
+		if (error)
+			return error;
+
+		error = iqs7222_gpio_select(iqs7222, event_node,
+					    BIT(chan_index),
+					    dev_desc->touch_link - (i ? 0 : 2));
+		if (error)
+			return error;
+
+		if (!fwnode_property_read_u32(event_node,
+					      "azoteq,timeout-press-ms",
+					      &val)) {
+			/*
+			 * The IQS7222B employs a global pair of press timeout
+			 * registers as opposed to channel-specific registers.
+			 */
+			u16 *setup = dev_desc->reg_grps
+				     [IQS7222_REG_GRP_BTN].num_col > 2 ?
+				     &iqs7222->btn_setup[chan_index][2] :
+				     &sys_setup[9];
+
+			if (val > U8_MAX * 500) {
+				dev_err(&client->dev,
+					"Invalid %s press timeout: %u\n",
+					fwnode_get_name(chan_node), val);
+				return -EINVAL;
+			}
+
+			*setup &= ~(U8_MAX << i * 8);
+			*setup |= (val / 500 << i * 8);
+		}
+
+		error = fwnode_property_read_u32(event_node, "linux,code",
+						 &val);
+		if (error) {
+			dev_err(&client->dev, "Failed to read %s code: %d\n",
+				fwnode_get_name(chan_node), error);
+			return error;
+		}
+
+		iqs7222->kp_code[chan_index][i] = val;
+		iqs7222->kp_type[chan_index][i] = EV_KEY;
+
+		if (fwnode_property_present(event_node, "linux,input-type")) {
+			error = fwnode_property_read_u32(event_node,
+							 "linux,input-type",
+							 &val);
+			if (error) {
+				dev_err(&client->dev,
+					"Failed to read %s input type: %d\n",
+					fwnode_get_name(chan_node), error);
+				return error;
+			}
+
+			if (val != EV_KEY && val != EV_SW) {
+				dev_err(&client->dev,
+					"Invalid %s input type: %u\n",
+					fwnode_get_name(chan_node), val);
+				return -EINVAL;
+			}
+
+			iqs7222->kp_type[chan_index][i] = val;
+		}
+
+		/*
+		 * Reference channels can opt out of event reporting by using
+		 * KEY_RESERVED in place of a true key or switch code.
+		 */
+		if (iqs7222->kp_type[chan_index][i] == EV_KEY &&
+		    iqs7222->kp_code[chan_index][i] == KEY_RESERVED)
+			continue;
+
+		input_set_capability(iqs7222->keypad,
+				     iqs7222->kp_type[chan_index][i],
+				     iqs7222->kp_code[chan_index][i]);
+
+		if (!dev_desc->event_offset)
+			continue;
+
+		sys_setup[dev_desc->event_offset] |= event_enable;
+	}
+
+	/*
+	 * The following call handles a special pair of properties that apply
+	 * to a channel node, but reside within the button (event) group.
+	 */
+	return iqs7222_parse_props(iqs7222, &chan_node, chan_index,
+				   IQS7222_REG_GRP_BTN,
+				   IQS7222_REG_KEY_DEBOUNCE);
+}
+
+static int iqs7222_parse_sldr(struct iqs7222_private *iqs7222, int sldr_index)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	struct i2c_client *client = iqs7222->client;
+	struct fwnode_handle *sldr_node = NULL;
+	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
+	int ext_chan = rounddown(num_chan, 10);
+	int count, error, reg_offset, i;
+	u16 *sldr_setup = iqs7222->sldr_setup[sldr_index];
+	u16 *sys_setup = iqs7222->sys_setup;
+	unsigned int chan_sel[4], val;
+
+	error = iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
+				    IQS7222_REG_GRP_SLDR,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	if (!sldr_node)
+		return 0;
+
+	/*
+	 * Each slider can be spread across 3 to 4 channels. It is possible to
+	 * select only 2 channels, but doing so prevents the slider from using
+	 * the specified resolution.
+	 */
+	count = fwnode_property_count_u32(sldr_node, "azoteq,channel-select");
+	if (count < 3 || count > ARRAY_SIZE(chan_sel)) {
+		dev_err(&client->dev, "Invalid number of %s channels\n",
+			fwnode_get_name(sldr_node));
+		return -EINVAL;
+	} else if (count < 0) {
+		dev_err(&client->dev, "Failed to count %s channels: %d\n",
+			fwnode_get_name(sldr_node), count);
+		return count;
+	}
+
+	error = fwnode_property_read_u32_array(sldr_node,
+					       "azoteq,channel-select",
+					       chan_sel, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read %s channels: %d\n",
+			fwnode_get_name(sldr_node), error);
+		return error;
+	}
+
+	/*
+	 * Resolution and top speed, if small enough, are packed into a single
+	 * register. Otherwise, each occupies its own register and the rest of
+	 * the slider-related register addresses are offset by one.
+	 */
+	reg_offset = dev_desc->sldr_res < U16_MAX ? 0 : 1;
+
+	sldr_setup[0] |= count;
+	sldr_setup[3 + reg_offset] &= ~IQS7222_SLDR_SETUP_3_CHAN_SEL_MASK;
+
+	for (i = 0; i < ARRAY_SIZE(chan_sel); i++) {
+		sldr_setup[5 + reg_offset + i] = 0;
+		if (i >= count)
+			continue;
+
+		if (chan_sel[i] >= ext_chan) {
+			dev_err(&client->dev, "Invalid %s channel: %u\n",
+				fwnode_get_name(sldr_node), chan_sel[i]);
+			return -EINVAL;
+		}
+
+		/*
+		 * The following fields indicate which channels participate in
+		 * the slider, as well as each channel's relative placement.
+		 */
+		sldr_setup[3 + reg_offset] |= BIT(chan_sel[i]);
+		sldr_setup[5 + reg_offset + i] = chan_sel[i] * 42 + 1080;
+	}
+
+	sldr_setup[4 + reg_offset] = dev_desc->touch_link;
+	if (fwnode_property_present(sldr_node, "azoteq,use-prox"))
+		sldr_setup[4 + reg_offset] -= 2;
+
+	if (!fwnode_property_read_u32(sldr_node, "azoteq,slider-size", &val)) {
+		if (!val || val > dev_desc->sldr_res) {
+			dev_err(&client->dev, "Invalid %s size: %u\n",
+				fwnode_get_name(sldr_node), val);
+			return -EINVAL;
+		}
+
+		if (reg_offset) {
+			sldr_setup[3] = val;
+		} else {
+			sldr_setup[2] &= ~IQS7222_SLDR_SETUP_2_RES_MASK;
+			sldr_setup[2] |= (val / 16 <<
+					  IQS7222_SLDR_SETUP_2_RES_SHIFT);
+		}
+	}
+
+	if (!fwnode_property_read_u32(sldr_node, "azoteq,top-speed", &val)) {
+		if (val > (reg_offset ? U16_MAX : U8_MAX * 4)) {
+			dev_err(&client->dev, "Invalid %s top speed: %u\n",
+				fwnode_get_name(sldr_node), val);
+			return -EINVAL;
+		}
+
+		if (reg_offset) {
+			sldr_setup[2] = val;
+		} else {
+			sldr_setup[2] &= ~IQS7222_SLDR_SETUP_2_TOP_SPEED_MASK;
+			sldr_setup[2] |= (val / 4);
+		}
+	}
+
+	if (!fwnode_property_read_u32(sldr_node, "linux,axis", &val)) {
+		u16 sldr_max = sldr_setup[3] - 1;
+
+		if (!reg_offset) {
+			sldr_max = sldr_setup[2];
+
+			sldr_max &= IQS7222_SLDR_SETUP_2_RES_MASK;
+			sldr_max >>= IQS7222_SLDR_SETUP_2_RES_SHIFT;
+
+			sldr_max = sldr_max * 16 - 1;
+		}
+
+		input_set_abs_params(iqs7222->keypad, val, 0, sldr_max, 0, 0);
+		iqs7222->sl_axis[sldr_index] = val;
+	}
+
+	if (dev_desc->wheel_enable) {
+		sldr_setup[0] &= ~dev_desc->wheel_enable;
+		if (iqs7222->sl_axis[sldr_index] == ABS_WHEEL)
+			sldr_setup[0] |= dev_desc->wheel_enable;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(iqs7222_sl_events); i++) {
+		const char *event_name = iqs7222_sl_events[i].name;
+		struct fwnode_handle *event_node;
+
+		/*
+		 * The absence of a register offset means the remaining fields
+		 * in the group represent gesture settings.
+		 */
+		if (iqs7222_sl_events[i].enable && !reg_offset)
+			sldr_setup[9] &= ~iqs7222_sl_events[i].enable;
+
+		event_node = fwnode_get_named_child_node(sldr_node, event_name);
+		if (!event_node)
+			continue;
+
+		error = iqs7222_parse_props(iqs7222, &event_node, sldr_index,
+					    IQS7222_REG_GRP_SLDR,
+					    reg_offset ?
+					    IQS7222_REG_KEY_RESERVED :
+					    iqs7222_sl_events[i].reg_key);
+		if (error)
+			return error;
+
+		error = fwnode_property_read_u32(event_node, "linux,code",
+						 &val);
+		if (error) {
+			dev_err(&client->dev, "Failed to read %s code: %d\n",
+				fwnode_get_name(sldr_node), error);
+			return error;
+		}
+
+		iqs7222->sl_code[sldr_index][i] = val;
+		input_set_capability(iqs7222->keypad, EV_KEY, val);
+
+		/*
+		 * The press/release event is determined based on whether the
+		 * coordinate field reports 0xFFFF and has no explicit enable
+		 * control.
+		 */
+		if (!iqs7222_sl_events[i].enable || reg_offset)
+			continue;
+
+		sldr_setup[9] |= iqs7222_sl_events[i].enable;
+
+		error = iqs7222_gpio_select(iqs7222, event_node,
+					    iqs7222_sl_events[i].enable,
+					    1568 + sldr_index * 30);
+		if (error)
+			return error;
+
+		if (!dev_desc->event_offset)
+			continue;
+
+		sys_setup[dev_desc->event_offset] |= BIT(10 + sldr_index);
+	}
+
+	/*
+	 * The following call handles a special pair of properties that shift
+	 * to make room for a wheel enable control in the case of IQS7222C.
+	 */
+	return iqs7222_parse_props(iqs7222, &sldr_node, sldr_index,
+				   IQS7222_REG_GRP_SLDR,
+				   dev_desc->wheel_enable ?
+				   IQS7222_REG_KEY_WHEEL :
+				   IQS7222_REG_KEY_NO_WHEEL);
+}
+
+static int iqs7222_parse_all(struct iqs7222_private *iqs7222)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	const struct iqs7222_reg_grp_desc *reg_grps = dev_desc->reg_grps;
+	u16 *sys_setup = iqs7222->sys_setup;
+	int error, i;
+
+	if (dev_desc->event_offset)
+		sys_setup[dev_desc->event_offset] = IQS7222_EVENT_MASK_ATI;
+
+	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CYCLE].num_row; i++) {
+		error = iqs7222_parse_cycle(iqs7222, i);
+		if (error)
+			return error;
+	}
+
+	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_GLBL,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	for (i = 0; i < reg_grps[IQS7222_REG_GRP_GPIO].num_row; i++) {
+		struct fwnode_handle *gpio_node = NULL;
+		u16 *gpio_setup = iqs7222->gpio_setup[i];
+		int j;
+
+		gpio_setup[0] &= ~IQS7222_GPIO_SETUP_0_GPIO_EN;
+		gpio_setup[1] = 0;
+		gpio_setup[2] = 0;
+
+		error = iqs7222_parse_props(iqs7222, &gpio_node, i,
+					    IQS7222_REG_GRP_GPIO,
+					    IQS7222_REG_KEY_NONE);
+		if (error)
+			return error;
+
+		if (reg_grps[IQS7222_REG_GRP_GPIO].num_row == 1)
+			continue;
+
+		/*
+		 * The IQS7222C exposes multiple GPIO and must be informed
+		 * as to which GPIO this group represents.
+		 */
+		for (j = 0; j < ARRAY_SIZE(iqs7222_gpio_links); j++)
+			gpio_setup[0] &= ~BIT(iqs7222_gpio_links[j]);
+
+		gpio_setup[0] |= BIT(iqs7222_gpio_links[i]);
+	}
+
+	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CHAN].num_row; i++) {
+		u16 *chan_setup = iqs7222->chan_setup[i];
+
+		chan_setup[0] &= ~IQS7222_CHAN_SETUP_0_REF_MODE_MASK;
+		chan_setup[0] &= ~IQS7222_CHAN_SETUP_0_CHAN_EN;
+
+		chan_setup[5] = 0;
+	}
+
+	for (i = 0; i < reg_grps[IQS7222_REG_GRP_CHAN].num_row; i++) {
+		error = iqs7222_parse_chan(iqs7222, i);
+		if (error)
+			return error;
+	}
+
+	error = iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_FILT,
+				    IQS7222_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	for (i = 0; i < reg_grps[IQS7222_REG_GRP_SLDR].num_row; i++) {
+		u16 *sldr_setup = iqs7222->sldr_setup[i];
+
+		sldr_setup[0] &= ~IQS7222_SLDR_SETUP_0_CHAN_CNT_MASK;
+
+		error = iqs7222_parse_sldr(iqs7222, i);
+		if (error)
+			return error;
+	}
+
+	sys_setup[0] &= ~IQS7222_SYS_SETUP_INTF_MODE_MASK;
+	sys_setup[0] &= ~IQS7222_SYS_SETUP_PWR_MODE_MASK;
+
+	sys_setup[0] |= IQS7222_SYS_SETUP_ACK_RESET;
+
+	return iqs7222_parse_props(iqs7222, NULL, 0, IQS7222_REG_GRP_SYS,
+				   IQS7222_REG_KEY_NONE);
+}
+
+static int iqs7222_report(struct iqs7222_private *iqs7222)
+{
+	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
+	struct i2c_client *client = iqs7222->client;
+	int num_chan = dev_desc->reg_grps[IQS7222_REG_GRP_CHAN].num_row;
+	int num_stat = dev_desc->reg_grps[IQS7222_REG_GRP_STAT].num_col;
+	int error, i, j;
+	__le16 status[IQS7222_MAX_COLS_STAT];
+
+	error = iqs7222_read_burst(iqs7222, IQS7222_SYS_STATUS, status,
+				   num_stat);
+	if (error)
+		return error;
+
+	if (le16_to_cpu(status[0]) & IQS7222_SYS_STATUS_RESET) {
+		dev_err(&client->dev, "Unexpected device reset\n");
+		return iqs7222_dev_init(iqs7222, WRITE);
+	}
+
+	if (le16_to_cpu(status[0]) & IQS7222_SYS_STATUS_ATI_ERROR) {
+		dev_err(&client->dev, "Unexpected ATI error\n");
+		return iqs7222_ati_trigger(iqs7222);
+	}
+
+	if (le16_to_cpu(status[0]) & IQS7222_SYS_STATUS_ATI_ACTIVE)
+		return 0;
+
+	for (i = 0; i < num_chan; i++) {
+		u16 *chan_setup = iqs7222->chan_setup[i];
+
+		if (!(chan_setup[0] & IQS7222_CHAN_SETUP_0_CHAN_EN))
+			continue;
+
+		for (j = 0; j < ARRAY_SIZE(iqs7222_kp_events); j++) {
+			/*
+			 * Proximity state begins at offset 2 and spills into
+			 * offset 3 for devices with more than 16 channels.
+			 *
+			 * Touch state begins at the first offset immediately
+			 * following proximity state.
+			 */
+			int k = 2 + j * (num_chan > 16 ? 2 : 1);
+			u16 state = le16_to_cpu(status[k + i / 16]);
+
+			input_event(iqs7222->keypad,
+				    iqs7222->kp_type[i][j],
+				    iqs7222->kp_code[i][j],
+				    !!(state & BIT(i % 16)));
+		}
+	}
+
+	for (i = 0; i < dev_desc->reg_grps[IQS7222_REG_GRP_SLDR].num_row; i++) {
+		u16 *sldr_setup = iqs7222->sldr_setup[i];
+		u16 sldr_pos = le16_to_cpu(status[4 + i]);
+		u16 state = le16_to_cpu(status[6 + i]);
+
+		if (!(sldr_setup[0] & IQS7222_SLDR_SETUP_0_CHAN_CNT_MASK))
+			continue;
+
+		if (sldr_pos < dev_desc->sldr_res)
+			input_report_abs(iqs7222->keypad, iqs7222->sl_axis[i],
+					 sldr_pos);
+
+		for (j = 0; j < ARRAY_SIZE(iqs7222_sl_events); j++) {
+			u16 mask = iqs7222_sl_events[j].mask;
+			u16 val = iqs7222_sl_events[j].val;
+
+			if (!iqs7222_sl_events[j].enable) {
+				input_report_key(iqs7222->keypad,
+						 iqs7222->sl_code[i][j],
+						 sldr_pos < dev_desc->sldr_res);
+				continue;
+			}
+
+			/*
+			 * The remaining offsets represent gesture state, and
+			 * are discarded in the case of IQS7222C because only
+			 * absolute position is reported.
+			 */
+			if (num_stat < IQS7222_MAX_COLS_STAT)
+				continue;
+
+			input_report_key(iqs7222->keypad,
+					 iqs7222->sl_code[i][j],
+					 (state & mask) == val);
+		}
+	}
+
+	input_sync(iqs7222->keypad);
+
+	return 0;
+}
+
+static irqreturn_t iqs7222_irq(int irq, void *context)
+{
+	struct iqs7222_private *iqs7222 = context;
+
+	return iqs7222_report(iqs7222) ? IRQ_NONE : IRQ_HANDLED;
+}
+
+static int iqs7222_probe(struct i2c_client *client)
+{
+	struct iqs7222_private *iqs7222;
+	unsigned long irq_flags;
+	int error, irq;
+
+	iqs7222 = devm_kzalloc(&client->dev, sizeof(*iqs7222), GFP_KERNEL);
+	if (!iqs7222)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, iqs7222);
+	iqs7222->client = client;
+
+	iqs7222->keypad = devm_input_allocate_device(&client->dev);
+	if (!iqs7222->keypad)
+		return -ENOMEM;
+
+	iqs7222->keypad->name = client->name;
+	iqs7222->keypad->id.bustype = BUS_I2C;
+
+	/*
+	 * The RDY pin behaves as an interrupt, but must also be polled ahead
+	 * of unsolicited I2C communication. As such, it is first opened as a
+	 * GPIO and then passed to gpiod_to_irq() to register the interrupt.
+	 */
+	iqs7222->irq_gpio = devm_gpiod_get(&client->dev, "irq", GPIOD_IN);
+	if (IS_ERR(iqs7222->irq_gpio)) {
+		error = PTR_ERR(iqs7222->irq_gpio);
+		dev_err(&client->dev, "Failed to request IRQ GPIO: %d\n",
+			error);
+		return error;
+	}
+
+	iqs7222->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(iqs7222->reset_gpio)) {
+		error = PTR_ERR(iqs7222->reset_gpio);
+		dev_err(&client->dev, "Failed to request reset GPIO: %d\n",
+			error);
+		return error;
+	}
+
+	error = iqs7222_hard_reset(iqs7222);
+	if (error)
+		return error;
+
+	error = iqs7222_dev_info(iqs7222);
+	if (error)
+		return error;
+
+	error = iqs7222_dev_init(iqs7222, READ);
+	if (error)
+		return error;
+
+	error = iqs7222_parse_all(iqs7222);
+	if (error)
+		return error;
+
+	error = iqs7222_dev_init(iqs7222, WRITE);
+	if (error)
+		return error;
+
+	error = iqs7222_report(iqs7222);
+	if (error)
+		return error;
+
+	error = input_register_device(iqs7222->keypad);
+	if (error) {
+		dev_err(&client->dev, "Failed to register device: %d\n", error);
+		return error;
+	}
+
+	irq = gpiod_to_irq(iqs7222->irq_gpio);
+	if (irq < 0)
+		return irq;
+
+	irq_flags = gpiod_is_active_low(iqs7222->irq_gpio) ? IRQF_TRIGGER_LOW
+							   : IRQF_TRIGGER_HIGH;
+	irq_flags |= IRQF_ONESHOT;
+
+	error = devm_request_threaded_irq(&client->dev, irq, NULL, iqs7222_irq,
+					  irq_flags, client->name, iqs7222);
+	if (error)
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+
+	return error;
+}
+
+static const struct of_device_id iqs7222_of_match[] = {
+	{ .compatible = "azoteq,iqs7222a" },
+	{ .compatible = "azoteq,iqs7222b" },
+	{ .compatible = "azoteq,iqs7222c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, iqs7222_of_match);
+
+static struct i2c_driver iqs7222_i2c_driver = {
+	.driver = {
+		.name = "iqs7222",
+		.of_match_table = iqs7222_of_match,
+	},
+	.probe_new = iqs7222_probe,
+};
+module_i2c_driver(iqs7222_i2c_driver);
+
+MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
+MODULE_DESCRIPTION("Azoteq IQS7222A/B/C Capacitive Touch Controller");
+MODULE_LICENSE("GPL");
-- 
2.25.1

