Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C02632DA4D
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhCDTXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29023 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234975AbhCDTXQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885710;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7xmBlRuZSRDsvCOUTzdafxLoB8Jh5uBwEExSVC1VlxQ=;
        b=I0K6eUApxieMCBv+FdOjCPQL/bmT2hGmg4rbkkYKNo+kF0RmwtGLr5d/dVI8+MZu1ubGrR
        nQgEbpPiNjDTjqNo7DPtlRDDH89zqEnDiLbeO/NWn9hw8mwuI4s72cuyyH5Bm85ADnyebo
        GOput8gsuz4C6aueoBHlqd2WSaEJ4SU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-X6p1qxr7MvWMMQOzZz8jig-1; Thu, 04 Mar 2021 14:21:48 -0500
X-MC-Unique: X6p1qxr7MvWMMQOzZz8jig-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B187183DD22;
        Thu,  4 Mar 2021 19:21:47 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0743319CAB;
        Thu,  4 Mar 2021 19:21:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v4 4/9] HID: lenovo: Remove lenovo_led_brightness_get()
Date:   Thu,  4 Mar 2021 20:21:29 +0100
Message-Id: <20210304192134.520919-5-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since lenovo_led_brightness_get() just returns the last set value
it does not add any functionality, so we can just remove it.

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/hid/hid-lenovo.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index b2596ed37880..1b8dd85ceb05 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -774,22 +774,6 @@ static void lenovo_led_set_tpkbd(struct hid_device *hdev)
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
@@ -837,7 +821,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
-	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
@@ -846,7 +829,6 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
-	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
-- 
2.30.1

