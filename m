Return-Path: <linux-input+bounces-12963-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E14AE036F
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 13:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D57451BC30EB
	for <lists+linux-input@lfdr.de>; Thu, 19 Jun 2025 11:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCA4A22756A;
	Thu, 19 Jun 2025 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="gYpXWvo6"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11hn2204.outbound.protection.outlook.com [52.100.172.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE6F22539D;
	Thu, 19 Jun 2025 11:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.100.172.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750332311; cv=fail; b=YZeXVzab/7duIHUr1PZE6PpSp7Xp5+qI/83B6sBsmGVYtAE22If0qM54nwvYQs3ls3wH+VRoArcZ7nSNLNImKNSkn8lhGeqJPPBhKQ69rJKhdACQmk5tXYRYgrUfO0905zrAbnAAHS4aOhVNLTskVLD+8shyElezqbxRiH5v0WU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750332311; c=relaxed/simple;
	bh=hn3iX34QpRfdDdaLq8NTaA6c6RN232lHFj/uIy1XGVM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=XkbS1LB16lVkurb1flzDDsBIhZr5KFs+J2EF/3zW1GS6bTe7Y3PwPzHgZZiwuwt+Vg1QdZpF/JVSYgPJRVl1xwfREMc69+FX5jsRDLLjhkTywCAUb2jPuvYXiV8SWhoImW870HVVtiwuiVGe99G4rLRH3NQb+jgFDMlZYlW6YYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=gYpXWvo6; arc=fail smtp.client-ip=52.100.172.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDkfhfiGluDh/zV4ljGuiuq0i3QX+cR7NpvU4KQw4+ZcIvGaUzeXFUUsA1/cCVSTOdUKBk7jgHSaJAqSF+tycgmQoRWJuU2d+AVSObpbeCBX/Ni6KVktOMvGVbexjZ+TuuMv0eM2ca6TJ6tvbYoeZQSTabCCZzJRv5zh7Q1ZbSibsy5w1dewGErfoZ5Y+KtkK2qkzVLBgEKFZgQZDn6g6XOP375xJcUqBQKdQFEA3tpypFl67Q88hXBKkySrftgpHpaRwUkhsn2RTq++vaNkGV9mjBfVKROrnmWehxhE0UHwJCFDuIWgXV/Rc50S5knp+KLRNSyFd1fybLV0cgQo0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3F1bx2oesNsXHVM8JQXfco3d4kuwKfVLce8EEP2SB3A=;
 b=FUXZn5ea3pCIzWsTmgF1EyrnENOokKryXe+YPLl90RdAsXp0y258Z/i27O/joyWQSMYRVlX+tUiT7pOUnbywH8bFvC5pNmjRwoHHaXZxIk4s5lpeCxPmGdtUXvYjjulE0KGJbBj6uhJrd3NaS/6n6H7oWaj87nL4WqJpKcwON3ovMQg0fveCA9O74Zh8lq0hCt23gL5ykrX0nxlV8J5aLlfg7r0Vi9xycqGq/Ko90YdIcQ+dTAK/piR4EnaN1x4PpC9ftfwzUNOEj8imrMzqqTsEDEe3Lk/doy01kB85Swh2tzTsfDIL/ZyEjJD3FoYE6b5uDJ5oWPVXtlGbXRsJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.147.44.87) smtp.rcpttodomain=gmail.com smtp.mailfrom=tw.synaptics.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=tw.synaptics.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3F1bx2oesNsXHVM8JQXfco3d4kuwKfVLce8EEP2SB3A=;
 b=gYpXWvo6hKgQyvjhP1EN87vqPl/zvUj73Yi7/D7KccS/Wq+GRYR/MdyvUnXlWRST5teZlyL21Gt1+GlcrUWzK7CokiZyWfBlvmEPnOuO/dkEnF8BRlGcHwCwDF0dZJTxdSB5rwT8uyJNyMa7I2plf1sovUEsoziuOg81zO8ROYs=
Received: from BL1P223CA0005.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::10)
 by PH0PR03MB6979.namprd03.prod.outlook.com (2603:10b6:510:169::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 11:25:06 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::de) by BL1P223CA0005.outlook.office365.com
 (2603:10b6:208:2c4::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.25 via Frontend Transport; Thu,
 19 Jun 2025 11:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.147.44.87)
 smtp.mailfrom=tw.synaptics.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=tw.synaptics.com;
Received-SPF: Pass (protection.outlook.com: domain of tw.synaptics.com
 designates 192.147.44.87 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.147.44.87;
 helo=sjc1uvd-bld04.synaptics.com; pr=C
Received: from sjc1uvd-bld04.synaptics.com (192.147.44.87) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server id 15.20.8857.21 via Frontend Transport; Thu, 19 Jun 2025
 11:25:04 +0000
From: Marge Yang <marge.yang@tw.synaptics.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vincent.huang@tw.synaptics.com,
	marge.yang@tw.synaptics.com
Cc: david.chiu@tw.synaptics.com,
	derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com,
	Marge Yang <Marge.Yang@tw.synaptics.com>
Subject: [PATCH V1] Input: synaptics-rmi4- Add a new feature for Forcepad.
Date: Thu, 19 Jun 2025 11:25:00 +0000
Message-Id: <20250619112500.3213276-1-marge.yang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|PH0PR03MB6979:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8602e713-0e1e-4a0a-0bfd-08ddaf23f0ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026|12100799063;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yd0zGGRHxSkQRX3Yyv7Nx48kXFyRQPgAZqrwBa3FdbZd8SGVoGDyiDO6ZsUg?=
 =?us-ascii?Q?XbG1AEgYHlt0mTZ43T2zubz1DrkAStL8cOz9L3fjfQNFbygiBQnG672k2ccy?=
 =?us-ascii?Q?Qij+7mun2NbpikXQdU45aHryeBcMDrEqVbcmuhDDAD34DwgDLjFg2ekqJZfZ?=
 =?us-ascii?Q?D6UnLtQ6/sKVz4e2EMmAQGFFGoHfocc3aSfmDfxRx4mpyFdNSVDTH8OmsLCD?=
 =?us-ascii?Q?5m39/HJUmd5Yc4JI3pEk3H+t0zRC7w7w4nO/xZIZDlnMxcNKRtcZ5T1hjfej?=
 =?us-ascii?Q?lafdr1tpA6beiftP1wfLajCwcman1B2G293ABKTxirmG3uKrenQHYfl+7QJ4?=
 =?us-ascii?Q?mOX8VjLcm86wq6kmPPVv7xbsPgdgKvb7IzTZ3nRnuUrrs4n/m7Q5lFQcbyE9?=
 =?us-ascii?Q?ZMU18Qdgk2xZDdFLdGgO2OHjooZq4FfeodoHcLCrD+JYvzVu6Txpe5Yg5g3h?=
 =?us-ascii?Q?WbqqFQJHHckWjBxnp9wjDYExqVG+jWGA++9f5mWg4iVRABvfkawhN4BXSNvr?=
 =?us-ascii?Q?4fwrf45drDM1DSX5mRE0qyJoBjhvV6cTviFYEVGxRMEEGRNeSmxjGkFzPSJo?=
 =?us-ascii?Q?2xGqKgnCnsjjEDY0phw09FB5pSs5D1kQc8SpsTEGE+TwXJqSIgnIzDew/lKW?=
 =?us-ascii?Q?cL2nAIj6NUpnISwpn/QzRQvFBysMxNw5vSdq/3HSR94fJYID2oHiEQVrYr8G?=
 =?us-ascii?Q?LVeg/GenFlGRuuuUpzZXJ1SAWXoz2Si+71XbxP9+QUHTAuMTmLm/VcrdCaoL?=
 =?us-ascii?Q?5y/iWsomETZzMD+93S2Vuy7DImk16M+7wwFLlK2tkna5xx8SZKguyApgp7RK?=
 =?us-ascii?Q?+WLUY11vcsclVvycPH//itF/85W0b6FjlOBRLZnOSwzwMefkO0RUSEQuU6hX?=
 =?us-ascii?Q?HLVkJgbZEZT9NCo2WI4sM5K7EyoX+FQ8fT8rExrI/bRNv1lJRZVqNNKSSV9L?=
 =?us-ascii?Q?WF5sULnglOz+ruolRyNDD+L4/nguH24/IzTn2tRBz8eVbWAaz5GkmYlGhrbI?=
 =?us-ascii?Q?eHrtONcoC1YJTPsk+s8fuw32oJiOwX2+CMsxyoRCm7h4NZQnHwi2N0La2jIt?=
 =?us-ascii?Q?DVDh1QQ1um/lboR1eUcuMdXvQ0SQtOMaQNiwjReKYhxHkY3vHXpKTuK27c+3?=
 =?us-ascii?Q?R7D1RHOrEdCIJuUGMNwnt1Uz2iW55hN/Gzd2sEDu8151wey7diiso2paLQuL?=
 =?us-ascii?Q?YCz3BnH3Gaxn288vH6VY1yUA636E6IMCTbkYxo3hb09f5viLU3XXs92oczas?=
 =?us-ascii?Q?tTTZJZOBMuzd5fRVIqNvr9sNLV0dTo2Vnln3K/eD6yt5CvV437u9Cl2GqmF+?=
 =?us-ascii?Q?muNu4rZPLJ3wZL04UWlEV2gfNuvyL1c4eR7K3aaTZ56DKsfmtut/iEn6snpC?=
 =?us-ascii?Q?wl09fA9PICeOuzU6uT2txUGAcgc3Ht/rX835gly09Xnln+5ZLb4123cW63qU?=
 =?us-ascii?Q?lLRw4Nt/H2kfnH16Rt61ruwPKMgz6Ou5APCElWkuaDEvgWcj3KiroEUhsIau?=
 =?us-ascii?Q?lCTT2r+h+bxIMIUQLIyTuKF5+gnBble505fB?=
X-Forefront-Antispam-Report:
	CIP:192.147.44.87;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjc1uvd-bld04.synaptics.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026)(12100799063);DIR:OUT;SFP:1501;
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 11:25:04.6903
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8602e713-0e1e-4a0a-0bfd-08ddaf23f0ce
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=335d1fbc-2124-4173-9863-17e7051a2a0e;Ip=[192.147.44.87];Helo=[sjc1uvd-bld04.synaptics.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6979

From: Marge Yang <Marge.Yang@tw.synaptics.com>

Forcepad devices will use F21, for click simulation
due to lack of a metal button, so we add F21 support
to make forcepad support click function.

Signed-off-by: Marge Yang <Marge.Yang@tw.synaptics.com>
---
 drivers/input/rmi4/Kconfig      |   8 ++
 drivers/input/rmi4/Makefile     |   1 +
 drivers/input/rmi4/rmi_bus.c    |   3 +
 drivers/input/rmi4/rmi_driver.h |   5 ++
 drivers/input/rmi4/rmi_f21.c    | 126 ++++++++++++++++++++++++++++++++
 5 files changed, 143 insertions(+)
 create mode 100644 drivers/input/rmi4/rmi_f21.c

diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
index c0163b983ce6..086013be6a64 100644
--- a/drivers/input/rmi4/Kconfig
+++ b/drivers/input/rmi4/Kconfig
@@ -82,6 +82,14 @@ config RMI4_F12
 	  touchpads. For sensors that support relative pointing, F12 also
 	  provides mouse input.
 
+config RMI4_F21
+	bool "RMI4 Function 21 (PRESSURE)"
+	help
+	  Say Y here if you want to add support for RMI4 function 21.
+
+	  Function 21 provides buttons/pressure for RMI4 devices. This includes
+	  support for buttons/pressure on PressurePad.
+
 config RMI4_F30
 	bool "RMI4 Function 30 (GPIO LED)"
 	help
diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile
index 02f14c846861..484b97eca025 100644
--- a/drivers/input/rmi4/Makefile
+++ b/drivers/input/rmi4/Makefile
@@ -8,6 +8,7 @@ rmi_core-$(CONFIG_RMI4_2D_SENSOR) += rmi_2d_sensor.o
 rmi_core-$(CONFIG_RMI4_F03) += rmi_f03.o
 rmi_core-$(CONFIG_RMI4_F11) += rmi_f11.o
 rmi_core-$(CONFIG_RMI4_F12) += rmi_f12.o
+rmi_core-$(CONFIG_RMI4_F21) += rmi_f21.o
 rmi_core-$(CONFIG_RMI4_F30) += rmi_f30.o
 rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o
 rmi_core-$(CONFIG_RMI4_F3A) += rmi_f3a.o
diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index 3aee04837205..47fe7a88c92b 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -360,6 +360,9 @@ static struct rmi_function_handler *fn_handlers[] = {
 #ifdef CONFIG_RMI4_F12
 	&rmi_f12_handler,
 #endif
+#ifdef CONFIG_RMI4_F21
+	&rmi_f21_handler,
+#endif
 #ifdef CONFIG_RMI4_F30
 	&rmi_f30_handler,
 #endif
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 3bfe9013043e..18fdf2a166d5 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -115,6 +115,10 @@ static inline int rmi_f03_overwrite_button(struct rmi_function *fn,
 static inline void rmi_f03_commit_buttons(struct rmi_function *fn) {}
 #endif
 
+#ifdef CONFIG_RMI4_F21
+int rmi_f21_report_pressure(struct rmi_function *fn, int i);
+#endif
+
 #ifdef CONFIG_RMI4_F34
 int rmi_f34_create_sysfs(struct rmi_device *rmi_dev);
 void rmi_f34_remove_sysfs(struct rmi_device *rmi_dev);
@@ -133,6 +137,7 @@ extern struct rmi_function_handler rmi_f01_handler;
 extern struct rmi_function_handler rmi_f03_handler;
 extern struct rmi_function_handler rmi_f11_handler;
 extern struct rmi_function_handler rmi_f12_handler;
+extern struct rmi_function_handler rmi_f21_handler;
 extern struct rmi_function_handler rmi_f30_handler;
 extern struct rmi_function_handler rmi_f34_handler;
 extern struct rmi_function_handler rmi_f3a_handler;
diff --git a/drivers/input/rmi4/rmi_f21.c b/drivers/input/rmi4/rmi_f21.c
new file mode 100644
index 000000000000..93ef2331ed16
--- /dev/null
+++ b/drivers/input/rmi4/rmi_f21.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2025 Synaptics Incorporated
+ */
+
+#include <linux/kernel.h>
+#include <linux/rmi.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include "rmi_driver.h"
+
+#define RMI_f21_INPUT_REPORT_DATA_SIZE	6
+#define RMI_F21_INPUT_REPORT_FORCE_CLICK_OFFSET	5
+#define RMI_F21_TABLE_FORCE_CLICK_OFFSET	8
+#define RMI_f21_FORCE_CLICK			0x01
+#define RMI_f21_DATA_REGS_MAX_SIZE	19
+#define RMI_f21_FORCEPAD_BUTTON_COUNT	1
+
+struct f21_data {
+	/* Query Data */
+	u8 data_regs[RMI_f21_DATA_REGS_MAX_SIZE];
+	u8 input_report_data[RMI_f21_INPUT_REPORT_DATA_SIZE];
+	struct input_dev *input;
+	u16 key_code;
+};
+
+static irqreturn_t rmi_f21_attention(int irq, void *ctx)
+{
+	struct rmi_function *fn = ctx;
+	struct f21_data *f21 = dev_get_drvdata(&fn->dev);
+	struct rmi_driver_data *drvdata = dev_get_drvdata(&fn->rmi_dev->dev);
+	int error;
+	bool pressed;
+
+	if (drvdata->attn_data.data) {
+		if (drvdata->attn_data.size < RMI_f21_INPUT_REPORT_DATA_SIZE) {
+			dev_warn(&fn->dev, "f21 interrupted, but data is missing\n");
+			return IRQ_HANDLED;
+		}
+		memcpy(f21->input_report_data, drvdata->attn_data.data, RMI_f21_INPUT_REPORT_DATA_SIZE);
+		drvdata->attn_data.data += RMI_f21_INPUT_REPORT_DATA_SIZE;
+		drvdata->attn_data.size -= RMI_f21_INPUT_REPORT_DATA_SIZE;
+
+		pressed = !!(f21->input_report_data[RMI_F21_INPUT_REPORT_FORCE_CLICK_OFFSET] &
+					RMI_f21_FORCE_CLICK);
+	} else {
+		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr,
+					f21->data_regs, RMI_f21_DATA_REGS_MAX_SIZE);
+		if (error) {
+			dev_err(&fn->dev, "%s: Failed to read f21 data registers: %d\n",
+				__func__, error);
+			return IRQ_RETVAL(error);
+		}
+		pressed = !!(f21->data_regs[RMI_F21_TABLE_FORCE_CLICK_OFFSET] &
+					RMI_f21_FORCE_CLICK);
+	}
+
+	input_report_key(f21->input, f21->key_code, pressed);
+
+	return IRQ_HANDLED;
+}
+
+static int rmi_f21_config(struct rmi_function *fn)
+{
+	struct f21_data *f21 = dev_get_drvdata(&fn->dev);
+	struct rmi_driver *drv = fn->rmi_dev->driver;
+
+	if (!f21)
+		return 0;
+
+	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+
+	return 0;
+}
+
+static int rmi_f21_initialize(struct rmi_function *fn, struct f21_data *f21)
+{
+	struct input_dev *input = f21->input;
+	unsigned int button = BTN_LEFT;
+
+	f21->key_code = button;
+	input_set_capability(input, EV_KEY, f21->key_code);
+	input->keycode = &(f21->key_code);
+	input->keycodesize = sizeof(f21->key_code);
+	input->keycodemax = RMI_f21_FORCEPAD_BUTTON_COUNT;
+
+	__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
+
+	return 0;
+}
+
+static int rmi_f21_probe(struct rmi_function *fn)
+{
+	struct rmi_device *rmi_dev = fn->rmi_dev;
+	struct rmi_driver_data *drv_data = dev_get_drvdata(&rmi_dev->dev);
+	struct f21_data *f21;
+	int error;
+
+	if (!drv_data->input) {
+		dev_info(&fn->dev, "f21: no input device found, ignoring\n");
+		return -ENXIO;
+	}
+
+	f21 = devm_kzalloc(&fn->dev, sizeof(*f21), GFP_KERNEL);
+	if (!f21)
+		return -ENOMEM;
+
+	f21->input = drv_data->input;
+
+	error = rmi_f21_initialize(fn, f21);
+	if (error)
+		return error;
+
+	dev_set_drvdata(&fn->dev, f21);
+	return 0;
+}
+
+struct rmi_function_handler rmi_f21_handler = {
+	.driver = {
+		.name = "rmi4_f21",
+	},
+	.func = 0x21,
+	.probe = rmi_f21_probe,
+	.config = rmi_f21_config,
+	.attention = rmi_f21_attention,
+};
-- 
2.43.0


