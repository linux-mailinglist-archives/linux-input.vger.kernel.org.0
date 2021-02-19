Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDAF31F7E9
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 12:07:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbhBSLGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 06:06:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbhBSLGk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 06:06:40 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79F4C061756
        for <linux-input@vger.kernel.org>; Fri, 19 Feb 2021 03:05:59 -0800 (PST)
Received: from [2a0a:edc0:0:c01:1d::a2] (helo=drehscheibe.grey.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lD3bi-0000Dx-EG; Fri, 19 Feb 2021 12:05:58 +0100
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lD3bg-0001ar-Qn; Fri, 19 Feb 2021 12:05:56 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1lD3bg-007ncA-Q0; Fri, 19 Feb 2021 12:05:56 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com
Cc:     geert+renesas@glider.be, andrej.valek@siemens.com
Subject: [PATCH] Input: st1232 - add IDLE state as ready condition
Date:   Fri, 19 Feb 2021 12:05:56 +0100
Message-Id: <20210219110556.1858969-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The st1232 can switch from NORMAL to IDLE state after the configured
idle time (by default 8 s). If the st1232 is not reset during probe, it
might already be ready but in IDLE state. Since it does not enter NORMAL
state in this case, probe fails.

Fix the wait function to report the IDLE state as ready, too.

Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/input/touchscreen/st1232.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index b4e7bcbe9b91..885f0572488d 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -94,7 +94,7 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
 
 	for (retries = 10; retries; retries--) {
 		error = st1232_ts_read_data(ts, REG_STATUS, 1);
-		if (!error && ts->read_buf[0] == (STATUS_NORMAL | ERROR_NONE))
+		if (!error && ts->read_buf[0] == (STATUS_NORMAL | STATUS_IDLE | ERROR_NONE))
 			return 0;
 
 		usleep_range(1000, 2000);
-- 
2.29.2

