Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18A0438B99E
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 00:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhETWsy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 May 2021 18:48:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231861AbhETWsy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 May 2021 18:48:54 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C97FC061574
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:31 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id c20so17973508qkm.3
        for <linux-input@vger.kernel.org>; Thu, 20 May 2021 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qhSQeJB763cMwz58WJbI0C+i53NDYrc5yQr8W5tYYBw=;
        b=h16vjXKdKOCR+FeT2Hdm2c/0p/AOPt4rGr8DIzGyYGEFCrcIhjaKe6JTSREWe5D6vD
         beEkF1ksBMDNVQf3ZruaiPtYOmI9ctcyqyPAeyWPjtAcXTvHDG1zhoaOw2/6w4FacMJg
         mVwyOuFt29s+GbIIAnQ5HD1vBjnHOUH1Ewa+aje4njn/Fg4nB9ZQs0/eO/nesCtXpVYj
         CmPVEJK3za0fI0H9gCw9OGY9kin2xVu8+myob0Ggy2V6AYetgybBbFe1DZo1KRckcTB/
         vntrq70cqgl4Y65lhsaUjLobZjuyy2s3/x53FSvu2jJ3LVlSOl82D5PkIoLbKw8fcQDg
         zmNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qhSQeJB763cMwz58WJbI0C+i53NDYrc5yQr8W5tYYBw=;
        b=NMAhAv2P5h/Cpxyl0PRuQ0reomSKkNNKjaARp1OECiRfqN74e9urabVS0Am7jUv4CB
         ocOZfUTCgZbpff+N6Z4o6rwLlFThJKNL3BerRQg3AwMpzp8fq0wKpYcmCvBjd0/BpLzi
         Ehgr7xF/Gq4rH28/+Dncl3cAbnqvHAd5OXkLJlvYSCnZpVFGcRQsC08fEpBPGLfCoqEB
         l60JpoQE8f4K6OUWnPUSwiJ4sHpKfsDTCPAIUrD8VBPAQK0aESCiXEtXkY4Z+nZwjizg
         wzx8VpSqyHhoGfDkZYKaIO/ApdsNaG7Ru3QS7kQ4BJOJg0UeFOS6gCeiu/acViuGaSbd
         xoNA==
X-Gm-Message-State: AOAM5307z2WDUhdnpNXvXNFLS671OlB8m7PuMVstWRTEtLYWbYo4tVvN
        nxrFw80CvyMwz7hqSzK+57HD5F3UexkQDA==
X-Google-Smtp-Source: ABdhPJzMgWg2wh+LC6Eeis87c9V0JHyRKUaispwQI2HYchRoy6abKg/dCohp42jWnHfy6IlZckzN1g==
X-Received: by 2002:a37:9c17:: with SMTP id f23mr6657340qke.125.1621550850510;
        Thu, 20 May 2021 15:47:30 -0700 (PDT)
Received: from Arrakis.djogorchock.com (pool-173-68-68-24.nycmny.fios.verizon.net. [173.68.68.24])
        by smtp.gmail.com with ESMTPSA id s11sm2126251qtn.77.2021.05.20.15.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 15:47:29 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v13 02/15] HID: nintendo: add player led support
Date:   Thu, 20 May 2021 18:47:02 -0400
Message-Id: <20210520224715.680919-3-djogorchock@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
References: <20210520224715.680919-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds led_classdev functionality to the switch controller
driver. It adds support for the 4 player LEDs. The Home Button LED still
needs to be supported on the pro controllers and right joy-con.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/Kconfig        |  2 +
 drivers/hid/hid-nintendo.c | 95 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 95 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 1f23e84f8bdf3..86a6129d3d89f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -722,6 +722,8 @@ config HID_MULTITOUCH
 config HID_NINTENDO
 	tristate "Nintendo Joy-Con and Pro Controller support"
 	depends on HID
+	depends on NEW_LEDS
+	depends on LEDS_CLASS
 	help
 	Adds support for the Nintendo Switch Joy-Cons and Pro Controller.
 	All controllers support bluetooth, and the Pro Controller also supports
diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index b6c0e5e36d8b0..c21682b4a2e62 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -25,6 +25,7 @@
 #include <linux/device.h>
 #include <linux/hid.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/spinlock.h>
 
@@ -183,11 +184,13 @@ struct joycon_input_report {
 } __packed;
 
 #define JC_MAX_RESP_SIZE	(sizeof(struct joycon_input_report) + 35)
+#define JC_NUM_LEDS		4
 
 /* Each physical controller is associated with a joycon_ctlr struct */
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
+	struct led_classdev leds[JC_NUM_LEDS];
 	enum joycon_ctlr_state ctlr_state;
 
 	/* The following members are used for synchronous sends/receives */
@@ -553,11 +556,9 @@ static const unsigned int joycon_dpad_inputs_jc[] = {
 	BTN_DPAD_UP, BTN_DPAD_DOWN, BTN_DPAD_LEFT, BTN_DPAD_RIGHT,
 };
 
-static DEFINE_MUTEX(joycon_input_num_mutex);
 static int joycon_input_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev;
-	static int input_num = 1;
 	const char *name;
 	int ret;
 	int i;
@@ -643,6 +644,66 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		return ret;
 
+	return 0;
+}
+
+static int joycon_player_led_brightness_set(struct led_classdev *led,
+					    enum led_brightness brightness)
+{
+	struct device *dev = led->dev->parent;
+	struct hid_device *hdev = to_hid_device(dev);
+	struct joycon_ctlr *ctlr;
+	int val = 0;
+	int i;
+	int ret;
+	int num;
+
+	ctlr = hid_get_drvdata(hdev);
+	if (!ctlr) {
+		hid_err(hdev, "No controller data\n");
+		return -ENODEV;
+	}
+
+	/* determine which player led this is */
+	for (num = 0; num < JC_NUM_LEDS; num++) {
+		if (&ctlr->leds[num] == led)
+			break;
+	}
+	if (num >= JC_NUM_LEDS)
+		return -EINVAL;
+
+	mutex_lock(&ctlr->output_mutex);
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		if (i == num)
+			val |= brightness << i;
+		else
+			val |= ctlr->leds[i].brightness << i;
+	}
+	ret = joycon_set_player_leds(ctlr, 0, val);
+	mutex_unlock(&ctlr->output_mutex);
+
+	return ret;
+}
+
+static const char * const joycon_player_led_names[] = {
+	"player1",
+	"player2",
+	"player3",
+	"player4"
+};
+
+static DEFINE_MUTEX(joycon_input_num_mutex);
+static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+{
+	struct hid_device *hdev = ctlr->hdev;
+	struct device *dev = &hdev->dev;
+	const char *d_name = dev_name(dev);
+	struct led_classdev *led;
+	char *name;
+	int ret = 0;
+	int i;
+	static int input_num = 1;
+
 	/* Set the default controller player leds based on controller number */
 	mutex_lock(&joycon_input_num_mutex);
 	mutex_lock(&ctlr->output_mutex);
@@ -650,6 +711,29 @@ static int joycon_input_create(struct joycon_ctlr *ctlr)
 	if (ret)
 		hid_warn(ctlr->hdev, "Failed to set leds; ret=%d\n", ret);
 	mutex_unlock(&ctlr->output_mutex);
+
+	/* configure the player LEDs */
+	for (i = 0; i < JC_NUM_LEDS; i++) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name,
+				      joycon_player_led_names[i]);
+		if (!name)
+			return -ENOMEM;
+
+		led = &ctlr->leds[i];
+		led->name = name;
+		led->brightness = ((i + 1) <= input_num) ? LED_ON : LED_OFF;
+		led->max_brightness = LED_ON;
+		led->brightness_set_blocking =
+					joycon_player_led_brightness_set;
+		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
+
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret) {
+			hid_err(hdev, "Failed registering %s LED\n", led->name);
+			break;
+		}
+	}
+
 	if (++input_num > 4)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
@@ -813,6 +897,13 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 
 	mutex_unlock(&ctlr->output_mutex);
 
+	/* Initialize the leds */
+	ret = joycon_player_leds_create(ctlr);
+	if (ret) {
+		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
+		goto err_close;
+	}
+
 	ret = joycon_input_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create input device; ret=%d\n", ret);
-- 
2.31.1

