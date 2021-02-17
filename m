Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7AD631DF7B
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 20:20:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhBQTTO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 14:19:14 -0500
Received: from ec2-44-228-98-151.us-west-2.compute.amazonaws.com ([44.228.98.151]:58878
        "EHLO chill.innovation.ch" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232547AbhBQTTN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 14:19:13 -0500
X-Greylist: delayed 651 seconds by postgrey-1.27 at vger.kernel.org; Wed, 17 Feb 2021 14:19:10 EST
Received: from localhost (localhost [127.0.0.1])
        by chill.innovation.ch (Postfix) with ESMTP id 30D451B640F;
        Wed, 17 Feb 2021 19:07:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at chill.innovation.ch
Received: from chill.innovation.ch ([127.0.0.1])
        by localhost (chill.innovation.ch [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id 7BxdjnFa6Gfu; Wed, 17 Feb 2021 19:07:31 +0000 (UTC)
From:   =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>
DKIM-Filter: OpenDKIM Filter v2.11.0 chill.innovation.ch 77B491B5EA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=innovation.ch;
        s=default; t=1613588851;
        bh=NTnBPdcPQ1mHAuBRtKTt9xZ5SgKJhiroAKknFH1WnTw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bjhz7O0GLjLTNOkGgBYYRnp9CBqiOsET9xfFY56qDsSxdHc7lpTIB8Nj5s8g0RGiX
         4cJVGHvCZEkrfhaBvjueFaVDAUkMpdFoJVy+Ja9LoShKKssBoRdTneci9h3uTS/MIs
         NzrN6crorswasrDXGxzyydNVitahKYpClQ94koL7C9R554dJ38Y24OL87PrDWrci3S
         St0BCcJNP4kf06+0CipaFtNK2VwQ/kDrHG4g+v6UuA/cdT5eBqXFWlJd60NmbUk75+
         ecC4d/6YGdC+ieNIb8JW15fcHsEpG+1NTvFW7NfbYc63ZIJkUVDiGlabMqH9Y52S2c
         wR4lmGJm+vm/g==
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] Input: applespi: Add trace_event module param for early tracing.
Date:   Wed, 17 Feb 2021 11:07:18 -0800
Message-Id: <20210217190718.11035-3-ronald@innovation.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210217190718.11035-1-ronald@innovation.ch>
References: <20210217190718.11035-1-ronald@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The problem is that tracing can't be set via sysfs until the module is
loaded, at which point the keyboard and trackpad initialization commands
have already been run and hence tracing can't be used to debug problems
here.

Adding this param allows tracing to be enabled for messages sent and
received during module probing. It takes comma-separated list of events,
e.g.

  trace_event=applespi_tp_ini_cmd,applespi_bad_crc

Signed-off-by: Ronald Tschalär <ronald@innovation.ch>
---
 drivers/input/keyboard/applespi.c | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/input/keyboard/applespi.c b/drivers/input/keyboard/applespi.c
index f0a0067c48ff6..03f9ad0f83967 100644
--- a/drivers/input/keyboard/applespi.c
+++ b/drivers/input/keyboard/applespi.c
@@ -53,6 +53,8 @@
 #include <linux/module.h>
 #include <linux/spinlock.h>
 #include <linux/spi/spi.h>
+#include <linux/string.h>
+#include <linux/trace_events.h>
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
@@ -110,6 +112,10 @@ module_param_string(touchpad_dimensions, touchpad_dimensions,
 		    sizeof(touchpad_dimensions), 0444);
 MODULE_PARM_DESC(touchpad_dimensions, "The pixel dimensions of the touchpad, as XxY+W+H .");
 
+static char *trace_event;
+module_param(trace_event, charp, 0444);
+MODULE_PARM_DESC(trace_event, "Enable early event tracing. It takes the form of a comma-separated list of events to enable.");
+
 /**
  * struct keyboard_protocol - keyboard message.
  * message.type = 0x0110, message.length = 0x000a
@@ -1645,6 +1651,30 @@ static void applespi_save_bl_level(struct applespi_data *applespi,
 			 "Error saving backlight level to EFI vars: %d\n", sts);
 }
 
+static void applespi_enable_early_event_tracing(struct device *dev)
+{
+	char *buf, *event;
+	int sts;
+
+	if (trace_event && trace_event[0]) {
+		buf = kstrdup(trace_event, GFP_KERNEL);
+		if (!buf)
+			return;
+
+		while ((event = strsep(&buf, ","))) {
+			if (event[0]) {
+				sts = trace_set_clr_event("applespi", event, 1);
+				if (sts)
+					dev_warn(dev,
+						 "Error setting trace event '%s': %d\n",
+						 event, sts);
+			}
+		}
+
+		kfree(buf);
+	}
+}
+
 static int applespi_probe(struct spi_device *spi)
 {
 	struct applespi_data *applespi;
@@ -1653,6 +1683,8 @@ static int applespi_probe(struct spi_device *spi)
 	int sts, i;
 	unsigned long long gpe, usb_status;
 
+	applespi_enable_early_event_tracing(&spi->dev);
+
 	/* check if the USB interface is present and enabled already */
 	acpi_sts = acpi_evaluate_integer(spi_handle, "UIST", NULL, &usb_status);
 	if (ACPI_SUCCESS(acpi_sts) && usb_status) {
-- 
2.26.2

