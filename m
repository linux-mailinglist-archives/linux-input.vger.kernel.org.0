Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B96C353746
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 09:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhDDHxO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 03:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28051 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229918AbhDDHxL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 03:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617522787;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OH7Cn7XqLYo+eqHaDWyQ7QOLJNfARghqSu/3lHuBKNg=;
        b=K0BuRVR+6eL7U6io+lo29BpPZj32xJ3IPyAfalyNkwUDrS+7pI/VvuZbj2j98G43i95pqV
        QgbmkL1+8dmkOnS36wZsgKi4quonztnU63PH69F5iJjWmwW2UxgQb3XMymwFATL92S0J79
        c8GEb665hApmNLoryjj/AFBnbPmsWCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-p7lc4vKlPjy6O5XvMI5O1A-1; Sun, 04 Apr 2021 03:53:03 -0400
X-MC-Unique: p7lc4vKlPjy6O5XvMI5O1A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB811005D4F;
        Sun,  4 Apr 2021 07:53:02 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 59D0B1B534;
        Sun,  4 Apr 2021 07:53:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH resend 2/3] HID: elan: Set default_trigger for the mute LED
Date:   Sun,  4 Apr 2021 09:52:51 +0200
Message-Id: <20210404075252.4032-3-hdegoede@redhat.com>
In-Reply-To: <20210404075252.4032-1-hdegoede@redhat.com>
References: <20210404075252.4032-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The mute LED should be automatically turned on/off based
on the audio-card's mixer settings.

Add the standardized default-trigger name for this, so that the alsa
code can turn the LED on/off as appropriate (on supported audio cards).

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/hid/hid-elan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-elan.c b/drivers/hid/hid-elan.c
index 473d8528319d..5173f50d474d 100644
--- a/drivers/hid/hid-elan.c
+++ b/drivers/hid/hid-elan.c
@@ -460,6 +460,7 @@ static int elan_init_mute_led(struct hid_device *hdev)
 	struct led_classdev *mute_led = &drvdata->mute_led;
 
 	mute_led->name = "elan:red:mute";
+	mute_led->default_trigger = "audio-mute";
 	mute_led->brightness_get = elan_mute_led_get_brigtness;
 	mute_led->brightness_set_blocking = elan_mute_led_set_brigtness;
 	mute_led->max_brightness = LED_ON;
-- 
2.30.2

