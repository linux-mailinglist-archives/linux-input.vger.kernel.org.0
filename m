Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0746A320542
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhBTM0V (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51911 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229667AbhBTM0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823892;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jOL+FdwS/B3DRKhCWYwqfisPm30E1ScKv54DcYwPS6U=;
        b=KomwKoWTwoSSmiD8ORo8z7WTfzPF964F6SolRE2p/SqRI3iRbYoN1CAvW3yYvYl4FhihCW
        52QReM3sUM5QFxbh8bn2irOhFLAd55895pywSiu+b1eSvVZUwDtF4CeaMoA0JTofHPOCML
        Jz89jW8P1YWcD7Fx7oDBwgE0JggRbWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-Qo5BOthvMlaAUcFtJQoe2w-1; Sat, 20 Feb 2021 07:24:50 -0500
X-MC-Unique: Qo5BOthvMlaAUcFtJQoe2w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18E701E563;
        Sat, 20 Feb 2021 12:24:49 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EFDF1100164C;
        Sat, 20 Feb 2021 12:24:47 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 4/7] HID: lenovo: Remove lenovo_led_brightness_get()
Date:   Sat, 20 Feb 2021 13:24:35 +0100
Message-Id: <20210220122438.21857-5-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since lenovo_led_brightness_get() just returns the last set value
it does not add any functionality, so we can just remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/hid/hid-lenovo.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index f1868b5d9b58..bb8e5ebdaabe 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -768,22 +768,6 @@ static void lenovo_led_set_tpkbd(struct hid_device *hdev)
 	hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
 }
 
-static enum led_brightness lenovo_led_brightness_get(
-			struct led_classdev *led_cdev)
-{
-	struct device *dev = led_cdev->dev->parent;
-	struct hid_device *hdev = to_hid_device(dev);
-	struct lenovo_drvdata *data_pointer = hid_get_drvdata(hdev);
-	int led_nr = 0;
-
-	if (led_cdev == &data_pointer->led_micmute)
-		led_nr = 1;
-
-	return data_pointer->led_state & (1 << led_nr)
-				? LED_FULL
-				: LED_OFF;
-}
-
 static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
@@ -831,7 +815,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
-	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
@@ -840,7 +823,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
-	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
-- 
2.30.1

