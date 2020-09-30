Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62D8927E56F
	for <lists+linux-input@lfdr.de>; Wed, 30 Sep 2020 11:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbgI3JnI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Sep 2020 05:43:08 -0400
Received: from mail-dm6nam12on2052.outbound.protection.outlook.com ([40.107.243.52]:50523
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728169AbgI3JnH (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Sep 2020 05:43:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc67J5uGOW9EHxo+F6/Oi1kJV6SQiiRHOtaj5lece57dSnVwPNWVNMd3Qt51Sk4HM+1P8rmXKALqDBeu3yloO0vFJEq/nD7y9+Bi8O6YCYNwgsiPn4OtoSSEENtBjy8R6wexHHEEAOJaMsxezyVfxExeGpkJgE4rCDBo+HdN6diwS2W7H2kzf4GA/OcvaHy38SFXqP1RCX5mj95UNVMA+yY0uMOJl5fgAZm48kx+5K+/BbWW/Eh3gkrvqpeDSIh+DXuIkvKT+nqjq3LoppxHsWZBz7CIo9UlHMW91iRNgZ+9GQ7EOjaN3fm7xvzZjVcjKzA/isf3R8nFr5a+JEnjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFCoaI0CFcn5OgiL6CGBza0lUp08pN+W7AIcy1w2QPA=;
 b=PUSoU6m5u/LL6viyVW9QXjttpYU/EquFRCZK/BrSH1GCSnhavluNOZiRFVZQSzUuEjtsityIlDQSF5EtdbWEWiTHiJif6f98a1xIeHPRT3QCPLBYlprvBB6/7bC/HL8daTPRzF+HR9rHYmKFfhFOyX8z8ophpNZ+Ti8wO3C4ANkCmapPnpDG0OWMtVlnaC6cZ/6n/HD8C/hTxUpV3jNjQHEbHnCFp0cvGjJfiTFNtVyoWuZ8uCkBuSZ2i3CG3H52hpoy5X7KXc9dUuFrL78TS9YC7zZWo/PlEGlN3MKCVaV71fe1V0njStuVDTKPzRFHVSczV9+RBHpXY+2/dQZQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tw.synaptics.com; dmarc=pass action=none
 header.from=tw.synaptics.com; dkim=pass header.d=tw.synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFCoaI0CFcn5OgiL6CGBza0lUp08pN+W7AIcy1w2QPA=;
 b=Xi6idKU6o9J4B/tb2Cr19FnczCfd+x60t3i9/YwOHi+nCYVEU0I3cJPf4LwtmBKtF4Qj4oSdPke2ofQqL1DBOzttWFRKylhU+xVczrKQWeF6qSalfu0KssD4t+rU8JzzEvcLYGMO9yAYk9JIrZC6pomyhpmWmSDQHgXnPw0VYqQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=tw.synaptics.com;
Received: from SN6PR03MB3952.namprd03.prod.outlook.com (2603:10b6:805:75::26)
 by SN6PR03MB3821.namprd03.prod.outlook.com (2603:10b6:805:6a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.28; Wed, 30 Sep
 2020 09:43:04 +0000
Received: from SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e]) by SN6PR03MB3952.namprd03.prod.outlook.com
 ([fe80::3c54:f5cf:3148:407e%7]) with mapi id 15.20.3433.035; Wed, 30 Sep 2020
 09:43:04 +0000
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
Subject: [PATCH v3 2/2] Input: synaptics-rmi4 - add support for F3A
Date:   Wed, 30 Sep 2020 17:41:47 +0800
Message-Id: <20200930094147.635556-3-vincent.huang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
References: <20200930094147.635556-1-vincent.huang@tw.synaptics.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [60.250.40.146]
X-ClientProxiedBy: HK2PR06CA0020.apcprd06.prod.outlook.com
 (2603:1096:202:2e::32) To SN6PR03MB3952.namprd03.prod.outlook.com
 (2603:10b6:805:75::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from test-ThinkPad.synaptics-inc.local (60.250.40.146) by HK2PR06CA0020.apcprd06.prod.outlook.com (2603:1096:202:2e::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend Transport; Wed, 30 Sep 2020 09:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0c610880-bdd4-41d2-5dfa-08d865253a56
X-MS-TrafficTypeDiagnostic: SN6PR03MB3821:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB382181BB76775389DAE3899CD6330@SN6PR03MB3821.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:26;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HDvT6bS5aSMXaN7D8/7JgR0Ffm0AvI3NU6N71DH/dIwUoTnvfYxRxJgoLoDNApjP2HmztYWHM298BQKzDo+UiuAKjP7rYn068pXgs1TYoS7jKLNLIUdUdmUDdGbszkCIn9cBqX8KD1bHjybCliT2hY0X9AW5eOYGIY9jEy+LntHMJ6rtUVEE+HPKyjr3BbV4L9ht/d3/vzVJxCXlG7Kc/QzXNJ6uKCwlu6QeQarLilcCvEO7qwt07u2rd/6yMqbXUDvukaVt4GLCNiZ/BsxL9m0dzrRUgRu1NTKn/FhOFkAaGb2wIvF+VN3Egzglze8Do44l9Ipv8/omiSPyeFXVsY0ysoDKfdzEs6llYT2lkUs3v0AQCGQdbIuo31YbJzZT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR03MB3952.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(366004)(376002)(39860400002)(136003)(346002)(6486002)(66946007)(478600001)(6666004)(5660300002)(107886003)(83380400001)(66476007)(956004)(2616005)(66556008)(8936002)(186003)(16526019)(52116002)(26005)(4326008)(8676002)(316002)(44832011)(86362001)(6512007)(54906003)(1076003)(6506007)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: pV1brrRN1QO/v+LvHDaGp7wkzW8gOk6U3FKFIjABfSkFzgX+tmAaZQ+WN1Fgz4P6eOAZrrN2bXydfKMpMOHX2EAxhYywAHzu5Ubg0OmkM6GG4wG9tX7hWX8vGX0EE42uSESjBxWJf3Bqwe40+FL3DHnRb2SxupGktI8lF7FhU7aCuSM16Br2dPy4N4mFfl6ujlCidKGUTc6jZRnZ4EVWJ2ej9btIZPaWJVhuMyZBzGr9AhsLixOgb2Gb/Ftr+WsBXdnL6YHVUE6Kdcc4gX1hIz2jxB8ZQthH3YG2Wdy1E6tulvTq+u9+TIcK3eF5zVJmeaEWMt/JTPu33AS7+I9vkpzB8V5YNSVGG3zgHV4r4HKN957XddgmyX0GY4E/xCXmeGaQiK6rbWaj0swlamDvClT4T3cQUX2h34Dqv0NUfuW+/vaxI7PnxStp+jX6lBH939HhzM/15gAbbQvrRH/m/fCVv8e6BFdKZCzyewpxgDwq/1KR4pi+3lILjM7Yd4xJ4YMADyaZ64Fi6a1BMQTxnxjBEaAmk5OEGMCb+OUUTU2blNuTOos8wSA8Le4tszTlfhI8HiXY5j08uTl9Bw6GW+AxgK3WP8o9riHX3WqWDyhytuarsGydlFrXMCDqy/HmLKSI/A27u9fgqOfPVXBS9Q==
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c610880-bdd4-41d2-5dfa-08d865253a56
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3952.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2020 09:43:04.2447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKnR/vAIS3nHdy2o/e2APKpXbLJCwWDEnH6OBLedx6iKVeIdne68UWOIw81Zt2t0ZFtrKSv9jTLPtuPKwMV/Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB3821
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
 drivers/input/rmi4/rmi_f3a.c    | 240 ++++++++++++++++++++++++++++++++
 5 files changed, 253 insertions(+)
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
index 000000000000..11ff35f811b0
--- /dev/null
+++ b/drivers/input/rmi4/rmi_f3a.c
@@ -0,0 +1,240 @@
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
+		button >= TRACKSTICK_RANGE_START &&
+		button <= TRACKSTICK_RANGE_END) {
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
+					f3a->data_regs, f3a->register_count);
+		if (error) {
+			dev_err(&fn->dev,
+				"%s: Failed to read F3a data registers: %d\n",
+				__func__, error);
+			return IRQ_RETVAL(error);
+		}
+	}
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
+			rmi_get_platform_data(fn->rmi_dev);
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
+					u8 *query1_regs, u8 *ctrl1_regs)
+{
+	/* gpio exist && direction input */
+	return (query1_regs[0] & BIT(button)) && !(ctrl1_regs[0] & BIT(button));
+}
+
+static int rmi_f3a_map_gpios(struct rmi_function *fn, struct f3a_data *f3a,
+				u8 *query1_regs, u8 *ctrl1_regs)
+{
+	const struct rmi_device_platform_data *pdata =
+			rmi_get_platform_data(fn->rmi_dev);
+	struct input_dev *input = f3a->input;
+	unsigned int button = BTN_LEFT;
+	unsigned int trackstick_button = BTN_LEFT;
+	bool button_mapped = false;
+	int i;
+	int button_count = min_t(u8, f3a->gpio_count, TRACKSTICK_RANGE_END);
+
+	f3a->gpio_key_map = devm_kcalloc(&fn->dev,
+						button_count,
+						sizeof(f3a->gpio_key_map[0]),
+						GFP_KERNEL);
+	if (!f3a->gpio_key_map) {
+		dev_err(&fn->dev, "Failed to allocate gpio map memory.\n");
+		return -ENOMEM;
+	}
+
+	for (i = 0; i < button_count; i++) {
+		if (!rmi_f3a_is_valid_button(i, f3a, query1_regs, ctrl1_regs))
+			continue;
+
+		if (pdata->gpio_data.trackstick_buttons &&
+			i >= TRACKSTICK_RANGE_START &&
+			i < TRACKSTICK_RANGE_END) {
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
+				query1, f3a->register_count);
+	if (error) {
+		dev_err(&fn->dev, "Failed to read query1 register\n");
+		return error;
+	}
+
+	/* Ctrl1 -> gpio direction */
+	error = rmi_read_block(fn->rmi_dev, fn->fd.control_base_addr + 1,
+				ctrl1, f3a->register_count);
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

