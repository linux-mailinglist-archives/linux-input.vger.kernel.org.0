Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D373044781C
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 02:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235031AbhKHAzo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 19:55:44 -0500
Received: from phobos.denx.de ([85.214.62.61]:35864 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236361AbhKHAzM (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 19:55:12 -0500
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 44412837EE;
        Mon,  8 Nov 2021 01:52:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636332747;
        bh=LwGx3CdlTwnxzJGX5iphAvcFEudX82JMl1F4SkVxbPc=;
        h=From:To:Cc:Subject:Date:From;
        b=LD2ZTJV6AU52mbkNviiuvQ254aD+1CPqembcHnAjDSg2EbPIbnl+zOx43fCIVqNl+
         4BQsvcQ2vKaV1FHXpyJnsm59lwVQjEaF6d/DuJ7N+QHbYrKwShzKR+rN2cFPB28y8P
         Hb/oBO5LbDIjLbsEpDfdhnwRyLbpONtJA5jKnT3aeqnU7ruLi/6nMuBIE237bzr9PU
         eI1M2apP3FXwhwdcFNDuSsgqe7zhP3+8N03I7HGYShvZ1jEJe79IfJnHxSI7P+pTYn
         Rk0IdZ2b8LrT2tt2QAVtGVf3w8i9zOo4RmfaL1oEDy8hL4CaJhNK4fiHvj/3Xx04Y7
         BDaua0q+g7Rcg==
From:   Marek Vasut <marex@denx.de>
To:     linux-input@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Joe Hung <joe_hung@ilitek.com>, Luca Hsu <luca_hsu@ilitek.com>
Subject: [PATCH] Input: ili210x - Improve polled sample spacing
Date:   Mon,  8 Nov 2021 01:52:16 +0100
Message-Id: <20211108005216.480525-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently the ili210x driver implements a threaded interrupt handler which
starts upon edge on the interrupt line, and then polls the touch controller
for samples. Every time a sample is obtained from the controller, the thread
function checks whether further polling is required, and if so, waits fixed
amount of time before polling for next sample.

The delay between consecutive samples can thus vary greatly, because the
I2C transfer required to retrieve the sample from the controller takes
different amount of time on different platforms. Furthermore, different
models of the touch controllers supported by this driver require different
delays during retrieval of samples too.

Instead of waiting fixed amount of time before polling for next sample,
determine how much time passed since the beginning of sampling cycle and
then wait only the remaining amount of time within the sampling cycle.
This makes the driver deliver samples with equal spacing between them.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Joe Hung <joe_hung@ilitek.com>
Cc: Luca Hsu <luca_hsu@ilitek.com>
---
 drivers/input/touchscreen/ili210x.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
index a3b71a9511eb3..b2d9fe1e1c707 100644
--- a/drivers/input/touchscreen/ili210x.c
+++ b/drivers/input/touchscreen/ili210x.c
@@ -328,10 +328,13 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 	const struct ili2xxx_chip *chip = priv->chip;
 	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
 	bool keep_polling;
+	ktime_t time_next;
+	s64 time_delta;
 	bool touch;
 	int error;
 
 	do {
+		time_next = ktime_add_ms(ktime_get(), ILI2XXX_POLL_PERIOD);
 		error = chip->get_touch_data(client, touchdata);
 		if (error) {
 			dev_err(&client->dev,
@@ -341,8 +344,11 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
 
 		touch = ili210x_report_events(priv, touchdata);
 		keep_polling = chip->continue_polling(touchdata, touch);
-		if (keep_polling)
-			msleep(ILI2XXX_POLL_PERIOD);
+		if (keep_polling) {
+			time_delta = ktime_us_delta(time_next, ktime_get());
+			if (time_delta > 0)
+				usleep_range(time_delta, time_delta + 1000);
+		}
 	} while (!priv->stop && keep_polling);
 
 	return IRQ_HANDLED;
-- 
2.33.0

