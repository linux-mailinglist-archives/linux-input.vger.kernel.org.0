Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEE0F1A6710
	for <lists+linux-input@lfdr.de>; Mon, 13 Apr 2020 15:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729982AbgDMNdB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Apr 2020 09:33:01 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:12679 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729901AbgDMNcZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Apr 2020 09:32:25 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4918gC44qQzqB;
        Mon, 13 Apr 2020 15:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586784743; bh=TaRAs79tIlLGqfEvkjIK4MXn0J3D9DouayMsfpB2sqM=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=n/lFhlExV64AcBGdH4NYIZW4ArzfGz7Mt/hAYbLUTv5TyMDsO430coujRGjY4Jvym
         NrUNHBVrPeMYEq/uRr0fd9IjtW6XbxIdyAnNx497SDRfjItW1XaV7in/CXUiA7t/pj
         UDsA9O+hZ40f8gAbm+oPoUdt1NBbUoxiyH5jtjniEzJxKx+AjxfAOACKIBGBJU20UO
         L2ejtUMO60WLNWFfoI+A3iElS9oCnU0ac2z1cyCAKziC+48ZbKO10JFl5+6tTAEoQP
         SgGssQV1DatzrofO1ZwPWmRW6bMstVwV+0fxw3YRCM6hHoTYecnIR/5GjmsnVJOooh
         eqKUISJfIgpSA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Mon, 13 Apr 2020 15:32:23 +0200
Message-Id: <63c42676d47450b37cab5b8f158f4beec60fe7e5.1586784389.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3 2/9] input: elants: support old touch report format
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Dmitry Osipenko <digetx@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
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
index b528bd687cca..ddebd3741145 100644
--- a/drivers/input/touchscreen/elants_i2c.c
+++ b/drivers/input/touchscreen/elants_i2c.c
@@ -67,6 +67,7 @@
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
@@ -865,7 +867,8 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
 			buf[FW_POS_STATE];
 
 	dev_dbg(&ts->client->dev,
-		"n_fingers: %u, state: %04x\n",  n_fingers, finger_state);
+		"n_fingers: %u, state: %04x, report_len: %zu\n",
+		n_fingers, finger_state, report_len);
 
 	for (i = 0; i < MAX_CONTACT_NUM && n_fingers; i++) {
 		if (finger_state & 1) {
@@ -875,8 +878,16 @@ static void elants_i2c_mt_event(struct elants_data *ts, u8 *buf)
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
@@ -909,7 +920,8 @@ static u8 elants_i2c_calculate_checksum(u8 *buf)
 	return checksum;
 }
 
-static void elants_i2c_event(struct elants_data *ts, u8 *buf)
+static void elants_i2c_event(struct elants_data *ts, u8 *buf,
+			     size_t report_len)
 {
 	u8 checksum = elants_i2c_calculate_checksum(buf);
 
@@ -923,7 +935,7 @@ static void elants_i2c_event(struct elants_data *ts, u8 *buf)
 			 "%s: unknown packet type: %02x\n",
 			 __func__, buf[FW_POS_HEADER]);
 	else
-		elants_i2c_mt_event(ts, buf);
+		elants_i2c_mt_event(ts, buf, report_len);
 }
 
 static irqreturn_t elants_i2c_irq(int irq, void *_dev)
@@ -981,7 +993,8 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
 			break;
 
 		case QUEUE_HEADER_SINGLE:
-			elants_i2c_event(ts, &ts->buf[HEADER_SIZE]);
+			elants_i2c_event(ts, &ts->buf[HEADER_SIZE],
+					 ts->buf[FW_HDR_LENGTH]);
 			break;
 
 		case QUEUE_HEADER_NORMAL:
@@ -994,17 +1007,18 @@ static irqreturn_t elants_i2c_irq(int irq, void *_dev)
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

