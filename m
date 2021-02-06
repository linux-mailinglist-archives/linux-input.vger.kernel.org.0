Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B70B311E5C
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 16:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbhBFPOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 10:14:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230176AbhBFPOi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Feb 2021 10:14:38 -0500
Received: from antares.kleine-koenig.org (antares.kleine-koenig.org [IPv6:2a01:4f8:c0c:3a97::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346AAC06174A;
        Sat,  6 Feb 2021 07:13:59 -0800 (PST)
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 51094AEEC12; Sat,  6 Feb 2021 16:13:56 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] HID: intel-ish-hid: Drop if block with an always false condition
Date:   Sat,  6 Feb 2021 16:13:46 +0100
Message-Id: <20210206151348.14530-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A remove callback is only ever called for a bound device. So there is no
need to check for device or driver being NULL.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index bba29cd36d29..ccd54f244503 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -257,17 +257,13 @@ static int ishtp_cl_bus_match(struct device *dev, struct device_driver *drv)
 static int ishtp_cl_device_remove(struct device *dev)
 {
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
-	struct ishtp_cl_driver *driver;
-
-	if (!device || !dev->driver)
-		return 0;
+	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(dev->driver);
 
 	if (device->event_cb) {
 		device->event_cb = NULL;
 		cancel_work_sync(&device->event_work);
 	}
 
-	driver = to_ishtp_cl_driver(dev->driver);
 	if (!driver->remove) {
 		dev->driver = NULL;
 

base-commit: 5c8fe583cce542aa0b84adc939ce85293de36e5e
-- 
2.29.2

