Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD016DBF7
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 08:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726564AbfD2Gat (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 02:30:49 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:47110 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbfD2Gat (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 02:30:49 -0400
Received: from localhost.localdomain (pD95EFAD5.dip0.t-ipconnect.de [217.94.250.213])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 676972A9DC0;
        Mon, 29 Apr 2019 06:28:48 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Sven Neumann <Sven.Neumann@teufel.de>
Subject: [PATCH v3 2/2] input: touch: eeti: read hardware state once after wakeup
Date:   Mon, 29 Apr 2019 08:30:38 +0200
Message-Id: <20190429063038.17773-2-daniel@zonque.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429063038.17773-1-daniel@zonque.org>
References: <20190429063038.17773-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

For systems in which the touch IRQ is acting as wakeup source, the interrupt
controller might not latch the GPIO IRQ during sleep. In such cases, the
interrupt will never occur again after resume, hence the touch screen
appears dead.

To fix this, call into eeti_ts_read() once in the resume path to read the
hardware status and to arm the IRQ again.

Introduce a mutex to guard eeti_ts_read() against parallel invocations
from different contexts.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Reported-by: Sven Neumann <Sven.Neumann@teufel.de>
---
v2: swap the order of eeti_ts_read() and enable_irq() to address a
potential race.

v3: use a mutex to guard eeti_ts_read()

 drivers/input/touchscreen/eeti_ts.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
index 67c54413ad2b..468efe194c3b 100644
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
 	for (;;) {
 		if (!eeti->running)
 			break;
@@ -104,6 +107,8 @@ static void eeti_ts_read(struct eeti_ts *eeti)
 		if (!eeti->attn_gpio)
 			break;
 	}
+
+	mutex_unlock(&eeti->mutex);
 }
 
 static irqreturn_t eeti_ts_isr(int irq, void *dev_id)
@@ -120,6 +125,7 @@ static void eeti_ts_start(struct eeti_ts *eeti)
 	eeti->running = true;
 	wmb();
 	enable_irq(eeti->client->irq);
+	eeti_ts_read(eeti);
 }
 
 static void eeti_ts_stop(struct eeti_ts *eeti)
@@ -166,6 +172,8 @@ static int eeti_ts_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
+	mutex_init(&eeti->mutex);
+
 	input = devm_input_allocate_device(dev);
 	if (!input) {
 		dev_err(dev, "Failed to allocate input device.\n");
-- 
2.20.1

