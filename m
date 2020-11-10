Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189452AD1C6
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 09:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731819AbgKJIuv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 03:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731643AbgKJIuu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 03:50:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A66C0613D4
        for <linux-input@vger.kernel.org>; Tue, 10 Nov 2020 00:50:50 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kcPMT-0004bp-Bm; Tue, 10 Nov 2020 09:50:45 +0100
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kcPMS-0004GA-65; Tue, 10 Nov 2020 09:50:44 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-spi@vger.kernel.org, David Jander <david@protonic.nl>
Subject: [PATCH v2 2/2] Input: ads7846: convert to one message
Date:   Tue, 10 Nov 2020 09:50:41 +0100
Message-Id: <20201110085041.16303-3-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201110085041.16303-1-o.rempel@pengutronix.de>
References: <20201110085041.16303-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Convert multiple full duplex transfers in to a single transfer to reduce
CPU load.

Current driver version support following filtering modes:
- ads7846_no_filter() - not filtered
- ads7846_debounce_filter() - driver specific debounce filter
- pdata->filter - platform specific debounce filter (do any platform
	provides such filter?)

Without filter this HW is not really usable, since the physic of
resistive touchscreen can provide some bounce effects. With driver internal
filter, we have constant amount of retries + debounce retries if some anomaly
was detected.

High amount of tiny SPI transfers is the primer reason of high CPU load
and interrupt frequency.

This patch create one SPI transfer with all fields and not optional retires. If
bounce anomaly was detected, we will make more transfer if needed.

Without this patch, we will get about 10% CPU load on iMX6S on pen-down event.
For example by holding stylus on the screen.

With this patch, depending in the amount of retries, the CPU load will
be 1% with "ti,debounce-rep = <3>".

One buffer transfer allows us to use PIO FIFO or DMA engine, depending
on the platform.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/input/touchscreen/ads7846.c | 375 ++++++++++++++--------------
 1 file changed, 193 insertions(+), 182 deletions(-)

diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index e9a520c9ad69..d6c6a13af4ea 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -64,23 +64,13 @@
 
 struct ads7846_buf {
 	u8 cmd;
-	/* This union is a temporary hack. The driver does an in-place
-	 * endianness conversion. This will be cleaned up in the next
-	 * patch.
-	 */
-	union {
-		__be16 data_be16;
-		u16 data;
-	};
+	__be16 data;
 } __attribute__((__packed__));
 
-
-struct ts_event {
-	bool ignore;
-	struct ads7846_buf x;
-	struct ads7846_buf y;
-	struct ads7846_buf z1;
-	struct ads7846_buf z2;
+struct ads7846_buf_layout {
+	unsigned int offset;
+	unsigned int count;
+	unsigned int skip;
 };
 
 /*
@@ -89,12 +79,18 @@ struct ts_event {
  * systems where main memory is not DMA-coherent (most non-x86 boards).
  */
 struct ads7846_packet {
-	struct ts_event tc;
-	struct ads7846_buf read_x_cmd;
-	struct ads7846_buf read_y_cmd;
-	struct ads7846_buf read_z1_cmd;
-	struct ads7846_buf read_z2_cmd;
+	unsigned int count;
+	unsigned int count_skip;
+	unsigned int cmds;
+	unsigned int last_cmd_idx;
+	struct ads7846_buf_layout l[5];
+	struct ads7846_buf *rx;
+	struct ads7846_buf *tx;
+
 	struct ads7846_buf pwrdown_cmd;
+
+	bool ignore;
+	u16 x, y, z1, z2;
 };
 
 struct ads7846 {
@@ -193,7 +189,6 @@ struct ads7846 {
 #define	READ_Y(vref)	(READ_12BIT_DFR(y,  1, vref))
 #define	READ_Z1(vref)	(READ_12BIT_DFR(z1, 1, vref))
 #define	READ_Z2(vref)	(READ_12BIT_DFR(z2, 1, vref))
-
 #define	READ_X(vref)	(READ_12BIT_DFR(x,  1, vref))
 #define	PWRDOWN		(READ_12BIT_DFR(y,  0, 0))	/* LAST */
 
@@ -206,6 +201,21 @@ struct ads7846 {
 #define	REF_ON	(READ_12BIT_DFR(x, 1, 1))
 #define	REF_OFF	(READ_12BIT_DFR(y, 0, 0))
 
+/* Order commands in the most optimal way to reduce Vref switching and
+ * settling time:
+ * Measure:  X; Vref: X+, X-; IN: Y+
+ * Measure:  Y; Vref: Y+, Y-; IN: X+
+ * Measure: Z1; Vref: Y+, X-; IN: X+
+ * Measure: Z2; Vref: Y+, X-; IN: Y-
+ */
+enum ads7846_cmds {
+	ADS7846_X,
+	ADS7846_Y,
+	ADS7846_Z1,
+	ADS7846_Z2,
+	ADS7846_PWDOWN,
+};
+
 static int get_pendown_state(struct ads7846 *ts)
 {
 	if (ts->get_pendown_state)
@@ -696,26 +706,109 @@ static int ads7846_no_filter(void *ads, int data_idx, int *val)
 	return ADS7846_FILTER_OK;
 }
 
-static int ads7846_get_value(struct ads7846 *ts, struct spi_message *m)
+static int ads7846_get_value(struct ads7846_buf *buf)
 {
 	int value;
-	struct spi_transfer *t =
-		list_entry(m->transfers.prev, struct spi_transfer, transfer_list);
-	struct ads7846_buf *buf = t->rx_buf;
 
-	value = be16_to_cpup(&buf->data_be16);
+	value = be16_to_cpup(&buf->data);
 
 	/* enforce ADC output is 12 bits width */
 	return (value >> 3) & 0xfff;
 }
 
-static void ads7846_update_value(struct spi_message *m, int val)
+static void ads7846_set_cmd_val(struct ads7846 *ts, enum ads7846_cmds cmd_idx,
+				u16 val)
+{
+	struct ads7846_packet *packet = ts->packet;
+
+	switch (cmd_idx) {
+	case ADS7846_Y:
+		packet->y = val;
+		break;
+	case ADS7846_X:
+		packet->x = val;
+		break;
+	case ADS7846_Z1:
+		packet->z1 = val;
+		break;
+	case ADS7846_Z2:
+		packet->z2 = val;
+		break;
+	default:
+		WARN_ON_ONCE(1);
+	}
+}
+
+static u8 ads7846_get_cmd(enum ads7846_cmds cmd_idx, int vref)
+{
+	switch (cmd_idx) {
+	case ADS7846_Y:
+		return READ_Y(vref);
+	case ADS7846_X:
+		return READ_X(vref);
+
+	/* 7846 specific commands  */
+	case ADS7846_Z1:
+		return READ_Z1(vref);
+	case ADS7846_Z2:
+		return READ_Z2(vref);
+	case ADS7846_PWDOWN:
+		return PWRDOWN;
+	default:
+		WARN_ON_ONCE(1);
+	}
+
+	return 0;
+}
+
+static bool ads7846_cmd_need_settle(enum ads7846_cmds cmd_idx)
+{
+	switch (cmd_idx) {
+	case ADS7846_X:
+	case ADS7846_Y:
+	case ADS7846_Z1:
+	case ADS7846_Z2:
+		return true;
+	case ADS7846_PWDOWN:
+		return false;
+	default:
+		WARN_ON_ONCE(1);
+	}
+
+	return false;
+}
+
+static int ads7846_filter(struct ads7846 *ts)
 {
-	struct spi_transfer *t =
-		list_entry(m->transfers.prev, struct spi_transfer, transfer_list);
-	struct ads7846_buf *buf = t->rx_buf;
+	struct ads7846_packet *packet = ts->packet;
+	int action;
+	int val;
+	unsigned int cmd_idx, b;
+
+	packet->ignore = false;
+	for (cmd_idx = packet->last_cmd_idx; cmd_idx < packet->cmds - 1; cmd_idx++) {
+		struct ads7846_buf_layout *l = &packet->l[cmd_idx];
 
-	buf->data = val;
+		packet->last_cmd_idx = cmd_idx;
+
+		for (b = l->skip; b < l->count; b++) {
+			val = ads7846_get_value(&packet->rx[l->offset + b]);
+
+			action = ts->filter(ts->filter_data, cmd_idx, &val);
+			if (action == ADS7846_FILTER_REPEAT) {
+				if (b == l->count - 1)
+					return -EAGAIN;
+			} else if (action == ADS7846_FILTER_OK) {
+				ads7846_set_cmd_val(ts, cmd_idx, val);
+				break;
+			} else {
+				packet->ignore = true;
+				return 0;
+			}
+		}
+	}
+
+	return 0;
 }
 
 static void ads7846_read_state(struct ads7846 *ts)
@@ -723,52 +816,26 @@ static void ads7846_read_state(struct ads7846 *ts)
 	struct ads7846_packet *packet = ts->packet;
 	struct spi_message *m;
 	int msg_idx = 0;
-	int val;
-	int action;
 	int error;
 
-	while (msg_idx < ts->msg_count) {
+	packet->last_cmd_idx = 0;
 
+	while (true) {
 		ts->wait_for_sync();
 
 		m = &ts->msg[msg_idx];
 		error = spi_sync(ts->spi, m);
 		if (error) {
 			dev_err(&ts->spi->dev, "spi_sync --> %d\n", error);
-			packet->tc.ignore = true;
+			packet->ignore = true;
 			return;
 		}
 
-		/*
-		 * Last message is power down request, no need to convert
-		 * or filter the value.
-		 */
-		if (msg_idx < ts->msg_count - 1) {
+		error = ads7846_filter(ts);
+		if (error)
+			continue;
 
-			val = ads7846_get_value(ts, m);
-
-			action = ts->filter(ts->filter_data, msg_idx, &val);
-			switch (action) {
-			case ADS7846_FILTER_REPEAT:
-				continue;
-
-			case ADS7846_FILTER_IGNORE:
-				packet->tc.ignore = true;
-				msg_idx = ts->msg_count - 1;
-				continue;
-
-			case ADS7846_FILTER_OK:
-				ads7846_update_value(m, val);
-				packet->tc.ignore = false;
-				msg_idx++;
-				break;
-
-			default:
-				BUG();
-			}
-		} else {
-			msg_idx++;
-		}
+		return;
 	}
 }
 
@@ -778,19 +845,14 @@ static void ads7846_report_state(struct ads7846 *ts)
 	unsigned int Rt;
 	u16 x, y, z1, z2;
 
-	/*
-	 * ads7846_get_value() does in-place conversion (including byte swap)
-	 * from on-the-wire format as part of debouncing to get stable
-	 * readings.
-	 */
-	x = packet->tc.x.data;
-	y = packet->tc.y.data;
+	x = packet->x;
+	y = packet->y;
 	if (ts->model == 7845) {
 		z1 = 0;
 		z2 = 0;
 	} else {
-		z1 = packet->tc.z1.data;
-		z2 = packet->tc.z2.data;
+		z1 = packet->z1;
+		z2 = packet->z2;
 	}
 
 	/* range filtering */
@@ -822,9 +884,9 @@ static void ads7846_report_state(struct ads7846 *ts)
 	 * the maximum. Don't report it to user space, repeat at least
 	 * once more the measurement
 	 */
-	if (packet->tc.ignore || Rt > ts->pressure_max) {
+	if (packet->ignore || Rt > ts->pressure_max) {
 		dev_vdbg(&ts->spi->dev, "ignored %d pressure %d\n",
-			 packet->tc.ignore, Rt);
+			 packet->ignore, Rt);
 		return;
 	}
 
@@ -985,13 +1047,59 @@ static int ads7846_setup_pendown(struct spi_device *spi,
  * Set up the transfers to read touchscreen state; this assumes we
  * use formula #2 for pressure, not #3.
  */
-static void ads7846_setup_spi_msg(struct ads7846 *ts,
+static int ads7846_setup_spi_msg(struct ads7846 *ts,
 				  const struct ads7846_platform_data *pdata)
 {
 	struct spi_message *m = &ts->msg[0];
 	struct spi_transfer *x = ts->xfer;
 	struct ads7846_packet *packet = ts->packet;
 	int vref = pdata->keep_vref_on;
+	unsigned int count, offset = 0;
+	unsigned int cmd_idx, b;
+	unsigned long time;
+	size_t size = 0;
+
+	/* time per bit */
+	time = NSEC_PER_SEC / ts->spi->max_speed_hz;
+
+	count = pdata->settle_delay_usecs * NSEC_PER_USEC / time;
+	packet->count_skip = DIV_ROUND_UP(count, 24);
+
+	if (ts->debounce_max && ts->debounce_rep)
+		/* ads7846_debounce_filter() is making ts->debounce_rep + 2
+		 * reads. So we need to get all samples for normal case. */
+		packet->count = ts->debounce_rep + 2;
+	else
+		packet->count = 1;
+
+	if (ts->model == 7846)
+		packet->cmds = 5; /* x, y, z1, z2, pwdown */
+	else
+		packet->cmds = 3; /* x, y, pwdown */
+
+	for (cmd_idx = 0; cmd_idx < packet->cmds; cmd_idx++) {
+		struct ads7846_buf_layout *l = &packet->l[cmd_idx];
+		unsigned int max_count;
+
+		if (ads7846_cmd_need_settle(cmd_idx))
+			max_count = packet->count + packet->count_skip;
+		else
+			max_count = packet->count;
+
+		l->offset = offset;
+		offset += max_count;
+		l->count = max_count;
+		l->skip = packet->count_skip;
+		size += sizeof(*packet->tx) * max_count;
+	}
+
+	packet->tx = devm_kzalloc(&ts->spi->dev, size, GFP_KERNEL);
+	if (!packet->tx)
+		return -ENOMEM;
+
+	packet->rx = devm_kzalloc(&ts->spi->dev, size, GFP_KERNEL);
+	if (!packet->rx)
+		return -ENOMEM;
 
 	if (ts->model == 7873) {
 		/*
@@ -1007,117 +1115,20 @@ static void ads7846_setup_spi_msg(struct ads7846 *ts,
 	spi_message_init(m);
 	m->context = ts;
 
-	packet->read_y_cmd.cmd = READ_Y(vref);
-	x->tx_buf = &packet->read_y_cmd;
-	x->rx_buf = &packet->tc.y;
-	x->len = 3;
-	spi_message_add_tail(x, m);
+	for (cmd_idx = 0; cmd_idx < packet->cmds; cmd_idx++) {
+		struct ads7846_buf_layout *l = &packet->l[cmd_idx];
+		u8 cmd = ads7846_get_cmd(cmd_idx, vref);
 
-	/*
-	 * The first sample after switching drivers can be low quality;
-	 * optionally discard it, using a second one after the signals
-	 * have had enough time to stabilize.
-	 */
-	if (pdata->settle_delay_usecs) {
-		x->delay.value = pdata->settle_delay_usecs;
-		x->delay.unit = SPI_DELAY_UNIT_USECS;
-		x++;
-
-		x->tx_buf = &packet->read_y_cmd;
-		x->rx_buf = &packet->tc.y;
-		x->len = 3;
-		spi_message_add_tail(x, m);
+		for (b = 0; b < l->count; b++)
+			packet->tx[l->offset + b].cmd = cmd;
 	}
 
-	ts->msg_count++;
-	m++;
-	spi_message_init(m);
-	m->context = ts;
-
-	/* turn y- off, x+ on, then leave in lowpower */
-	x++;
-	packet->read_x_cmd.cmd = READ_X(vref);
-	x->tx_buf = &packet->read_x_cmd;
-	x->rx_buf = &packet->tc.x;
-	x->len = 3;
+	x->tx_buf = packet->tx;
+	x->rx_buf = packet->rx;
+	x->len = size;
 	spi_message_add_tail(x, m);
 
-	/* ... maybe discard first sample ... */
-	if (pdata->settle_delay_usecs) {
-		x->delay.value = pdata->settle_delay_usecs;
-		x->delay.unit = SPI_DELAY_UNIT_USECS;
-
-		x++;
-		x->tx_buf = &packet->read_x_cmd;
-		x->rx_buf = &packet->tc.x;
-		x->len = 3;
-		spi_message_add_tail(x, m);
-	}
-
-	/* turn y+ off, x- on; we'll use formula #2 */
-	if (ts->model == 7846) {
-		ts->msg_count++;
-		m++;
-		spi_message_init(m);
-		m->context = ts;
-
-		x++;
-		packet->read_z1_cmd.cmd = READ_Z1(vref);
-		x->tx_buf = &packet->read_z1_cmd;
-		x->rx_buf = &packet->tc.z1;
-		x->len = 3;
-		spi_message_add_tail(x, m);
-
-		/* ... maybe discard first sample ... */
-		if (pdata->settle_delay_usecs) {
-			x->delay.value = pdata->settle_delay_usecs;
-			x->delay.unit = SPI_DELAY_UNIT_USECS;
-
-			x++;
-			x->tx_buf = &packet->read_z1_cmd;
-			x->rx_buf = &packet->tc.z1;
-			x->len = 3;
-			spi_message_add_tail(x, m);
-		}
-
-		ts->msg_count++;
-		m++;
-		spi_message_init(m);
-		m->context = ts;
-
-		x++;
-		packet->read_z2_cmd.cmd = READ_Z2(vref);
-		x->tx_buf = &packet->read_z2_cmd;
-		x->rx_buf = &packet->tc.z2;
-		x->len = 3;
-		spi_message_add_tail(x, m);
-
-		/* ... maybe discard first sample ... */
-		if (pdata->settle_delay_usecs) {
-			x->delay.value = pdata->settle_delay_usecs;
-			x->delay.unit = SPI_DELAY_UNIT_USECS;
-
-			x++;
-			x->tx_buf = &packet->read_z2_cmd;
-			x->rx_buf = &packet->tc.z2;
-			x->len = 3;
-			spi_message_add_tail(x, m);
-		}
-	}
-
-	/* power down */
-	ts->msg_count++;
-	m++;
-	spi_message_init(m);
-	m->context = ts;
-
-	x++;
-	packet->pwrdown_cmd.cmd = PWRDOWN;
-	x->tx_buf = &packet->pwrdown_cmd;
-	x->len = 3;
-
-	CS_CHANGE(*x);
-	spi_message_add_tail(x, m);
+	return 0;
 }
 
 #ifdef CONFIG_OF
-- 
2.28.0

