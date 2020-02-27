Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1940C1715ED
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgB0L22 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49513 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728846AbgB0L21 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:28:27 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL4-0000p5-Gt; Thu, 27 Feb 2020 12:28:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL3-0001k4-9D; Thu, 27 Feb 2020 12:28:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/4] Input: edt-ft5x06 - fix get_default register write access
Date:   Thu, 27 Feb 2020 12:28:16 +0100
Message-Id: <20200227112819.16754-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200227112819.16754-1-m.felsch@pengutronix.de>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
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

Since commit b6eba86030bf ("Input: edt-ft5x06 - add offset support for
ev-ft5726") offset-x and offset-y is supported. Devices using those
offset parameters don't support the offset parameter so we need to add
the NO_REGISTER check for edt_ft5x06_ts_get_defaults().

Fixes: b6eba86030bf ("Input: edt-ft5x06 - add offset support for ev-ft5726")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index d2587724c52a..9b8450794a8a 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -938,19 +938,25 @@ static void edt_ft5x06_ts_get_defaults(struct device *dev,
 
 	error = device_property_read_u32(dev, "offset", &val);
 	if (!error) {
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset, val);
+		if (reg_addr->reg_offset != NO_REGISTER)
+			edt_ft5x06_register_write(tsdata,
+						  reg_addr->reg_offset, val);
 		tsdata->offset = val;
 	}
 
 	error = device_property_read_u32(dev, "offset-x", &val);
 	if (!error) {
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_x, val);
+		if (reg_addr->reg_offset_x != NO_REGISTER)
+			edt_ft5x06_register_write(tsdata,
+						  reg_addr->reg_offset_x, val);
 		tsdata->offset_x = val;
 	}
 
 	error = device_property_read_u32(dev, "offset-y", &val);
 	if (!error) {
-		edt_ft5x06_register_write(tsdata, reg_addr->reg_offset_y, val);
+		if (reg_addr->reg_offset_y != NO_REGISTER)
+			edt_ft5x06_register_write(tsdata,
+						  reg_addr->reg_offset_y, val);
 		tsdata->offset_y = val;
 	}
 }
-- 
2.20.1

