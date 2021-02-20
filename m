Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3645320544
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhBTM0W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60170 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229712AbhBTM0V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZMsm8Vg0jKQIWTMTfpch7yXS+RSWJJVTqx2VTtQM4sA=;
        b=Nsdw5BuPSPyIKKtA/bPnJ9wKsCpmp4Nf6Bshc8xPbA/mCiMx50m/2G1hVp2Hi+6pExTXDK
        lCOlfDZC/EYQYU5OeQBBi4ns1oGl5SFVUOcosJmsdh6LYRBqVclYwivvi1C7H3cYXsYrhr
        XoyoA7VyU5gljsWmD07CnPmGiRzW0co=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-WS_-tjaKOxKyg0JVXyR76w-1; Sat, 20 Feb 2021 07:24:53 -0500
X-MC-Unique: WS_-tjaKOxKyg0JVXyR76w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0821E563;
        Sat, 20 Feb 2021 12:24:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 76BF91001E73;
        Sat, 20 Feb 2021 12:24:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 5/7] HID: lenovo: Set LEDs max_brightness value
Date:   Sat, 20 Feb 2021 13:24:36 +0100
Message-Id: <20210220122438.21857-6-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The LEDs can only by turned on/off, so max_brightness should be set to 1
(aka LED_ON). Without this the max_brightness sysfs-attribute will report
255 which is wrong.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index bb8e5ebdaabe..d936edb88f07 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -816,6 +816,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_mute.name = name_mute;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_mute.max_brightness = LED_ON;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
 	data->led_mute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_mute);
@@ -824,6 +825,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 
 	data->led_micmute.name = name_micm;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
+	data->led_micmute.max_brightness = LED_ON;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
 	data->led_micmute.dev = &hdev->dev;
 	ret = led_classdev_register(&hdev->dev, &data->led_micmute);
-- 
2.30.1

