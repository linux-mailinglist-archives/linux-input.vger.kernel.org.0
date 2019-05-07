Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFCC815F91
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2019 10:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbfEGIkX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 May 2019 04:40:23 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52559 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfEGIkX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 May 2019 04:40:23 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hNve9-0000zB-2n; Tue, 07 May 2019 10:40:21 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1hNve8-0008LR-RA; Tue, 07 May 2019 10:40:20 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     kernel@pengutronix.de, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org
Subject: [PATCH] input: qt1050: fix error check during identify the chip
Date:   Tue,  7 May 2019 10:40:18 +0200
Message-Id: <20190507084018.32009-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
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

The regmap_read return value must be checked decide if the read was
successful or not and not the read value.

Fixes: a33ff45923c8 ("Input: qt1050 - add Microchip AT42QT1050 support")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
Hi Dmitry,

there was a issue which was covered by Colin Ian King. Can you add this
fix please? Maybe you can squash the fix.

Regards,
  Marco

 drivers/input/keyboard/qt1050.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
index 2a816efdedbc..749016fc1ca7 100644
--- a/drivers/input/keyboard/qt1050.c
+++ b/drivers/input/keyboard/qt1050.c
@@ -223,6 +223,7 @@ static struct regmap_config qt1050_regmap_config = {
 static bool qt1050_identify(struct qt1050_priv *ts)
 {
 	unsigned int val;
+	int err;
 
 	/* Read Chip ID */
 	regmap_read(ts->regmap, QT1050_CHIP_ID, &val);
@@ -232,8 +233,8 @@ static bool qt1050_identify(struct qt1050_priv *ts)
 	}
 
 	/* Read firmware version */
-	regmap_read(ts->regmap, QT1050_FW_VERSION, &val);
-	if (val < 0) {
+	err = regmap_read(ts->regmap, QT1050_FW_VERSION, &val);
+	if (err) {
 		dev_err(&ts->client->dev, "could not read the firmware version\n");
 		return false;
 	}
-- 
2.20.1

