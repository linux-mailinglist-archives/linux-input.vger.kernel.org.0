Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1068320639
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 17:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhBTQdw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 11:33:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34688 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229817AbhBTQdw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 11:33:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613838746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c7VKymmQZ3Xc4Y43PAd9Aaj3siwoR45oU3rmUaaB60g=;
        b=PD1DxZfM7tZLIMxMz86cI91Abyk8TIKcdHG2iNcsihZp+I5aj6DJiZNCFI+WW7QDXbxgQM
        9U8+9cAaQftN80HQmDJJ5Qf//i7QZ+VUL3NTOlVT2EziiEJSBgJkDRn3j23ZwZ5CK/aiBp
        66lcEMlPItkm5kxUF508ikeyG5+gZic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-rlc8v1FOOriW0BrgrUb_VA-1; Sat, 20 Feb 2021 11:32:24 -0500
X-MC-Unique: rlc8v1FOOriW0BrgrUb_VA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3300A80402C;
        Sat, 20 Feb 2021 16:32:23 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E72AD6062F;
        Sat, 20 Feb 2021 16:32:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 3/3] HID: elan: Remove elan_mute_led_get_brigtness()
Date:   Sat, 20 Feb 2021 17:32:11 +0100
Message-Id: <20210220163211.323178-3-hdegoede@redhat.com>
In-Reply-To: <20210220163211.323178-1-hdegoede@redhat.com>
References: <20210220163211.323178-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The led_classdev already contains a cached value of the last set
brightness, the brightness_get callback is only meant for LED drivers
which can read back the actual / current brightness from the hardware.

Since elan_mute_led_get_brigtness() just returns the last set value
it does not add any functionality, so we can just remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 6958649ece22..f1ac0443ee67 100644
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

