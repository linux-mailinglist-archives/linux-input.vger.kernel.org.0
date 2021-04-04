Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9FC8353745
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 09:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhDDHxN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 03:53:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56449 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229788AbhDDHxK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 03:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617522786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8F2L8XZBcnlIjAt8iGkwkSWvI1GfQmnb5P2PUhjAY94=;
        b=KmPm4zfd+vzkZw85fwd6O0K147R/di5wyTOczaGG+j5oF/HQq/hx7BWLEXDcEFa+OU/B+F
        CRBHY9CWfwR5tQ4lkgx59IeuM2A+8okHJAzTyQLA5keQtr06mxDLjmaW+WuYo3TUX9Osm5
        9/bLwsxoFYEeE+wIrdwt3w5KxOz9F/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-T9d1aV7wPx6UQvghizka9g-1; Sun, 04 Apr 2021 03:53:04 -0400
X-MC-Unique: T9d1aV7wPx6UQvghizka9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B16B58030A1;
        Sun,  4 Apr 2021 07:53:03 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 535535C5DF;
        Sun,  4 Apr 2021 07:53:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH resend 3/3] HID: elan: Remove elan_mute_led_get_brigtness()
Date:   Sun,  4 Apr 2021 09:52:52 +0200
Message-Id: <20210404075252.4032-4-hdegoede@redhat.com>
In-Reply-To: <20210404075252.4032-1-hdegoede@redhat.com>
References: <20210404075252.4032-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since elan_mute_led_get_brigtness() just returns the last set value
it does not add any functionality, so we can just remove it.

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 5173f50d474d..021049805bb7 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -410,15 +410,6 @@ static int elan_start_multitouch(struct hid_device *hdev)
 	return 0;
 }
 
-static enum led_brightness elan_mute_led_get_brigtness(struct led_classdev *led_cdev)
-{
-	struct device *dev = led_cdev->dev->parent;
-	struct hid_device *hdev = to_hid_device(dev);
-	struct elan_drvdata *drvdata = hid_get_drvdata(hdev);
-
-	return drvdata->mute_led_state;
-}
-
 static int elan_mute_led_set_brigtness(struct led_classdev *led_cdev,
 				       enum led_brightness value)
 {
@@ -461,7 +452,6 @@ static int elan_init_mute_led(struct hid_device *hdev)
 
 	mute_led->name = "elan:red:mute";
 	mute_led->default_trigger = "audio-mute";
-	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
 	mute_led->flags = LED_HW_PLUGGABLE;
-- 
2.30.2

