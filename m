Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA1E63B
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 17:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbfD2PYV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 11:24:21 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:50624 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728653AbfD2PYU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 11:24:20 -0400
Received: from localhost.localdomain (pD95EFAD5.dip0.t-ipconnect.de [217.94.250.213])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 295582A9DC0;
        Mon, 29 Apr 2019 15:22:20 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Sven Neumann <Sven.Neumann@teufel.de>
Subject: [PATCH v4 2/2] input: touch: eeti: read hardware state once after wakeup
Date:   Mon, 29 Apr 2019 17:24:11 +0200
Message-Id: <20190429152411.12835-2-daniel@zonque.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429152411.12835-1-daniel@zonque.org>
References: <20190429152411.12835-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For systems in which the touch IRQ is acting as wakeup source, and that do
not support level-driven interrupts, the interrupt controller might not
latch the GPIO IRQ during sleep. In such cases, the interrupt will never
occur again after resume, hence the touch screen appears dead.

To fix this, check for the assertion of the attn gpio, and call into
eeti_ts_read() once in the resume path to read the hardware status and
to arm the IRQ again.

Introduce a mutex to guard eeti_ts_read() against parallel invocations
from different contexts.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reported-by: Sven Neumann <Sven.Neumann@teufel.de>
---
 drivers/input/touchscreen/eeti_ts.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 3e13cc12aaaf..48cecdd484a5 100644
--- a/drivers/input/touchscreen/eeti_ts.c
+++ b/drivers/input/touchscreen/eeti_ts.c
@@ -41,6 +41,7 @@ struct eeti_ts {
 	struct input_dev *input;
 	struct gpio_desc *attn_gpio;
 	struct touchscreen_properties props;
+	struct mutex mutex;
 	bool running;
 };
 
@@ -80,6 +81,8 @@ static void eeti_ts_read(struct eeti_ts *eeti)
 	int len, error;
 	char buf[6];
 
+	mutex_lock(&eeti->mutex);
+
 	do {
 		len = i2c_master_recv(eeti->client, buf, sizeof(buf));
 		if (len != sizeof(buf)) {
@@ -95,6 +98,8 @@ static void eeti_ts_read(struct eeti_ts *eeti)
 			eeti_ts_report_event(eeti, buf);
 	} while (eeti->running &&
 		 eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio));
+
+	mutex_unlock(&eeti->mutex);
 }
 
 static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
@@ -111,6 +116,9 @@ static void eeti_ts_start(struct eeti_ts *eeti)
 	eeti->running = true;
 	wmb();
 	enable_irq(eeti->client->irq);
+
+	if (eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio))
+		eeti_ts_read(eeti);
 }
 
 static void eeti_ts_stop(struct eeti_ts *eeti)
@@ -157,6 +165,8 @@ static int eeti_ts_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
+	mutex_init(&eeti->mutex);
+
 	input = devm_input_allocate_device(dev);
 	if (!input) {
 		dev_err(dev, "Failed to allocate input device.\n");
-- 
2.20.1

