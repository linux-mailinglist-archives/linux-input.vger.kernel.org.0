Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFBA0320635
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 17:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhBTQdt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 11:33:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60659 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhBTQds (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 11:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613838740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qx11CZ5+lK21NSKCmGUQAraLywcyCc6f99uNUBTXYaQ=;
        b=cWzyVnlpcVqJOzpQ8yxwm22OWzeVQypFLKnRmJILQ2o5TbrFDXJcogn+QLmZFh87t2fWpN
        2vAz0kHeEjJqrrDGjLHYS+8ybd9vtWn9T+zMqXcqTrJf7+1Sg16e3Fdf5iwpQ/IwfKCltY
        88c8aP9mfovTrIDo+NSWpTqnmItkXJk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-WRoOfztHPpeISnhn2WbP4g-1; Sat, 20 Feb 2021 11:32:18 -0500
X-MC-Unique: WRoOfztHPpeISnhn2WbP4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046491005501;
        Sat, 20 Feb 2021 16:32:17 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 562DA6062F;
        Sat, 20 Feb 2021 16:32:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 1/3] HID: elan: Silence mute LED errors being logged when the device is unplugged
Date:   Sat, 20 Feb 2021 17:32:09 +0100
Message-Id: <20210220163211.323178-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Being integrated into an USB keyboard-dock the mute LED can go away
at any time, leading to the following errors:

[  918.667671] elan 0003:04F3:0755.0002: Failed to set mute led brightness: -19
[  918.667737] leds elan:red:mute: Setting an LED's brightness failed (-19)

Fix this by making the following changes:

1. Don't log an error from elan_mute_led_set_brigtness() when ret == ENODEV
2. Set the LED_HW_PLUGGABLE flag on the mute LED led_classdev

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index dae193749d44..71740988a3f6 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -445,7 +445,8 @@ static int elan_mute_led_set_brigtness(struct led_classdev *led_cdev,
 	kfree(dmabuf);
 
 	if (ret != ELAN_LED_REPORT_SIZE) {
-		hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
+		if (ret != -ENODEV)
+			hid_err(hdev, "Failed to set mute led brightness: %d\n", ret);
 		return ret;
 	}
 
@@ -462,6 +463,7 @@ static int elan_init_mute_led(struct hid_device *hdev)
 	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
+	mute_led->flags = LED_HW_PLUGGABLE;
 	mute_led->dev = &hdev->dev;
 
 	return devm_led_classdev_register(&hdev->dev, mute_led);
-- 
2.30.1

