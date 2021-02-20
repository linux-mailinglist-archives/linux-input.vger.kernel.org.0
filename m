Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E34BD32054A
	for <lists+linux-input@lfdr.de>; Sat, 20 Feb 2021 13:26:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbhBTM01 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 07:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27815 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229712AbhBTM00 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 07:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613823900;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JDHHg/+mJYAL8US7hGWMmr+P663UlNWXOOXuhRPKzAQ=;
        b=URaoPanCaeDtxKgERsrBXBBxjw2kprwW+Ty+XTSkzYjNseiA30oKAS/rmlftAraUgHMQxS
        4Qy+MfUk7c/n31dPw+/lg7g4AG+d8WyT8eLBO9TL9ngqz87I4Xs7Ig6JgWoFZyNBmFCS94
        +ZlXwo7+miebeAtfijvw9LYONlHpFqI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-DJxpM2EhPkiv1-aOYay6rg-1; Sat, 20 Feb 2021 07:24:58 -0500
X-MC-Unique: DJxpM2EhPkiv1-aOYay6rg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E526803648;
        Sat, 20 Feb 2021 12:24:57 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-29.ams2.redhat.com [10.36.112.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 72A41100164C;
        Sat, 20 Feb 2021 12:24:56 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org
Subject: [PATCH v2 7/7] HID: lenovo: Set default_trigger-s for the mute and micmute LEDs
Date:   Sat, 20 Feb 2021 13:24:38 +0100
Message-Id: <20210220122438.21857-8-hdegoede@redhat.com>
In-Reply-To: <20210220122438.21857-1-hdegoede@redhat.com>
References: <20210220122438.21857-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mute and mic-mute LEDs should be automatically turned on/off based
on the audio-cards mixer settings.

Add the standardized default-trigger names for this, so that the alsa
code can turn the LEDs on/off as appropriate (on supported audio cards).

This brings the mute/mic-mute LED support inline with the thinkpad_acpi
support for the same LEDs in keyboards directly connected to the
laptop's embedded-controller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 041bfa1937a8..18e9ffcf2ace 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -818,6 +818,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
+	data->led_mute.default_trigger = "audio-mute";
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.max_brightness = LED_ON;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
@@ -827,6 +828,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
+	data->led_micmute.default_trigger = "audio-micmute";
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.max_brightness = LED_ON;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
-- 
2.30.1

