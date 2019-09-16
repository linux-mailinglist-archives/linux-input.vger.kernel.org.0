Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C32B3C1A
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 16:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388414AbfIPOEE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Sep 2019 10:04:04 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:33777 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727973AbfIPOEE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Sep 2019 10:04:04 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbk-0000tF-Fg; Mon, 16 Sep 2019 16:04:00 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1i9rbj-0008GG-Sq; Mon, 16 Sep 2019 16:03:59 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     support.opensource@diasemi.com, stwiss.opensource@diasemi.com,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 4/4] Input: da9063 - fix capability and drop KEY_SLEEP
Date:   Mon, 16 Sep 2019 16:03:58 +0200
Message-Id: <20190916140358.30036-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916140358.30036-1-m.felsch@pengutronix.de>
References: <20190916140358.30036-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since commit f889beaaab1c ("Input: da9063 - report KEY_POWER instead of
KEY_SLEEP during power key-press") KEY_SLEEP isn't supported anymore.
So the input device don't report a key event if "dlg,disable-key-power"
is set.

Fixes: f889beaaab1c ("Input: da9063 - report KEY_POWER instead of KEY_SLEEP during power key-press")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/misc/da9063_onkey.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/input/misc/da9063_onkey.c b/drivers/input/misc/da9063_onkey.c
index bc982fcc87eb..2362b1360a41 100644
--- a/drivers/input/misc/da9063_onkey.c
+++ b/drivers/input/misc/da9063_onkey.c
@@ -242,10 +242,7 @@ static int da9063_onkey_probe(struct platform_device *pdev)
 	onkey->input->phys = onkey->phys;
 	onkey->input->dev.parent = &pdev->dev;
 
-	if (onkey->key_power)
-		input_set_capability(onkey->input, EV_KEY, KEY_POWER);
-
-	input_set_capability(onkey->input, EV_KEY, KEY_SLEEP);
+	input_set_capability(onkey->input, EV_KEY, KEY_POWER);
 
 	INIT_DELAYED_WORK(&onkey->work, da9063_poll_on);
 
-- 
2.20.1

