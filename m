Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 968501A3599
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 16:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbgDIOOM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 10:14:12 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:34763 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727235AbgDIOOL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 10:14:11 -0400
Received: from localhost (unknown [78.193.40.249])
        (Authenticated sender: kamel.bouhara@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id D3D4820000B;
        Thu,  9 Apr 2020 14:14:08 +0000 (UTC)
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     William Breathitt Gray <vilhelm.gray@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-iio@vger.kernel.org,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH v2 3/3] counter: Add atmel TCB capture counter
Date:   Thu,  9 Apr 2020 16:14:01 +0200
Message-Id: <20200409141401.321222-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200409141401.321222-1-kamel.bouhara@bootlin.com>
References: <20200409141401.321222-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This drivers allows to use the capture mode of the Timer Counter Block
hardware block available in Atmel SoCs through the counter subsystem.

Two functions of the counter are supported for the moment: period
capture and quadrature decoder. The latter is only supported by the
SAMA5 series of SoCs.

For the period capture mode a basic setup has been chosen that will
reset the counter each time the period is actually reached. Of course
the device offers much more possibilities.

For quadrature mode, both channel 0 and 1 must be configured even if we
only capture the position (no revolution/rotation).

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes from v2:
 - Updated return code to -EINVAL when user is requesting qdec mode on
   a counter device not supporting it.
 - Added an error case returning -EINVAL when action edge is performed in
   qdec mode.
 - Removed no need to explicity setting ops to NULL from static struct as
   it is the default value.
 - Changed confusing code by using snprintf for the sake of clarity.
 - Changed code to use ARRAY_SIZE so that future reviewers will know
   that num_counts matches what's in the atmel_tc_count array without
   having to check so themselves.

 drivers/counter/Kconfig             |  11 +
 drivers/counter/Makefile            |   1 +
 drivers/counter/atmel-tcb-capture.c | 394 ++++++++++++++++++++++++++++
 3 files changed, 406 insertions(+)
 create mode 100644 drivers/counter/atmel-tcb-capture.c

diff --git a/drivers/counter/Kconfig b/drivers/counter/Kconfig
index c80fa76bb531..c50d7453ec33 100644
--- a/drivers/counter/Kconfig
+++ b/drivers/counter/Kconfig
@@ -70,4 +70,15 @@ config FTM_QUADDEC
 	  To compile this driver as a module, choose M here: the
 	  module will be called ftm-quaddec.

+config ATMEL_TCB_CAPTURE
+	tristate "Atmel Timer Counter Capture driver"
+	depends on HAS_IOMEM && OF
+	select REGMAP_MMIO
+	help
+	  Select this option to enable the Atmel Timer Counter Block
+	  capture driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called atmel-tcb-capture.
+
 endif # COUNTER
diff --git a/drivers/counter/Makefile b/drivers/counter/Makefile
index 55142d1f4c43..70c5b8924588 100644
--- a/drivers/counter/Makefile
+++ b/drivers/counter/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_STM32_TIMER_CNT)	+= stm32-timer-cnt.o
 obj-$(CONFIG_STM32_LPTIMER_CNT)	+= stm32-lptimer-cnt.o
 obj-$(CONFIG_TI_EQEP)		+= ti-eqep.o
 obj-$(CONFIG_FTM_QUADDEC)	+= ftm-quaddec.o
+obj-$(CONFIG_ATMEL_TCB_CAPTURE)	+= atmel-tcb-capture.o
diff --git a/drivers/counter/atmel-tcb-capture.c b/drivers/counter/atmel-tcb-capture.c
new file mode 100644
index 000000000000..4f2b3d60584f
--- /dev/null
+++ b/drivers/counter/atmel-tcb-capture.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/**
+ * Copyright (C) 2020 Atmel
+ *
+ * Author: Kamel Bouhara <kamel.bouhara@bootlin.com>
+ *
+ */
+#include <linux/clk.h>
+#include <linux/counter.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <soc/at91/atmel_tcb.h>
+
+#define ATMEL_TC_CMR_MASK	(ATMEL_TC_LDRA_RISING | ATMEL_TC_LDRB_FALLING | \
+				 ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_LDBDIS | \
+				 ATMEL_TC_LDBSTOP)
+
+#define ATMEL_TC_QDEN			BIT(8)
+#define ATMEL_TC_POSEN			BIT(9)
+
+struct atmel_tc_data {
+	const struct atmel_tcb_config *tc_cfg;
+	struct counter_device counter;
+	struct regmap *regmap;
+	int qdec_mode;
+	int num_channels;
+	int channel[2];
+	bool trig_inverted;
+};
+
+enum atmel_tc_count_function {
+	ATMEL_TC_FUNCTION_INCREASE,
+	ATMEL_TC_FUNCTION_QUADRATURE,
+};
+
+static enum counter_count_function atmel_tc_count_functions[] = {
+	[ATMEL_TC_FUNCTION_INCREASE] = COUNTER_COUNT_FUNCTION_INCREASE,
+	[ATMEL_TC_FUNCTION_QUADRATURE] = COUNTER_COUNT_FUNCTION_QUADRATURE_X4,
+};
+
+enum atmel_tc_synapse_action {
+	ATMEL_TC_SYNAPSE_ACTION_NONE = 0,
+	ATMEL_TC_SYNAPSE_ACTION_RISING_EDGE,
+	ATMEL_TC_SYNAPSE_ACTION_FALLING_EDGE,
+	ATMEL_TC_SYNAPSE_ACTION_BOTH_EDGE
+};
+
+static enum counter_synapse_action atmel_tc_synapse_actions[] = {
+	[ATMEL_TC_SYNAPSE_ACTION_NONE] = COUNTER_SYNAPSE_ACTION_NONE,
+	[ATMEL_TC_SYNAPSE_ACTION_RISING_EDGE] = COUNTER_SYNAPSE_ACTION_RISING_EDGE,
+	[ATMEL_TC_SYNAPSE_ACTION_FALLING_EDGE] = COUNTER_SYNAPSE_ACTION_FALLING_EDGE,
+	[ATMEL_TC_SYNAPSE_ACTION_BOTH_EDGE] = COUNTER_SYNAPSE_ACTION_BOTH_EDGES,
+};
+
+static struct counter_signal atmel_tc_count_signals[] = {
+	{
+		.id = 0,
+		.name = "Channel A",
+	},
+	{
+		.id = 1,
+		.name = "Channel B",
+	}
+};
+
+static struct counter_synapse atmel_tc_count_synapses[] = {
+	{
+		.actions_list = atmel_tc_synapse_actions,
+		.num_actions = ARRAY_SIZE(atmel_tc_synapse_actions),
+		.signal = &atmel_tc_count_signals[0]
+	},
+	{
+		.actions_list = atmel_tc_synapse_actions,
+		.num_actions = ARRAY_SIZE(atmel_tc_synapse_actions),
+		.signal = &atmel_tc_count_signals[1]
+	}
+};
+
+static int atmel_tc_count_function_get(struct counter_device *counter,
+				       struct counter_count *count,
+				       size_t *function)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+
+	if (priv->qdec_mode)
+		*function = ATMEL_TC_FUNCTION_QUADRATURE;
+	else
+		*function = ATMEL_TC_FUNCTION_INCREASE;
+
+	return 0;
+}
+
+static int atmel_tc_count_function_set(struct counter_device *counter,
+				       struct counter_count *count,
+				       size_t function)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+	u32 bmr, cmr;
+
+	regmap_read(priv->regmap, ATMEL_TC_BMR, &bmr);
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], CMR), &cmr);
+
+	/* Set capture mode */
+	cmr &= ~ATMEL_TC_WAVE;
+
+	switch (function) {
+	case ATMEL_TC_FUNCTION_INCREASE:
+		priv->qdec_mode = 0;
+		/* Set highest rate based on whether soc has gclk or not */
+		bmr &= ~(ATMEL_TC_QDEN | ATMEL_TC_POSEN);
+		if (priv->tc_cfg->has_gclk)
+			cmr |= ATMEL_TC_TIMER_CLOCK2;
+		else
+			cmr |= ATMEL_TC_TIMER_CLOCK1;
+		/* Setup the period capture mode */
+		cmr |=  ATMEL_TC_CMR_MASK;
+		cmr &= ~(ATMEL_TC_ABETRG | ATMEL_TC_XC0);
+		break;
+	case ATMEL_TC_FUNCTION_QUADRATURE:
+		if (!priv->tc_cfg->has_qdec)
+			return -EINVAL;
+		/* In QDEC mode settings both channels 0 and 1 are required */
+		if (priv->num_channels < 2 || priv->channel[0] != 0 ||
+		    priv->channel[1] != 1) {
+			pr_err("Invalid channels number or id for quadrature mode\n");
+			return -EINVAL;
+		}
+		priv->qdec_mode = 1;
+		bmr |= ATMEL_TC_QDEN | ATMEL_TC_POSEN;
+		cmr |= ATMEL_TC_ETRGEDG_RISING | ATMEL_TC_ABETRG | ATMEL_TC_XC0;
+		break;
+	}
+
+	regmap_write(priv->regmap, ATMEL_TC_BMR, bmr);
+	regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], CMR), cmr);
+
+	/* Enable clock and trigger counter */
+	regmap_write(priv->regmap, ATMEL_TC_REG(priv->channel[0], CCR),
+		     ATMEL_TC_CLKEN | ATMEL_TC_SWTRG);
+
+	if (priv->qdec_mode) {
+		regmap_write(priv->regmap,
+			     ATMEL_TC_REG(priv->channel[1], CMR), cmr);
+		regmap_write(priv->regmap,
+			     ATMEL_TC_REG(priv->channel[1], CCR),
+			     ATMEL_TC_CLKEN | ATMEL_TC_SWTRG);
+	}
+
+	return 0;
+}
+
+static int atmel_tc_count_signal_read(struct counter_device *counter,
+				      struct counter_signal *signal,
+				      enum counter_signal_value *val)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+	bool sigstatus;
+	u32 sr;
+
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], SR), &sr);
+
+	if (priv->trig_inverted)
+		sigstatus = (sr & ATMEL_TC_MTIOB);
+	else
+		sigstatus = (sr & ATMEL_TC_MTIOA);
+
+	*val = sigstatus ? COUNTER_SIGNAL_HIGH : COUNTER_SIGNAL_LOW;
+
+	return 0;
+}
+
+static int atmel_tc_count_action_get(struct counter_device *counter,
+				     struct counter_count *count,
+				     struct counter_synapse *synapse,
+				     size_t *action)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+	u32 cmr;
+
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], CMR), &cmr);
+
+	*action = ATMEL_TC_SYNAPSE_ACTION_NONE;
+
+	if (cmr & ATMEL_TC_ETRGEDG_NONE)
+		*action = ATMEL_TC_SYNAPSE_ACTION_NONE;
+	else if (cmr & ATMEL_TC_ETRGEDG_RISING)
+		*action = ATMEL_TC_SYNAPSE_ACTION_RISING_EDGE;
+	else if (cmr & ATMEL_TC_ETRGEDG_FALLING)
+		*action = ATMEL_TC_SYNAPSE_ACTION_FALLING_EDGE;
+	else if (cmr & ATMEL_TC_ETRGEDG_BOTH)
+		*action = ATMEL_TC_SYNAPSE_ACTION_BOTH_EDGE;
+
+	return 0;
+}
+
+static int atmel_tc_count_action_set(struct counter_device *counter,
+				     struct counter_count *count,
+				     struct counter_synapse *synapse,
+				     size_t action)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+	u32 edge = ATMEL_TC_ETRGEDG_NONE;
+
+	/* QDEC mode is rising edge only */
+	if (priv->qdec_mode)
+		return -EINVAL;
+
+	switch (action) {
+	case ATMEL_TC_SYNAPSE_ACTION_NONE:
+		edge = ATMEL_TC_ETRGEDG_NONE;
+		break;
+	case ATMEL_TC_SYNAPSE_ACTION_RISING_EDGE:
+		edge = ATMEL_TC_ETRGEDG_RISING;
+		break;
+	case ATMEL_TC_SYNAPSE_ACTION_FALLING_EDGE:
+		edge = ATMEL_TC_ETRGEDG_FALLING;
+		break;
+	case ATMEL_TC_SYNAPSE_ACTION_BOTH_EDGE:
+		edge = ATMEL_TC_ETRGEDG_BOTH;
+		break;
+	}
+
+	return regmap_write_bits(priv->regmap,
+				ATMEL_TC_REG(priv->channel[0], CMR),
+				ATMEL_TC_ETRGEDG, edge);
+}
+
+static int atmel_tc_count_read(struct counter_device *counter,
+			       struct counter_count *count,
+			       unsigned long *val)
+{
+	struct atmel_tc_data *const priv = counter->priv;
+	u32 cnt;
+
+	regmap_read(priv->regmap, ATMEL_TC_REG(priv->channel[0], CV), &cnt);
+	*val = cnt;
+
+	return 0;
+}
+
+static struct counter_count atmel_tc_counts[] = {
+	{
+		.id = 0,
+		.name = "Timer Counter",
+		.functions_list = atmel_tc_count_functions,
+		.num_functions = ARRAY_SIZE(atmel_tc_count_functions),
+		.synapses = atmel_tc_count_synapses,
+		.num_synapses = ARRAY_SIZE(atmel_tc_count_synapses),
+	},
+};
+
+static struct counter_ops atmel_tc_ops = {
+	.signal_read  = atmel_tc_count_signal_read,
+	.count_read   = atmel_tc_count_read,
+	.function_get = atmel_tc_count_function_get,
+	.function_set = atmel_tc_count_function_set,
+	.action_get   = atmel_tc_count_action_get,
+	.action_set   = atmel_tc_count_action_set
+};
+
+static const struct atmel_tcb_config tcb_rm9200_config = {
+		.counter_width = 16,
+};
+
+static const struct atmel_tcb_config tcb_sam9x5_config = {
+		.counter_width = 32,
+};
+
+static const struct atmel_tcb_config tcb_sama5d2_config = {
+		.counter_width = 32,
+		.has_gclk = true,
+		.has_qdec = true,
+};
+
+static const struct atmel_tcb_config tcb_sama5d3_config = {
+		.counter_width = 32,
+		.has_qdec = true,
+};
+
+static const struct of_device_id atmel_tc_of_match[] = {
+	{ .compatible = "atmel,at91rm9200-tcb", .data = &tcb_rm9200_config, },
+	{ .compatible = "atmel,at91sam9x5-tcb", .data = &tcb_sam9x5_config, },
+	{ .compatible = "atmel,sama5d2-tcb", .data = &tcb_sama5d2_config, },
+	{ .compatible = "atmel,sama5d3-tcb", .data = &tcb_sama5d3_config, },
+	{ /* sentinel */ }
+};
+
+static int atmel_tc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	const struct atmel_tcb_config *tcb_config;
+	const struct of_device_id *match;
+	struct atmel_tc_data *priv;
+	char clk_name[7];
+	struct regmap *regmap;
+	struct clk *clk[3];
+	int channel;
+	int ret, i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	match = of_match_node(atmel_tc_of_match, np->parent);
+	tcb_config = match->data;
+	if (!tcb_config) {
+		dev_err(&pdev->dev, "No matching parent node found\n");
+		return -ENODEV;
+	}
+
+	regmap = syscon_node_to_regmap(np->parent);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	/* max. channels number is 2 when in QDEC mode */
+	priv->num_channels = of_property_count_u32_elems(np, "reg");
+	if (priv->num_channels < 0) {
+		dev_err(&pdev->dev, "Invalid or missing channel\n");
+		return -EINVAL;
+	}
+
+	/* Register channels and initialize clocks */
+	for (i = 0; i < priv->num_channels; i++) {
+		ret = of_property_read_u32_index(np, "reg", i, &channel);
+		if (ret < 0 || channel > 2)
+			return -ENODEV;
+
+		priv->channel[i] = channel;
+
+		snprintf(clk_name, sizeof(clk_name), "t%d_clk", channel);
+
+		clk[i] = of_clk_get_by_name(np->parent, clk_name);
+		if (IS_ERR(clk[i])) {
+			/* Fallback to t0_clk */
+			clk[i] = of_clk_get_by_name(np->parent, "t0_clk");
+			if (IS_ERR(clk[i]))
+				return PTR_ERR(clk[i]);
+		}
+
+		ret = clk_prepare_enable(clk[i]);
+		if (ret)
+			return ret;
+
+		dev_info(&pdev->dev,
+			 "Initialized capture mode on channel %d\n",
+			 channel);
+	}
+
+	priv->tc_cfg = tcb_config;
+	priv->regmap = regmap;
+	priv->counter.name = dev_name(&pdev->dev);
+	priv->counter.parent = &pdev->dev;
+	priv->counter.ops = &atmel_tc_ops;
+	priv->counter.num_counts = ARRAY_SIZE(atmel_tc_counts);
+	priv->counter.counts = atmel_tc_counts;
+	priv->counter.num_signals = ARRAY_SIZE(atmel_tc_count_signals);
+	priv->counter.signals = atmel_tc_count_signals;
+	priv->counter.priv = priv;
+
+	ret = devm_counter_register(&pdev->dev, &priv->counter);
+	if (ret < 0) {
+		for (i = 0; i < priv->num_channels; i++)
+			clk_disable_unprepare(clk[i]);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id atmel_tc_dt_ids[] = {
+	{ .compatible = "atmel,tcb-capture", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, atmel_tc_dt_ids);
+
+static struct platform_driver atmel_tc_driver = {
+	.probe = atmel_tc_probe,
+	.driver = {
+		.name = "atmel-tcb-capture",
+		.of_match_table = atmel_tc_dt_ids,
+	},
+};
+module_platform_driver(atmel_tc_driver);
+
+MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
+MODULE_DESCRIPTION("Atmel TCB Capture driver");
+MODULE_LICENSE("GPL v2");
--
2.25.0

