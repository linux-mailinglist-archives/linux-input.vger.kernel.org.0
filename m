Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B6844D3A2
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 09:58:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbhKKJBl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 04:01:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:37802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229543AbhKKJBk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 04:01:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92ED961208;
        Thu, 11 Nov 2021 08:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636621131;
        bh=R/hxMyBxw54SZkxop6XaqXPv6qgS05My5zvnCK2eyHE=;
        h=From:To:Cc:Subject:Date:From;
        b=kZpEJfqsZvnUfiY2s+Z1GCDnTon+gl5i948cGEmu1Lb6Emsb8Ts4PKMYVHsQHWyxr
         A7Xzzmtt3sXEu71KKWv5+AuqH26rMRy6YjsENilwmHY2znmI+carKd2w0eTOouTLqF
         fVc6L72wJWeaoRn73pjmYBUjeZVhs4JhQgLvEes+FePqJ8KJGk/QCAohf+wM6d8Hdp
         3drIuINXTO6dJzbEWjaYx+MVTb0Ut7h3ArbsEB9lipgDFcvMY/Ngxw73FNb4ETNl/I
         dPSvoDkdWVA+cOqCG6rPoes4CndV4wSukj0uT5jYwzGVweC5G55otkpWetPysHFqUh
         VkduHmeDKKvzw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Sumesh K Naduvalath <sumesh.k.naduvalath@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] HID: intel-ish-hid: fix module device-id handling
Date:   Thu, 11 Nov 2021 09:56:33 +0100
Message-Id: <20211111085842.2846422-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

A late addititon to the intel-ish-hid framework caused a build failure
with clang, and introduced an ABI to the module loader that stops working
if any driver ever needs to bind to more than one UUID:

drivers/hid/intel-ish-hid/ishtp-fw-loader.c:1067:4: error: initializer element is not a compile-time constant

Change the ishtp_device_id to have correct documentation and a driver_data
field like all the other ones, and change the drivers to use the ID table
as the primary identification in a way that works with all compilers
and avoids duplciating the identifiers.

Fixes: f155dfeaa4ee ("platform/x86: isthp_eclite: only load for matching devices")
Fixes: facfe0a4fdce ("platform/chrome: chros_ec_ishtp: only load for matching devices")
Fixes: 0d0cccc0fd83 ("HID: intel-ish-hid: hid-client: only load for matching devices")
Fixes: 44e2a58cb880 ("HID: intel-ish-hid: fw-loader: only load for matching devices")
Fixes: cb1a2c6847f7 ("HID: intel-ish-hid: use constants for modaliases")
Fixes: fa443bc3c1e4 ("HID: intel-ish-hid: add support for MODULE_DEVICE_TABLE()")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I did not see this reported on the list so far, but it has probably
shown up in other build bots as well.

There are lots of ways to fix the warning, I picked this way to address
the more urgent problem of fixing the mod_devicetable.h format before
it is too late for that.
---
 drivers/hid/intel-ish-hid/ishtp-fw-loader.c  | 19 ++++++++-----------
 drivers/hid/intel-ish-hid/ishtp-hid-client.c | 19 ++++++++-----------
 drivers/hid/intel-ish-hid/ishtp/bus.c        |  2 +-
 drivers/platform/chrome/cros_ec_ishtp.c      | 19 ++++++++-----------
 drivers/platform/x86/intel/ishtp_eclite.c    | 19 ++++++++-----------
 include/linux/intel-ish-client-if.h          |  4 ++--
 include/linux/mod_devicetable.h              |  5 +++--
 7 files changed, 38 insertions(+), 49 deletions(-)

diff --git a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
index 945a9d0b68cd..0e1183e96147 100644
--- a/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
+++ b/drivers/hid/intel-ish-hid/ishtp-fw-loader.c
@@ -76,9 +76,12 @@ enum ish_loader_commands {
 #define LOADER_XFER_MODE_ISHTP			BIT(1)
 
 /* ISH Transport Loader client unique GUID */
-static const guid_t loader_ishtp_guid =
-	GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7,
-		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc);
+static const struct ishtp_device_id loader_ishtp_id_table[] = {
+	{ .guid = GUID_INIT(0xc804d06a, 0x55bd, 0x4ea7,
+		  0xad, 0xed, 0x1e, 0x31, 0x22, 0x8c, 0x76, 0xdc) },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);
 
 #define FILENAME_SIZE				256
 
@@ -880,7 +883,7 @@ static int loader_init(struct ishtp_cl *loader_ishtp_cl, int reset)
 
 	fw_client =
 		ishtp_fw_cl_get_client(ishtp_get_ishtp_device(loader_ishtp_cl),
-				       &loader_ishtp_guid);
+				       &loader_ishtp_id_table[0].guid);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(client_data),
 			"ISH client uuid not found\n");
@@ -1057,18 +1060,12 @@ static int loader_ishtp_cl_reset(struct ishtp_cl_device *cl_device)
 
 static struct ishtp_cl_driver	loader_ishtp_cl_driver = {
 	.name = "ish-loader",
-	.guid = &loader_ishtp_guid,
+	.id = loader_ishtp_id_table,
 	.probe = loader_ishtp_cl_probe,
 	.remove = loader_ishtp_cl_remove,
 	.reset = loader_ishtp_cl_reset,
 };
 
-static const struct ishtp_device_id loader_ishtp_id_table[] = {
-	{ loader_ishtp_guid },
-	{ }
-};
-MODULE_DEVICE_TABLE(ishtp, loader_ishtp_id_table);
-
 static int __init ish_loader_init(void)
 {
 	return ishtp_cl_driver_register(&loader_ishtp_cl_driver, THIS_MODULE);
diff --git a/drivers/hid/intel-ish-hid/ishtp-hid-client.c b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
index fb47d38d1e87..4338c9b68a43 100644
--- a/drivers/hid/intel-ish-hid/ishtp-hid-client.c
+++ b/drivers/hid/intel-ish-hid/ishtp-hid-client.c
@@ -12,9 +12,12 @@
 #include "ishtp-hid.h"
 
 /* ISH Transport protocol (ISHTP in short) GUID */
-static const guid_t hid_ishtp_guid =
-	GUID_INIT(0x33AECD58, 0xB679, 0x4E54,
-		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26);
+static const struct ishtp_device_id hid_ishtp_id_table[] = {
+	{ .guid = GUID_INIT(0x33AECD58, 0xB679, 0x4E54,
+		  0x9B, 0xD9, 0xA0, 0x4D, 0x34, 0xF0, 0xC2, 0x26), },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
 
 /* Rx ring buffer pool size */
 #define HID_CL_RX_RING_SIZE	32
@@ -662,7 +665,7 @@ static int hid_ishtp_cl_init(struct ishtp_cl *hid_ishtp_cl, int reset)
 	ishtp_set_tx_ring_size(hid_ishtp_cl, HID_CL_TX_RING_SIZE);
 	ishtp_set_rx_ring_size(hid_ishtp_cl, HID_CL_RX_RING_SIZE);
 
-	fw_client = ishtp_fw_cl_get_client(dev, &hid_ishtp_guid);
+	fw_client = ishtp_fw_cl_get_client(dev, &hid_ishtp_id_table[0].guid);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(client_data),
 			"ish client uuid not found\n");
@@ -945,19 +948,13 @@ static const struct dev_pm_ops hid_ishtp_pm_ops = {
 
 static struct ishtp_cl_driver	hid_ishtp_cl_driver = {
 	.name = "ish-hid",
-	.guid = &hid_ishtp_guid,
+	.id = hid_ishtp_id_table,
 	.probe = hid_ishtp_cl_probe,
 	.remove = hid_ishtp_cl_remove,
 	.reset = hid_ishtp_cl_reset,
 	.driver.pm = &hid_ishtp_pm_ops,
 };
 
-static const struct ishtp_device_id hid_ishtp_id_table[] = {
-	{ hid_ishtp_guid },
-	{ }
-};
-MODULE_DEVICE_TABLE(ishtp, hid_ishtp_id_table);
-
 static int __init ish_hid_init(void)
 {
 	int	rv;
diff --git a/drivers/hid/intel-ish-hid/ishtp/bus.c b/drivers/hid/intel-ish-hid/ishtp/bus.c
index e159cd1c5f37..f68aba8794fe 100644
--- a/drivers/hid/intel-ish-hid/ishtp/bus.c
+++ b/drivers/hid/intel-ish-hid/ishtp/bus.c
@@ -241,7 +241,7 @@ static int ishtp_cl_bus_match(struct device *dev, struct device_driver *drv)
 	struct ishtp_cl_device *device = to_ishtp_cl_device(dev);
 	struct ishtp_cl_driver *driver = to_ishtp_cl_driver(drv);
 
-	return guid_equal(driver->guid,
+	return guid_equal(&driver->id[0].guid,
 			  &device->fw_client->props.protocol_name);
 }
 
diff --git a/drivers/platform/chrome/cros_ec_ishtp.c b/drivers/platform/chrome/cros_ec_ishtp.c
index 8c17358e84c1..4020b8354bae 100644
--- a/drivers/platform/chrome/cros_ec_ishtp.c
+++ b/drivers/platform/chrome/cros_ec_ishtp.c
@@ -41,9 +41,12 @@ enum cros_ec_ish_channel {
 #define ISHTP_SEND_TIMEOUT			(3 * HZ)
 
 /* ISH Transport CrOS EC ISH client unique GUID */
-static const guid_t cros_ish_guid =
-	GUID_INIT(0x7b7154d0, 0x56f4, 0x4bdc,
-		  0xb0, 0xd8, 0x9e, 0x7c, 0xda,	0xe0, 0xd6, 0xa0);
+static const struct ishtp_device_id cros_ec_ishtp_id_table[] = {
+	{ .guid = GUID_INIT(0x7b7154d0, 0x56f4, 0x4bdc,
+		  0xb0, 0xd8, 0x9e, 0x7c, 0xda,	0xe0, 0xd6, 0xa0), },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, cros_ec_ishtp_id_table);
 
 struct header {
 	u8 channel;
@@ -389,7 +392,7 @@ static int cros_ish_init(struct ishtp_cl *cros_ish_cl)
 	ishtp_set_tx_ring_size(cros_ish_cl, CROS_ISH_CL_TX_RING_SIZE);
 	ishtp_set_rx_ring_size(cros_ish_cl, CROS_ISH_CL_RX_RING_SIZE);
 
-	fw_client = ishtp_fw_cl_get_client(dev, &cros_ish_guid);
+	fw_client = ishtp_fw_cl_get_client(dev, &cros_ec_ishtp_id_table[0].guid);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(client_data),
 			"ish client uuid not found\n");
@@ -765,7 +768,7 @@ static SIMPLE_DEV_PM_OPS(cros_ec_ishtp_pm_ops, cros_ec_ishtp_suspend,
 
 static struct ishtp_cl_driver	cros_ec_ishtp_driver = {
 	.name = "cros_ec_ishtp",
-	.guid = &cros_ish_guid,
+	.id = cros_ec_ishtp_id_table,
 	.probe = cros_ec_ishtp_probe,
 	.remove = cros_ec_ishtp_remove,
 	.reset = cros_ec_ishtp_reset,
@@ -774,12 +777,6 @@ static struct ishtp_cl_driver	cros_ec_ishtp_driver = {
 	},
 };
 
-static const struct ishtp_device_id cros_ec_ishtp_id_table[] = {
-	{ cros_ish_guid },
-	{ }
-};
-MODULE_DEVICE_TABLE(ishtp, cros_ec_ishtp_id_table);
-
 static int __init cros_ec_ishtp_mod_init(void)
 {
 	return ishtp_cl_driver_register(&cros_ec_ishtp_driver, THIS_MODULE);
diff --git a/drivers/platform/x86/intel/ishtp_eclite.c b/drivers/platform/x86/intel/ishtp_eclite.c
index b9fb8f28fd63..b2da3a4b3e1b 100644
--- a/drivers/platform/x86/intel/ishtp_eclite.c
+++ b/drivers/platform/x86/intel/ishtp_eclite.c
@@ -93,9 +93,12 @@ struct ishtp_opregion_dev {
 };
 
 /* eclite ishtp client UUID: 6a19cc4b-d760-4de3-b14d-f25ebd0fbcd9 */
-static const guid_t ecl_ishtp_guid =
-	GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3,
-		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9);
+static const struct ishtp_device_id ecl_ishtp_id_table[] = {
+	{ .guid = GUID_INIT(0x6a19cc4b, 0xd760, 0x4de3,
+		  0xb1, 0x4d, 0xf2, 0x5e, 0xbd, 0xf, 0xbc, 0xd9), },
+	{ }
+};
+MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
 
 /* ACPI DSM UUID: 91d936a7-1f01-49c6-a6b4-72f00ad8d8a5 */
 static const guid_t ecl_acpi_guid =
@@ -462,7 +465,7 @@ static int ecl_ishtp_cl_init(struct ishtp_cl *ecl_ishtp_cl)
 	ishtp_set_tx_ring_size(ecl_ishtp_cl, ECL_CL_TX_RING_SIZE);
 	ishtp_set_rx_ring_size(ecl_ishtp_cl, ECL_CL_RX_RING_SIZE);
 
-	fw_client = ishtp_fw_cl_get_client(dev, &ecl_ishtp_guid);
+	fw_client = ishtp_fw_cl_get_client(dev, &ecl_ishtp_id_table[0].guid);
 	if (!fw_client) {
 		dev_err(cl_data_to_dev(opr_dev), "fw client not found\n");
 		return -ENOENT;
@@ -674,19 +677,13 @@ static const struct dev_pm_ops ecl_ishtp_pm_ops = {
 
 static struct ishtp_cl_driver ecl_ishtp_cl_driver = {
 	.name = "ishtp-eclite",
-	.guid = &ecl_ishtp_guid,
+	.id = &ecl_ishtp_id_table,
 	.probe = ecl_ishtp_cl_probe,
 	.remove = ecl_ishtp_cl_remove,
 	.reset = ecl_ishtp_cl_reset,
 	.driver.pm = &ecl_ishtp_pm_ops,
 };
 
-static const struct ishtp_device_id ecl_ishtp_id_table[] = {
-	{ ecl_ishtp_guid },
-	{ }
-};
-MODULE_DEVICE_TABLE(ishtp, ecl_ishtp_id_table);
-
 static int __init ecl_ishtp_init(void)
 {
 	return ishtp_cl_driver_register(&ecl_ishtp_cl_driver, THIS_MODULE);
diff --git a/include/linux/intel-ish-client-if.h b/include/linux/intel-ish-client-if.h
index aee8ff4739b1..f45f13304add 100644
--- a/include/linux/intel-ish-client-if.h
+++ b/include/linux/intel-ish-client-if.h
@@ -9,7 +9,7 @@
 #define _INTEL_ISH_CLIENT_IF_H_
 
 #include <linux/device.h>
-#include <linux/uuid.h>
+#include <linux/mod_devicetable.h>
 
 struct ishtp_cl_device;
 struct ishtp_device;
@@ -40,7 +40,7 @@ enum cl_state {
 struct ishtp_cl_driver {
 	struct device_driver driver;
 	const char *name;
-	const guid_t *guid;
+	const struct ishtp_device_id *id;
 	int (*probe)(struct ishtp_cl_device *dev);
 	void (*remove)(struct ishtp_cl_device *dev);
 	int (*reset)(struct ishtp_cl_device *dev);
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index befbf53c4b7c..bcfd5357c9a5 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -901,11 +901,12 @@ struct dfl_device_id {
 
 /**
  * struct ishtp_device_id - ISHTP device identifier
- * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
- * @context: pointer to driver specific data
+ * @guid: 16-byte binary guid representation
+ * @driver_data: pointer to driver specific data
  */
 struct ishtp_device_id {
 	guid_t guid;
+	kernel_ulong_t driver_data;
 };
 
 #endif /* LINUX_MOD_DEVICETABLE_H */
-- 
2.29.2

