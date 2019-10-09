Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CEB4D072C
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 08:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfJIG3F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 02:29:05 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40683 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729285AbfJIG3F (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Oct 2019 02:29:05 -0400
Received: by mail-io1-f66.google.com with SMTP id h144so2484146iof.7
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L/flZya9J8rT+q2TDHIJqFvxMr7DAFkfWMyF2R3rN6A=;
        b=kzMkqjsvSojL8+sPhEZqeQoMu4zrT5fsBWdCmfEjsgSTxeZo9G4w87bmtpyXqQ9ypc
         2gGY1UK1Ke5fnVqw5oWuxx8zJJQNlI6LMK2UpaTUShFjaTXU0HkpF3jMacy7FofLeRqU
         v0MunkBm9QMAYYnR54zC2un4NkoKmLv0N2PwrrQkpYmF4a7MDhAbcIex4Nw/sXl0PTQp
         iQkdPz5VlLyrzwPKNE0NuWj+TSusviiNlAA8rgRsJQGnOqaT9QRtqvHK5utO99AJ2iax
         mm39cFV94PqKmI3CDAIjpbhkk1u9zHcgA4h2GrPx3H5YMqISuZ4z/e3nqPSYmxof70m5
         08+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L/flZya9J8rT+q2TDHIJqFvxMr7DAFkfWMyF2R3rN6A=;
        b=ZsESZObG4UXXr3dlFXia3A1UCbv5zLq7Gco+kmDUeds34095vkcVnWJQu6omSgnrA0
         ALl5O6CUV8Z1xa8GaKrCZ/ud+ml+cayT23cJb9T1o0D8yACsbQHJKcmrIJusT/TqVgCb
         GCOyKjbhVQbJCIia8bXHk6rUbiido84zH7g+efYH01pg+IK3OPyRvalEf4cn1xXAg7y9
         nUH0OEGgKwSHKJW6JOuZpAnFb49N0y9cL8OGjOMNsCFbibEribNTDMbbEOjeB69Fk6G7
         FEoaNLh6yGCcccMcC4l7IJy91dt7kYr1PXOR31YasffB84/0o5gLkyHb95AYaym4k8Ay
         94Bw==
X-Gm-Message-State: APjAAAVCrq/skQ0GQrRWtTVgPg4PMnccflQ5Q2t/hv7TvI0EgumqMjEz
        G2jFkNYk3bSkvLNTaYKS8dP6vPnO5iM=
X-Google-Smtp-Source: APXvYqz5hf/Qg/KHbQ+jTnT7f6nP6Kxt1Z7bZTKaH0F27KxcXaq8ulKkKYw7fKug0ZbqvXiRPMGmPg==
X-Received: by 2002:a02:cd8e:: with SMTP id l14mr1743194jap.30.1570602544118;
        Tue, 08 Oct 2019 23:29:04 -0700 (PDT)
Received: from Arrakis.djogorchock.com ([136.61.189.171])
        by smtp.gmail.com with ESMTPSA id r22sm880844ilb.85.2019.10.08.23.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2019 23:29:03 -0700 (PDT)
From:   "Daniel J. Ogorchock" <djogorchock@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     thunderbird2k@gmail.com, blaws05@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: [PATCH v7 4/8] HID: nintendo: add home led support
Date:   Wed,  9 Oct 2019 01:28:29 -0500
Message-Id: <20191009062833.3599398-5-djogorchock@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191009062833.3599398-1-djogorchock@gmail.com>
References: <20191009062833.3599398-1-djogorchock@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the ability to set the intensity level of the home
button's LED.

Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
---
 drivers/hid/hid-nintendo.c | 69 +++++++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-nintendo.c b/drivers/hid/hid-nintendo.c
index c12cea6b75d8..9108d85f7668 100644
--- a/drivers/hid/hid-nintendo.c
+++ b/drivers/hid/hid-nintendo.c
@@ -187,7 +187,8 @@ struct joycon_input_report {
 struct joycon_ctlr {
 	struct hid_device *hdev;
 	struct input_dev *input;
-	struct led_classdev leds[JC_NUM_LEDS];
+	struct led_classdev leds[JC_NUM_LEDS]; /* player leds */
+	struct led_classdev home_led;
 	enum joycon_ctlr_state ctlr_state;
 	spinlock_t lock;
 
@@ -660,6 +661,40 @@ static int joycon_player_led_brightness_set(struct led_classdev *led,
 	return ret;
 }
 
+static int joycon_home_led_brightness_set(struct led_classdev *led,
+					  enum led_brightness brightness)
+{
+	struct device *dev = led->dev->parent;
+	struct hid_device *hdev = to_hid_device(dev);
+	struct joycon_ctlr *ctlr;
+	struct joycon_subcmd_request *req;
+	u8 buffer[sizeof(*req) + 5] = { 0 };
+	u8 *data;
+	int ret;
+
+	ctlr = hid_get_drvdata(hdev);
+	if (!ctlr) {
+		hid_err(hdev, "No controller data\n");
+		return -ENODEV;
+	}
+
+	req = (struct joycon_subcmd_request *)buffer;
+	req->subcmd_id = JC_SUBCMD_SET_HOME_LIGHT;
+	data = req->data;
+	data[0] = 0x01;
+	data[1] = brightness << 4;
+	data[2] = brightness | (brightness << 4);
+	data[3] = 0x11;
+	data[4] = 0x11;
+
+	hid_dbg(hdev, "setting home led brightness\n");
+	mutex_lock(&ctlr->output_mutex);
+	ret = joycon_send_subcmd(ctlr, req, 5);
+	mutex_unlock(&ctlr->output_mutex);
+
+	return ret;
+}
+
 static const char * const joycon_player_led_names[] = {
 	"player1",
 	"player2",
@@ -668,7 +703,7 @@ static const char * const joycon_player_led_names[] = {
 };
 
 static DEFINE_MUTEX(joycon_input_num_mutex);
-static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
+static int joycon_leds_create(struct joycon_ctlr *ctlr)
 {
 	struct hid_device *hdev = ctlr->hdev;
 	struct device *dev = &hdev->dev;
@@ -705,7 +740,7 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		ret = devm_led_classdev_register(&hdev->dev, led);
 		if (ret) {
 			hid_err(hdev, "Failed registering %s LED\n", led->name);
-			break;
+			return ret;
 		}
 	}
 
@@ -713,6 +748,32 @@ static int joycon_player_leds_create(struct joycon_ctlr *ctlr)
 		input_num = 1;
 	mutex_unlock(&joycon_input_num_mutex);
 
+	/* configure the home LED */
+	if (ctlr->hdev->product != USB_DEVICE_ID_NINTENDO_JOYCONL) {
+		name = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", d_name, "home");
+		if (!name)
+			return ret;
+
+		led = &ctlr->home_led;
+		led->name = name;
+		led->brightness = 0;
+		led->max_brightness = 0xF;
+		led->brightness_set_blocking = joycon_home_led_brightness_set;
+		led->flags = LED_CORE_SUSPENDRESUME | LED_HW_PLUGGABLE;
+		ret = devm_led_classdev_register(&hdev->dev, led);
+		if (ret) {
+			hid_err(hdev, "Failed registering home led\n");
+			return ret;
+		}
+		/* Set the home LED to 0 as default state */
+		ret = joycon_home_led_brightness_set(led, 0);
+		if (ret) {
+			hid_err(hdev, "Failed to set home LED dflt; ret=%d\n",
+									ret);
+			return ret;
+		}
+	}
+
 	return 0;
 }
 
@@ -964,7 +1025,7 @@ static int nintendo_hid_probe(struct hid_device *hdev,
 	}
 
 	/* Initialize the leds */
-	ret = joycon_player_leds_create(ctlr);
+	ret = joycon_leds_create(ctlr);
 	if (ret) {
 		hid_err(hdev, "Failed to create leds; ret=%d\n", ret);
 		goto err_close;
-- 
2.23.0

