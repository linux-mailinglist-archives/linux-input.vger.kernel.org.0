Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4F91715EE
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 12:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbgB0L22 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46713 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728895AbgB0L22 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 06:28:28 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL4-0000p8-Gz; Thu, 27 Feb 2020 12:28:22 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7HL3-0001kO-AR; Thu, 27 Feb 2020 12:28:21 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     dmitry.torokhov@gmail.com, andriy.shevchenko@linux.intel.com,
        hdegoede@redhat.com, LW@KARO-electronics.de
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 4/4] Input: edt-ft5x06 - prefer asynchronous probe
Date:   Thu, 27 Feb 2020 12:28:19 +0100
Message-Id: <20200227112819.16754-5-m.felsch@pengutronix.de>
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

From: Ahmad Fatoum <a.fatoum@pengutronix.de>

Probing the device takes a while, because we sleep for 300 ms after a
reset; allow asynchronous probing so this can happen in the background
while other devices are being probed.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/input/touchscreen/edt-ft5x06.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 0babe6a25fe3..b7f2aee30943 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -1399,6 +1399,7 @@ static struct i2c_driver edt_ft5x06_ts_driver = {
 		.name = "edt_ft5x06",
 		.of_match_table = edt_ft5x06_of_match,
 		.pm = &edt_ft5x06_ts_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = edt_ft5x06_ts_id,
 	.probe    = edt_ft5x06_ts_probe,
-- 
2.20.1

