Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 330DD3209E8
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:24:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBULV6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:21:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39352 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229937AbhBULVz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613906429;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xLtYq+ADM7vbPNe6c86uhechW5/cx4XEdy1z93qSclY=;
        b=Zh5tZ0puISZE7dIMM0a1wyjq+fXO2UvDDxl4+jw+qh+tMkbvOjLZL9t67wH0jK4kzKelnK
        Fr5N9zPLbKoiZMIYKX+RxwfumiVDlAiZsFqrHbt7Dm8byTepFMwPn4WKoaXHHCLJMN2z8C
        KuzRWus+PVix3C1DIeomOof/VsuFs5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-qhaFWjm9Nkmzk2IjFTflWQ-1; Sun, 21 Feb 2021 06:20:25 -0500
X-MC-Unique: qhaFWjm9Nkmzk2IjFTflWQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 815A580364B;
        Sun, 21 Feb 2021 11:20:24 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AC59862A24;
        Sun, 21 Feb 2021 11:20:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v3 5/7] HID: lenovo: Set LEDs max_brightness value
Date:   Sun, 21 Feb 2021 12:20:03 +0100
Message-Id: <20210221112005.102116-6-hdegoede@redhat.com>
In-Reply-To: <20210221112005.102116-1-hdegoede@redhat.com>
References: <20210221112005.102116-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LEDs can only by turned on/off, so max_brightness should be set to 1.
Without this the max_brightness sysfs-attribute will report 255 which is
wrong.

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
2.30.1

