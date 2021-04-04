Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353A935374E
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 10:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230037AbhDDIEs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 04:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24007 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229861AbhDDIEs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 04:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617523483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iFN6RW3Cpccm3D6gxN7YWCPkIi5izmy1URavwZkYT4o=;
        b=SYS5FybiaIog/X7dy0WHiJlY39Wbn95hVtAZ10FVDIoOqwmqinSZE87HbGzxC4rpkAz4Ao
        N2n6XtHStjQLYSo78lnrMErRPC4jxICM2IXXAuYgjlEdcxyyk93x4OX6X3A9yaURN5lhpm
        H+luU/N4PnlgklJfPuPkljfZp9zFS24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-0cVvFArqNfystABuht2cow-1; Sun, 04 Apr 2021 04:04:42 -0400
X-MC-Unique: 0cVvFArqNfystABuht2cow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3AE180FCA7;
        Sun,  4 Apr 2021 08:04:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BA04E100E113;
        Sun,  4 Apr 2021 08:04:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 resend 1/9] HID: lenovo: Use brightness_set_blocking callback for setting LEDs brightness
Date:   Sun,  4 Apr 2021 10:04:24 +0200
Message-Id: <20210404080432.4322-2-hdegoede@redhat.com>
In-Reply-To: <20210404080432.4322-1-hdegoede@redhat.com>
References: <20210404080432.4322-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The lenovo_led_brightness_set function may sleep, so we should have the
the led_class_dev's brightness_set_blocking callback point to it, rather
then the regular brightness_set callback.

When toggled through sysfs this is not a problem, but the brightness_set
callback may be called from atomic context when using LED-triggers.

Fixes: bc04b37ea0ec ("HID: lenovo: Add ThinkPad 10 Ultrabook Keyboard support")
Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index c6c8e20f3e8d..4dc5e5f932ed 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -777,7 +777,7 @@ static enum led_brightness lenovo_led_brightness_get(
 				: LED_OFF;
 }
 
-static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
+static int lenovo_led_brightness_set(struct led_classdev *led_cdev,
 			enum led_brightness value)
 {
 	struct device *dev = led_cdev->dev->parent;
@@ -802,6 +802,8 @@ static void lenovo_led_brightness_set(struct led_classdev *led_cdev,
 		lenovo_led_set_tp10ubkbd(hdev, tp10ubkbd_led[led_nr], value);
 		break;
 	}
+
+	return 0;
 }
 
 static int lenovo_register_leds(struct hid_device *hdev)
@@ -822,7 +824,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
-	data->led_mute.brightness_set = lenovo_led_brightness_set;
+	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
 	if (ret < 0)
@@ -830,7 +832,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
-	data->led_micmute.brightness_set = lenovo_led_brightness_set;
+	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
 	if (ret < 0) {
-- 
2.30.2

