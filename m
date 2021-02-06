Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2CB311E5F
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 16:16:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbhBFPOq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 6 Feb 2021 10:14:46 -0500
Received: from antares.kleine-koenig.org ([94.130.110.236]:49440 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230180AbhBFPOk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 6 Feb 2021 10:14:40 -0500
Received: by antares.kleine-koenig.org (Postfix, from userid 1000)
        id 79ABBAEEC16; Sat,  6 Feb 2021 16:13:59 +0100 (CET)
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] HID: intel-ish-hid: Make remove callback return void
Date:   Sat,  6 Feb 2021 16:13:48 +0100
Message-Id: <20210206151348.14530-3-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210206151348.14530-1-uwe@kleine-koenig.org>
References: <20210206151348.14530-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver core ignores the return value of struct bus_type::remove()
because there is only little that can be done. To simplify the quest to
make this function return void, let struct ishtp_cl_driver::remove() return
void, too. All users already unconditionally return 0, this commit makes
it obvious that returning an error value is a bad idea.

Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c  | 4 +---
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 4 +---
 drivers/hid/intel-ish-hid/ishtp/bus.c        | 5 ++---
 drivers/platform/chrome/cros_ec_ishtp.c      | 4 +---
 include/linux/intel-ish-client-if.h          | 2 +-
 5 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 6cf59fd26ad7..edb0bd084c27 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -1015,7 +1015,7 @@ static int loader_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
  *
  * Return: 0
  */
-static int loader_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
+static void loader_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 {
 	struct ishtp_cl_data *client_data;
 	struct ishtp_cl	*loader_ishtp_cl = ishtp_get_drvdata(cl_device);
@@ -1032,8 +1032,6 @@ static int loader_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 	cancel_work_sync(&client_data->work_ishtp_reset);
 	loader_deinit(loader_ishtp_cl);
 	ishtp_put_device(cl_device);
-
-	return 0;
 }
 
 /**
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index 6ba944b40fdb..0f1b5283bab4 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -838,7 +838,7 @@ static int hid_ishtp_cl_probe(struct ishtp_cl_device *cl_device)
  *
  * Return: 0
  */
-static int hid_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
+static void hid_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 {
 	struct ishtp_cl *hid_ishtp_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(hid_ishtp_cl);
@@ -856,8 +856,6 @@ static int hid_ishtp_cl_remove(struct ishtp_cl_device *cl_device)
 	hid_ishtp_cl = NULL;
 
 	client_data->num_hid_devices = 0;
-
-	return 0;
 }
 
 /**
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index 7f36ce6187a1..ffc9ce5c86ee 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -258,7 +258,6 @@ static int ishtp_cl_device_remove(struct device *dev)
 {
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
 	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(dev->driver);
-	int ret = 0;
 
 	if (device->event_cb) {
 		device->event_cb = NULL;
@@ -266,9 +265,9 @@ static int ishtp_cl_device_remove(struct device *dev)
 	}
 
 	if (driver->remove)
-		ret = driver->remove(device);
+		driver->remove(device);
 
-	return ret;
+	return 0;
 }
 
 /**
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 81364029af36..bd80173b33a2 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -707,7 +707,7 @@ static int cros_ec_ishtp_probe(struct ishtp_cl_device *cl_device)
  *
  * Return: 0
  */
-static int cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
+static void cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
 {
 	struct ishtp_cl	*cros_ish_cl = ishtp_get_drvdata(cl_device);
 	struct ishtp_cl_data *client_data = ishtp_get_client_data(cros_ish_cl);
@@ -716,8 +716,6 @@ static int cros_ec_ishtp_remove(struct ishtp_cl_device *cl_device)
 	cancel_work_sync(&client_data->work_ec_evt);
 	cros_ish_deinit(cros_ish_cl);
 	ishtp_put_device(cl_device);
-
-	return 0;
 }
 
 /**
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index 0d6b4bc191c5..94669e21dc8b 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -36,7 +36,7 @@ struct ishtp_cl_driver {
 	const char *name;
 	const guid_t *guid;
 	int (*probe)(struct ishtp_cl_device *dev);
-	int (*remove)(struct ishtp_cl_device *dev);
+	void (*remove)(struct ishtp_cl_device *dev);
 	int (*reset)(struct ishtp_cl_device *dev);
 	const struct dev_pm_ops *pm;
 };
-- 
2.29.2

