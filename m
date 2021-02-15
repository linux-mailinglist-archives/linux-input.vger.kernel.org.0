Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D8331C315
	for <lists+linux-input@lfdr.de>; Mon, 15 Feb 2021 21:40:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhBOUjy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Feb 2021 15:39:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51797 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhBOUjx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Feb 2021 15:39:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613421507;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vfOV5qIKuIZJ94/NWeZMoXRXEDoapJH6cjMGgZA03Io=;
        b=K/jWkzgl1+xQimLtLG1LQzytTrRyJGb09nkzlDQ887kqOnSANZIOoHbhK/Z9SMJFsITh+0
        rDLnCvR4InUvU1ieUYcMHU1qKHW/wOPA1Jk172mf4a0bjw+fuuwjCwrK9sIWHxGRpuaePi
        UgQlMdtCWW4U4tVSRSith5WHRSsl8d8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Jl9pkGHRMZqlDTjJAoykJg-1; Mon, 15 Feb 2021 15:38:25 -0500
X-MC-Unique: Jl9pkGHRMZqlDTjJAoykJg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 508F980196C;
        Mon, 15 Feb 2021 20:38:24 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-74.ams2.redhat.com [10.36.115.74])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 5DACA5D9C0;
        Mon, 15 Feb 2021 20:38:23 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 5/5] HID: lenovo: Set default_trigger-s for the mute and micmute LEDs
Date:   Mon, 15 Feb 2021 21:38:14 +0100
Message-Id: <20210215203814.699633-5-hdegoede@redhat.com>
In-Reply-To: <20210215203814.699633-1-hdegoede@redhat.com>
References: <20210215203814.699633-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mute and mic-mute LEDs should be automatically turned on/off based
on the audio-cards mixer settings.

Add the standardized default-trigger names for this, so that the alsa
code can turn the LEDs on/off as appropriate (on supported audo cards).

This brings the mute/mic-mute LED support inline with the thinkpad_acpi
support for the same LEDs in keyboards directly connected to the
laptop's embedded-controller.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-lenovo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-lenovo.c b/drivers/hid/hid-lenovo.c
index 045c06ba0ab8..c82e328f5310 100644
--- a/drivers/hid/hid-lenovo.c
+++ b/drivers/hid/hid-lenovo.c
@@ -829,6 +829,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 	snprintf(name_micm, name_sz, "%s:amber:micmute", dev_name(&hdev->dev));
 
 	data->led_mute.name = name_mute;
+	data->led_mute.default_trigger = "audio-mute";
 	data->led_mute.brightness_get = lenovo_led_brightness_get;
 	data->led_mute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_mute.dev = &hdev->dev;
@@ -837,6 +838,7 @@ static int lenovo_register_leds(struct hid_device *hdev)
 		return ret;
 
 	data->led_micmute.name = name_micm;
+	data->led_micmute.default_trigger = "audio-micmute";
 	data->led_micmute.brightness_get = lenovo_led_brightness_get;
 	data->led_micmute.brightness_set_blocking = lenovo_led_brightness_set;
 	data->led_micmute.dev = &hdev->dev;
-- 
2.30.1

