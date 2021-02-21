Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B7D2320A01
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhBULcI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:32:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31939 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229871AbhBULcG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:32:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613907039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RGhoaiUahRGEqg6YAu1OLbTZWon7ll7ymdptKdOKNCc=;
        b=Au31YoLW8cKVpmzdIrNWCEjkLA6ajwbDCbJEZVHXaWciNKGzhzhSp0I25Q6SzQ9splZKrE
        RqozzCZKFj5j2gL8IMAJ5sTqM5SAL7Tnq7yV8of+P+PMQAZPG53euaw/sa4+fh8BaxJ1UK
        JwYEycvXvCHsutfrXbhpuPYl0h3sHwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-IpQAVNBeNgqFWX0TVZqZIw-1; Sun, 21 Feb 2021 06:30:38 -0500
X-MC-Unique: IpQAVNBeNgqFWX0TVZqZIw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0721C291;
        Sun, 21 Feb 2021 11:30:36 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 743751002391;
        Sun, 21 Feb 2021 11:30:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v2 1/3] HID: elan: Silence mute LED errors being logged when the device is unplugged
Date:   Sun, 21 Feb 2021 12:30:27 +0100
Message-Id: <20210221113029.103703-2-hdegoede@redhat.com>
In-Reply-To: <20210221113029.103703-1-hdegoede@redhat.com>
References: <20210221113029.103703-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
2.30.1

