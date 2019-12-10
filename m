Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38467117C51
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2019 01:19:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727491AbfLJATU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 19:19:20 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:21281 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727425AbfLJATT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 19:19:19 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 47X0wr6vJFzFZ;
        Tue, 10 Dec 2019 01:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1575937005; bh=+yXkdEmHbGVnUoL0SE9nNKnNhlZX/InCwmV5e2Rr8j8=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=GWiGBFyJHivTlCR//wBW0N2/Fjwa6tU8NPORwvFwHRJqXTNORTmAHBSRfyvWceKvY
         TlS2TB40WYcCU8owZN6SmWvJBE85N5wgUyRsj568115hERt2cMDT5lBEABRlbWr24j
         DCNSZIwMxf/dmqTLXoV0RjK9ctIUOPTiEZ+0EgYX3JvNjk3Xl3Fyo6i+Trcrugzd0Q
         2gxTWAtpm74UbxIJ2hmUQMW4ChEfmVDpKU6mJ0VlsUPEewfuvgUJnvFxb/YBRFnFMI
         VzVIxgKJCw5qAZILz8QiHAL4s6ITUpw0w92LdCpJRK5mH6JD7cHuKoG1MzZ7/AKWhG
         Is2Jy7ffMWmoA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.101.4 at mail
Date:   Tue, 10 Dec 2019 01:19:17 +0100
Message-Id: <7a8ff01ae0952d026a7da307a69e4540055e370a.1575936961.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
References: <cover.1575936961.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/6] input: elants: support old touch report format
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support ELAN touchpad sensor with older firmware as found on eg. Asus
Transformer Pads.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/input/touchscreen/elants_i2c.c | 36 ++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index 887888c53996..eadd26d5a06f 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -65,6 +65,7 @@
 #define CMD_HEADER_REK		0x66
 
 /* FW position data */
+#define PACKET_SIZE_OLD		40
 #define PACKET_SIZE		55
 #define MAX_CONTACT_NUM		10
 #define FW_POS_HEADER		0
@@ -792,7 +793,8 @@ static int elants_i2c_fw_update(struct elants_data *ts)
  * Event reporting.
  */
 
-static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
+				size_t report_len)
 {
 	struct input_dev *input = ts->input;
 	unsigned int n_fingers;
@@ -804,7 +806,8 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 			buf[FW_POS_STATE];
 
 	dev_dbg(&ts->client->dev,
-		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
+		"n_fingers: %u, state: %04x, report_len: %zu\n",
+		n_fingers, finger_state, report_len);
 
 	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
 		if (finger_state & 1) {
@@ -814,8 +817,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 			pos = &buf[FW_POS_XY + i * 3];
 			x = (((u16)pos[0] & 0xf0) << 4) | pos[1];
 			y = (((u16)pos[0] & 0x0f) << 8) | pos[2];
-			p = buf[FW_POS_PRESSURE + i];
-			w = buf[FW_POS_WIDTH + i];
+			if (report_len == PACKET_SIZE_OLD) {
+				w = buf[FW_POS_WIDTH + i / 2];
+				w >>= 4 * (~i & 1);	// little-endian-nibbles
+				w |= w << 4;
+				w |= !w;
+				p = w;
+			} else {
+				p = buf[FW_POS_PRESSURE + i];
+				w = buf[FW_POS_WIDTH + i];
+			}
 
 			dev_dbg(&ts->client->dev, "i=%d x=%d y=%d p=%d w=%d\n",
 				i, x, y, p, w);
@@ -848,7 +859,8 @@ static u8 elants_i2c_calculate_checksum(u8 *buf)
 	return checksum;
 }
 
-static void elants_i2c_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_event(struct elants_data *ts, u8 *buf,
+			     size_t report_len)
 {
 	u8 checksum = elants_i2c_calculate_checksum(buf);
 
@@ -862,7 +874,7 @@ static void elants_i2c_event(struct elants_data *ts, u8 *buf)
 			 "%s: unknown packet type: %02x\n",
 			 __func__, buf[FW_POS_HEADER]);
 	else
-		elants_i2c_mt_event(ts, buf);
+		elants_i2c_mt_event(ts, buf, report_len);
 }
 
 static irqreturn_t elants_i2c_irq(int irq, void *_dev)
@@ -920,7 +932,8 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_SINGLE:
-			elants_i2c_event(ts, &ts->buf[HEADER_SIZE]);
+			elants_i2c_event(ts, &ts->buf[HEADER_SIZE],
+					 ts->buf[FW_HDR_LENGTH]);
 			break;
 
 		case QUEUE_HEADER_NORMAL:
@@ -933,17 +946,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			}
 
 			report_len = ts->buf[FW_HDR_LENGTH] / report_count;
-			if (report_len != PACKET_SIZE) {
+			if (report_len != PACKET_SIZE &&
+			    report_len != PACKET_SIZE_OLD) {
 				dev_err(&client->dev,
-					"mismatching report length: %*ph\n",
+					"unsupported report length: %*ph\n",
 					HEADER_SIZE, ts->buf);
 				break;
 			}
 
 			for (i = 0; i < report_count; i++) {
 				u8 *buf = ts->buf + HEADER_SIZE +
-							i * PACKET_SIZE;
-				elants_i2c_event(ts, buf);
+					  i * report_len;
+				elants_i2c_event(ts, buf, report_len);
 			}
 			break;
 
-- 
2.20.1

