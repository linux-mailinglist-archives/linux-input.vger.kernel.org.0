Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4710F3749BA
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 22:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234184AbhEEUy0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 16:54:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231224AbhEEUyZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 May 2021 16:54:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B5CEC061574
        for <linux-input@vger.kernel.org>; Wed,  5 May 2021 13:53:28 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1leOWJ-00037I-0r; Wed, 05 May 2021 22:53:23 +0200
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1leOWI-00082p-Bi; Wed, 05 May 2021 22:53:22 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        David Herrmann <dh.herrmann@googlemail.com>
Cc:     linux-input@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] HID: hid-core: Don't fail to remove a device on a signal
Date:   Wed,  5 May 2021 22:53:19 +0200
Message-Id: <20210505205319.201563-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver core ignores the return code of a remove function and
considers a device unbound unconditionally after .remove() returns. So
don't sleep interruptible while waiting on the mutex, as there is no
sane way to handle an interrupt. Just returning -EINTR as was done up to
now results in leaking resources because the hid driver's remove
callback (or hid_hw_stop()) isn't called.

Fixes: 4ea5454203d9 ("HID: Fix race condition between driver core and ll-driver")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/hid/hid-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 0ae9f6df59d1..4095a4db623d 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -2303,12 +2303,9 @@ static int hid_device_remove(struct device *dev)
 {
 	struct hid_device *hdev = to_hid_device(dev);
 	struct hid_driver *hdrv;
-	int ret = 0;
 
-	if (down_interruptible(&hdev->driver_input_lock)) {
-		ret = -EINTR;
-		goto end;
-	}
+	down(&hdev->driver_input_lock);
+
 	hdev->io_started = false;
 
 	hdrv = hdev->driver;
@@ -2323,8 +2320,8 @@ static int hid_device_remove(struct device *dev)
 
 	if (!hdev->io_started)
 		up(&hdev->driver_input_lock);
-end:
-	return ret;
+
+	return 0;
 }
 
 static ssize_t modalias_show(struct device *dev, struct device_attribute *a,
-- 
2.30.2

