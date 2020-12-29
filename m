Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997782E7246
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 17:27:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgL2Q0r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726302AbgL2Q0r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDEAC061799
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 08:26:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id AGS4240054C55Sk01GS4Cn; Tue, 29 Dec 2020 17:26:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHox-0014bD-AF; Tue, 29 Dec 2020 17:26:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHow-0092W3-NY; Tue, 29 Dec 2020 17:26:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrej Valek <andrej.valek@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] Input: st1232 - wait until device is ready before reading resolution
Date:   Tue, 29 Dec 2020 17:26:01 +0100
Message-Id: <20201229162601.2154566-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201229162601.2154566-1-geert+renesas@glider.be>
References: <20201229162601.2154566-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

According to the st1232 datasheet, the host has to wait for the device
to change into Normal state before accessing registers other than the
Status Register.

If the reset GPIO is wired, the device is powered on during driver
probe, just before reading the resolution.  However, the latter may
happen before the device is ready, leading to a probe failure:

    st1232-ts 1-0055: Failed to read resolution: -6

Fix this by waiting until the device is ready, by trying to read the
Status Register until it indicates so, or until timeout.

On Armadillo 800 EVA, typically the first read fails with an I2C
transfer error, while the second read indicates the device is ready.

Fixes: 3a54a215410b1650 ("Input: st1232 - add support resolution reading")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Adding an mdelay(1) before reading the resolution also seems to work.
But as the datasheet doesn't mention timing w.r.t. power on reset, I
think it's better to follow the documented procedure.
---
 drivers/input/touchscreen/st1232.c | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 459701056f2bda96..47e5b3ac5bb053f6 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -26,6 +26,20 @@
 #define ST1232_TS_NAME	"st1232-ts"
 #define ST1633_TS_NAME	"st1633-ts"
 
+#define REG_STATUS		0x01	/* Device Status | Error Code */
+
+#define STATUS_NORMAL		0x00
+#define STATUS_INIT		0x01
+#define STATUS_ERROR		0x02
+#define STATUS_AUTO_TUNING	0x03
+#define STATUS_IDLE		0x04
+#define STATUS_POWER_DOWN	0x05
+
+#define ERROR_NONE		0x00
+#define ERROR_INVALID_ADDRESS	0x10
+#define ERROR_INVALID_VALUE	0x20
+#define ERROR_INVALID_PLATFORM	0x30
+
 #define REG_XY_RESOLUTION	0x04
 #define REG_XY_COORDINATES	0x12
 #define ST_TS_MAX_FINGERS	10
@@ -73,6 +87,22 @@ static int st1232_ts_read_data(struct st1232_ts_data *ts, u8 reg,
 	return 0;
 }
 
+static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
+{
+	unsigned int retries;
+	int ret;
+
+	for (retries = 10; retries; retries--) {
+		ret = st1232_ts_read_data(ts, REG_STATUS, 1);
+		if (!ret && ts->read_buf[0] == (STATUS_NORMAL | ERROR_NONE))
+			return 0;
+
+		usleep_range(1000, 2000);
+	}
+
+	return -ENXIO;
+}
+
 static int st1232_ts_read_resolution(struct st1232_ts_data *ts, u16 *max_x,
 				     u16 *max_y)
 {
@@ -252,6 +282,11 @@ static int st1232_ts_probe(struct i2c_client *client,
 	input_dev->name = "st1232-touchscreen";
 	input_dev->id.bustype = BUS_I2C;
 
+	/* Wait until device is ready */
+	error = st1232_ts_wait_ready(ts);
+	if (error)
+		return error;
+
 	/* Read resolution from the chip */
 	error = st1232_ts_read_resolution(ts, &max_x, &max_y);
 	if (error) {
-- 
2.25.1

