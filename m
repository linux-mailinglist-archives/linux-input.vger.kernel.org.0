Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFA7E63A
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 17:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbfD2PYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 11:24:20 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:50614 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728645AbfD2PYU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 11:24:20 -0400
Received: from localhost.localdomain (pD95EFAD5.dip0.t-ipconnect.de [217.94.250.213])
        by mail.bugwerft.de (Postfix) with ESMTPSA id C83DC2A9DB0;
        Mon, 29 Apr 2019 15:22:19 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 1/2] input: touch: eeti: move ISR code to own function
Date:   Mon, 29 Apr 2019 17:24:10 +0200
Message-Id: <20190429152411.12835-1-daniel@zonque.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move the ISR handling code to its own function This allows us to call
it at resume time to read the hardware state.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/input/touchscreen/eeti_ts.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 7fe41965c5d1..3e13cc12aaaf 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -75,11 +75,9 @@ static void eeti_ts_report_event(struct eeti_ts *eeti, u8 *buf)
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
 
 	do {
@@ -92,12 +90,18 @@ static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
 			break;
 		}
 
-		if (buf[0] & 0x80) {
-			/* Motion packet */
+		/* Motion packet */
+		if (buf[0] & 0x80)
 			eeti_ts_report_event(eeti, buf);
-		}
 	} while (eeti->running &&
 		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
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

