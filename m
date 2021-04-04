Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB1BD353742
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 09:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhDDHxK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 03:53:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229911AbhDDHxK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 03:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617522785;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=upX7XR4pztHm7LEtxyGrV6ftWfxbW6s4rs10lEHck0c=;
        b=BsPNiBE8kZ/I+5G84/0E+DdF6qNcAFzFDfYdDdgRPlnUU1Ds6hCQLs6/zEyGsdGVn3vnpv
        FBZa42J90aHi9RHC2BOKwZNrldhaiOuhHNM/ja1cLlzzIvZdA0XwTueIhX2I67VryUSJra
        BzhuJFN2fTgQcAzYP7niKzPGMmNBhEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-OEFTapzCNvmaUsCkcbpvrA-1; Sun, 04 Apr 2021 03:53:02 -0400
X-MC-Unique: OEFTapzCNvmaUsCkcbpvrA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B0A1084C8C;
        Sun,  4 Apr 2021 07:53:00 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 87F935F729;
        Sun,  4 Apr 2021 07:52:58 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH resend 1/3] HID: elan: Silence mute LED errors being logged when the device is unplugged
Date:   Sun,  4 Apr 2021 09:52:50 +0200
Message-Id: <20210404075252.4032-2-hdegoede@redhat.com>
In-Reply-To: <20210404075252.4032-1-hdegoede@redhat.com>
References: <20210404075252.4032-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Being integrated into an USB keyboard-dock the mute LED can go away
at any time, leading to the following errors:

[  918.667671] elan 0003:04F3:0755.0002: Failed to set mute led brightness: -19
[  918.667737] leds elan:red:mute: Setting an LED's brightness failed (-19)

Fix this by making the following changes:

1. Don't log an error from elan_mute_led_set_brigtness() when
   ret == -ENODEV
2. Set the LED_HW_PLUGGABLE flag on the mute LED led_classdev

While at it also make sure that elan_mute_led_set_brigtness() returns
an error (-EIO) when ret != 3 but it is not an error (>= 0).

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Return -EIO when ret != 3 and >= 0
---
 drivers/hid/hid-elan.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index dae193749d44..473d8528319d 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -445,8 +445,9 @@ static int elan_mute_led_set_brigtness(struct led_classdev *led_cdev,
 	kfree(dmabuf);
 
 	if (ret != ELAN_LED_REPORT_SIZE) {
-		hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
-		return ret;
+		if (ret != -ENODEV)
+			hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
+		return ret < 0 ? ret : -EIO;
 	}
 
 	drvdata->mute_led_state = led_state;
@@ -462,6 +463,7 @@ static int elan_init_mute_led(struct hid_device *hdev)
 	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
+	mute_led->flags = LED_HW_PLUGGABLE;
 	mute_led->dev = &hdev->dev;
 
 	return devm_led_classdev_register(&hdev->dev, mute_led);
-- 
2.30.2

