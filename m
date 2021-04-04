Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8ADC353754
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 10:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbhDDIE5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 04:04:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60321 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230089AbhDDIEz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 04:04:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617523490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HJKWMU8OuPMJuZ3Wyl1leBN+kroaglUe3Gfnu7Wmmtk=;
        b=ePPEONGdGwjyiAIc73jpfZfIQ3VAiY01MDoRskRSysNXucfb0MIPo4P6YDDEp5s7Mu/MXx
        BPayHVFLBmnIhHQNRL6OljMoXXcySTAA4RmzomZCPp6+B08y0mJwpPcsFCzOMaBY5VDZCk
        FZYMjm+nTgsW3VeP5C564MYPJD2nTAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-BZqzfVDZP1SPPP3Eppzk-w-1; Sun, 04 Apr 2021 04:04:48 -0400
X-MC-Unique: BZqzfVDZP1SPPP3Eppzk-w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C27281005D4F;
        Sun,  4 Apr 2021 08:04:47 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 40A06101F965;
        Sun,  4 Apr 2021 08:04:46 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 resend 5/9] HID: lenovo: Set LEDs max_brightness value
Date:   Sun,  4 Apr 2021 10:04:28 +0200
Message-Id: <20210404080432.4322-6-hdegoede@redhat.com>
In-Reply-To: <20210404080432.4322-1-hdegoede@redhat.com>
References: <20210404080432.4322-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LEDs can only by turned on/off, so max_brightness should be set to 1.
Without this the max_brightness sysfs-attribute will report 255 which is
wrong.

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Use 1 instead of LED_ON

Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 1b8dd85ceb05..668762663f69 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -822,6 +822,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_mute.max_brightness = 1;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
@@ -830,6 +831,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_micmute.max_brightness = 1;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
-- 
2.30.2

