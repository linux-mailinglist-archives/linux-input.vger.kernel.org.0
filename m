Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7713BAA6E
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhGCWFQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbhGCWFG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:06 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 005E5C061764;
        Sat,  3 Jul 2021 15:02:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id c17so22538885ejk.13;
        Sat, 03 Jul 2021 15:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Suqpqo5vbYogXQd8G18V6nH4n6l93IDGiGtOPmsm1nA=;
        b=EhZXCxm73mp70T++U1t3VqvHUiVxVuRM3XByDA3bLXkDOtEObYdJ1/AVxPnv+abV7W
         uPYLGKOSBkqAdArUFHVPhR8xC5xAvEZYRiaTc9TSPjDAVHPXhks7FV5Sk0PFrDG5UUUD
         lYrwebTWwUlM8IzBaCxBjaMDCYPZyc0PRzzj5sNk36rziIviLmzPz1Svu1j2U8TDCak7
         ydeUPdsPqXfBGtykEOlK/6fB6rD47QjLXAq0h45TzckaR6w0/EJnqLXpmo5oYg5gGECR
         ZnjlSBQIpTR/4RGX5ge1pYXl68/WvIoSw45gOnBQ7JWrrn8KSIgPMTns8VJYieN+hrcV
         fGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Suqpqo5vbYogXQd8G18V6nH4n6l93IDGiGtOPmsm1nA=;
        b=a8JuBDcLWoi/NhM26DYO652rCqqQeF2VW3cZ2zbUtW1BhP24+Vpb4IHUOvYOi4mAw9
         3kpmMVrqRqPdNYv74Pz/SprDjzKMGDBGTOdLLoBNYGqzepYcI8hA1YdmLPiNin/ChlXa
         /oYTYbgoMfzTrDYgS3A7y6qNT4Rx4zrRUYeAeThpZ3ej7+ZrbxYzaoYw/Eey0BMiTAhf
         SbKYU3iIbH56dHqxTAkX9UuyhtEH3b9KnsFsHldQFgMlJqEksa5mD7mprdEGcMC61qPq
         L7OtAIOQrHPTR4kXLv9LW1gOMf/Gy6LAcxUZMu4UoWMtH8gj5YWWduUuQVr5q66qBigc
         l+1w==
X-Gm-Message-State: AOAM53075C73fP/TonWttopHI/xYQKWBpqfrT26IBriuclpbKxuHCBak
        OjgKRjGsoEv7O5hVvtu6p4A=
X-Google-Smtp-Source: ABdhPJyBPuD8AbRKJW5TTubRnv3+Lgkn7ZtaMCfif6Im2I9efdqiQtQQV+XuaCPLP8ZAEvBY+VuZRw==
X-Received: by 2002:a17:907:1c0a:: with SMTP id nc10mr6129835ejc.294.1625349750546;
        Sat, 03 Jul 2021 15:02:30 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:30 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 6/6] HID: jabra: Change mute LED state to avoid missing key press events
Date:   Sun,  4 Jul 2021 01:02:02 +0300
Message-Id: <20210703220202.5637-7-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Jabra devices use their discretion regarding when to send the mute key
press events. Although every press on the mute button changes the LED
and actual mute state, key press events are only generated in the
offhook state and only if the mute state set by the host matches the
mute state of the headset.

Without the host's help, every second mute key press will be missed.
This patch addresses it by making the driver update the mute state every
time the mute button is pressed.

Tested with GN Netcom Jabra EVOLVE 20 MS (0b0e:0300). If some other
Jabra device doesn't suffer from this behavior, this workaround
shouldn't hurt.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-jabra.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/hid/hid-jabra.c b/drivers/hid/hid-jabra.c
index 41dc30fe2d16..818c174cd544 100644
--- a/drivers/hid/hid-jabra.c
+++ b/drivers/hid/hid-jabra.c
@@ -37,16 +37,51 @@ static int jabra_input_mapping(struct hid_device *hdev,
 	return is_vendor_defined ? -1 : 0;
 }
 
+static int jabra_event(struct hid_device *hdev, struct hid_field *field,
+		       struct hid_usage *usage, __s32 value)
+{
+	struct hid_field *mute_led_field;
+	int offset;
+
+	/* Usages are filtered in jabra_usages. */
+
+	if (!value) /* Handle key presses only. */
+		return 0;
+
+	offset = hidinput_find_field(hdev, EV_LED, LED_MUTE, &mute_led_field);
+	if (offset == -1)
+		return 0; /* No mute LED, proceed. */
+
+	/*
+	 * The device changes the LED state automatically on the mute key press,
+	 * however, it still expects the host to change the LED state. If there
+	 * is a mismatch (i.e. the host didn't change the LED state), the next
+	 * mute key press won't generate an event. To avoid missing every second
+	 * mute key press, change the LED state here.
+	 */
+	input_event(mute_led_field->hidinput->input, EV_LED, LED_MUTE,
+		    !mute_led_field->value[offset]);
+
+	return 0;
+}
+
 static const struct hid_device_id jabra_devices[] = {
 	{ HID_USB_DEVICE(USB_VENDOR_ID_JABRA, HID_ANY_ID) },
 	{ }
 };
 MODULE_DEVICE_TABLE(hid, jabra_devices);
 
+static const struct hid_usage_id jabra_usages[] = {
+	{ 0x000b002f, EV_KEY, HID_ANY_ID }, /* Mic mute */
+	{ HID_TERMINATOR, HID_TERMINATOR, HID_TERMINATOR }
+};
+
 static struct hid_driver jabra_driver = {
 	.name = "jabra",
 	.id_table = jabra_devices,
+	.usage_table = jabra_usages,
 	.input_mapping = jabra_input_mapping,
+	.event = jabra_event,
 };
 module_hid_driver(jabra_driver);
 
-- 
2.32.0

