Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4CC2297C72
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 14:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761501AbgJXMqo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 08:46:44 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:3629 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1761488AbgJXMqn (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 08:46:43 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4CJLSw5mkszHF;
        Sat, 24 Oct 2020 14:46:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1603543600; bh=SuKYXjpw/qBWpC6YXxydUVb5w6cLmNOjpgdbQogN4GI=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=XcQXiuhRQdtjbmtol0cQOZa63dskDV4BwhIsvweY36ksnDWHG2mUrm27hbJN/OYZa
         /EsC+OGpfjMm2UqZeglVl6WLl9K1F8yF4HQ34CJuxXcS/lRfEhNkZKNYaDxifA6/+h
         ykee0OMw1mm99loHDkTj8a8mApbQZ1OxBaJvfmkKA8TWSH4UMUD4LLcumrcT1o069G
         oJ0ImL9+XpeJf4BhfiRWqJeF3qF7Cq8wAGEw0EfUWOey6QewT2Wsdqtez27HZbGyna
         fh6d8kvCmTM0eAXYkSBwMOjqiWSp51s+vCnNyALVRCaogg8PhWulUToQop+Yuf4CtG
         O5YdwLCgW1FkQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sat, 24 Oct 2020 14:46:40 +0200
Message-Id: <6caac5757b8afdb84f0d621844ea2c5b6deb885f.1603543323.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1603543323.git.mirq-linux@rere.qmqm.pl>
References: <cover.1603543323.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v8 2/4] input: elants: support old touch report format
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Johnny Chuang <johnny.chuang.emc@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
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

