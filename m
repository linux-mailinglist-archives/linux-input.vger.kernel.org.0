Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C2B32DA4E
	for <lists+linux-input@lfdr.de>; Thu,  4 Mar 2021 20:24:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbhCDTXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 14:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28863 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235107AbhCDTXU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 14:23:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885715;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UldJQL9zvYH0ANJqnKzdJgHFKk4F+TeUm8bAzPGFIxk=;
        b=agJuSaKOCprRiQGl5elx3prQydVxfk9fiMJCPcuZuf3nb4dINwG8kFF69Y3VHzSfq5JxR2
        +e6km2rYb6F6sZusRapXWhjBluj5fiCueCxlL0VvvQnBjkStzS6X8ZUG49O2yUtM2qJLae
        CWfJIXVmRsyCF9puVvUNEZonK0FxX0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-R2SQimx5OgqOVqxlRYAK7Q-1; Thu, 04 Mar 2021 14:21:53 -0500
X-MC-Unique: R2SQimx5OgqOVqxlRYAK7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92E131009E2D;
        Thu,  4 Mar 2021 19:21:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-177.ams2.redhat.com [10.36.114.177])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3411B19CAB;
        Thu,  4 Mar 2021 19:21:51 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Alexander Kobel <a-kobel@a-kobel.de>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v4 7/9] HID: lenovo: Set default_triggers for the mute and micmute LEDs
Date:   Thu,  4 Mar 2021 20:21:32 +0100
Message-Id: <20210304192134.520919-8-hdegoede@redhat.com>
In-Reply-To: <20210304192134.520919-1-hdegoede@redhat.com>
References: <20210304192134.520919-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
2.30.1

