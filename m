Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20F5C41C8A3
	for <lists+linux-input@lfdr.de>; Wed, 29 Sep 2021 17:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245313AbhI2PqP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Sep 2021 11:46:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243396AbhI2PqO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Sep 2021 11:46:14 -0400
X-Greylist: delayed 1083 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 29 Sep 2021 08:44:33 PDT
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EAFCC06161C
        for <linux-input@vger.kernel.org>; Wed, 29 Sep 2021 08:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
        Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
        In-Reply-To:References; bh=/znKiqRAA5nssyHjnnwpXVbV4dhtUWZwr25Taw3gmtA=; b=DA
        K0c27CZL1tR517EhMM+AkhG78Q3il56KYyfDWVXQizUAMoX3nklIjfrsQPLEDt9w9y04wyo3JK5kI
        vUcTHVJeokHdUjWOpRT7i6IaDSkNFbbfGfG6BTwOVa+flyzJVEKVvV3wkDFnoQqTsbO7nsDYzhn9o
        FqT6CbsL32YWUAV/CONuy5FcWdP6FPLXILBcPR3HtPFHy388kAxHAED2LqI+6ApgRaHGC9Xrxp6zG
        w4Y6hUcYBhHzhmYH4xLMYQfpF3HUJM17gOfCEhYsHuriWJBkbizKI2T8RiyuMx/yu1Rgt+2VK3bRW
        jJRiTJreq12PLwnudrK3JkAg09ey2K3A==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1mVbTX-0005w5-If; Wed, 29 Sep 2021 16:26:27 +0100
From:   John Keeping <john@metanate.com>
To:     linux-input@vger.kernel.org
Cc:     John Keeping <john@metanate.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: st1232 - increase "wait ready" timeout
Date:   Wed, 29 Sep 2021 16:26:08 +0100
Message-Id: <20210929152609.2421483-1-john@metanate.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I have a ST1633 touch controller which fails to probe due to a timeout
waiting for the controller to become ready.  Increasing the minimum
delay to 100ms ensures that the probe sequence completes successfully.

The ST1633 datasheet says nothing about the maximum delay here and the
ST1232 I2C protocol document says "wait until" with no notion of a
timeout.

Since this only runs once during probe, being generous with the timout
seems reasonable and most likely the device will become ready
eventually.

(It may be worth noting that I saw this issue with a PREEMPT_RT patched
kernel which probably has tighter wakeups from usleep_range() than other
preemption models.)

Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/input/touchscreen/st1232.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/st1232.c b/drivers/input/touchscreen/st1232.c
index 6abae665ca71..9d1dea6996a2 100644
--- a/drivers/input/touchscreen/st1232.c
+++ b/drivers/input/touchscreen/st1232.c
@@ -92,7 +92,7 @@ static int st1232_ts_wait_ready(struct st1232_ts_data *ts)
 	unsigned int retries;
 	int error;
 
-	for (retries = 10; retries; retries--) {
+	for (retries = 100; retries; retries--) {
 		error = st1232_ts_read_data(ts, REG_STATUS, 1);
 		if (!error) {
 			switch (ts->read_buf[0]) {
-- 
2.33.0

