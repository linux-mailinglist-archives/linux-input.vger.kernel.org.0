Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B972AC235
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 18:28:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731757AbgKIR2t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 12:28:49 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:23066 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731617AbgKIR2s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Nov 2020 12:28:48 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CVHz21wmFzSq;
        Mon,  9 Nov 2020 18:28:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1604942926; bh=SuKYXjpw/qBWpC6YXxydUVb5w6cLmNOjpgdbQogN4GI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=HbZHP74te9RAyrdgUc+rFmB25dSZw4IIglP1kx5Hv5G8RuY2SDLVzx8pyNVFQgeka
         9JCQLhcioh+6wCDA4yoYMQtjy1l9txNmcgRlP+nZZ95AeOB2CDB0u5s0u+2JOBhc1U
         roCqWyPQinhc91yB9yZPTjcxIpFug+9lfgKoBee1PLdt4Zgmz1kARrRLaUIg1ktS3B
         TlB/4yOVTZJMDedtW0JwaVQkxP3q1/4B9Uf5iYOfW3obxEKEahlFjyjUSQiTJrrWLn
         EG4uu806HnXZ1s2hBE8jCyJoSjfN5fov5N4p7r5BYjteRkhXInDJm4ogNkOsGBtk3j
         mYPEHwBafkdcA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Mon, 09 Nov 2020 18:28:45 +0100
Message-Id: <83d08e62a58cc7dff1f5a36bca690ff4198be21c.1604942771.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1604942771.git.mirq-linux@rere.qmqm.pl>
References: <cover.1604942771.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH RESEND v8 2/4] input: elants: support old touch report format
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@who-t.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Support ELAN touchpad sensor with older firmware as found on eg. Asus
Transformer Pads.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
Tested-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/input/touchscreen/elants_i2c.c | 36 ++++++++++++++++++--------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
index d51cb910fba1..f1bf3e000e96 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -69,6 +69,7 @@
 #define CMD_HEADER_REK		0x66
 
 /* FW position data */
+#define PACKET_SIZE_OLD		40
 #define PACKET_SIZE		55
 #define MAX_CONTACT_NUM		10
 #define FW_POS_HEADER		0
@@ -853,7 +854,8 @@ static int elants_i2c_fw_update(struct elants_data *ts)
  * Event reporting.
  */
 
-static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf,
+				size_t report_len)
 {
 	struct input_dev *input = ts->input;
 	unsigned int n_fingers;
@@ -866,7 +868,8 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 			buf[FW_POS_STATE];
 
 	dev_dbg(&ts->client->dev,
-		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
+		"n_fingers: %u, state: %04x, report_len: %zu\n",
+		n_fingers, finger_state, report_len);
 
 	/* Note: all fingers have the same tool type */
 	tool_type = buf[FW_POS_TOOL_TYPE] & BIT(0) ?
@@ -880,8 +883,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
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
@@ -913,7 +924,8 @@ static u8 elants_i2c_calculate_checksum(u8 *buf)
 	return checksum;
 }
 
-static void elants_i2c_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_event(struct elants_data *ts, u8 *buf,
+			     size_t report_len)
 {
 	u8 checksum = elants_i2c_calculate_checksum(buf);
 
@@ -927,7 +939,7 @@ static void elants_i2c_event(struct elants_data *ts, u8 *buf)
 			 "%s: unknown packet type: %02x\n",
 			 __func__, buf[FW_POS_HEADER]);
 	else
-		elants_i2c_mt_event(ts, buf);
+		elants_i2c_mt_event(ts, buf, report_len);
 }
 
 static irqreturn_t elants_i2c_irq(int irq, void *_dev)
@@ -985,7 +997,8 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_SINGLE:
-			elants_i2c_event(ts, &ts->buf[HEADER_SIZE]);
+			elants_i2c_event(ts, &ts->buf[HEADER_SIZE],
+					 ts->buf[FW_HDR_LENGTH]);
 			break;
 
 		case QUEUE_HEADER_NORMAL:
@@ -998,17 +1011,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
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

