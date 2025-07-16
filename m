Return-Path: <linux-input+bounces-13556-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 73081B06C56
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 05:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B3491AA747F
	for <lists+linux-input@lfdr.de>; Wed, 16 Jul 2025 03:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E765427587D;
	Wed, 16 Jul 2025 03:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="TY88kznt"
X-Original-To: linux-input@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11021083.outbound.protection.outlook.com [52.101.62.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4318F1F2BAD;
	Wed, 16 Jul 2025 03:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752637017; cv=fail; b=OzfrBQWKCbAXUMOL2RP/mCq4weHPc9aQDmgwRZMNr/Cjp7y8eE6rvGvyXgkSHIfsbPaSBmCugEhB+0utNrqi5nC679MWJaBjsaDs6s6j7w4gOg+y/g/bKouZVeS3T5Hb0UoA0CF/U3wwK3RqnW9d2E6wvngQt6ZyosrCSIyr+A8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752637017; c=relaxed/simple;
	bh=o/0db0iSgxIUOdwrXMO5+fxvOjOzdVSVy82EXGs2Lkk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MZP1y+unCXWxXu4QhOhFqAswhc89bF3/SUjqdvrQyAzG6DLM7Co/XgjQrDhkQixp47zNn6p6GchUEEjNDDjW/WKiloPDcR8mXvE0ci56wCSTnfXN6nwsBPKj3B/+CZFp4R/lNRsYNKK7Y0BhKyTLvviWMDIXLOLIIO4nFaJTeUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=TY88kznt; arc=fail smtp.client-ip=52.101.62.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSMCS8H7RwrElhdK3kDOR+mHukvxp2AdsVUB2rakS/W+O3OqN24LVyZ884zQHJ7PSRnM5pLzMJr25G6hbOrME95YXsqO11syRtHs51YmlzMNZdmXid0PJdnkb8hhXlK6cfynVjQs8U5hsMiXWEE1UbP/t47e7jxFYKfIcC8x79RXOLs6QiiiRuSKHObIIs7ZH+sRysfJJP78H8m1OCwnU6cmDmMBCywn3neBDeOj/U/YX24mAWyTJxIe+cR/VwqGDBeFdbfEw9zsv5S0bwDQAxOkbhqn4pseihBOKuOqwTSn9bIWku8bgCvbIU3yUH0FQrvdV9QEAlg+FMTfkwXi4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CDxz89glYLXRioi1Ev5IoWg5Fd5aDElqTlEw7GPXJG0=;
 b=vKLyObvbDQklZObvFWeCE/Ki2JBFvvjTOk3vIivM/t+TizSe8zT159LeQ5vDNzjTua0/nKVblNTM9HjFIrRlSsdEjdeZXFIHSRM0JqfaerJ7EEd20CyWDe7jrFFcClYnYKyqvQ6ctisYKGPKfRPixMnHM1CXGdkIDq6CcriB8mpo8BMCKxk5kPIawvtZLjiKqN6UQg/FY639AMykIF5iwQaP3HjRWJKx6KX49DuMGD+GtQv1O+Ttuwg+o0HTtYH3EIZYqtnmqX8RfXuLL3cxQBTyrnhjYu8uofdux7kBl6Sd9AqCoKSWad63gJgtbzTmfH5E2MGg5zE/H841Hy7pYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.147.44.87) smtp.rcpttodomain=gmail.com smtp.mailfrom=tw.synaptics.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=tw.synaptics.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CDxz89glYLXRioi1Ev5IoWg5Fd5aDElqTlEw7GPXJG0=;
 b=TY88kzntCCPd3QEfLBR1TJ7ugs49IPLwlxiqnWeDlL/0nyYvl8ScxnDJAglCq7g54cXuGQMavQjVJt5gyiCqr5ZMcLCfiZdml8B4Vh3uXj9bBpKY9co7jIvn8+LBAJW+daiNOQ8TWFv5Qfyca0nCfWpqCiBwIS2IyS/BK+7zbyU=
Received: from DS7PR05CA0108.namprd05.prod.outlook.com (2603:10b6:8:56::27) by
 LV8PR03MB7518.namprd03.prod.outlook.com (2603:10b6:408:190::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.36; Wed, 16 Jul
 2025 03:36:52 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::77) by DS7PR05CA0108.outlook.office365.com
 (2603:10b6:8:56::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Wed,
 16 Jul 2025 03:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.147.44.87)
 smtp.mailfrom=tw.synaptics.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=tw.synaptics.com;
Received-SPF: Pass (protection.outlook.com: domain of tw.synaptics.com
 designates 192.147.44.87 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.147.44.87;
 helo=sjc1uvd-bld04.synaptics.com; pr=C
Received: from sjc1uvd-bld04.synaptics.com (192.147.44.87) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server id 15.20.8922.22 via Frontend Transport; Wed, 16 Jul 2025
 03:36:51 +0000
From: Marge Yang <marge.yang@tw.synaptics.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	marge.yang@tw.synaptics.com
Cc: david.chiu@tw.synaptics.com,
	derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com,
	vincent.huang@tw.synaptics.com,
	Marge Yang <Marge.Yang@tw.synaptics.com>
Subject: [PATCH V2] Input: synaptics-rmi4- Add a new feature for Forcepad.
Date: Wed, 16 Jul 2025 03:36:48 +0000
Message-Id: <20250716033648.1785509-1-marge.yang@tw.synaptics.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|LV8PR03MB7518:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c22c33b5-794b-428d-25e2-08ddc41a0127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b7UDhqh8DCiGxtHVw+vbxFKSp+n8W7HbgjN1lh6mIPeFjjq8rUI1mchfPrgu?=
 =?us-ascii?Q?WcE2kuMikGnLiA6stPj7LY5g5t+hmoNknoQv/MHFKpOrj6h4fUIJ/c1rOxb6?=
 =?us-ascii?Q?gmTwxLnygEPerJjDRoy0fv+U2X4GaVzk6GocOLkSQn2+6AW4M/IIM0gi+aFd?=
 =?us-ascii?Q?7yeK0fI7aC7D493llhIX+Fdmh5x/BzgwAbWesh12QcftXiki3d0sLpTMX4MI?=
 =?us-ascii?Q?ZL0wNju01lArUEcKQgdbsg4RsBDP8Z1LLUxti6R2mYGj6OfdI0Qp0r6QwHY8?=
 =?us-ascii?Q?a0crVJr9wiC3dyGBgQD+ys7qmdeJXn7cUihUR+icH0/FkXjJNEw/jNL+IjBO?=
 =?us-ascii?Q?4JlU5IWpApGy2tPx1xGXg5ZWiAomzGcVvLi7vcV19CVyMTEkT6Bi7hdcjLF5?=
 =?us-ascii?Q?C7oY5Xygl8VhMKonDhJMKb5m7g9E194S2BRCXax7I5QZlhq9tDsGTBBVQlS4?=
 =?us-ascii?Q?UQju78thIXBjW7fPn+0ZMzF6qi2vGIhCIP9z8FxyUMy0e63evXRQklDxy+6j?=
 =?us-ascii?Q?GlvQVoloev6ekxVmSS57OtMwby7vu7IghrvnNMGhUaGLAtwfw9kV+E5mZ/DR?=
 =?us-ascii?Q?b5SzIKgI82+uVcE11v2lj8ZBb7D4WcFXEksY/LEvxsuWpIw+vb39Td4HswM1?=
 =?us-ascii?Q?zcuAt3q0N2ErPg6IsIEnNHGAtRmyN2vROHU3Ln+7T2Kohh3xwjacS4DmtdC9?=
 =?us-ascii?Q?+jHnJ1KexTyf+36PbrLnZxB2+b70zzKfEBT7EdZjCLX0MOMXBKy5wCA2rjjn?=
 =?us-ascii?Q?vMDHeZHJ99oWNcoDjhcY+aEqJhauKVfottxDqpI50aH25/EvsQkuOaTzl3ZY?=
 =?us-ascii?Q?TPQcjIPH/5J8oLHIwqzXynrfp+zuopwSsZL5hbBTlD7kdApJrZhPfzFpnU7M?=
 =?us-ascii?Q?EuKAicQm7gbWq/qQFZIYYQDsCjc3mReusL0F5MajBcdqhWQNL0iDsLCWjCNu?=
 =?us-ascii?Q?IKWOuMPSoI38F9fz/GR7afqkfEKoB1qeb9AJaTtUF9gLAiyq4/HP5WbTGM4w?=
 =?us-ascii?Q?5OTpt3lanZm2/7ntrUnpzYn+XO7+rmTFq9bLREIiYX4X1B/xbytI9CPCAZck?=
 =?us-ascii?Q?Qn7TdvStbpQ+14FgI6fSQBpD/lfHf74GUBMk/Wq7eePx/4fT7X0czm/pjLjT?=
 =?us-ascii?Q?BvOBI9CiF0mpJEAAYTdKXdCEE7xbItjsJpZ83J260oLk7w0ZMYGZl1ox/xxn?=
 =?us-ascii?Q?yb/6qGrDEyPWu/nANk8WNqvBwC29e0LdLtbAylS09nCwY7gii2a2BWKfnrb4?=
 =?us-ascii?Q?KS8G3avUZK2SFpeGN7XJJHnC4/mQSOUJSdx6y6GGZuMWkzRtOBGJFomuSVjF?=
 =?us-ascii?Q?KTLpQiiKpSzBmzPbrC+fk6+XnODUHBkqZMMhrhw8GG4gp+6MJszHdy8g8ytD?=
 =?us-ascii?Q?cDsTh5fBZZfcnkjZogWUtVJ3erVvUylmnFAitQg8jSkoI0U3dMz2+svwgJ4n?=
 =?us-ascii?Q?5542Fx3qSAKP/KKOpqJnt8bfqZW2Z5DN/5Y8d9En+2h+e+4NmdPiveNdLLr5?=
 =?us-ascii?Q?RCqEtciiQ2QLa3GO/DMcdkyBjp5kzspbC9m1?=
X-Forefront-Antispam-Report:
	CIP:192.147.44.87;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjc1uvd-bld04.synaptics.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 03:36:51.8101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c22c33b5-794b-428d-25e2-08ddc41a0127
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=335d1fbc-2124-4173-9863-17e7051a2a0e;Ip=[192.147.44.87];Helo=[sjc1uvd-bld04.synaptics.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR03MB7518

From: Marge Yang <Marge.Yang@tw.synaptics.com>

Forcepad devices will use F21, for click simulation
due to lack of a metal button, so we add F21 support
to make forcepad support click function.

Signed-off-by: Marge Yang <Marge.Yang@tw.synaptics.com>
---
 drivers/input/rmi4/Kconfig      |   8 ++
 drivers/input/rmi4/Makefile     |   1 +
 drivers/input/rmi4/rmi_bus.c    |   3 +
 drivers/input/rmi4/rmi_driver.h |   1 +
 drivers/input/rmi4/rmi_f21.c    | 162 ++++++++++++++++++++++++++++++++
 5 files changed, 175 insertions(+)
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
index 3bfe9013043e..21e1c7663561 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -133,6 +133,7 @@ extern struct rmi_function_handler rmi_f01_handler;
 extern struct rmi_function_handler rmi_f03_handler;
 extern struct rmi_function_handler rmi_f11_handler;
 extern struct rmi_function_handler rmi_f12_handler;
+extern struct rmi_function_handler rmi_f21_handler;
 extern struct rmi_function_handler rmi_f30_handler;
 extern struct rmi_function_handler rmi_f34_handler;
 extern struct rmi_function_handler rmi_f3a_handler;
diff --git a/drivers/input/rmi4/rmi_f21.c b/drivers/input/rmi4/rmi_f21.c
new file mode 100644
index 000000000000..510278ee7704
--- /dev/null
+++ b/drivers/input/rmi4/rmi_f21.c
@@ -0,0 +1,162 @@
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
+#define RMI_f21_FORCE_CLICK			BIT(0)
+#define RMI_f21_DATA_REGS_MAX_SIZE	255
+#define RMI_f21_FORCEPAD_BUTTON_COUNT	1
+
+struct f21_data {
+	/* Query Data */
+	u8 data_regs[RMI_f21_DATA_REGS_MAX_SIZE];
+	struct input_dev *input;
+	u16 key_code;
+
+	unsigned int attn_data_size;
+	unsigned int attn_data_index_for_button;
+	unsigned int sensor_count;
+	unsigned int max_number_Of_finger;
+	unsigned int data_reg_size;
+	unsigned int data_reg_index_for_button;
+	unsigned int query15_offset;
+};
+
+static irqreturn_t rmi_f21_attention(int irq, void *ctx)
+{
+	struct rmi_function *fn = ctx;
+	struct f21_data *f21 = dev_get_drvdata(&fn->dev);
+	struct rmi_driver_data *drvdata = dev_get_drvdata(&fn->rmi_dev->dev);
+	int error;
+	bool pressed = false;
+
+	if (drvdata->attn_data.data) {
+		if (drvdata->attn_data.size < f21->attn_data_size) {
+			dev_warn(&fn->dev, "f21 interrupted, but data is missing\n");
+			return IRQ_HANDLED;
+		}
+		pressed = (((u8 *)drvdata->attn_data.data)[f21->attn_data_index_for_button] &
+					RMI_f21_FORCE_CLICK);
+		drvdata->attn_data.data += f21->attn_data_size;
+		drvdata->attn_data.size -= f21->attn_data_size;
+	} else {
+		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr,
+					f21->data_regs, f21->data_reg_size);
+		if (error) {
+			dev_err(&fn->dev, "%s: Failed to read f21 data registers: %d\n",
+				__func__, error);
+			return IRQ_RETVAL(error);
+		}
+		pressed = (f21->data_regs[f21->data_reg_index_for_button] &
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
+	struct rmi_driver *drv = fn->rmi_dev->driver;
+
+	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+
+	return 0;
+}
+
+static int rmi_f21_initialize(struct rmi_function *fn, struct f21_data *f21)
+{
+	struct input_dev *input = f21->input;
+
+	f21->key_code = BTN_LEFT;
+	input_set_capability(input, EV_KEY, f21->key_code);
+	input->keycode = &f21->key_code;
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
+
+	f21->sensor_count = fn->fd.query_base_addr & (BIT(0) | BIT(1) | BIT(2) | BIT(3));
+
+	if (fn->fd.query_base_addr & BIT(5)) {
+		if (fn->fd.query_base_addr & BIT(6))
+			f21->query15_offset = 2;
+		else
+			f21->query15_offset = 1;
+
+		rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + f21->query15_offset,
+					f21->data_regs, 1);
+		f21->max_number_Of_finger = f21->data_regs[0] & 0x0F;
+	} else {
+		dev_info(&fn->dev, "f21_query15 doesn't support.\n");
+		f21->query15_offset = 0;
+		f21->max_number_Of_finger = 5;
+	}
+
+	if (fn->fd.query_base_addr & BIT(6)) {
+		dev_info(&fn->dev, "Support new F21 feature.\n");
+		/*Each finger uses one byte, and the button state uses one byte.*/
+		f21->attn_data_size = f21->max_number_Of_finger + 1;
+		f21->attn_data_index_for_button = f21->attn_data_size - 1;
+		/*
+		 * Each sensor uses two bytes, the button state uses one byte,
+		 * and each finger uses two bytes.
+		 */
+		f21->data_reg_size = f21->sensor_count * 2 + 1 +
+								f21->max_number_Of_finger * 2;
+		f21->data_reg_index_for_button = f21->sensor_count * 2;
+	} else {
+		dev_info(&fn->dev, "Support old F21 feature.\n");
+		/*Each finger uses two bytes, and the button state uses one byte.*/
+		f21->attn_data_size = f21->sensor_count * 2 + 1;
+		f21->attn_data_index_for_button = f21->attn_data_size - 1;
+		/*Each finger uses two bytes, and the button state uses one byte.*/
+		f21->data_reg_size = f21->sensor_count * 2 + 1;
+		f21->data_reg_index_for_button = f21->data_reg_size - 1;
+	}
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


