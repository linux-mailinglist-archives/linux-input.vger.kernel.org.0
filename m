Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D82965AB446
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 16:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236601AbiIBOwO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 10:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236256AbiIBOvr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 10:51:47 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4489418E3C;
        Fri,  2 Sep 2022 07:15:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPa73bC8mfaSvSQOH4AkzfgiTWcNlii1Xk3DM8xzQCXsdnB0SFnIEDM9///AsUg6xqa0AYEW8fnRr/DM9fBQU7BHV2yh0YICIFxNuBQvURftgohAMigQSy6GavAXA1BMyfvrup/TM9qwTh0r0qP/ZkpKzDVqilRfaVYKZg0WCxm38AgejP942gIPQpNixwiwFFHGdNEBmMudbcJpVyW3QTyb6PQd3kXAosVtFSR0ip52Y3SoZQ+RHXe1fBVnwAoVESUYUuoKMVHDh7bqlJSq5dTxJ9hVs8J190VDvyr+94ujEMCdwI6W63AvDAEaHTXToJBwZ0Z+rl6ggoiyKhLNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2f4vmu+oljC8831oxMC2HnluP3vKp1oMXzw8TzGNm4=;
 b=E7OB6Ro+8ZDonQjSXFWdFqtpMFtgenfv/basy0V24/xdbAU2LhkFPeTRC8NjVyXIRsa31jMIH9tUBPniFk8FvoR1wJ3FWeSCqNhRWw7kPxkmvg+6umQtlQOHwgEFyoACmWHoaVbWCEyf2s9yNnc2F+DlxZeaLxwA+3MKg5zgebauY4TEsxyW+dBHZFUBYeBVhle3b93GNTkHVPPKRfQO+owRfkTsapw9euplyUKiSQIxEcpujMSvL/D67zhpChFwlnNzUSaBZgEeKOeVR/yuzK7a8uUbcj7uac8rboupQWgkLSE12o53xI29jQYVPESvt7rlu++lIMIU1//LrCtUbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2f4vmu+oljC8831oxMC2HnluP3vKp1oMXzw8TzGNm4=;
 b=ukspd88u8FbZEcylSrnmfjPvVqvmG6GQArRW4zMB384BHGGJxB838gVHN2mQwa3UGF2TXCwMpOvdG/NT7069LkI9nLF6KMnMCSvrVEO3O8c6HjgcVXNj08CH9380eTyhnKgfknwD1fVAQVopmCL6KJZa9P3CgCsIrjzxF87jNhA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BN8PR08MB6420.namprd08.prod.outlook.com
 (2603:10b6:408:7c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 2 Sep
 2022 14:14:57 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5%7]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 14:14:57 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 2/2] Input: add support for Azoteq IQS7210A/7211A/E
Date:   Fri,  2 Sep 2022 09:14:24 -0500
Message-Id: <20220902141424.90063-3-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902141424.90063-1-jeff@labundy.com>
References: <20220902141424.90063-1-jeff@labundy.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 378af3cb-7739-4620-475c-08da8ced8404
X-MS-TrafficTypeDiagnostic: BN8PR08MB6420:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AsYqB8axhtvUMrMm8f7yfPH5rQuJcKBf5pkmIx4Dz9fkCFaG6/EkPVT2Irt/FSEHgVajW+GiRiQMaNvi+k052AhzbQ/QStfuE1gdn0RJH5n7NFFasShK02dSrWlT9ydKP4FiQ7SqqIgXeiHpGmo3PYFpv/XBQ2UM0hcvaYl3pM7C4xywOmH8fR5E1QI8XzBQrJ1echqDJ5isVsAPCqEW26WQGoYtSDRrgQCPfqqvp6rUYl9fo/fjWZwGkfxNrfzNqLdpv7hKbWF/Y8J82AcIeJkX1Mtua5ZbS9+qFT6HtkUL0Gs78va5LeKksP2OvCAW8Z9vw4q11pKzmESclXyQpbYJ+yC8pxUHNrdvjYsHLi99GktomsWp5P926wRyNoTHK+QHBkQ3hBm/Sk0A6gvxHQUMfQo72ie7lAGeXWEV5B+5KBMZ1ZGxg8T62O/6cU89MSbh2doQjSfzCs3muItqPfywYgAq/K8t/XvclSh+s56NJcXX0md0jTgyI2FECpvq+EaYj8fvvq4RAD36NPweW4LAewuhpoHPXGuDjKgLxNw4Z9QBWyYOcX74n2983lKqrzLpmfOSi6uU2x2ybx1DkcqyndCraeWn45VZ/ctha6VNFcbs/SEfn/aUwz3Uef5KVXZS9zZOpNfz8dNg+k3085DyjOUtxf+MiXpbxfkq0nVjFPbhWH8A56p4GJb2US/djZWw7azMOvOE3kR8KYDv6/dFkaOfb53kuXqsyM+IXJS2c/Kdc2k/F/wXLRPQAAFUyHdI+w9M2po3vL4wwzIycQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(136003)(346002)(396003)(39830400003)(83380400001)(478600001)(1076003)(186003)(2616005)(66556008)(4326008)(66946007)(8676002)(66476007)(36756003)(6486002)(52116002)(6512007)(6666004)(6506007)(41300700001)(26005)(107886003)(86362001)(2906002)(30864003)(5660300002)(8936002)(38100700002)(38350700002)(316002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t9CceFEt90TvLzrURSWzZHsdkiLoD/M6MeIqv93IUuK9WP9IeEaDyWOuasug?=
 =?us-ascii?Q?EVgauqUpLjP9mXj0v/bcsg+qpksjH2NPRwW2F8uhuUWg8yZNU3bjSu64UMwZ?=
 =?us-ascii?Q?0aPyvuVDQjQw9XBA+j16cil29Mnrg0pdpSdJ9jo1XzVAaaUgB1DqhPpyM7Za?=
 =?us-ascii?Q?0F3MOPNtC5jdBOxinuMExPdhD8zQMNH1OwWC1w0aIvEqGXq5XQ7PUaDaGXq5?=
 =?us-ascii?Q?SvGgAv3Nv7F1pBOHbNM5hTpLfa0jNQyWCdFhEkZRiFz7+fpDEsRCIwv00jKe?=
 =?us-ascii?Q?I1bat4QD55zJA5nuENaZEuhSu7X2m5IT9LyGuomuBwTuj/tVInjo7A7qtuKW?=
 =?us-ascii?Q?zNHBe0AJRQXbsKRRmLTF/Ed89W1y/TFsgqQVk4zegd92MSlqFW/YzX0OSWLw?=
 =?us-ascii?Q?uv+USe1jDnpwtz2J6ohhMJngFqYAtIMBj/DdWlam/JJMIGJkw023DHG+VCOL?=
 =?us-ascii?Q?ksbnqIUO/+XGtIzksQcRn54wzda2c/3ueC25djCw8K6ph+nIC0lYDFLOBrLU?=
 =?us-ascii?Q?mL3n4iYY43Nff7cqVsJYl1sUCEmm0YkDAH3vjJPMVnCtkvSJXg/kmyJIpreX?=
 =?us-ascii?Q?CzkNCJyOLSg1KF6bJ99te4/bmqCIuIR4eCNeek68Drkxt+fnpKlpY1n2kMWG?=
 =?us-ascii?Q?OB7o6c9Q1XwvAoY3i5WeaOQ0ozuRtxoiUluDfga/8kv4GCPqw+hgm7wcxXee?=
 =?us-ascii?Q?kTFFRN6o/X4j/AwrIRDrb+hCpFP/bRmhfaKm533pUjkuLtAU6e3+XT+K41AU?=
 =?us-ascii?Q?rQwdLb4ajHx9hOONug/PPqpY43wGGRzCupxfvoW5xcU5RrOwuiJ6ISk4sVup?=
 =?us-ascii?Q?DMX2LX7dqfPsUGfBCnzB0G4BCkEOMkvtlzH2WFeH42TRH8Yt2UTuT8+t8TzC?=
 =?us-ascii?Q?RfyYlMCaQoul6lfY/m/a6HcgXZVV63rNqy6V+Eax5KOakttvWHVPDZYhCYJB?=
 =?us-ascii?Q?DaidTzutBZKJSnqshtMrmxcTz7re3FfNbQrXAnamC1K4wmxIA/fh8KKzckQC?=
 =?us-ascii?Q?cYoC+f7ac/U40QORgYw91qgUGeNP2WLG3/9u3s0DiwsldpwGQTQDGp3RmIhV?=
 =?us-ascii?Q?m7G2zg1HeA4ZxY3Z76AUiRGqGx83wqRBJuargDO9uvxIMRwC3lG7FYnBdJ5I?=
 =?us-ascii?Q?6A/buPPoKsJHlkCahE8tqoBfPy3V2FpOMrlk3667pwTLzTgYqXYd6kbBqtyr?=
 =?us-ascii?Q?Cc4SrskV7Z3yHqZY0tALva9vnPfkjGG4hLYVPSr/W8Y0xnL1D7RetAvwZkSl?=
 =?us-ascii?Q?aqusvu8qXkGMdnL1yniZGrbT/ytOSL0uGEjjDGAWdxl0QU1lp5qf6j+wi8Bh?=
 =?us-ascii?Q?OIokhfSl8hna6InEiz7jX03jyDvxB3M9d8Ca5g8ELQrSW/fMD8UHYUheDo+N?=
 =?us-ascii?Q?7HBKFdwrx8AxSIF0LuZk50fEJGL+OH6X0EDHBAhgTGh41MixW4L0O0/VTevw?=
 =?us-ascii?Q?GICdgvEmpbHVaZvUOsYar2id8vovc4wnXNF3F6t0/uCXeeyvE65hz4bP8HL+?=
 =?us-ascii?Q?9wXeuq4LYKzJHuelHhljS5gMaIPk8q0BSfhWsDJXwBABdQQ7zRcKSq1WPebn?=
 =?us-ascii?Q?UEfgDjcET7xQotTL34V9K00ulC8x4gLD42H9XPjO?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378af3cb-7739-4620-475c-08da8ced8404
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:14:57.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dXt0Ftbd8DdG0oAlnvkmIq0t5d7OmidL54XOL4GcnvWd5VZ3nlQU4vOiP1mrIo0Xc+zXR9YcR3KqJhJD9YD4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR08MB6420
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds support for the Azoteq IQS7210A/7211A/E family of
trackpad/touchscreen controllers.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/Kconfig   |   10 +
 drivers/input/touchscreen/Makefile  |    1 +
 drivers/input/touchscreen/iqs7211.c | 2566 +++++++++++++++++++++++++++
 3 files changed, 2577 insertions(+)
 create mode 100644 drivers/input/touchscreen/iqs7211.c

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index dc90a3ea51ee..bf23d6f047c6 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -1367,6 +1367,16 @@ config TOUCHSCREEN_IQS5XX
 	  To compile this driver as a module, choose M here: the
 	  module will be called iqs5xx.
 
+config TOUCHSCREEN_IQS7211
+	tristate "Azoteq IQS7210A/7211A/E trackpad/touchscreen controller"
+	depends on I2C
+	help
+	  Say Y to enable support for the Azoteq IQS7210A/7211A/E
+	  family of trackpad/touchscreen controllers.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called iqs7211.
+
 config TOUCHSCREEN_ZINITIX
 	tristate "Zinitix touchscreen support"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 557f84fd2075..95605c60bafc 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -115,4 +115,5 @@ obj-$(CONFIG_TOUCHSCREEN_COLIBRI_VF50)	+= colibri-vf50-ts.o
 obj-$(CONFIG_TOUCHSCREEN_ROHM_BU21023)	+= rohm_bu21023.o
 obj-$(CONFIG_TOUCHSCREEN_RASPBERRYPI_FW)	+= raspberrypi-ts.o
 obj-$(CONFIG_TOUCHSCREEN_IQS5XX)	+= iqs5xx.o
+obj-$(CONFIG_TOUCHSCREEN_IQS7211)	+= iqs7211.o
 obj-$(CONFIG_TOUCHSCREEN_ZINITIX)	+= zinitix.o
diff --git a/drivers/input/touchscreen/iqs7211.c b/drivers/input/touchscreen/iqs7211.c
new file mode 100644
index 000000000000..aa39f8aa80fe
--- /dev/null
+++ b/drivers/input/touchscreen/iqs7211.c
@@ -0,0 +1,2566 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Azoteq IQS7210A/7211A/E Trackpad/Touchscreen Controller
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
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/ktime.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <asm/unaligned.h>
+
+#define IQS7211_PROD_NUM			0x00
+
+#define IQS7211_EVENT_MASK_ALL			GENMASK(14, 8)
+#define IQS7211_EVENT_MASK_ALP			BIT(13)
+#define IQS7211_EVENT_MASK_BTN			BIT(12)
+#define IQS7211_EVENT_MASK_ATI			BIT(11)
+#define IQS7211_EVENT_MASK_MOVE			BIT(10)
+#define IQS7211_EVENT_MASK_GSTR			BIT(9)
+#define IQS7211_EVENT_MODE			BIT(8)
+
+#define IQS7211_COMMS_ERROR			0xEEEE
+#define IQS7211_COMMS_RETRY_MS			50
+#define IQS7211_COMMS_TIMEOUT_MS		100
+#define IQS7211_RESET_TIMEOUT_MS		250
+#define IQS7211_START_TIMEOUT_MS		1000
+
+#define IQS7211_NUM_RETRIES			5
+#define IQS7211_NUM_CRX				8
+#define IQS7211_MAX_CTX				13
+
+#define IQS7211_MAX_CONTACTS			2
+#define IQS7211_MAX_CYCLES			21
+
+enum iqs7211_dev_id {
+	IQS7210A,
+	IQS7211A,
+	IQS7211E,
+};
+
+enum iqs7211_comms_mode {
+	IQS7211_COMMS_MODE_WAIT,
+	IQS7211_COMMS_MODE_FREE,
+	IQS7211_COMMS_MODE_FORCE,
+};
+
+struct iqs7211_reg_field_desc {
+	struct list_head list;
+	u8 addr;
+	u16 mask;
+	u16 val;
+};
+
+enum iqs7211_reg_key_id {
+	IQS7211_REG_KEY_NONE,
+	IQS7211_REG_KEY_PROX,
+	IQS7211_REG_KEY_TOUCH,
+	IQS7211_REG_KEY_TAP,
+	IQS7211_REG_KEY_HOLD,
+	IQS7211_REG_KEY_PALM,
+	IQS7211_REG_KEY_AXIAL_X,
+	IQS7211_REG_KEY_AXIAL_Y,
+	IQS7211_REG_KEY_RESERVED
+};
+
+enum iqs7211_reg_grp_id {
+	IQS7211_REG_GRP_TP,
+	IQS7211_REG_GRP_BTN,
+	IQS7211_REG_GRP_ALP,
+	IQS7211_REG_GRP_SYS,
+	IQS7211_NUM_REG_GRPS
+};
+
+static const char * const iqs7211_reg_grp_names[IQS7211_NUM_REG_GRPS] = {
+	[IQS7211_REG_GRP_TP] = "trackpad",
+	[IQS7211_REG_GRP_BTN] = "button",
+	[IQS7211_REG_GRP_ALP] = "alp",
+};
+
+static const u16 iqs7211_reg_grp_masks[IQS7211_NUM_REG_GRPS] = {
+	[IQS7211_REG_GRP_TP] = IQS7211_EVENT_MASK_GSTR,
+	[IQS7211_REG_GRP_BTN] = IQS7211_EVENT_MASK_BTN,
+	[IQS7211_REG_GRP_ALP] = IQS7211_EVENT_MASK_ALP,
+};
+
+struct iqs7211_event_desc {
+	const char *name;
+	u16 mask;
+	u16 enable;
+	enum iqs7211_reg_grp_id reg_grp;
+	enum iqs7211_reg_key_id reg_key;
+};
+
+static const struct iqs7211_event_desc iqs7210a_kp_events[] = {
+	{
+		.mask = BIT(10),
+		.enable = BIT(13) | BIT(12),
+		.reg_grp = IQS7211_REG_GRP_ALP,
+	},
+	{
+		.name = "event-prox",
+		.mask = BIT(2),
+		.enable = BIT(5) | BIT(4),
+		.reg_grp = IQS7211_REG_GRP_BTN,
+		.reg_key = IQS7211_REG_KEY_PROX,
+	},
+	{
+		.name = "event-touch",
+		.mask = BIT(3),
+		.enable = BIT(5) | BIT(4),
+		.reg_grp = IQS7211_REG_GRP_BTN,
+		.reg_key = IQS7211_REG_KEY_TOUCH,
+	},
+	{
+		.name = "event-tap",
+		.mask = BIT(0),
+		.enable = BIT(0),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_TAP,
+	},
+	{
+		.name = "event-hold",
+		.mask = BIT(1),
+		.enable = BIT(1),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-swipe-x-neg",
+		.mask = BIT(2),
+		.enable = BIT(2),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-x-pos",
+		.mask = BIT(3),
+		.enable = BIT(3),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-y-pos",
+		.mask = BIT(4),
+		.enable = BIT(4),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+	{
+		.name = "event-swipe-y-neg",
+		.mask = BIT(5),
+		.enable = BIT(5),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+};
+
+static const struct iqs7211_event_desc iqs7211a_kp_events[] = {
+	{
+		.mask = BIT(14),
+		.reg_grp = IQS7211_REG_GRP_ALP,
+	},
+	{
+		.name = "event-tap",
+		.mask = BIT(0),
+		.enable = BIT(0),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_TAP,
+	},
+	{
+		.name = "event-hold",
+		.mask = BIT(1),
+		.enable = BIT(1),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-swipe-x-neg",
+		.mask = BIT(2),
+		.enable = BIT(2),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-x-pos",
+		.mask = BIT(3),
+		.enable = BIT(3),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-y-pos",
+		.mask = BIT(4),
+		.enable = BIT(4),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+	{
+		.name = "event-swipe-y-neg",
+		.mask = BIT(5),
+		.enable = BIT(5),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+};
+
+static const struct iqs7211_event_desc iqs7211e_kp_events[] = {
+	{
+		.mask = BIT(14),
+		.reg_grp = IQS7211_REG_GRP_ALP,
+	},
+	{
+		.name = "event-tap",
+		.mask = BIT(0),
+		.enable = BIT(0),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_TAP,
+	},
+	{
+		.name = "event-tap-double",
+		.mask = BIT(1),
+		.enable = BIT(1),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_TAP,
+	},
+	{
+		.name = "event-tap-triple",
+		.mask = BIT(2),
+		.enable = BIT(2),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_TAP,
+	},
+	{
+		.name = "event-hold",
+		.mask = BIT(3),
+		.enable = BIT(3),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-palm",
+		.mask = BIT(4),
+		.enable = BIT(4),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_PALM,
+	},
+	{
+		.name = "event-swipe-x-pos",
+		.mask = BIT(8),
+		.enable = BIT(8),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-x-neg",
+		.mask = BIT(9),
+		.enable = BIT(9),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+	},
+	{
+		.name = "event-swipe-y-pos",
+		.mask = BIT(10),
+		.enable = BIT(10),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+	{
+		.name = "event-swipe-y-neg",
+		.mask = BIT(11),
+		.enable = BIT(11),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+	},
+	{
+		.name = "event-swipe-x-pos-hold",
+		.mask = BIT(12),
+		.enable = BIT(12),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-swipe-x-neg-hold",
+		.mask = BIT(13),
+		.enable = BIT(13),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-swipe-y-pos-hold",
+		.mask = BIT(14),
+		.enable = BIT(14),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+	{
+		.name = "event-swipe-y-neg-hold",
+		.mask = BIT(15),
+		.enable = BIT(15),
+		.reg_grp = IQS7211_REG_GRP_TP,
+		.reg_key = IQS7211_REG_KEY_HOLD,
+	},
+};
+
+struct iqs7211_dev_desc {
+	const char *tp_name;
+	const char *kp_name;
+	u16 prod_num;
+	u16 show_reset;
+	u16 ati_error[IQS7211_NUM_REG_GRPS];
+	u16 ati_start[IQS7211_NUM_REG_GRPS];
+	u16 suspend;
+	u16 ack_reset;
+	u16 comms_hold;
+	u16 comms_forced;
+	int charge_shift;
+	int info_offs;
+	int gesture_offs;
+	int contact_offs;
+	u8 sys_stat;
+	u8 sys_ctrl;
+	u8 alp_config;
+	u8 tp_config;
+	u8 exp_file;
+	u8 kp_enable[IQS7211_NUM_REG_GRPS];
+	u8 rx_tx_map;
+	u8 cycle_alloc[2];
+	u8 cycle_limit[2];
+	const struct iqs7211_event_desc *kp_events;
+	int num_kp_events;
+	int min_crx_alp;
+	int num_ctx;
+};
+
+static const struct iqs7211_dev_desc iqs7211_devs[] = {
+	[IQS7210A] = {
+		.tp_name = "iqs7210a_trackpad",
+		.kp_name = "iqs7210a_keys",
+		.prod_num = 944,
+		.show_reset = BIT(15),
+		.ati_error = {
+			[IQS7211_REG_GRP_TP] = BIT(12),
+			[IQS7211_REG_GRP_BTN] = BIT(0),
+			[IQS7211_REG_GRP_ALP] = BIT(8),
+		},
+		.ati_start = {
+			[IQS7211_REG_GRP_TP] = BIT(13),
+			[IQS7211_REG_GRP_BTN] = BIT(1),
+			[IQS7211_REG_GRP_ALP] = BIT(9),
+		},
+		.suspend = BIT(11),
+		.ack_reset = BIT(7),
+		.comms_hold = BIT(2),
+		.comms_forced = BIT(1),
+		.charge_shift = 4,
+		.info_offs = 0,
+		.gesture_offs = 1,
+		.contact_offs = 4,
+		.sys_stat = 0x0A,
+		.sys_ctrl = 0x35,
+		.alp_config = 0x39,
+		.tp_config = 0x4E,
+		.exp_file = 0x57,
+		.kp_enable = {
+			[IQS7211_REG_GRP_TP] = 0x58,
+			[IQS7211_REG_GRP_BTN] = 0x37,
+			[IQS7211_REG_GRP_ALP] = 0x37,
+		},
+		.rx_tx_map = 0x60,
+		.cycle_alloc = { 0x66, 0x75, },
+		.cycle_limit = { 10, 6, },
+		.kp_events = iqs7210a_kp_events,
+		.num_kp_events = ARRAY_SIZE(iqs7210a_kp_events),
+		.min_crx_alp = 4,
+		.num_ctx = IQS7211_MAX_CTX - 1,
+	},
+	[IQS7211A] = {
+		.tp_name = "iqs7211a_trackpad",
+		.kp_name = "iqs7211a_keys",
+		.prod_num = 763,
+		.show_reset = BIT(7),
+		.ati_error = {
+			[IQS7211_REG_GRP_TP] = BIT(3),
+			[IQS7211_REG_GRP_ALP] = BIT(5),
+		},
+		.ati_start = {
+			[IQS7211_REG_GRP_TP] = BIT(5),
+			[IQS7211_REG_GRP_ALP] = BIT(6),
+		},
+		.ack_reset = BIT(7),
+		.comms_forced = BIT(4),
+		.charge_shift = 0,
+		.info_offs = 0,
+		.gesture_offs = 1,
+		.contact_offs = 4,
+		.sys_stat = 0x10,
+		.sys_ctrl = 0x50,
+		.tp_config = 0x60,
+		.alp_config = 0x72,
+		.exp_file = 0x74,
+		.kp_enable = {
+			[IQS7211_REG_GRP_TP] = 0x80,
+		},
+		.rx_tx_map = 0x90,
+		.cycle_alloc = { 0xA0, 0xB0, },
+		.cycle_limit = { 10, 8, },
+		.kp_events = iqs7211a_kp_events,
+		.num_kp_events = ARRAY_SIZE(iqs7211a_kp_events),
+		.num_ctx = IQS7211_MAX_CTX - 1,
+	},
+	[IQS7211E] = {
+		.tp_name = "iqs7211e_trackpad",
+		.kp_name = "iqs7211e_keys",
+		.prod_num = 1112,
+		.show_reset = BIT(7),
+		.ati_error = {
+			[IQS7211_REG_GRP_TP] = BIT(3),
+			[IQS7211_REG_GRP_ALP] = BIT(5),
+		},
+		.ati_start = {
+			[IQS7211_REG_GRP_TP] = BIT(5),
+			[IQS7211_REG_GRP_ALP] = BIT(6),
+		},
+		.suspend = BIT(11),
+		.ack_reset = BIT(7),
+		.comms_hold = BIT(6),
+		.comms_forced = BIT(4),
+		.charge_shift = 0,
+		.info_offs = 1,
+		.gesture_offs = 0,
+		.contact_offs = 2,
+		.sys_stat = 0x0E,
+		.sys_ctrl = 0x33,
+		.tp_config = 0x41,
+		.alp_config = 0x36,
+		.exp_file = 0x4A,
+		.kp_enable = {
+			[IQS7211_REG_GRP_TP] = 0x4B,
+		},
+		.rx_tx_map = 0x56,
+		.cycle_alloc = { 0x5D, 0x6C, },
+		.cycle_limit = { 10, 11, },
+		.kp_events = iqs7211e_kp_events,
+		.num_kp_events = ARRAY_SIZE(iqs7211e_kp_events),
+		.num_ctx = IQS7211_MAX_CTX,
+	},
+};
+
+struct iqs7211_prop_desc {
+	const char *name;
+	enum iqs7211_reg_key_id reg_key;
+	u8 reg_addr[IQS7211_NUM_REG_GRPS][ARRAY_SIZE(iqs7211_devs)];
+	int reg_shift;
+	int reg_width;
+	int val_pitch;
+	int val_min;
+	int val_max;
+	const char *label;
+};
+
+static const struct iqs7211_prop_desc iqs7211_props[] = {
+	{
+		.name = "azoteq,ati-frac-div-fine",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x1E,
+				[IQS7211A] = 0x30,
+				[IQS7211E] = 0x21,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x22,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x23,
+				[IQS7211A] = 0x36,
+				[IQS7211E] = 0x25,
+			},
+		},
+		.reg_shift = 9,
+		.reg_width = 5,
+		.label = "ATI fine fractional divider",
+	},
+	{
+		.name = "azoteq,ati-frac-mult-coarse",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x1E,
+				[IQS7211A] = 0x30,
+				[IQS7211E] = 0x21,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x22,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x23,
+				[IQS7211A] = 0x36,
+				[IQS7211E] = 0x25,
+			},
+		},
+		.reg_shift = 5,
+		.reg_width = 4,
+		.label = "ATI coarse fractional multiplier",
+	},
+	{
+		.name = "azoteq,ati-frac-div-coarse",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x1E,
+				[IQS7211A] = 0x30,
+				[IQS7211E] = 0x21,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x22,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x23,
+				[IQS7211A] = 0x36,
+				[IQS7211E] = 0x25,
+			},
+		},
+		.reg_shift = 0,
+		.reg_width = 5,
+		.label = "ATI coarse fractional divider",
+	},
+	{
+		.name = "azoteq,ati-comp-div",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x1F,
+				[IQS7211E] = 0x22,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x24,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7211E] = 0x26,
+			},
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.val_max = 31,
+		.label = "ATI compensation divider",
+	},
+	{
+		.name = "azoteq,ati-comp-div",
+		.reg_addr = {
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x24,
+			},
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_max = 31,
+		.label = "ATI compensation divider",
+	},
+	{
+		.name = "azoteq,ati-comp-div",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7211A] = 0x31,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7211A] = 0x37,
+			},
+		},
+		.val_max = 31,
+		.label = "ATI compensation divider",
+	},
+	{
+		.name = "azoteq,ati-target",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x20,
+				[IQS7211A] = 0x32,
+				[IQS7211E] = 0x23,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x27,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x28,
+				[IQS7211A] = 0x38,
+				[IQS7211E] = 0x27,
+			},
+		},
+		.label = "ATI target",
+	},
+	{
+		.name = "azoteq,ati-base",
+		.reg_addr[IQS7211_REG_GRP_ALP] = {
+			[IQS7210A] = 0x26,
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 8,
+		.label = "ATI base",
+	},
+	{
+		.name = "azoteq,ati-base",
+		.reg_addr[IQS7211_REG_GRP_BTN] = {
+			[IQS7210A] = 0x26,
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.val_pitch = 8,
+		.label = "ATI base",
+	},
+	{
+		.name = "azoteq,rate-active-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x29,
+			[IQS7211A] = 0x40,
+			[IQS7211E] = 0x28,
+		},
+		.label = "active mode report rate",
+	},
+	{
+		.name = "azoteq,rate-touch-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2A,
+			[IQS7211A] = 0x41,
+			[IQS7211E] = 0x29,
+		},
+		.label = "idle-touch mode report rate",
+	},
+	{
+		.name = "azoteq,rate-idle-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2B,
+			[IQS7211A] = 0x42,
+			[IQS7211E] = 0x2A,
+		},
+		.label = "idle mode report rate",
+	},
+	{
+		.name = "azoteq,rate-lp1-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2C,
+			[IQS7211A] = 0x43,
+			[IQS7211E] = 0x2B,
+		},
+		.label = "low-power mode 1 report rate",
+	},
+	{
+		.name = "azoteq,rate-lp2-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2D,
+			[IQS7211A] = 0x44,
+			[IQS7211E] = 0x2C,
+		},
+		.label = "low-power mode 2 report rate",
+	},
+	{
+		.name = "azoteq,timeout-active-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2E,
+			[IQS7211A] = 0x45,
+			[IQS7211E] = 0x2D,
+		},
+		.val_pitch = 1000,
+		.label = "active mode timeout",
+	},
+	{
+		.name = "azoteq,timeout-touch-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x2F,
+			[IQS7211A] = 0x46,
+			[IQS7211E] = 0x2E,
+		},
+		.val_pitch = 1000,
+		.label = "idle-touch mode timeout",
+	},
+	{
+		.name = "azoteq,timeout-idle-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x30,
+			[IQS7211A] = 0x47,
+			[IQS7211E] = 0x2F,
+		},
+		.val_pitch = 1000,
+		.label = "idle mode timeout",
+	},
+	{
+		.name = "azoteq,timeout-lp1-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x31,
+			[IQS7211A] = 0x48,
+			[IQS7211E] = 0x30,
+		},
+		.val_pitch = 1000,
+		.label = "low-power mode 1 timeout",
+	},
+	{
+		.name = "azoteq,timeout-lp2-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x32,
+			[IQS7211E] = 0x31,
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_pitch = 1000,
+		.val_max = 60000,
+		.label = "trackpad reference value update rate",
+	},
+	{
+		.name = "azoteq,timeout-lp2-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7211A] = 0x49,
+		},
+		.val_pitch = 1000,
+		.val_max = 60000,
+		.label = "trackpad reference value update rate",
+	},
+	{
+		.name = "azoteq,timeout-ati-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x32,
+			[IQS7211E] = 0x31,
+		},
+		.reg_width = 8,
+		.val_pitch = 1000,
+		.val_max = 60000,
+		.label = "ATI error timeout",
+	},
+	{
+		.name = "azoteq,timeout-ati-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7211A] = 0x35,
+		},
+		.val_pitch = 1000,
+		.val_max = 60000,
+		.label = "ATI error timeout",
+	},
+	{
+		.name = "azoteq,timeout-comms-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x33,
+			[IQS7211A] = 0x4A,
+			[IQS7211E] = 0x32,
+		},
+		.label = "communication timeout",
+	},
+	{
+		.name = "azoteq,timeout-press-ms",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x34,
+		},
+		.reg_width = 8,
+		.val_pitch = 1000,
+		.val_max = 60000,
+		.label = "press timeout",
+	},
+	{
+		.name = "azoteq,ati-mode",
+		.reg_addr[IQS7211_REG_GRP_ALP] = {
+			[IQS7210A] = 0x37,
+		},
+		.reg_shift = 15,
+		.reg_width = 1,
+		.label = "ATI mode",
+	},
+	{
+		.name = "azoteq,ati-mode",
+		.reg_addr[IQS7211_REG_GRP_BTN] = {
+			[IQS7210A] = 0x37,
+		},
+		.reg_shift = 7,
+		.reg_width = 1,
+		.label = "ATI mode",
+	},
+	{
+		.name = "azoteq,sense-mode",
+		.reg_addr[IQS7211_REG_GRP_ALP] = {
+			[IQS7210A] = 0x37,
+			[IQS7211A] = 0x72,
+			[IQS7211E] = 0x36,
+		},
+		.reg_shift = 8,
+		.reg_width = 1,
+		.label = "sensing mode",
+	},
+	{
+		.name = "azoteq,sense-mode",
+		.reg_addr[IQS7211_REG_GRP_BTN] = {
+			[IQS7210A] = 0x37,
+		},
+		.reg_shift = 0,
+		.reg_width = 2,
+		.val_max = 2,
+		.label = "sensing mode",
+	},
+	{
+		.name = "azoteq,fosc-freq",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x38,
+			[IQS7211A] = 0x52,
+			[IQS7211E] = 0x35,
+		},
+		.reg_shift = 4,
+		.reg_width = 1,
+		.label = "core clock frequency selection",
+	},
+	{
+		.name = "azoteq,fosc-trim",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x38,
+			[IQS7211A] = 0x52,
+			[IQS7211E] = 0x35,
+		},
+		.reg_shift = 0,
+		.reg_width = 4,
+		.label = "core clock frequency trim",
+	},
+	{
+		.name = "azoteq,touch-exit",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x3B,
+				[IQS7211A] = 0x53,
+				[IQS7211E] = 0x38,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x3E,
+			},
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "touch exit factor",
+	},
+	{
+		.name = "azoteq,touch-enter",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x3B,
+				[IQS7211A] = 0x53,
+				[IQS7211E] = 0x38,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x3E,
+			},
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "touch entrance factor",
+	},
+	{
+		.name = "azoteq,thresh",
+		.reg_addr = {
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x3C,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x3D,
+				[IQS7211A] = 0x54,
+				[IQS7211E] = 0x39,
+			},
+		},
+		.label = "threshold",
+	},
+	{
+		.name = "azoteq,debounce-exit",
+		.reg_addr = {
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x3F,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x40,
+				[IQS7211A] = 0x56,
+				[IQS7211E] = 0x3A,
+			},
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "debounce exit factor",
+	},
+	{
+		.name = "azoteq,debounce-enter",
+		.reg_addr = {
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x3F,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x40,
+				[IQS7211A] = 0x56,
+				[IQS7211E] = 0x3A,
+			},
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "debounce entrance factor",
+	},
+	{
+		.name = "azoteq,conv-frac",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x48,
+				[IQS7211A] = 0x58,
+				[IQS7211E] = 0x3D,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x49,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x4A,
+				[IQS7211A] = 0x59,
+				[IQS7211E] = 0x3E,
+			},
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "conversion frequency fractional divider",
+	},
+	{
+		.name = "azoteq,conv-period",
+		.reg_addr = {
+			[IQS7211_REG_GRP_TP] = {
+				[IQS7210A] = 0x48,
+				[IQS7211A] = 0x58,
+				[IQS7211E] = 0x3D,
+			},
+			[IQS7211_REG_GRP_BTN] = {
+				[IQS7210A] = 0x49,
+			},
+			[IQS7211_REG_GRP_ALP] = {
+				[IQS7210A] = 0x4A,
+				[IQS7211A] = 0x59,
+				[IQS7211E] = 0x3E,
+			},
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "conversion period",
+	},
+	{
+		.name = "azoteq,thresh",
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x55,
+			[IQS7211A] = 0x67,
+			[IQS7211E] = 0x48,
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "threshold",
+	},
+	{
+		.name = "azoteq,contact-split",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x55,
+			[IQS7211A] = 0x67,
+			[IQS7211E] = 0x48,
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "contact split factor",
+	},
+	{
+		.name = "azoteq,trim-x",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x56,
+			[IQS7211E] = 0x49,
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "horizontal trim width",
+	},
+	{
+		.name = "azoteq,trim-x",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7211A] = 0x68,
+		},
+		.label = "horizontal trim width",
+	},
+	{
+		.name = "azoteq,trim-y",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7210A] = 0x56,
+			[IQS7211E] = 0x49,
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.label = "vertical trim height",
+	},
+	{
+		.name = "azoteq,trim-y",
+		.reg_addr[IQS7211_REG_GRP_SYS] = {
+			[IQS7211A] = 0x69,
+		},
+		.label = "vertical trim height",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_key = IQS7211_REG_KEY_TAP,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x59,
+			[IQS7211A] = 0x81,
+			[IQS7211E] = 0x4C,
+		},
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-mid-ms",
+		.reg_key = IQS7211_REG_KEY_TAP,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7211E] = 0x4D,
+		},
+		.label = "repeated gesture time",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_key = IQS7211_REG_KEY_TAP,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5A,
+			[IQS7211A] = 0x82,
+			[IQS7211E] = 0x4E,
+		},
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_key = IQS7211_REG_KEY_HOLD,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5A,
+			[IQS7211A] = 0x82,
+			[IQS7211E] = 0x4E,
+		},
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-min-ms",
+		.reg_key = IQS7211_REG_KEY_HOLD,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5B,
+			[IQS7211A] = 0x83,
+			[IQS7211E] = 0x4F,
+		},
+		.label = "minimum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5C,
+			[IQS7211A] = 0x84,
+			[IQS7211E] = 0x50,
+		},
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-max-ms",
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5C,
+			[IQS7211A] = 0x84,
+			[IQS7211E] = 0x50,
+		},
+		.label = "maximum gesture time",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5D,
+			[IQS7211A] = 0x85,
+			[IQS7211E] = 0x51,
+		},
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-dist",
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5E,
+			[IQS7211A] = 0x86,
+			[IQS7211E] = 0x52,
+		},
+		.label = "gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-dist-rep",
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7211E] = 0x53,
+		},
+		.label = "repeated gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-dist-rep",
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7211E] = 0x54,
+		},
+		.label = "repeated gesture distance",
+	},
+	{
+		.name = "azoteq,gesture-angle",
+		.reg_key = IQS7211_REG_KEY_AXIAL_X,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5F,
+			[IQS7211A] = 0x87,
+			[IQS7211E] = 0x55,
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "gesture angle",
+	},
+	{
+		.name = "azoteq,gesture-angle",
+		.reg_key = IQS7211_REG_KEY_AXIAL_Y,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7210A] = 0x5F,
+			[IQS7211A] = 0x87,
+			[IQS7211E] = 0x55,
+		},
+		.reg_shift = 0,
+		.reg_width = 8,
+		.label = "gesture angle",
+	},
+	{
+		.name = "azoteq,thresh",
+		.reg_key = IQS7211_REG_KEY_PALM,
+		.reg_addr[IQS7211_REG_GRP_TP] = {
+			[IQS7211E] = 0x55,
+		},
+		.reg_shift = 8,
+		.reg_width = 8,
+		.val_max = 42,
+		.label = "threshold",
+	},
+};
+
+struct iqs7211_ver_info {
+	__le16 prod_num;
+	__le16 major;
+	__le16 minor;
+	__le32 patch;
+} __packed;
+
+struct iqs7211_touch_data {
+	__le16 abs_x;
+	__le16 abs_y;
+	__le16 pressure;
+	__le16 area;
+} __packed;
+
+struct iqs7211_tp_config {
+	u8 tp_settings;
+	u8 total_rx;
+	u8 total_tx;
+	u8 num_contacts;
+	__le16 max_x;
+	__le16 max_y;
+} __packed;
+
+struct iqs7211_private {
+	const struct iqs7211_dev_desc *dev_desc;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *irq_gpio;
+	struct i2c_client *client;
+	struct input_dev *tp_idev;
+	struct input_dev *kp_idev;
+	struct iqs7211_ver_info ver_info;
+	struct iqs7211_tp_config tp_config;
+	struct touchscreen_properties prop;
+	struct list_head reg_field_head;
+	enum iqs7211_comms_mode comms_mode;
+	unsigned int num_contacts;
+	unsigned int kp_code[ARRAY_SIZE(iqs7211e_kp_events)];
+	u8 rx_tx_map[IQS7211_MAX_CTX + 1];
+	u8 cycle_alloc[2][33];
+	u8 exp_file[2];
+	u16 event_mask;
+	u16 ati_start;
+	u16 gesture_cache;
+};
+
+static int iqs7211_irq_poll(struct iqs7211_private *iqs7211,
+			    u16 timeout_ms, int val)
+{
+	ktime_t irq_timeout = ktime_add_ms(ktime_get(), timeout_ms);
+	int ret;
+
+	do {
+		usleep_range(50, 100);
+
+		ret = gpiod_get_value_cansleep(iqs7211->irq_gpio);
+		if (ret < 0)
+			return ret;
+		else if (ret == val)
+			return 0;
+	} while (ktime_compare(ktime_get(), irq_timeout) < 0);
+
+	return -EBUSY;
+}
+
+static int iqs7211_hard_reset(struct iqs7211_private *iqs7211)
+{
+	int error;
+
+	if (!iqs7211->reset_gpio)
+		return 0;
+
+	/*
+	 * If the MCLR and RDY pins are shared, the host must wait until the
+	 * device deasserts the common pin before asserting reset.
+	 */
+	if (iqs7211->reset_gpio == iqs7211->irq_gpio) {
+		error = iqs7211_irq_poll(iqs7211, IQS7211_RESET_TIMEOUT_MS, 0);
+		if (error)
+			return error;
+	}
+
+	gpiod_set_value_cansleep(iqs7211->reset_gpio, 1);
+	usleep_range(1000, 1100);
+
+	gpiod_set_value_cansleep(iqs7211->reset_gpio, 0);
+
+	/*
+	 * The following delay ensures the common pin is pulled up before it
+	 * is sampled once more.
+	 */
+	if (iqs7211->reset_gpio == iqs7211->irq_gpio) {
+		error = iqs7211_irq_poll(iqs7211, IQS7211_RESET_TIMEOUT_MS, 0);
+		if (error)
+			return error;
+	}
+
+	return iqs7211_irq_poll(iqs7211, IQS7211_RESET_TIMEOUT_MS, 1);
+}
+
+static int iqs7211_force_comms(struct iqs7211_private *iqs7211)
+{
+	u8 msg_buf[] = { 0xFF, 0x00, };
+	int ret;
+
+	switch (iqs7211->comms_mode) {
+	case IQS7211_COMMS_MODE_WAIT:
+		return iqs7211_irq_poll(iqs7211, IQS7211_START_TIMEOUT_MS, 1);
+
+	case IQS7211_COMMS_MODE_FREE:
+		return 0;
+
+	case IQS7211_COMMS_MODE_FORCE:
+		break;
+
+	default:
+		return -EINVAL;
+	}
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
+	ret = gpiod_get_value_cansleep(iqs7211->irq_gpio);
+	if (ret < 0)
+		return ret;
+	else if (ret > 0)
+		return 0;
+
+	ret = i2c_master_send(iqs7211->client, msg_buf, sizeof(msg_buf));
+	if (ret < (int)sizeof(msg_buf)) {
+		if (ret >= 0)
+			ret = -EIO;
+
+		msleep(IQS7211_COMMS_RETRY_MS);
+		return ret;
+	}
+
+	return iqs7211_irq_poll(iqs7211, IQS7211_COMMS_TIMEOUT_MS, 1);
+}
+
+static int iqs7211_read_burst(struct iqs7211_private *iqs7211,
+			      u8 reg, void *val, u16 val_len)
+{
+	int ret, i;
+	struct i2c_client *client = iqs7211->client;
+	struct i2c_msg msg[] = {
+		{
+			.addr = client->addr,
+			.flags = 0,
+			.len = sizeof(reg),
+			.buf = &reg,
+		},
+		{
+			.addr = client->addr,
+			.flags = I2C_M_RD,
+			.len = val_len,
+			.buf = (u8 *)val,
+		},
+	};
+
+	/*
+	 * The following loop protects against an edge case in which the RDY
+	 * pin is automatically deasserted just as the read is initiated. In
+	 * that case, the read must be retried using forced communication.
+	 */
+	for (i = 0; i < IQS7211_NUM_RETRIES; i++) {
+		ret = iqs7211_force_comms(iqs7211);
+		if (ret < 0)
+			continue;
+
+		ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
+		if (ret < (int)ARRAY_SIZE(msg)) {
+			if (ret >= 0)
+				ret = -EIO;
+
+			msleep(IQS7211_COMMS_RETRY_MS);
+			continue;
+		}
+
+		if (get_unaligned_le16(msg[1].buf) == IQS7211_COMMS_ERROR) {
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
+	usleep_range(350, 400);
+
+	if (ret < 0)
+		dev_err(&client->dev,
+			"Failed to read from address 0x%02X: %d\n", reg, ret);
+
+	return ret;
+}
+
+static int iqs7211_read_word(struct iqs7211_private *iqs7211, u8 reg, u16 *val)
+{
+	__le16 val_buf;
+	int error;
+
+	error = iqs7211_read_burst(iqs7211, reg, &val_buf, sizeof(val_buf));
+	if (error)
+		return error;
+
+	*val = le16_to_cpu(val_buf);
+
+	return 0;
+}
+
+static int iqs7211_write_burst(struct iqs7211_private *iqs7211,
+			       u8 reg, const void *val, u16 val_len)
+{
+	int msg_len = sizeof(reg) + val_len;
+	int ret, i;
+	struct i2c_client *client = iqs7211->client;
+	u8 *msg_buf;
+
+	msg_buf = kzalloc(msg_len, GFP_KERNEL);
+	if (!msg_buf)
+		return -ENOMEM;
+
+	*msg_buf = reg;
+	memcpy(msg_buf + sizeof(reg), val, val_len);
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
+	for (i = 0; i < IQS7211_NUM_RETRIES; i++) {
+		ret = iqs7211_force_comms(iqs7211);
+		if (ret < 0)
+			continue;
+
+		ret = i2c_master_send(client, msg_buf, msg_len);
+		if (ret < msg_len) {
+			if (ret >= 0)
+				ret = -EIO;
+
+			msleep(IQS7211_COMMS_RETRY_MS);
+			continue;
+		}
+
+		ret = 0;
+		break;
+	}
+
+	kfree(msg_buf);
+
+	usleep_range(350, 400);
+
+	if (ret < 0)
+		dev_err(&client->dev,
+			"Failed to write to address 0x%02X: %d\n", reg, ret);
+
+	return ret;
+}
+
+static int iqs7211_write_word(struct iqs7211_private *iqs7211, u8 reg, u16 val)
+{
+	__le16 val_buf = cpu_to_le16(val);
+
+	return iqs7211_write_burst(iqs7211, reg, &val_buf, sizeof(val_buf));
+}
+
+static int iqs7211_dev_init(struct iqs7211_private *iqs7211)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct iqs7211_reg_field_desc *reg_field;
+	__le16 sys_ctrl[] = {
+		cpu_to_le16(dev_desc->ack_reset),
+		cpu_to_le16(iqs7211->event_mask),
+	};
+	int error, i;
+
+	/*
+	 * Acknowledge reset before writing any registers in case the device
+	 * suffers a spurious reset during initialization. The communication
+	 * mode is configured at this time as well.
+	 */
+	error = iqs7211_write_burst(iqs7211, dev_desc->sys_ctrl, sys_ctrl,
+				    sizeof(sys_ctrl));
+	if (error)
+		return error;
+
+	if (iqs7211->event_mask & dev_desc->comms_forced)
+		iqs7211->comms_mode = IQS7211_COMMS_MODE_FORCE;
+	else
+		iqs7211->comms_mode = IQS7211_COMMS_MODE_FREE;
+
+	/*
+	 * Take advantage of the stop-bit disable function, if available, to
+	 * save the trouble of having to reopen a communication window after
+	 * each read or write.
+	 */
+	error = iqs7211_write_word(iqs7211, dev_desc->sys_ctrl + 1,
+				   iqs7211->event_mask | dev_desc->comms_hold);
+	if (error)
+		return error;
+
+	list_for_each_entry(reg_field, &iqs7211->reg_field_head, list) {
+		u16 new_val = reg_field->val;
+
+		if (reg_field->mask < U16_MAX) {
+			u16 old_val;
+
+			error = iqs7211_read_word(iqs7211, reg_field->addr,
+						  &old_val);
+			if (error)
+				return error;
+
+			new_val = old_val & ~reg_field->mask;
+			new_val |= reg_field->val;
+
+			if (new_val == old_val)
+				continue;
+		}
+
+		error = iqs7211_write_word(iqs7211, reg_field->addr, new_val);
+		if (error)
+			return error;
+	}
+
+	error = iqs7211_write_burst(iqs7211, dev_desc->tp_config,
+				    &iqs7211->tp_config,
+				    sizeof(iqs7211->tp_config));
+	if (error)
+		return error;
+
+	if (**iqs7211->cycle_alloc) {
+		error = iqs7211_write_burst(iqs7211, dev_desc->rx_tx_map,
+					    &iqs7211->rx_tx_map,
+					    dev_desc->num_ctx);
+		if (error)
+			return error;
+
+		for (i = 0; i < sizeof(dev_desc->cycle_limit); i++) {
+			error = iqs7211_write_burst(iqs7211,
+						    dev_desc->cycle_alloc[i],
+						    iqs7211->cycle_alloc[i],
+						    dev_desc->cycle_limit[i] * 3);
+			if (error)
+				return error;
+		}
+	}
+
+	*sys_ctrl = cpu_to_le16(iqs7211->ati_start);
+
+	return iqs7211_write_burst(iqs7211, dev_desc->sys_ctrl, sys_ctrl,
+				   sizeof(sys_ctrl));
+}
+
+static int iqs7211_add_field(struct iqs7211_private *iqs7211,
+			     struct iqs7211_reg_field_desc new_field)
+{
+	struct i2c_client *client = iqs7211->client;
+	struct iqs7211_reg_field_desc *reg_field;
+
+	if (!new_field.addr)
+		return 0;
+
+	list_for_each_entry(reg_field, &iqs7211->reg_field_head, list) {
+		if (reg_field->addr != new_field.addr)
+			continue;
+
+		reg_field->mask |= new_field.mask;
+		reg_field->val |= new_field.val;
+		return 0;
+	}
+
+	reg_field = devm_kzalloc(&client->dev, sizeof(*reg_field), GFP_KERNEL);
+	if (!reg_field)
+		return -ENOMEM;
+
+	reg_field->addr = new_field.addr;
+	reg_field->mask = new_field.mask;
+	reg_field->val = new_field.val;
+
+	list_add(&reg_field->list, &iqs7211->reg_field_head);
+
+	return 0;
+}
+
+static int iqs7211_parse_props(struct iqs7211_private *iqs7211,
+			       struct fwnode_handle *reg_grp_node,
+			       enum iqs7211_reg_grp_id reg_grp,
+			       enum iqs7211_reg_key_id reg_key)
+{
+	struct i2c_client *client = iqs7211->client;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(iqs7211_props); i++) {
+		const char *name = iqs7211_props[i].name;
+		u8 reg_addr = iqs7211_props[i].reg_addr[reg_grp]
+						       [iqs7211->dev_desc -
+							iqs7211_devs];
+		int reg_shift = iqs7211_props[i].reg_shift;
+		int reg_width = iqs7211_props[i].reg_width ? : 16;
+		int val_pitch = iqs7211_props[i].val_pitch ? : 1;
+		int val_min = iqs7211_props[i].val_min;
+		int val_max = iqs7211_props[i].val_max;
+		const char *label = iqs7211_props[i].label ? : name;
+		struct iqs7211_reg_field_desc reg_field;
+		unsigned int val;
+		int error;
+
+		if (iqs7211_props[i].reg_key != reg_key)
+			continue;
+
+		if (!reg_addr)
+			continue;
+
+		if (!fwnode_property_present(reg_grp_node, name))
+			continue;
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
+			dev_err(&client->dev, "Invalid %s: %u\n", label, val);
+			return -EINVAL;
+		}
+
+		reg_field.addr = reg_addr;
+		reg_field.mask = GENMASK(reg_shift + reg_width - 1, reg_shift);
+		reg_field.val = val / val_pitch << reg_shift;
+
+		error = iqs7211_add_field(iqs7211, reg_field);
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
+static int iqs7211_parse_keys(struct iqs7211_private *iqs7211,
+			      struct fwnode_handle *reg_grp_node,
+			      enum iqs7211_reg_grp_id reg_grp)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	struct iqs7211_reg_field_desc reg_field;
+	struct fwnode_handle *event_node;
+	int error, i;
+
+	reg_field.addr = dev_desc->kp_enable[reg_grp];
+	reg_field.mask = 0;
+	reg_field.val = 0;
+
+	for (i = 0; i < dev_desc->num_kp_events; i++) {
+		const char *event_name = dev_desc->kp_events[i].name;
+
+		if (dev_desc->kp_events[i].reg_grp != reg_grp)
+			continue;
+
+		reg_field.mask |= dev_desc->kp_events[i].enable;
+
+		if (event_name)
+			event_node = fwnode_get_named_child_node(reg_grp_node,
+								 event_name);
+		else
+			event_node = fwnode_handle_get(reg_grp_node);
+
+		if (!event_node)
+			continue;
+
+		error = iqs7211_parse_props(iqs7211, event_node,
+					    dev_desc->kp_events[i].reg_grp,
+					    dev_desc->kp_events[i].reg_key);
+		if (error) {
+			fwnode_handle_put(event_node);
+			return error;
+		}
+
+		iqs7211->event_mask |= iqs7211_reg_grp_masks[reg_grp];
+		reg_field.val |= dev_desc->kp_events[i].enable;
+
+		if (fwnode_property_present(event_node, "linux,code")) {
+			error = fwnode_property_read_u32(event_node,
+							 "linux,code",
+							 &iqs7211->kp_code[i]);
+			if (error) {
+				dev_err(&client->dev,
+					"Failed to read %s code: %d\n",
+					fwnode_get_name(event_node), error);
+				fwnode_handle_put(event_node);
+				return error;
+			}
+		}
+
+		fwnode_handle_put(event_node);
+	}
+
+	return iqs7211_add_field(iqs7211, reg_field);
+}
+
+static int iqs7211_parse_chan(struct iqs7211_private *iqs7211,
+			      struct fwnode_handle *tp_node)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	int num_cycles = dev_desc->cycle_limit[0] + dev_desc->cycle_limit[1];
+	int error, count, i, j, k, cycle_start;
+	unsigned int cycle_alloc[IQS7211_MAX_CYCLES][2];
+	u8 total_rx = iqs7211->tp_config.total_rx;
+	u8 total_tx = iqs7211->tp_config.total_tx;
+
+	for (i = 0; i < IQS7211_MAX_CYCLES * 2; i++)
+		*(cycle_alloc[0] + i) = U8_MAX;
+
+	if (fwnode_property_present(tp_node, "azoteq,channel-select")) {
+		count = fwnode_property_count_u32(tp_node,
+						  "azoteq,channel-select");
+		if (count < 0) {
+			dev_err(&client->dev, "Failed to count channels: %d\n",
+				count);
+			return count;
+		} else if (count > num_cycles * 2) {
+			dev_err(&client->dev,
+				"Insufficient number of cycles\n");
+			return -EINVAL;
+		}
+
+		error = fwnode_property_read_u32_array(tp_node,
+						       "azoteq,channel-select",
+						       cycle_alloc[0], count);
+		if (error) {
+			dev_err(&client->dev, "Failed to read channels: %d\n",
+				error);
+			return error;
+		}
+
+		for (i = 0; i < count; i++) {
+			int chan = *(cycle_alloc[0] + i);
+
+			if (chan == U8_MAX)
+				continue;
+
+			if (chan >= total_rx * total_tx) {
+				dev_err(&client->dev, "Invalid channel: %d\n",
+					chan);
+				return -EINVAL;
+			}
+
+			for (j = 0; j < count; j++) {
+				if (j == i || *(cycle_alloc[0] + j) != chan)
+					continue;
+
+				dev_err(&client->dev, "Duplicate channel: %d\n",
+					chan);
+				return -EINVAL;
+			}
+		}
+	} else {
+		/*
+		 * Assign each sensing cycle's slots (0 and 1) to a channel,
+		 * defined as the intersection between two CRx and CTx pins.
+		 * A channel assignment of 255 means the slot is unused.
+		 */
+		for (i = 0, cycle_start = 0; i < total_tx; i++) {
+			int cycle_stop = 0;
+
+			for (j = 0; j < total_rx; j++) {
+				/*
+				 * Channels formed by CRx0-3 and CRx4-7 are
+				 * bound to slots 0 and 1, respectively.
+				 */
+				int slot = iqs7211->rx_tx_map[j] < 4 ? 0 : 1;
+				int chan = i * total_rx + j;
+
+				for (k = cycle_start; k < num_cycles; k++) {
+					if (cycle_alloc[k][slot] < U8_MAX)
+						continue;
+
+					cycle_alloc[k][slot] = chan;
+					break;
+				}
+
+				if (k < num_cycles) {
+					cycle_stop = max(k, cycle_stop);
+					continue;
+				}
+
+				dev_err(&client->dev,
+					"Insufficient number of cycles\n");
+				return -EINVAL;
+			}
+
+			/*
+			 * Sensing cycles cannot straddle more than one CTx
+			 * pin. As such, the next row's starting cycle must
+			 * be greater than the previous row's highest cycle.
+			 */
+			cycle_start = cycle_stop + 1;
+		}
+	}
+
+	/*
+	 * Once the raw channel assignments have been derived, they must be
+	 * packed according to the device's register map.
+	 */
+	for (i = 0, cycle_start = 0; i < sizeof(dev_desc->cycle_limit); i++) {
+		int offs = 0;
+
+		for (j = cycle_start;
+		     j < cycle_start + dev_desc->cycle_limit[i]; j++) {
+			iqs7211->cycle_alloc[i][offs++] = 0x05;
+			iqs7211->cycle_alloc[i][offs++] = cycle_alloc[j][0];
+			iqs7211->cycle_alloc[i][offs++] = cycle_alloc[j][1];
+		}
+
+		cycle_start += dev_desc->cycle_limit[i];
+	}
+
+	return 0;
+}
+
+static int iqs7211_parse_pins_tp(struct iqs7211_private *iqs7211,
+				 struct fwnode_handle *tp_node)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	unsigned int pins[IQS7211_MAX_CTX];
+	int error, count, i, j;
+
+	if (!fwnode_property_present(tp_node, "azoteq,rx-enable"))
+		return 0;
+
+	count = fwnode_property_count_u32(tp_node, "azoteq,rx-enable");
+	if (count < 0) {
+		dev_err(&client->dev, "Failed to count CRx pins: %d\n", count);
+		return count;
+	} else if (count > IQS7211_NUM_CRX) {
+		dev_err(&client->dev, "Invalid number of CRx pins\n");
+		return -EINVAL;
+	}
+
+	error = fwnode_property_read_u32_array(tp_node, "azoteq,rx-enable",
+					       pins, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read CRx pins: %d\n", error);
+		return error;
+	}
+
+	for (i = 0; i < count; i++) {
+		if (pins[i] >= IQS7211_NUM_CRX) {
+			dev_err(&client->dev, "Invalid CRx pin: %u\n", pins[i]);
+			return -EINVAL;
+		}
+
+		iqs7211->rx_tx_map[i] = pins[i];
+	}
+
+	iqs7211->tp_config.total_rx = count;
+
+	count = fwnode_property_count_u32(tp_node, "azoteq,tx-enable");
+	if (count < 0) {
+		dev_err(&client->dev, "Failed to count CTx pins: %d\n", count);
+		return count;
+	} else if (count > dev_desc->num_ctx) {
+		dev_err(&client->dev, "Invalid number of CTx pins\n");
+		return -EINVAL;
+	}
+
+	error = fwnode_property_read_u32_array(tp_node, "azoteq,tx-enable",
+					       pins, count);
+	if (error) {
+		dev_err(&client->dev, "Failed to read CTx pins: %d\n", error);
+		return error;
+	}
+
+	for (i = 0; i < count; i++) {
+		if (pins[i] >= dev_desc->num_ctx) {
+			dev_err(&client->dev, "Invalid CTx pin: %u\n", pins[i]);
+			return -EINVAL;
+		}
+
+		for (j = 0; j < iqs7211->tp_config.total_rx; j++) {
+			if (iqs7211->rx_tx_map[j] != pins[i])
+				continue;
+
+			dev_err(&client->dev, "Conflicting CTx pin: %u\n",
+				pins[i]);
+			return -EINVAL;
+		}
+
+		iqs7211->rx_tx_map[iqs7211->tp_config.total_rx + i] = pins[i];
+	}
+
+	iqs7211->tp_config.total_tx = count;
+
+	return iqs7211_parse_chan(iqs7211, tp_node);
+}
+
+static int iqs7211_parse_pins_alp(struct iqs7211_private *iqs7211,
+				  struct fwnode_handle *alp_node)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	struct iqs7211_reg_field_desc reg_field;
+	int error, count, i;
+
+	if (fwnode_property_present(alp_node, "azoteq,rx-enable")) {
+		unsigned int pins[IQS7211_NUM_CRX];
+
+		count = fwnode_property_count_u32(alp_node, "azoteq,rx-enable");
+		if (count < 0) {
+			dev_err(&client->dev, "Failed to count CRx pins: %d\n",
+				count);
+			return count;
+		} else if (count > ARRAY_SIZE(pins)) {
+			dev_err(&client->dev, "Invalid number of CRx pins\n");
+			return -EINVAL;
+		}
+
+		error = fwnode_property_read_u32_array(alp_node,
+						       "azoteq,rx-enable",
+						       pins, count);
+		if (error) {
+			dev_err(&client->dev, "Failed to read CRx pins: %d\n",
+				error);
+			return error;
+		}
+
+		reg_field.addr = dev_desc->alp_config;
+		reg_field.mask = GENMASK(IQS7211_NUM_CRX - 1, 0);
+		reg_field.val = 0;
+
+		for (i = 0; i < count; i++) {
+			if (pins[i] < dev_desc->min_crx_alp ||
+			    pins[i] >= IQS7211_NUM_CRX) {
+				dev_err(&client->dev, "Invalid CRx pin: %u\n",
+					pins[i]);
+				return -EINVAL;
+			}
+
+			reg_field.val |= BIT(pins[i]);
+		}
+
+		error = iqs7211_add_field(iqs7211, reg_field);
+		if (error)
+			return error;
+	}
+
+	if (fwnode_property_present(alp_node, "azoteq,tx-enable")) {
+		unsigned int pins[IQS7211_MAX_CTX];
+
+		count = fwnode_property_count_u32(alp_node, "azoteq,tx-enable");
+		if (count < 0) {
+			dev_err(&client->dev, "Failed to count CTx pins: %d\n",
+				count);
+			return count;
+		} else if (count > dev_desc->num_ctx) {
+			dev_err(&client->dev, "Invalid number of CTx pins\n");
+			return -EINVAL;
+		}
+
+		error = fwnode_property_read_u32_array(alp_node,
+						       "azoteq,tx-enable",
+						       pins, count);
+		if (error) {
+			dev_err(&client->dev, "Failed to read CTx pins: %d\n",
+				error);
+			return error;
+		}
+
+		reg_field.addr = dev_desc->alp_config + 1;
+		reg_field.mask = GENMASK(dev_desc->num_ctx - 1, 0);
+		reg_field.val = 0;
+
+		for (i = 0; i < count; i++) {
+			if (pins[i] >= dev_desc->num_ctx) {
+				dev_err(&client->dev, "Invalid CTx pin: %u\n",
+					pins[i]);
+				return -EINVAL;
+			}
+
+			reg_field.val |= BIT(pins[i]);
+		}
+
+		error = iqs7211_add_field(iqs7211, reg_field);
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
+static int iqs7211_parse_kp(struct iqs7211_private *iqs7211)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct input_dev *kp_idev = iqs7211->kp_idev;
+	struct i2c_client *client = iqs7211->client;
+	enum iqs7211_reg_grp_id reg_grp;
+	int error, i;
+
+	for (reg_grp = 0; reg_grp < IQS7211_NUM_REG_GRPS; reg_grp++) {
+		const char *reg_grp_name = iqs7211_reg_grp_names[reg_grp];
+		struct fwnode_handle *reg_grp_node;
+
+		if (!reg_grp_name)
+			continue;
+
+		reg_grp_node = device_get_named_child_node(&client->dev,
+							   reg_grp_name);
+		if (!reg_grp_node)
+			continue;
+
+		if (reg_grp == IQS7211_REG_GRP_TP)
+			error = iqs7211_parse_pins_tp(iqs7211, reg_grp_node);
+		else if (reg_grp == IQS7211_REG_GRP_ALP)
+			error = iqs7211_parse_pins_alp(iqs7211, reg_grp_node);
+
+		if (error) {
+			fwnode_handle_put(reg_grp_node);
+			return error;
+		}
+
+		error = iqs7211_parse_keys(iqs7211, reg_grp_node, reg_grp);
+		if (error) {
+			fwnode_handle_put(reg_grp_node);
+			return error;
+		}
+
+		error = iqs7211_parse_props(iqs7211, reg_grp_node, reg_grp,
+					    IQS7211_REG_KEY_NONE);
+		fwnode_handle_put(reg_grp_node);
+
+		if (error)
+			return error;
+
+		iqs7211->ati_start |= dev_desc->ati_start[reg_grp];
+	}
+
+	for (i = 0; i < dev_desc->num_kp_events; i++)
+		if (iqs7211->kp_code[i])
+			break;
+
+	if (i == dev_desc->num_kp_events)
+		return 0;
+
+	kp_idev = devm_input_allocate_device(&client->dev);
+	if (!kp_idev)
+		return -ENOMEM;
+
+	iqs7211->kp_idev = kp_idev;
+
+	kp_idev->name = dev_desc->kp_name;
+	kp_idev->id.bustype = BUS_I2C;
+
+	for (i = 0; i < dev_desc->num_kp_events; i++)
+		if (iqs7211->kp_code[i])
+			input_set_capability(iqs7211->kp_idev, EV_KEY,
+					     iqs7211->kp_code[i]);
+
+	error = input_register_device(kp_idev);
+	if (error)
+		dev_err(&client->dev, "Failed to register %s: %d\n",
+			kp_idev->name, error);
+
+	return error;
+}
+
+static int iqs7211_parse_tp(struct iqs7211_private *iqs7211)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct touchscreen_properties *prop = &iqs7211->prop;
+	struct input_dev *tp_idev = iqs7211->tp_idev;
+	struct i2c_client *client = iqs7211->client;
+	int error;
+
+	if (!device_property_present(&client->dev, "azoteq,num-contacts"))
+		return 0;
+
+	error = device_property_read_u32(&client->dev, "azoteq,num-contacts",
+					 &iqs7211->num_contacts);
+	if (error) {
+		dev_err(&client->dev, "Failed to read number of contacts: %d\n",
+			error);
+		return error;
+	} else if (iqs7211->num_contacts > IQS7211_MAX_CONTACTS) {
+		dev_err(&client->dev, "Invalid number of contacts: %u\n",
+			iqs7211->num_contacts);
+		return -EINVAL;
+	}
+
+	iqs7211->tp_config.num_contacts = iqs7211->num_contacts ? : 1;
+
+	if (!iqs7211->num_contacts)
+		return 0;
+
+	iqs7211->event_mask |= IQS7211_EVENT_MASK_MOVE;
+
+	tp_idev = devm_input_allocate_device(&client->dev);
+	if (!tp_idev)
+		return -ENOMEM;
+
+	iqs7211->tp_idev = tp_idev;
+
+	tp_idev->name = dev_desc->tp_name;
+	tp_idev->id.bustype = BUS_I2C;
+
+	input_set_abs_params(tp_idev, ABS_MT_POSITION_X,
+			     0, le16_to_cpu(iqs7211->tp_config.max_x), 0, 0);
+
+	input_set_abs_params(tp_idev, ABS_MT_POSITION_Y,
+			     0, le16_to_cpu(iqs7211->tp_config.max_y), 0, 0);
+
+	input_set_abs_params(tp_idev, ABS_MT_PRESSURE, 0, U16_MAX, 0, 0);
+
+	touchscreen_parse_properties(tp_idev, true, prop);
+
+	/*
+	 * The device reserves 0xFFFF for coordinates that correspond to slots
+	 * which are not in a state of touch.
+	 */
+	if (prop->max_x >= U16_MAX || prop->max_y >= U16_MAX) {
+		dev_err(&client->dev, "Invalid trackpad size: %u*%u\n",
+			prop->max_x, prop->max_y);
+		return -EINVAL;
+	}
+
+	iqs7211->tp_config.max_x = cpu_to_le16(prop->max_x);
+	iqs7211->tp_config.max_y = cpu_to_le16(prop->max_y);
+
+	error = input_mt_init_slots(tp_idev, iqs7211->num_contacts,
+				    INPUT_MT_DIRECT);
+	if (error) {
+		dev_err(&client->dev, "Failed to initialize slots: %d\n",
+			error);
+		return error;
+	}
+
+	error = input_register_device(tp_idev);
+	if (error)
+		dev_err(&client->dev, "Failed to register %s: %d\n",
+			tp_idev->name, error);
+
+	return error;
+}
+
+static int iqs7211_parse_all(struct iqs7211_private *iqs7211)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	bool comms_forced;
+	u16 comms_setup;
+	int error;
+
+	/*
+	 * Until forced communication can be enabled, the host must wait for a
+	 * communication window each time it intends to elicit a response from
+	 * the device.
+	 *
+	 * Forced communication is not necessary, however, if the host adapter
+	 * can support clock stretching. In that case, the device freely clock
+	 * stretches until all pending conversions are complete.
+	 */
+	comms_forced = device_property_present(&client->dev,
+					       "azoteq,forced-comms");
+
+	if (device_property_present(&client->dev, "azoteq,default-comms")) {
+		error = device_property_read_u32(&client->dev,
+						 "azoteq,default-comms",
+						 &iqs7211->comms_mode);
+		if (error) {
+			dev_err(&client->dev,
+				"Failed to read default communication mode: %d\n",
+				error);
+			return error;
+		}
+
+		switch (iqs7211->comms_mode) {
+		case IQS7211_COMMS_MODE_WAIT:
+			break;
+
+		case IQS7211_COMMS_MODE_FREE:
+			if (comms_forced)
+				iqs7211->comms_mode = IQS7211_COMMS_MODE_WAIT;
+			break;
+
+		case IQS7211_COMMS_MODE_FORCE:
+			if (!comms_forced)
+				iqs7211->comms_mode = IQS7211_COMMS_MODE_WAIT;
+			break;
+
+		default:
+			dev_err(&client->dev,
+				"Invalid default communication mode: %u\n",
+				iqs7211->comms_mode);
+			return -EINVAL;
+		}
+	}
+
+	error = iqs7211_read_burst(iqs7211, IQS7211_PROD_NUM,
+				   &iqs7211->ver_info,
+				   sizeof(iqs7211->ver_info));
+	if (error)
+		return error;
+
+	if (le16_to_cpu(iqs7211->ver_info.prod_num) != dev_desc->prod_num) {
+		dev_err(&client->dev, "Invalid product number: %u\n",
+			le16_to_cpu(iqs7211->ver_info.prod_num));
+		return -EINVAL;
+	}
+
+	error = iqs7211_read_word(iqs7211, dev_desc->sys_ctrl + 1,
+				  &comms_setup);
+	if (error)
+		return error;
+
+	if (comms_forced)
+		comms_setup |= dev_desc->comms_forced;
+	else
+		comms_setup &= ~dev_desc->comms_forced;
+
+	error = iqs7211_write_word(iqs7211, dev_desc->sys_ctrl + 1,
+				   comms_setup | dev_desc->comms_hold);
+	if (error)
+		return error;
+
+	if (comms_forced)
+		iqs7211->comms_mode = IQS7211_COMMS_MODE_FORCE;
+	else
+		iqs7211->comms_mode = IQS7211_COMMS_MODE_FREE;
+
+	error = iqs7211_read_burst(iqs7211, dev_desc->exp_file,
+				   iqs7211->exp_file,
+				   sizeof(iqs7211->exp_file));
+	if (error)
+		return error;
+
+	error = iqs7211_read_burst(iqs7211, dev_desc->tp_config,
+				   &iqs7211->tp_config,
+				   sizeof(iqs7211->tp_config));
+	if (error)
+		return error;
+
+	error = iqs7211_write_word(iqs7211, dev_desc->sys_ctrl + 1,
+				   comms_setup);
+	if (error)
+		return error;
+
+	iqs7211->event_mask = comms_setup & ~IQS7211_EVENT_MASK_ALL;
+	iqs7211->event_mask |= (IQS7211_EVENT_MASK_ATI | IQS7211_EVENT_MODE);
+
+	error = iqs7211_parse_props(iqs7211, dev_fwnode(&client->dev),
+				    IQS7211_REG_GRP_SYS, IQS7211_REG_KEY_NONE);
+	if (error)
+		return error;
+
+	error = iqs7211_parse_kp(iqs7211);
+	if (error)
+		return error;
+
+	return iqs7211_parse_tp(iqs7211);
+}
+
+static int iqs7211_report(struct iqs7211_private *iqs7211)
+{
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	struct i2c_client *client = iqs7211->client;
+	struct iqs7211_touch_data *touch_data;
+	u16 info_flags, charge_mode, gesture_flags;
+	__le16 status[12];
+	int error, i;
+
+	error = iqs7211_read_burst(iqs7211, dev_desc->sys_stat, status,
+				   dev_desc->contact_offs * sizeof(__le16) +
+				   iqs7211->num_contacts * sizeof(*touch_data));
+	if (error)
+		return error;
+
+	info_flags = le16_to_cpu(status[dev_desc->info_offs]);
+
+	if (info_flags & dev_desc->show_reset) {
+		dev_err(&client->dev, "Unexpected device reset\n");
+
+		/*
+		 * The device may or may not expect forced communication after
+		 * it comes out of reset, so configure the corresponding state
+		 * machine to wait until the next communication window appears.
+		 */
+		iqs7211->comms_mode = IQS7211_COMMS_MODE_WAIT;
+
+		return iqs7211_dev_init(iqs7211);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(dev_desc->ati_error); i++) {
+		if (!(info_flags & dev_desc->ati_error[i]))
+			continue;
+
+		dev_err(&client->dev, "Unexpected %s ATI error\n",
+			iqs7211_reg_grp_names[i]);
+		return 0;
+	}
+
+	for (i = 0; i < iqs7211->num_contacts; i++) {
+		u16 pressure;
+
+		touch_data = (struct iqs7211_touch_data *)
+			     &status[dev_desc->contact_offs] + i;
+		pressure = le16_to_cpu(touch_data->pressure);
+
+		input_mt_slot(iqs7211->tp_idev, i);
+		if (input_mt_report_slot_state(iqs7211->tp_idev, MT_TOOL_FINGER,
+					       pressure != 0)) {
+			touchscreen_report_pos(iqs7211->tp_idev, &iqs7211->prop,
+					       le16_to_cpu(touch_data->abs_x),
+					       le16_to_cpu(touch_data->abs_y),
+					       true);
+			input_report_abs(iqs7211->tp_idev, ABS_MT_PRESSURE,
+					 pressure);
+		}
+	}
+
+	if (iqs7211->num_contacts) {
+		input_mt_sync_frame(iqs7211->tp_idev);
+		input_sync(iqs7211->tp_idev);
+	}
+
+	if (!iqs7211->kp_idev)
+		return 0;
+
+	charge_mode = info_flags & GENMASK(dev_desc->charge_shift + 2,
+					   dev_desc->charge_shift);
+	charge_mode >>= dev_desc->charge_shift;
+
+	/*
+	 * A charging mode higher than 2 (idle mode) indicates the device last
+	 * operated in low-power mode and intends to express an ALP event.
+	 */
+	if (info_flags & dev_desc->kp_events->mask && charge_mode > 2) {
+		input_report_key(iqs7211->kp_idev, *iqs7211->kp_code, 1);
+		input_sync(iqs7211->kp_idev);
+
+		input_report_key(iqs7211->kp_idev, *iqs7211->kp_code, 0);
+	}
+
+	for (i = 0; i < dev_desc->num_kp_events; i++) {
+		if (dev_desc->kp_events[i].reg_grp != IQS7211_REG_GRP_BTN)
+			continue;
+
+		input_report_key(iqs7211->kp_idev, iqs7211->kp_code[i],
+				 info_flags & dev_desc->kp_events[i].mask);
+	}
+
+	gesture_flags = le16_to_cpu(status[dev_desc->gesture_offs]);
+
+	for (i = 0; i < dev_desc->num_kp_events; i++) {
+		enum iqs7211_reg_key_id reg_key = dev_desc->kp_events[i].reg_key;
+		u16 mask = dev_desc->kp_events[i].mask;
+
+		if (dev_desc->kp_events[i].reg_grp != IQS7211_REG_GRP_TP)
+			continue;
+
+		if ((gesture_flags ^ iqs7211->gesture_cache) & mask)
+			input_report_key(iqs7211->kp_idev, iqs7211->kp_code[i],
+					 gesture_flags & mask);
+
+		iqs7211->gesture_cache &= ~mask;
+
+		/*
+		 * Hold and palm gestures persist while the contact remains in
+		 * place; all others are momentary and hence are followed by a
+		 * complementary release event.
+		 */
+		if (reg_key == IQS7211_REG_KEY_HOLD ||
+		    reg_key == IQS7211_REG_KEY_PALM) {
+			iqs7211->gesture_cache |= gesture_flags & mask;
+			gesture_flags &= ~mask;
+		}
+	}
+
+	if (gesture_flags) {
+		input_sync(iqs7211->kp_idev);
+
+		for (i = 0; i < dev_desc->num_kp_events; i++)
+			if (dev_desc->kp_events[i].reg_grp == IQS7211_REG_GRP_TP &&
+			    gesture_flags & dev_desc->kp_events[i].mask)
+				input_report_key(iqs7211->kp_idev,
+						 iqs7211->kp_code[i], 0);
+	}
+
+	input_sync(iqs7211->kp_idev);
+
+	return 0;
+}
+
+static irqreturn_t iqs7211_irq(int irq, void *context)
+{
+	struct iqs7211_private *iqs7211 = context;
+
+	return iqs7211_report(iqs7211) ? IRQ_NONE : IRQ_HANDLED;
+}
+
+static int __maybe_unused iqs7211_suspend(struct device *dev)
+{
+	struct iqs7211_private *iqs7211 = dev_get_drvdata(dev);
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	int error;
+
+	if (!dev_desc->suspend || device_may_wakeup(dev))
+		return 0;
+
+	/*
+	 * I2C communication prompts the device to assert its RDY pin if it is
+	 * not already asserted. As such, the interrupt must be disabled so as
+	 * to prevent reentrant interrupts.
+	 */
+	disable_irq(gpiod_to_irq(iqs7211->irq_gpio));
+
+	error = iqs7211_write_word(iqs7211, dev_desc->sys_ctrl,
+				   dev_desc->suspend);
+
+	enable_irq(gpiod_to_irq(iqs7211->irq_gpio));
+
+	return error;
+}
+
+static int __maybe_unused iqs7211_resume(struct device *dev)
+{
+	struct iqs7211_private *iqs7211 = dev_get_drvdata(dev);
+	const struct iqs7211_dev_desc *dev_desc = iqs7211->dev_desc;
+	__le16 sys_ctrl[] = {
+		0,
+		cpu_to_le16(iqs7211->event_mask),
+	};
+	int error;
+
+	if (!dev_desc->suspend || device_may_wakeup(dev))
+		return 0;
+
+	disable_irq(gpiod_to_irq(iqs7211->irq_gpio));
+
+	/*
+	 * Forced communication, if in use, must be explicitly enabled as part
+	 * of the wake-up command.
+	 */
+	error = iqs7211_write_burst(iqs7211, dev_desc->sys_ctrl, sys_ctrl,
+				    sizeof(sys_ctrl));
+
+	enable_irq(gpiod_to_irq(iqs7211->irq_gpio));
+
+	return error;
+}
+
+static SIMPLE_DEV_PM_OPS(iqs7211_pm, iqs7211_suspend, iqs7211_resume);
+
+static ssize_t fw_info_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	struct iqs7211_private *iqs7211 = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%u.%u.%u.%u:%u.%u\n",
+			 le16_to_cpu(iqs7211->ver_info.prod_num),
+			 le32_to_cpu(iqs7211->ver_info.patch),
+			 le16_to_cpu(iqs7211->ver_info.major),
+			 le16_to_cpu(iqs7211->ver_info.minor),
+			 iqs7211->exp_file[1], iqs7211->exp_file[0]);
+}
+
+static DEVICE_ATTR_RO(fw_info);
+
+static struct attribute *iqs7211_attrs[] = {
+	&dev_attr_fw_info.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(iqs7211);
+
+static const struct of_device_id iqs7211_of_match[] = {
+	{
+		.compatible = "azoteq,iqs7210a",
+		.data = (void *)IQS7210A,
+	},
+	{
+		.compatible = "azoteq,iqs7211a",
+		.data = (void *)IQS7211A,
+	},
+	{
+		.compatible = "azoteq,iqs7211e",
+		.data = (void *)IQS7211E,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, iqs7211_of_match);
+
+static const struct i2c_device_id iqs7211_id[] = {
+	{ "iqs7210a", IQS7210A },
+	{ "iqs7211a", IQS7211A },
+	{ "iqs7211e", IQS7211E },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, iqs7211_id);
+
+static int iqs7211_probe(struct i2c_client *client)
+{
+	struct iqs7211_private *iqs7211;
+	enum iqs7211_dev_id dev_id;
+	unsigned long irq_flags;
+	bool split_reset;
+	int error, irq;
+
+	iqs7211 = devm_kzalloc(&client->dev, sizeof(*iqs7211), GFP_KERNEL);
+	if (!iqs7211)
+		return -ENOMEM;
+
+	i2c_set_clientdata(client, iqs7211);
+	iqs7211->client = client;
+
+	if (client->dev.of_node)
+		dev_id = (enum iqs7211_dev_id)of_device_get_match_data(&client->dev);
+	else
+		dev_id = i2c_match_id(iqs7211_id, client)->driver_data;
+
+	/*
+	 * If an extra CTx pin is present, the MCLR and RDY pins are combined
+	 * into a single pin.
+	 */
+	split_reset = iqs7211_devs[dev_id].num_ctx < IQS7211_MAX_CTX;
+	iqs7211->dev_desc = &iqs7211_devs[dev_id];
+
+	INIT_LIST_HEAD(&iqs7211->reg_field_head);
+
+	/*
+	 * The RDY pin behaves as an interrupt, but must also be polled ahead
+	 * of unsolicited I2C communication. As such, it is first opened as a
+	 * GPIO and then passed to gpiod_to_irq() to register the interrupt.
+	 */
+	iqs7211->irq_gpio = devm_gpiod_get(&client->dev, "irq",
+					   split_reset ? GPIOD_IN
+						       : GPIOD_OUT_LOW);
+	if (IS_ERR(iqs7211->irq_gpio)) {
+		error = PTR_ERR(iqs7211->irq_gpio);
+		dev_err(&client->dev, "Failed to request IRQ GPIO: %d\n",
+			error);
+		return error;
+	}
+
+	iqs7211->reset_gpio = split_reset ? devm_gpiod_get_optional(&client->dev,
+								    "reset",
+								    GPIOD_OUT_HIGH)
+					  : iqs7211->irq_gpio;
+	if (IS_ERR(iqs7211->reset_gpio)) {
+		error = PTR_ERR(iqs7211->reset_gpio);
+		dev_err(&client->dev, "Failed to request reset GPIO: %d\n",
+			error);
+		return error;
+	}
+
+	error = iqs7211_hard_reset(iqs7211);
+	if (error) {
+		dev_err(&client->dev, "Failed to reset device: %d\n", error);
+		return error;
+	}
+
+	error = iqs7211_parse_all(iqs7211);
+	if (error)
+		return error;
+
+	error = iqs7211_dev_init(iqs7211);
+	if (error)
+		return error;
+
+	irq = gpiod_to_irq(iqs7211->irq_gpio);
+	if (irq < 0)
+		return irq;
+
+	irq_flags = gpiod_is_active_low(iqs7211->irq_gpio) ? IRQF_TRIGGER_LOW
+							   : IRQF_TRIGGER_HIGH;
+	irq_flags |= IRQF_ONESHOT;
+
+	error = devm_request_threaded_irq(&client->dev, irq, NULL, iqs7211_irq,
+					  irq_flags, client->name, iqs7211);
+	if (error)
+		dev_err(&client->dev, "Failed to request IRQ: %d\n", error);
+
+	return error;
+}
+
+static struct i2c_driver iqs7211_i2c_driver = {
+	.probe_new = iqs7211_probe,
+	.id_table = iqs7211_id,
+	.driver = {
+		.name = "iqs7211",
+		.of_match_table = iqs7211_of_match,
+		.dev_groups = iqs7211_groups,
+		.pm = &iqs7211_pm,
+	},
+};
+module_i2c_driver(iqs7211_i2c_driver);
+
+MODULE_AUTHOR("Jeff LaBundy <jeff@labundy.com>");
+MODULE_DESCRIPTION("Azoteq IQS7210A/7211A/E Trackpad/Touchscreen Controller");
+MODULE_LICENSE("GPL");
-- 
2.25.1

