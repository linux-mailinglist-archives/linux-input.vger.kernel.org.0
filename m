Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9565E301964
	for <lists+linux-input@lfdr.de>; Sun, 24 Jan 2021 04:45:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbhAXDoz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 22:44:55 -0500
Received: from mail-eopbgr750071.outbound.protection.outlook.com ([40.107.75.71]:35295
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726288AbhAXDoy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 22:44:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FutQpBH1xUS2VYmGRB3G4wn7XPvMSyvbjKFy4mkd1mUt0c/0tWQwS+OYocexTCHbMTZpiQ37ieWSk28UvD9gycJd7CgGEe90kfSpRGyfoyAcpZXnOtg5/k2daAfA4oO3x1Ke8MxRjzGFhhOxpUuzXXWhmZ051bRhAYE9sPAqwHizwCOIs7/8c9FI4kQqycyp6OIEZ9u/nPJR1fIOcNq2dMxkochnHqkNSbFS68SonfGiE0cCNlmqYenXJrl1BuT5fCuO2KN4d5sgbUPliO/0TveO5bYV3n/KshRL18f3rLbtK1proO+DnFnRtaikxpnovGfJh0l+r0YUK+zkA9KBeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByWvf/c6Q/IiPhIz+2kV/2HseAcaygeY/9npwYQVLkE=;
 b=HhGljOWOBHX6k0QRHh9BTw9AQXdecAoyLL7kmgyFayTXIMC2jwhwmi+jHacQldt8M6unxLolIfF4AiPMd4onQ2MlSWuxgERt4lrc80RSHFBGQ73OyamfpUEC/OMCXY3lnvwJ4GdaV5r52ioD1ZbS+EflE6Qs8c8XttIqz8TNoGE4A72Rw/C9SdzNzDWoSzDEdWzT7ZQ1r0NFCA9Ls54Ey9FF9XpUuiLEXevOusdv5XYO9jPAGc5vm1fEiWvjgQuUFI9VANyTR3jLWnujWe2Gp1IkUpVqsMheornwBLVEcOT1FWwsScg/5sfR8eykZAJrAb5uAa+2tv1jYsvTy08i9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByWvf/c6Q/IiPhIz+2kV/2HseAcaygeY/9npwYQVLkE=;
 b=AyXYaOkhVzbnhX3ggE/OYdcWQdKqSEZIYzgNINWsEX8beZywpwDJDFmJT4Ip21e74xfff2sjRNvVXLPwnDZ6ol/lCVwhe30OBZUnb+OhmpxXJydIsJ2XufptKq6ePUDkJpKHFxGX0FUsXXX0qFJbZaliskZisrkQZWgd36iIAX8=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA1PR08MB6992.namprd08.prod.outlook.com (2603:10b6:806:189::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.16; Sun, 24 Jan
 2021 03:43:32 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.014; Sun, 24 Jan 2021
 03:43:32 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 1/5] input: touchscreen: Move helper functions to core
Date:   Sat, 23 Jan 2021 21:42:52 -0600
Message-Id: <1611459776-23265-2-git-send-email-jeff@labundy.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611459776-23265-1-git-send-email-jeff@labundy.com>
References: <1611459776-23265-1-git-send-email-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:806:a7::19) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.173.128) by SA9PR10CA0014.namprd10.prod.outlook.com (2603:10b6:806:a7::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3784.12 via Frontend Transport; Sun, 24 Jan 2021 03:43:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58e6f9ff-5ba9-4e3c-dc4c-08d8c01a389b
X-MS-TrafficTypeDiagnostic: SA1PR08MB6992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA1PR08MB69920BE871DD5F02756B7E6BD3BE9@SA1PR08MB6992.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BC6sd0IDZrzEA2SEDH93kiXkjtUhISo1DoNIihhAf87rxNEWxTS1R9eWd57EPnUZZSpDHbarnCuu0SEfkVKoovGlopfFVrnuxMWEkeLEmnZQJVPyioiHwJAjagbqozZ7B4MVFlZ5IX+ffyTSvUunEaSlMOedijNOwBDe5YmyLOdLUVX4l6rDCWWIlofQr1tpQr2NlqJ+LVT6rwfHYM+1sSoGQhOUfCNhgD3qlufh/wO2gl3FUgKB7Som/A51bRL2dZlIHYjCsExpO04aA5XFW1yklVfRi8Uj12Nbfn6JfCjDltczSIjvbHv5TKZ6Jr52COVtqyrbUNuSKiochFi3ssF68RKNjxxxqdxY3zMOEVOfWuJsEdTByP21GTy2/xynqPbjOol5q7Olita1X124jFhUeAl19s7nRhCnRKdOu5aqXujyB54Z3Apf0funyeHiQL36/jBchpY3wqW08rZgsSXVm94qqD3XFf6DzOmlEpIynnx3OJtaWRZYvY0nz/p8rUq7Ai/xJkpB4zgG4s85eg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(136003)(39830400003)(346002)(52116002)(107886003)(5660300002)(66946007)(8676002)(6486002)(6506007)(66556008)(8936002)(36756003)(966005)(66476007)(86362001)(69590400011)(2616005)(83380400001)(4326008)(26005)(30864003)(16526019)(186003)(6512007)(6666004)(316002)(478600001)(2906002)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?9j57j5IpA7ym5jyxkW7xpQ5Ep+IP70ddMEMNQkfowQ+nbg6O3UN6AvRn3idO?=
 =?us-ascii?Q?PCJCYPQZCEmVSP+f/MjZoWT1dieCerRUYW2Pfh+TEnuzLDdUN3tpmaNFbyvT?=
 =?us-ascii?Q?jGTNKx1P8cRZo+VmDyMjtY9ieaydd8351caVwSy6hmkY9ssqy2POoJk/rk6Y?=
 =?us-ascii?Q?rtMtl3SlnZ6HjgKAhgTY+Jt8vZJmWB0dUZJUAmxsCi9oTtklBk3bcihFp7U1?=
 =?us-ascii?Q?DyEbyy44sPe1uLJWBt5svtGuxcMLUciwyVTQUNLUYi7Y+g6fAKcL+trm4gHp?=
 =?us-ascii?Q?s0ZbXpQcO3qa1RbM1nLY8ExhQCaa1rWX7zd6enzI7ZIEU3YMexQMkLnwADoK?=
 =?us-ascii?Q?ycfnhGfR5S2zWiJCLOz3M6qwXJ6B5QhAtjk+9ewKWfQXOD+FTEghwE2DTBv+?=
 =?us-ascii?Q?Do6NlveYTLNSFKn+IzcZaNPIlJXmb5Py3z8+z56TBlZEqQBH9c5EuMTgEvd2?=
 =?us-ascii?Q?ZgKFy/xK2Ep98wo9dDA767iSJUP+XOvrPvzyP3kxlHkPR9e19/aF+cstRHyd?=
 =?us-ascii?Q?xEsPD+H5Ftl64ETuqKbXx/xNzaLcYxLKXtKSoh1grZxEp2lovlpmNNCeatCS?=
 =?us-ascii?Q?GGeeP0lo8jxzR97qkcjUFqU66MAM9PUojUfAh4LQmpob/YGWM0ZEKQBTu5RK?=
 =?us-ascii?Q?SPhNsKJVQ3f3yheSpmisc/Rl1NOL+cy+QFBBLQ8l2Ky7qgLOpkuQc1z6cCUZ?=
 =?us-ascii?Q?eItHDuF7FCvn5rXWh0bU6yrQUKd2I6aX8ZwstRKIskpONus39eUIiRjy7juB?=
 =?us-ascii?Q?YBt/904mUZwG4A1OuS2qSwQCecUWJAfxF0/ucahVAJ7cMSI6M6+ciC5f+8FU?=
 =?us-ascii?Q?ZvjBEsQAbaCKi+ojfbBC7a6Bi2YaNtTl28Vp9VuHe/h1SV4AlWnNyQlQa/Ud?=
 =?us-ascii?Q?ZgMjCttTTGmYdoCo35QlKJbBROtFKS7HBgFHiOPBkVKlc2WIM8kHm6F97bCH?=
 =?us-ascii?Q?zvj1ealZ6lgP20Sr6v3M63lUwQQ19B4l0G2Sfz/WEwl2mK7KMfImYhQ1INUL?=
 =?us-ascii?Q?nWG4?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e6f9ff-5ba9-4e3c-dc4c-08d8c01a389b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2021 03:43:32.6277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7iFJJnSQrJjYhhuSAc9rcb1hswyVeBNNB2XZ/+EFuFcEK2bhQq+Wy5zu8jsRM35pMPVBGUzl83SMWvtGQE2IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR08MB6992
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some devices outside of drivers/input/touchscreen/ can still make
use of the touchscreen helper functions. Therefore, it was agreed
in [1] to move them outside of drivers/input/touchscreen/ so that
other devices can call them without INPUT_TOUCHSCREEN being set.

As part of this change, 'of' is dropped from the filename because
the helpers no longer actually use OF. No changes are made to the
file contents whatsoever.

[1] https://patchwork.kernel.org/patch/11924029/

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v2:
 - Added this patch to the series

 drivers/input/Makefile                     |   1 +
 drivers/input/touchscreen.c                | 206 +++++++++++++++++++++++++++++
 drivers/input/touchscreen/Kconfig          |   4 -
 drivers/input/touchscreen/Makefile         |   1 -
 drivers/input/touchscreen/of_touchscreen.c | 206 -----------------------------
 5 files changed, 207 insertions(+), 211 deletions(-)
 create mode 100644 drivers/input/touchscreen.c
 delete mode 100644 drivers/input/touchscreen/of_touchscreen.c

diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index d8f5310..037cc59 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -7,6 +7,7 @@

 obj-$(CONFIG_INPUT)		+= input-core.o
 input-core-y := input.o input-compat.o input-mt.o input-poller.o ff-core.o
+input-core-y += touchscreen.o

 obj-$(CONFIG_INPUT_FF_MEMLESS)	+= ff-memless.o
 obj-$(CONFIG_INPUT_SPARSEKMAP)	+= sparse-keymap.o
diff --git a/drivers/input/touchscreen.c b/drivers/input/touchscreen.c
new file mode 100644
index 0000000..97342e1
--- /dev/null
+++ b/drivers/input/touchscreen.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Generic DT helper functions for touchscreen devices
+ *
+ *  Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
+ */
+
+#include <linux/property.h>
+#include <linux/input.h>
+#include <linux/input/mt.h>
+#include <linux/input/touchscreen.h>
+#include <linux/module.h>
+
+static bool touchscreen_get_prop_u32(struct device *dev,
+				     const char *property,
+				     unsigned int default_value,
+				     unsigned int *value)
+{
+	u32 val;
+	int error;
+
+	error = device_property_read_u32(dev, property, &val);
+	if (error) {
+		*value = default_value;
+		return false;
+	}
+
+	*value = val;
+	return true;
+}
+
+static void touchscreen_set_params(struct input_dev *dev,
+				   unsigned long axis,
+				   int min, int max, int fuzz)
+{
+	struct input_absinfo *absinfo;
+
+	if (!test_bit(axis, dev->absbit)) {
+		dev_warn(&dev->dev,
+			 "DT specifies parameters but the axis %lu is not set up\n",
+			 axis);
+		return;
+	}
+
+	absinfo = &dev->absinfo[axis];
+	absinfo->minimum = min;
+	absinfo->maximum = max;
+	absinfo->fuzz = fuzz;
+}
+
+/**
+ * touchscreen_parse_properties - parse common touchscreen DT properties
+ * @input: input device that should be parsed
+ * @multitouch: specifies whether parsed properties should be applied to
+ *	single-touch or multi-touch axes
+ * @prop: pointer to a struct touchscreen_properties into which to store
+ *	axis swap and invert info for use with touchscreen_report_x_y();
+ *	or %NULL
+ *
+ * This function parses common DT properties for touchscreens and setups the
+ * input device accordingly. The function keeps previously set up default
+ * values if no value is specified via DT.
+ */
+void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
+				  struct touchscreen_properties *prop)
+{
+	struct device *dev = input->dev.parent;
+	struct input_absinfo *absinfo;
+	unsigned int axis, axis_x, axis_y;
+	unsigned int minimum, maximum, fuzz;
+	bool data_present;
+
+	input_alloc_absinfo(input);
+	if (!input->absinfo)
+		return;
+
+	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
+	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
+
+	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
+						input_abs_get_min(input, axis_x),
+						&minimum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
+						input_abs_get_max(input,
+								  axis_x) + 1,
+						&maximum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
+						input_abs_get_fuzz(input, axis_x),
+						&fuzz);
+	if (data_present)
+		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
+
+	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
+						input_abs_get_min(input, axis_y),
+						&minimum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
+						input_abs_get_max(input,
+								  axis_y) + 1,
+						&maximum) |
+		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
+						input_abs_get_fuzz(input, axis_y),
+						&fuzz);
+	if (data_present)
+		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
+
+	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
+	data_present = touchscreen_get_prop_u32(dev,
+						"touchscreen-max-pressure",
+						input_abs_get_max(input, axis),
+						&maximum) |
+		       touchscreen_get_prop_u32(dev,
+						"touchscreen-fuzz-pressure",
+						input_abs_get_fuzz(input, axis),
+						&fuzz);
+	if (data_present)
+		touchscreen_set_params(input, axis, 0, maximum, fuzz);
+
+	if (!prop)
+		return;
+
+	prop->max_x = input_abs_get_max(input, axis_x);
+	prop->max_y = input_abs_get_max(input, axis_y);
+
+	prop->invert_x =
+		device_property_read_bool(dev, "touchscreen-inverted-x");
+	if (prop->invert_x) {
+		absinfo = &input->absinfo[axis_x];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
+	prop->invert_y =
+		device_property_read_bool(dev, "touchscreen-inverted-y");
+	if (prop->invert_y) {
+		absinfo = &input->absinfo[axis_y];
+		absinfo->maximum -= absinfo->minimum;
+		absinfo->minimum = 0;
+	}
+
+	prop->swap_x_y =
+		device_property_read_bool(dev, "touchscreen-swapped-x-y");
+	if (prop->swap_x_y)
+		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
+}
+EXPORT_SYMBOL(touchscreen_parse_properties);
+
+static void
+touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
+			      unsigned int *x, unsigned int *y)
+{
+	if (prop->invert_x)
+		*x = prop->max_x - *x;
+
+	if (prop->invert_y)
+		*y = prop->max_y - *y;
+
+	if (prop->swap_x_y)
+		swap(*x, *y);
+}
+
+/**
+ * touchscreen_set_mt_pos - Set input_mt_pos coordinates
+ * @pos: input_mt_pos to set coordinates of
+ * @prop: pointer to a struct touchscreen_properties
+ * @x: X coordinate to store in pos
+ * @y: Y coordinate to store in pos
+ *
+ * Adjust the passed in x and y values applying any axis inversion and
+ * swapping requested in the passed in touchscreen_properties and store
+ * the result in a struct input_mt_pos.
+ */
+void touchscreen_set_mt_pos(struct input_mt_pos *pos,
+			    const struct touchscreen_properties *prop,
+			    unsigned int x, unsigned int y)
+{
+	touchscreen_apply_prop_to_x_y(prop, &x, &y);
+	pos->x = x;
+	pos->y = y;
+}
+EXPORT_SYMBOL(touchscreen_set_mt_pos);
+
+/**
+ * touchscreen_report_pos - Report touchscreen coordinates
+ * @input: input_device to report coordinates for
+ * @prop: pointer to a struct touchscreen_properties
+ * @x: X coordinate to report
+ * @y: Y coordinate to report
+ * @multitouch: Report coordinates on single-touch or multi-touch axes
+ *
+ * Adjust the passed in x and y values applying any axis inversion and
+ * swapping requested in the passed in touchscreen_properties and then
+ * report the resulting coordinates on the input_dev's x and y axis.
+ */
+void touchscreen_report_pos(struct input_dev *input,
+			    const struct touchscreen_properties *prop,
+			    unsigned int x, unsigned int y,
+			    bool multitouch)
+{
+	touchscreen_apply_prop_to_x_y(prop, &x, &y);
+	input_report_abs(input, multitouch ? ABS_MT_POSITION_X : ABS_X, x);
+	input_report_abs(input, multitouch ? ABS_MT_POSITION_Y : ABS_Y, y);
+}
+EXPORT_SYMBOL(touchscreen_report_pos);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Device-tree helpers functions for touchscreen devices");
diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index f012fe7..4c33278 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -12,10 +12,6 @@ menuconfig INPUT_TOUCHSCREEN

 if INPUT_TOUCHSCREEN

-config TOUCHSCREEN_PROPERTIES
-	def_tristate INPUT
-	depends on INPUT
-
 config TOUCHSCREEN_88PM860X
 	tristate "Marvell 88PM860x touchscreen"
 	depends on MFD_88PM860X
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 6233541..80cd241 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -7,7 +7,6 @@

 wm97xx-ts-y := wm97xx-core.o

-obj-$(CONFIG_TOUCHSCREEN_PROPERTIES)	+= of_touchscreen.o
 obj-$(CONFIG_TOUCHSCREEN_88PM860X)	+= 88pm860x-ts.o
 obj-$(CONFIG_TOUCHSCREEN_AD7877)	+= ad7877.o
 obj-$(CONFIG_TOUCHSCREEN_AD7879)	+= ad7879.o
diff --git a/drivers/input/touchscreen/of_touchscreen.c b/drivers/input/touchscreen/of_touchscreen.c
deleted file mode 100644
index 97342e1..0000000
--- a/drivers/input/touchscreen/of_touchscreen.c
+++ /dev/null
@@ -1,206 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Generic DT helper functions for touchscreen devices
- *
- *  Copyright (c) 2014 Sebastian Reichel <sre@kernel.org>
- */
-
-#include <linux/property.h>
-#include <linux/input.h>
-#include <linux/input/mt.h>
-#include <linux/input/touchscreen.h>
-#include <linux/module.h>
-
-static bool touchscreen_get_prop_u32(struct device *dev,
-				     const char *property,
-				     unsigned int default_value,
-				     unsigned int *value)
-{
-	u32 val;
-	int error;
-
-	error = device_property_read_u32(dev, property, &val);
-	if (error) {
-		*value = default_value;
-		return false;
-	}
-
-	*value = val;
-	return true;
-}
-
-static void touchscreen_set_params(struct input_dev *dev,
-				   unsigned long axis,
-				   int min, int max, int fuzz)
-{
-	struct input_absinfo *absinfo;
-
-	if (!test_bit(axis, dev->absbit)) {
-		dev_warn(&dev->dev,
-			 "DT specifies parameters but the axis %lu is not set up\n",
-			 axis);
-		return;
-	}
-
-	absinfo = &dev->absinfo[axis];
-	absinfo->minimum = min;
-	absinfo->maximum = max;
-	absinfo->fuzz = fuzz;
-}
-
-/**
- * touchscreen_parse_properties - parse common touchscreen DT properties
- * @input: input device that should be parsed
- * @multitouch: specifies whether parsed properties should be applied to
- *	single-touch or multi-touch axes
- * @prop: pointer to a struct touchscreen_properties into which to store
- *	axis swap and invert info for use with touchscreen_report_x_y();
- *	or %NULL
- *
- * This function parses common DT properties for touchscreens and setups the
- * input device accordingly. The function keeps previously set up default
- * values if no value is specified via DT.
- */
-void touchscreen_parse_properties(struct input_dev *input, bool multitouch,
-				  struct touchscreen_properties *prop)
-{
-	struct device *dev = input->dev.parent;
-	struct input_absinfo *absinfo;
-	unsigned int axis, axis_x, axis_y;
-	unsigned int minimum, maximum, fuzz;
-	bool data_present;
-
-	input_alloc_absinfo(input);
-	if (!input->absinfo)
-		return;
-
-	axis_x = multitouch ? ABS_MT_POSITION_X : ABS_X;
-	axis_y = multitouch ? ABS_MT_POSITION_Y : ABS_Y;
-
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-x",
-						input_abs_get_min(input, axis_x),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-x",
-						input_abs_get_max(input,
-								  axis_x) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-x",
-						input_abs_get_fuzz(input, axis_x),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis_x, minimum, maximum - 1, fuzz);
-
-	data_present = touchscreen_get_prop_u32(dev, "touchscreen-min-y",
-						input_abs_get_min(input, axis_y),
-						&minimum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-size-y",
-						input_abs_get_max(input,
-								  axis_y) + 1,
-						&maximum) |
-		       touchscreen_get_prop_u32(dev, "touchscreen-fuzz-y",
-						input_abs_get_fuzz(input, axis_y),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis_y, minimum, maximum - 1, fuzz);
-
-	axis = multitouch ? ABS_MT_PRESSURE : ABS_PRESSURE;
-	data_present = touchscreen_get_prop_u32(dev,
-						"touchscreen-max-pressure",
-						input_abs_get_max(input, axis),
-						&maximum) |
-		       touchscreen_get_prop_u32(dev,
-						"touchscreen-fuzz-pressure",
-						input_abs_get_fuzz(input, axis),
-						&fuzz);
-	if (data_present)
-		touchscreen_set_params(input, axis, 0, maximum, fuzz);
-
-	if (!prop)
-		return;
-
-	prop->max_x = input_abs_get_max(input, axis_x);
-	prop->max_y = input_abs_get_max(input, axis_y);
-
-	prop->invert_x =
-		device_property_read_bool(dev, "touchscreen-inverted-x");
-	if (prop->invert_x) {
-		absinfo = &input->absinfo[axis_x];
-		absinfo->maximum -= absinfo->minimum;
-		absinfo->minimum = 0;
-	}
-
-	prop->invert_y =
-		device_property_read_bool(dev, "touchscreen-inverted-y");
-	if (prop->invert_y) {
-		absinfo = &input->absinfo[axis_y];
-		absinfo->maximum -= absinfo->minimum;
-		absinfo->minimum = 0;
-	}
-
-	prop->swap_x_y =
-		device_property_read_bool(dev, "touchscreen-swapped-x-y");
-	if (prop->swap_x_y)
-		swap(input->absinfo[axis_x], input->absinfo[axis_y]);
-}
-EXPORT_SYMBOL(touchscreen_parse_properties);
-
-static void
-touchscreen_apply_prop_to_x_y(const struct touchscreen_properties *prop,
-			      unsigned int *x, unsigned int *y)
-{
-	if (prop->invert_x)
-		*x = prop->max_x - *x;
-
-	if (prop->invert_y)
-		*y = prop->max_y - *y;
-
-	if (prop->swap_x_y)
-		swap(*x, *y);
-}
-
-/**
- * touchscreen_set_mt_pos - Set input_mt_pos coordinates
- * @pos: input_mt_pos to set coordinates of
- * @prop: pointer to a struct touchscreen_properties
- * @x: X coordinate to store in pos
- * @y: Y coordinate to store in pos
- *
- * Adjust the passed in x and y values applying any axis inversion and
- * swapping requested in the passed in touchscreen_properties and store
- * the result in a struct input_mt_pos.
- */
-void touchscreen_set_mt_pos(struct input_mt_pos *pos,
-			    const struct touchscreen_properties *prop,
-			    unsigned int x, unsigned int y)
-{
-	touchscreen_apply_prop_to_x_y(prop, &x, &y);
-	pos->x = x;
-	pos->y = y;
-}
-EXPORT_SYMBOL(touchscreen_set_mt_pos);
-
-/**
- * touchscreen_report_pos - Report touchscreen coordinates
- * @input: input_device to report coordinates for
- * @prop: pointer to a struct touchscreen_properties
- * @x: X coordinate to report
- * @y: Y coordinate to report
- * @multitouch: Report coordinates on single-touch or multi-touch axes
- *
- * Adjust the passed in x and y values applying any axis inversion and
- * swapping requested in the passed in touchscreen_properties and then
- * report the resulting coordinates on the input_dev's x and y axis.
- */
-void touchscreen_report_pos(struct input_dev *input,
-			    const struct touchscreen_properties *prop,
-			    unsigned int x, unsigned int y,
-			    bool multitouch)
-{
-	touchscreen_apply_prop_to_x_y(prop, &x, &y);
-	input_report_abs(input, multitouch ? ABS_MT_POSITION_X : ABS_X, x);
-	input_report_abs(input, multitouch ? ABS_MT_POSITION_Y : ABS_Y, y);
-}
-EXPORT_SYMBOL(touchscreen_report_pos);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Device-tree helpers functions for touchscreen devices");
--
2.7.4

