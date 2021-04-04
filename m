Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FEC835375B
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 10:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbhDDIFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 04:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57059 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230167AbhDDIFA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 04:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617523496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ogy1UFwElZ9XDcOfoUiRODv19SmVCEHpzYMnikvf1Bg=;
        b=iJfcF7RfjeoixyEaX0sT0whs7F1lfU+NJOiwWMvByDa2wTf40Rba3RwEe7Z/TUPsBU654n
        0nHFs/PvBP0EqdoYjhLlWRRPSMWypgBPiLgK/20/cb/k2fZ3Bz1WncBK7IzXd7V7MUgtUV
        XlN8d+YRRlrXrkOVGjMYRPNrmUASW08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-552-y48PnhGZNoiw9prcHDh5bA-1; Sun, 04 Apr 2021 04:04:52 -0400
X-MC-Unique: y48PnhGZNoiw9prcHDh5bA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73EC887A826;
        Sun,  4 Apr 2021 08:04:51 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E0D12101F965;
        Sun,  4 Apr 2021 08:04:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 resend 7/9] HID: lenovo: Set default_triggers for the mute and micmute LEDs
Date:   Sun,  4 Apr 2021 10:04:30 +0200
Message-Id: <20210404080432.4322-8-hdegoede@redhat.com>
In-Reply-To: <20210404080432.4322-1-hdegoede@redhat.com>
References: <20210404080432.4322-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mute and mic-mute LEDs should be automatically turned on/off based
on the audio-card's mixer settings.

Add the standardized default-trigger names for this, so that the alsa
code can turn the LEDs on/off as appropriate (on supported audio cards).

This brings the mute/mic-mute LED support inline with the thinkpad_acpi
support for the same LEDs in keyboards directly connected to the
laptop's embedded-controller.

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 2cf89b880ac5..2287142116b9 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -824,6 +824,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
+	data->led_mute.default_trigger = "audio-mute";
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.max_brightness = 1;
 	data->led_mute.flags = LED_HW_PLUGGABLE;
@@ -833,6 +834,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
+	data->led_micmute.default_trigger = "audio-micmute";
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.max_brightness = 1;
 	data->led_micmute.flags = LED_HW_PLUGGABLE;
-- 
2.30.2

