Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02394DBF6
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 08:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfD2Gar (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 02:30:47 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:47100 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726667AbfD2Gar (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 02:30:47 -0400
Received: from localhost.localdomain (pD95EFAD5.dip0.t-ipconnect.de [217.94.250.213])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 2324C2A9DBE;
        Mon, 29 Apr 2019 06:28:48 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 1/2] input: touch: eeti: move ISR code to own function
Date:   Mon, 29 Apr 2019 08:30:37 +0200
Message-Id: <20190429063038.17773-1-daniel@zonque.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the ISR handling code to its own function and change the logic to bail
immediately in case of .running is false or if the attn_gpio is available
but unasserted.

This allows us to call the function at any time to check for the state of
attn_gpio.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
v3: break out at the end of the loop for setups with !eeti->attn_gpio

 drivers/input/touchscreen/eeti_ts.c | 33 ++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 7fe41965c5d1..67c54413ad2b 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -75,14 +75,19 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
 	input_sync(eeti->input);
 }
 
-static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
+static void eeti_ts_read(struct eeti_ts *eeti)
 {
-	struct eeti_ts *eeti = dev_id;
-	int len;
-	int error;
+	int len, error;
 	char buf[6];
 
-	do {
+	for (;;) {
+		if (!eeti->running)
+			break;
+
+		if (eeti->attn_gpio &&
+		    gpiod_get_value_cansleep(eeti->attn_gpio) == 0)
+			break;
+
 		len = i2c_master_recv(eeti->client, buf, sizeof(buf));
 		if (len != sizeof(buf)) {
 			error = len < 0 ? len : -EIO;
@@ -92,12 +97,20 @@ static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
 			break;
 		}
 
-		if (buf[0] & 0x80) {
-			/* Motion packet */
+		/* Motion packet */
+		if (buf[0] & 0x80)
 			eeti_ts_report_event(eeti, buf);
-		}
-	} while (eeti->running &&
-		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
+
+		if (!eeti->attn_gpio)
+			break;
+	}
+}
+
+static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
+{
+	struct eeti_ts *eeti = dev_id;
+
+	eeti_ts_read(eeti);
 
 	return IRQ_HANDLED;
 }
-- 
2.20.1

