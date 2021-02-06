Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C50311E5D
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 16:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbhBFPOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 10:14:39 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:49422 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbhBFPOi (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Feb 2021 10:14:38 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id B278AAEEC14; Sat,  6 Feb 2021 16:13:57 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] HID: intel-ish-hid: Simplify logic in ishtp_cl_device_remove()
Date:   Sat,  6 Feb 2021 16:13:47 +0100
Message-Id: <20210206151348.14530-2-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210206151348.14530-1-uwe@kleine-koenig.org>
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There is only a single change in behavior: Now dev->driver isn't modified.
Assigning to this variable is in the domain of the driver core only. (And
it's done in __device_release_driver shortly after bus->remove() (i.e
ishtp_cl_device_remove() here) returns.)

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/hid/intel-ish-hid/ishtp/bus.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index ccd54f244503..7f36ce6187a1 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -258,19 +258,17 @@ static int ishtp_cl_device_remove(struct device *dev)
 {
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
 	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(dev->driver);
+	int ret = 0;
 
 	if (device->event_cb) {
 		device->event_cb = NULL;
 		cancel_work_sync(&device->event_work);
 	}
 
-	if (!driver->remove) {
-		dev->driver = NULL;
+	if (driver->remove)
+		ret = driver->remove(device);
 
-		return 0;
-	}
-
-	return driver->remove(device);
+	return ret;
 }
 
 /**
-- 
2.29.2

