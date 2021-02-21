Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 060653209FD
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:32:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBULcN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:32:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39136 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhBULcJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:32:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613907043;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jRvDIk6w5R7tTJTlwErthP/8a9L/ZRRF5eq/nuQxcH8=;
        b=O0a+hCLCNk6LB/xTKTYU/u80p6R1FxjpUdH3SeCzAdnTahb4F+jWqIclH1y839xbj+dymK
        DKSNNKyaRLJ/GcS7YaLkm8B2RjWhOv1ZM+/+48v+1QeRWGYh+jO1bmDBlhzc9JN4sxS4H5
        oZ/EvypLEo7qgwySDcXNQEd7yJSv5m4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-BKvnVWu4OxaWoFxFu5FipQ-1; Sun, 21 Feb 2021 06:30:41 -0500
X-MC-Unique: BKvnVWu4OxaWoFxFu5FipQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65826107ACE8;
        Sun, 21 Feb 2021 11:30:40 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E22B91001281;
        Sun, 21 Feb 2021 11:30:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v2 3/3] HID: elan: Remove elan_mute_led_get_brigtness()
Date:   Sun, 21 Feb 2021 12:30:29 +0100
Message-Id: <20210221113029.103703-4-hdegoede@redhat.com>
In-Reply-To: <20210221113029.103703-1-hdegoede@redhat.com>
References: <20210221113029.103703-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since elan_mute_led_get_brigtness() just returns the last set value
it does not add any functionality, so we can just remove it.

Reviewed-by: Marek Behún <kabel@kernel.org>
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
2.30.1

