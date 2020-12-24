Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB5672E2529
	for <lists+linux-input@lfdr.de>; Thu, 24 Dec 2020 08:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbgLXHNw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Dec 2020 02:13:52 -0500
Received: from mail-out.m-online.net ([212.18.0.9]:53254 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726159AbgLXHNw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Dec 2020 02:13:52 -0500
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4D1h9R61rkz1qs0m;
        Thu, 24 Dec 2020 08:12:43 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4D1h9R5FzZz1tYVv;
        Thu, 24 Dec 2020 08:12:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id phpJyjjMIsGL; Thu, 24 Dec 2020 08:12:42 +0100 (CET)
X-Auth-Info: A7QbukQoILRDercA5+Atm3QLqqrjwpjjC3alGUKLmi8=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu, 24 Dec 2020 08:12:42 +0100 (CET)
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Olivier Sobrie <olivier@sobrie.be>,
        Philipp Puschmann <pp@emlix.com>
Subject: [PATCH] Input: ili210x - Implement pressure reporting for ILI251x
Date:   Thu, 24 Dec 2020 08:12:38 +0100
Message-Id: <20201224071238.160098-1-marex@denx.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The ILI251x seems to report pressure information in the 5th byte of
each per-finger touch data element. On the available hardware, this
information has the values ranging from 0x0 to 0xa, which is also
matching the downstream example code. Report pressure information
on the ILI251x.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Olivier Sobrie <olivier@sobrie.be>
Cc: Philipp Puschmann <pp@emlix.com>
To: linux-input@vger.kernel.org
---
 drivers/input/touchscreen/ili210x.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index 199cf3daec10..d8fccf048bf4 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -29,11 +29,13 @@ struct ili2xxx_chip {
 			void *buf, size_t len);
 	int (*get_touch_data)(struct i2c_client *client, u8 *data);
 	bool (*parse_touch_data)(const u8 *data, unsigned int finger,
-				 unsigned int *x, unsigned int *y);
+				 unsigned int *x, unsigned int *y,
+				 unsigned int *z);
 	bool (*continue_polling)(const u8 *data, bool touch);
 	unsigned int max_touches;
 	unsigned int resolution;
 	bool has_calibrate_reg;
+	bool has_pressure_reg;
 };
 
 struct ili210x {
@@ -82,7 +84,8 @@ static int ili210x_read_touch_data(struct i2c_client *client, u8 *data)
 
 static bool ili210x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
-					unsigned int *x, unsigned int *y)
+					unsigned int *x, unsigned int *y,
+					unsigned int *z)
 {
 	if (touchdata[0] & BIT(finger))
 		return false;
@@ -137,7 +140,8 @@ static int ili211x_read_touch_data(struct i2c_client *client, u8 *data)
 
 static bool ili211x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
-					unsigned int *x, unsigned int *y)
+					unsigned int *x, unsigned int *y,
+					unsigned int *z)
 {
 	u32 data;
 
@@ -169,7 +173,8 @@ static const struct ili2xxx_chip ili211x_chip = {
 
 static bool ili212x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
-					unsigned int *x, unsigned int *y)
+					unsigned int *x, unsigned int *y,
+					unsigned int *z)
 {
 	u16 val;
 
@@ -235,7 +240,8 @@ static int ili251x_read_touch_data(struct i2c_client *client, u8 *data)
 
 static bool ili251x_touchdata_to_coords(const u8 *touchdata,
 					unsigned int finger,
-					unsigned int *x, unsigned int *y)
+					unsigned int *x, unsigned int *y,
+					unsigned int *z)
 {
 	u16 val;
 
@@ -245,6 +251,7 @@ static bool ili251x_touchdata_to_coords(const u8 *touchdata,
 
 	*x = val & 0x3fff;
 	*y = get_unaligned_be16(touchdata + 1 + (finger * 5) + 2);
+	*z = touchdata[1 + (finger * 5) + 4];
 
 	return true;
 }
@@ -261,6 +268,7 @@ static const struct ili2xxx_chip ili251x_chip = {
 	.continue_polling	= ili251x_check_continue_polling,
 	.max_touches		= 10,
 	.has_calibrate_reg	= true,
+	.has_pressure_reg	= true,
 };
 
 static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
@@ -268,14 +276,16 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
 	struct input_dev *input = priv->input;
 	int i;
 	bool contact = false, touch;
-	unsigned int x = 0, y = 0;
+	unsigned int x = 0, y = 0, z = 0;
 
 	for (i = 0; i < priv->chip->max_touches; i++) {
-		touch = priv->chip->parse_touch_data(touchdata, i, &x, &y);
+		touch = priv->chip->parse_touch_data(touchdata, i, &x, &y, &z);
 
 		input_mt_slot(input, i);
 		if (input_mt_report_slot_state(input, MT_TOOL_FINGER, touch)) {
 			touchscreen_report_pos(input, &priv->prop, x, y, true);
+			if (priv->chip->has_pressure_reg)
+				input_report_abs(input, ABS_MT_PRESSURE, z);
 			contact = true;
 		}
 	}
@@ -437,6 +447,8 @@ static int ili210x_i2c_probe(struct i2c_client *client,
 	max_xy = (chip->resolution ?: SZ_64K) - 1;
 	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
 	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);
+	if (priv->chip->has_pressure_reg)
+		input_set_abs_params(input, ABS_MT_PRESSURE, 0, 0xa, 0, 0);
 	touchscreen_parse_properties(input, true, &priv->prop);
 
 	error = input_mt_init_slots(input, priv->chip->max_touches,
-- 
2.29.2

