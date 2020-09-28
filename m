Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CC1D27A6EB
	for <lists+linux-input@lfdr.de>; Mon, 28 Sep 2020 07:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgI1FWj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 01:22:39 -0400
Received: from mail-dm6nam11on2079.outbound.protection.outlook.com ([40.107.223.79]:51073
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbgI1FWj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 01:22:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lkXrWUY8nKCI6MF5z6tH+bbjYPvtDq1ARwO8W4HkJsfR2VgqnINCkhAcwd84rgnwiZRiXMR01Z8N1Hefxbk5mz+JVi4vHXXxEoWzVoIiK0pADDxBzxLsPA9pjsCvWp5jcAnOurG1/0ZbWj/OwujobhtMfz4bBcpB/bxoCF16EBC1NC4st1GCMkhmFdlD4lcu7og3z3KOS3VzGfCdurnlvSmg8mhUsCk7Wl8gJWPl6FkeO6vB/IuwNLm86Tbv9/c48RwsiWFTVReYiBz6Nmaghg/cR7V/NpBvnlw1UDV2fTMiAOzoVzElzMFcni2Z/2VfqOYgFlfsvHRg1JyW/PJIvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otj01DV52GGG7+kvxETDv2knXjnuq1221k6ExyPYNtg=;
 b=FFqL1/kdgK/sH2UlJoTcJaf3Gg0YFglWOFiTiHOu9VGNvnZ1/Tj/4GOhmZ9g//YCLdURPnACV0u+Kc/41wa8sJi+bE/j4VZFcAQFN+65eGiZTGC3ZeR+X0ejkf7XGGT8+H3UZtIOllQm7u6AGzWlVPSYxjM58Q/coYvrMaUIiDRxd5K9hEJX8+NXZHMLHs88/dNLfRmA+fyCW/jj0OXCvPjve9l6xZjloyJ3nLUQXWVSvHUZhpsds9gQPBVXOKJ+nO8a4x7D8z3tjClE/Q+EQmAn6RcWl75DCtv9BdBjMplEYyGObBAHUIHDZ3gORdxueorDFjsP3Z2eKszdiLfkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=otj01DV52GGG7+kvxETDv2knXjnuq1221k6ExyPYNtg=;
 b=LMKFKSmAozX5Z2k+IdQNcSncY0ZjIOUKh41koex2D6MhIxVGCoLx6ycP3d0D88z+lLu4V+h5+BIlyWGQt/5WyC+6LltAodhe7yUGaM6Hs3icUv0a2G984VTARguj0AGXZ5Mx4KrNhjRaGGMgWeYno1LtuRY/wwLsGzRxEWMy0P4=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB3757.namprd03.prod.outlook.com (2603:10b6:805:6c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.22; Mon, 28 Sep
 2020 05:22:35 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3412.029; Mon, 28 Sep 2020
 05:22:35 +0000
From:   Vincent Huang <vincent.huang@tw.synaptics.com>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Vincent Huang <vincent.huang@tw.synaptics.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Lyude Paul <lyude@redhat.com>,
        Chris Heiny <chris.heiny@synaptics.com>
Subject: [PATCH v2 2/2] Input: synaptics-rmi4 - add support for F3A
Date:   Mon, 28 Sep 2020 13:20:08 +0800
Message-Id: <20200928052008.279274-3-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
References: <20200928052008.279274-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR02CA0218.apcprd02.prod.outlook.com
 (2603:1096:201:20::30) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR02CA0218.apcprd02.prod.outlook.com (2603:1096:201:20::30) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.21 via Frontend Transport; Mon, 28 Sep 2020 05:22:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2a3f86b-dc90-4cfa-4dbf-08d8636e822a
X-MS-TrafficTypeDiagnostic: SN6PR03MB3757:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB37574C1E1EB30DCDE5A1C693D6350@SN6PR03MB3757.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:26;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mkFTzv/tDPqNnPLjARBFX3Ms9FDrkfVIKRjriVnPng70dPSIsHYU0kE7nJ0BhMEDTYWNBEhSd6CcDEEYPcJAIhLvHaUIaztoOYU/T6uG1S7GxCK/fgDqgOZaGJ/HP7dl8v7Rinmx6mB5C/VYoJ7htJ9JzgPtz8FXYM7cjQIoohTlEDPmQ+JKvFvpQSv/Vjc7C2FB9+GAkfTsYHo1XXEhe4M56zYd18P7voPtk08EDvaZaTdF1oxJujagdg+DbQTy4EOrR1wj456JEsz9PqcimuV+AOG2w8eb/+XAtZ/1PFv1NOziQK054kurwApbPDSpFzGjSw1iuwLctfx41tivJMxISjyXR6xPv55BWLrWCjf7IqcJRSHl+MGG6QfpYDTZ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(366004)(136003)(376002)(396003)(16526019)(54906003)(186003)(2616005)(956004)(316002)(6666004)(8936002)(6506007)(52116002)(478600001)(66946007)(6486002)(1076003)(5660300002)(26005)(4326008)(107886003)(6512007)(8676002)(2906002)(86362001)(83380400001)(44832011)(66476007)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 0qiaaYnEH93N1Ekt7kTSyi03lbtlEuNRNrsbOppl+y3cZuGbRl1P6FRlg8M6pwHrrum8X3oPu0VbLDIRKdBz8iMKDacnZnsjSmtYp5Ep5yu/ap2hHUk3XrbhuVbQwNaXADx0FnZnpx0/m9LKxkjuNVfJz3raBy4C9fo5+6v1Dz4LE9XPHjqLV14b4sJmvgf960eS16M3TrHmyKOqRqstkSuO/4vNk9HUCAbI6pO7CltlYENmad7ZTprMmaRIwM5i58STo8cUCVHdL2zcvgDJ7WB0erZoHsTM89n+d1jIswMXfO20EgKkqZ/USEObqWSQablLKXenSYVEtkVfC9SMoMZpYEoaQiIocXquvbXZrfHBZh5PKw1fJgpUQ78qx8ED4kV8Q1T4r/LW3E/T1dkyrKIsd+qDHdXnVa6QRVeK6b55axgsLut5DzjDns24u2gnpbjFbKXdWoc52rCpdCnGnnfZ4fVhviOshINEVvZp9TnPfI/9wPSUA3hB6KSJUFUuPDDLILQ0fTX7VDbxS5yMLgluiQsHhu+SKMf9LX10flUfONkfKc4dIKG+orcghF9vLZoPNAmwC2NceQynLdaQSrdw/GV3BYoVPqW9146OrSPb5gM3NVIvDcPMgHoE2fJNBNJvzKf4Ul9dOaImKyB0sg==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a3f86b-dc90-4cfa-4dbf-08d8636e822a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2020 05:22:35.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvK6LyerENZ+MT35jn0x3tFxPa3kl7TU6aGix8aOCFGn2UAaLtL6DOv/8iS6uT6fNGDUjoN8/5I47ZDUst3a5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3757
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

RMI4 F3A supports the touchpad GPIO function, it's designed to
support more GPIOs and used on newer touchpads. This patch adds
support of the touchpad buttons.

Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/rmi4/Kconfig      |   8 ++
 drivers/input/rmi4/Makefile     |   1 +
 drivers/input/rmi4/rmi_bus.c    |   3 +
 drivers/input/rmi4/rmi_driver.h |   1 +
 drivers/input/rmi4/rmi_f3a.c    | 241 ++++++++++++++++++++++++++++++++
 5 files changed, 254 insertions(+)
 create mode 100644 drivers/input/rmi4/rmi_f3a.c

diff --git a/drivers/input/rmi4/Kconfig b/drivers/input/rmi4/Kconfig
index a212ff706f74..16119f760d11 100644
--- a/drivers/input/rmi4/Kconfig
+++ b/drivers/input/rmi4/Kconfig
@@ -100,6 +100,14 @@ config RMI4_F34
 	  device via the firmware loader interface. This is triggered using a
 	  sysfs attribute.
 
+config RMI4_F3A
+	bool "RMI4 Function 3A (GPIO)"
+	help
+	  Say Y here if you want to add support for RMI4 function 3A.
+
+	  Function 3A provides GPIO support for RMI4 devices. This includes
+	  support for buttons on TouchPads and ClickPads.
+
 config RMI4_F54
 	bool "RMI4 Function 54 (Analog diagnostics)"
 	depends on VIDEO_V4L2=y || (RMI4_CORE=m && VIDEO_V4L2=m)
diff --git a/drivers/input/rmi4/Makefile b/drivers/input/rmi4/Makefile
index f17631656987..02f14c846861 100644
--- a/drivers/input/rmi4/Makefile
+++ b/drivers/input/rmi4/Makefile
@@ -10,6 +10,7 @@ rmi_core-$(CONFIG_RMI4_F11) += rmi_f11.o
 rmi_core-$(CONFIG_RMI4_F12) += rmi_f12.o
 rmi_core-$(CONFIG_RMI4_F30) += rmi_f30.o
 rmi_core-$(CONFIG_RMI4_F34) += rmi_f34.o rmi_f34v7.o
+rmi_core-$(CONFIG_RMI4_F3A) += rmi_f3a.o
 rmi_core-$(CONFIG_RMI4_F54) += rmi_f54.o
 rmi_core-$(CONFIG_RMI4_F55) += rmi_f55.o
 
diff --git a/drivers/input/rmi4/rmi_bus.c b/drivers/input/rmi4/rmi_bus.c
index af706a583656..47d1b97ed6cf 100644
--- a/drivers/input/rmi4/rmi_bus.c
+++ b/drivers/input/rmi4/rmi_bus.c
@@ -365,6 +365,9 @@ static struct rmi_function_handler *fn_handlers[] = {
 #ifdef CONFIG_RMI4_F34
 	&rmi_f34_handler,
 #endif
+#ifdef CONFIG_RMI4_F3A
+	&rmi_f3a_handler,
+#endif
 #ifdef CONFIG_RMI4_F54
 	&rmi_f54_handler,
 #endif
diff --git a/drivers/input/rmi4/rmi_driver.h b/drivers/input/rmi4/rmi_driver.h
index 65bfaa95e193..1c6c6086c0e5 100644
--- a/drivers/input/rmi4/rmi_driver.h
+++ b/drivers/input/rmi4/rmi_driver.h
@@ -135,6 +135,7 @@ extern struct rmi_function_handler rmi_f11_handler;
 extern struct rmi_function_handler rmi_f12_handler;
 extern struct rmi_function_handler rmi_f30_handler;
 extern struct rmi_function_handler rmi_f34_handler;
+extern struct rmi_function_handler rmi_f3a_handler;
 extern struct rmi_function_handler rmi_f54_handler;
 extern struct rmi_function_handler rmi_f55_handler;
 #endif
diff --git a/drivers/input/rmi4/rmi_f3a.c b/drivers/input/rmi4/rmi_f3a.c
new file mode 100644
index 000000000000..be3c1ecc1181
--- /dev/null
+++ b/drivers/input/rmi4/rmi_f3a.c
@@ -0,0 +1,241 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020 Synaptics Incorporated
+ */
+
+#include <linux/kernel.h>
+#include <linux/rmi.h>
+#include <linux/input.h>
+#include <linux/slab.h>
+#include "rmi_driver.h"
+
+#define RMI_F3A_MAX_GPIO_COUNT		128
+#define RMI_F3A_MAX_REG_SIZE		DIV_ROUND_UP(RMI_F3A_MAX_GPIO_COUNT, 8)
+
+/* Defs for Query 0 */
+#define RMI_F3A_GPIO_COUNT		0x7F
+
+#define RMI_F3A_DATA_REGS_MAX_SIZE	RMI_F3A_MAX_REG_SIZE
+
+#define TRACKSTICK_RANGE_START		3
+#define TRACKSTICK_RANGE_END		6
+
+struct f3a_data {
+	/* Query Data */
+	u8 gpio_count;
+
+	u8 register_count;
+
+	u8 data_regs[RMI_F3A_DATA_REGS_MAX_SIZE];
+	u16 *gpio_key_map;
+
+	struct input_dev *input;
+
+	struct rmi_function *f03;
+	bool trackstick_buttons;
+};
+
+static void rmi_f3a_report_button(struct rmi_function *fn,
+				  struct f3a_data *f3a, unsigned int button)
+{
+	u16 key_code = f3a->gpio_key_map[button];
+	bool key_down = !(f3a->data_regs[0] & BIT(button));
+
+	if (f3a->trackstick_buttons &&
+	    button >= TRACKSTICK_RANGE_START &&
+	    button <= TRACKSTICK_RANGE_END) {
+		rmi_f03_overwrite_button(f3a->f03, key_code, key_down);
+	} else {
+		rmi_dbg(RMI_DEBUG_FN, &fn->dev,
+			"%s: call input report key (0x%04x) value (0x%02x)",
+			__func__, key_code, key_down);
+		input_report_key(f3a->input, key_code, key_down);
+	}
+}
+
+static irqreturn_t rmi_f3a_attention(int irq, void *ctx)
+{
+	struct rmi_function *fn = ctx;
+	struct f3a_data *f3a = dev_get_drvdata(&fn->dev);
+	struct rmi_driver_data *drvdata = dev_get_drvdata(&fn->rmi_dev->dev);
+	int error;
+	int i;
+
+	if (drvdata->attn_data.data) {
+		if (drvdata->attn_data.size < f3a->register_count) {
+			dev_warn(&fn->dev,
+				 "F3A interrupted, but data is missing\n");
+			return IRQ_HANDLED;
+		}
+		memcpy(f3a->data_regs, drvdata->attn_data.data,
+			f3a->register_count);
+		drvdata->attn_data.data += f3a->register_count;
+		drvdata->attn_data.size -= f3a->register_count;
+	} else {
+		error = rmi_read_block(fn->rmi_dev, fn->fd.data_base_addr,
+				f3a->data_regs, f3a->register_count);
+		if (error) {
+			dev_err(&fn->dev,
+				"%s: Failed to read F3a data registers: %d\n",
+				__func__, error);
+			return IRQ_RETVAL(error);
+		}
+	}
+
+
+	for (i = 0; i < f3a->gpio_count; i++)
+		if (f3a->gpio_key_map[i] != KEY_RESERVED)
+			rmi_f3a_report_button(fn, f3a, i);
+	if (f3a->trackstick_buttons)
+		rmi_f03_commit_buttons(f3a->f03);
+
+	return IRQ_HANDLED;
+}
+
+static int rmi_f3a_config(struct rmi_function *fn)
+{
+	struct f3a_data *f3a = dev_get_drvdata(&fn->dev);
+	struct rmi_driver *drv = fn->rmi_dev->driver;
+	const struct rmi_device_platform_data *pdata =
+				rmi_get_platform_data(fn->rmi_dev);
+
+	if (!f3a)
+		return 0;
+
+	if (pdata->gpio_data.trackstick_buttons) {
+		/* Try [re-]establish link to F03. */
+		f3a->f03 = rmi_find_function(fn->rmi_dev, 0x03);
+		f3a->trackstick_buttons = f3a->f03 != NULL;
+	}
+
+	drv->set_irq_bits(fn->rmi_dev, fn->irq_mask);
+
+	return 0;
+}
+
+static bool rmi_f3a_is_valid_button(int button, struct f3a_data *f3a,
+				u8 *query1_regs, u8 *ctrl1_regs)
+{
+	/* gpio exist && direction input */
+	return (query1_regs[0] & BIT(button)) && !(ctrl1_regs[0] & BIT(button));
+}
+
+static int rmi_f3a_map_gpios(struct rmi_function *fn, struct f3a_data *f3a,
+				u8 *query1_regs, u8 *ctrl1_regs)
+{
+	const struct rmi_device_platform_data *pdata =
+					rmi_get_platform_data(fn->rmi_dev);
+	struct input_dev *input = f3a->input;
+	unsigned int button = BTN_LEFT;
+	unsigned int trackstick_button = BTN_LEFT;
+	bool button_mapped = false;
+	int i;
+	int button_count = min_t(u8, f3a->gpio_count, TRACKSTICK_RANGE_END);
+
+	f3a->gpio_key_map = devm_kcalloc(&fn->dev,
+					    button_count,
+					    sizeof(f3a->gpio_key_map[0]),
+					    GFP_KERNEL);
+	if (!f3a->gpio_key_map) {
+		dev_err(&fn->dev, "Failed to allocate gpio map memory.\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < button_count; i++) {
+
+		if (!rmi_f3a_is_valid_button(i, f3a, query1_regs, ctrl1_regs))
+			continue;
+
+		if (pdata->gpio_data.trackstick_buttons &&
+		    i >= TRACKSTICK_RANGE_START && i < TRACKSTICK_RANGE_END) {
+			f3a->gpio_key_map[i] = trackstick_button++;
+		} else if (!pdata->gpio_data.buttonpad || !button_mapped) {
+			f3a->gpio_key_map[i] = button;
+			input_set_capability(input, EV_KEY, button++);
+			button_mapped = true;
+		}
+	}
+	input->keycode = f3a->gpio_key_map;
+	input->keycodesize = sizeof(f3a->gpio_key_map[0]);
+	input->keycodemax = f3a->gpio_count;
+
+	if (pdata->gpio_data.buttonpad || (button - BTN_LEFT == 1))
+		__set_bit(INPUT_PROP_BUTTONPAD, input->propbit);
+
+	return 0;
+}
+
+static int rmi_f3a_initialize(struct rmi_function *fn, struct f3a_data *f3a)
+{
+	u8 query1[RMI_F3A_MAX_REG_SIZE];
+	u8 ctrl1[RMI_F3A_MAX_REG_SIZE];
+	u8 buf;
+	int error;
+
+	error = rmi_read(fn->rmi_dev, fn->fd.query_base_addr, &buf);
+	if (error < 0) {
+		dev_err(&fn->dev, "Failed to read general info register: %d\n",
+			error);
+		return -ENODEV;
+	}
+
+	f3a->gpio_count = buf & RMI_F3A_GPIO_COUNT;
+	f3a->register_count = DIV_ROUND_UP(f3a->gpio_count, 8);
+
+	/* Query1 -> gpio exist */
+	error = rmi_read_block(fn->rmi_dev, fn->fd.query_base_addr + 1,
+			       query1, f3a->register_count);
+	if (error) {
+		dev_err(&fn->dev, "Failed to read query1 register\n");
+		return error;
+	}
+
+	/* Ctrl1 -> gpio direction */
+	error = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr + 1,
+			       ctrl1, f3a->register_count);
+	if (error) {
+		dev_err(&fn->dev, "Failed to read control1 register\n");
+		return error;
+	}
+
+	error = rmi_f3a_map_gpios(fn, f3a, query1, ctrl1);
+	if (error)
+		return error;
+	return 0;
+}
+
+static int rmi_f3a_probe(struct rmi_function *fn)
+{
+	struct rmi_device *rmi_dev = fn->rmi_dev;
+	struct rmi_driver_data *drv_data = dev_get_drvdata(&rmi_dev->dev);
+	struct f3a_data *f3a;
+	int error;
+
+	if (!drv_data->input) {
+		dev_info(&fn->dev, "F3A: no input device found, ignoring\n");
+		return -ENXIO;
+	}
+
+	f3a = devm_kzalloc(&fn->dev, sizeof(*f3a), GFP_KERNEL);
+	if (!f3a)
+		return -ENOMEM;
+
+	f3a->input = drv_data->input;
+
+	error = rmi_f3a_initialize(fn, f3a);
+	if (error)
+		return error;
+
+	dev_set_drvdata(&fn->dev, f3a);
+	return 0;
+}
+
+struct rmi_function_handler rmi_f3a_handler = {
+	.driver = {
+		.name = "rmi4_f3a",
+	},
+	.func = 0x3a,
+	.probe = rmi_f3a_probe,
+	.config = rmi_f3a_config,
+	.attention = rmi_f3a_attention,
+};
-- 
2.25.1

