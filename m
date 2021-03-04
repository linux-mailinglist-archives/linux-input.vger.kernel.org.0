Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB5A32DA4B
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234530AbhCDTXb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39081 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230472AbhCDTXL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885705;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ba8o6S9lGeuNCrB6sTsjLo4VJbku4/yPgQ3LirIZ6UE=;
        b=WcubRBksDOcLXy/UWzYiOIFwZMUMIJjqMCIrICQ+IDTgmRKwo3oR+u5f3kKl+p7uzgkviy
        hP8s9mf1+Zs8SPfw2C0AbGMVTrZ/U5BRLRoY5aS7WQoXf/r+lPwik5SdHinlLIPzOytbqX
        n3hn0IDk38z/imxES0y4iEJzy3Ih478=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-ahhQMD4bPVuvRccKOhOIcA-1; Thu, 04 Mar 2021 14:21:44 -0500
X-MC-Unique: ahhQMD4bPVuvRccKOhOIcA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B020883DD20;
        Thu,  4 Mar 2021 19:21:42 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0DAB219CAB;
        Thu,  4 Mar 2021 19:21:40 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v4 1/9] HID: lenovo: Use brightness_set_blocking callback for setting LEDs brightness
Date:   Thu,  4 Mar 2021 20:21:26 +0100
Message-Id: <20210304192134.520919-2-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
2.30.1

