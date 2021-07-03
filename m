Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888103BAA65
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229520AbhGCWFG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhGCWFC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:02 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35A5C061762;
        Sat,  3 Jul 2021 15:02:27 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id b2so22588036ejg.8;
        Sat, 03 Jul 2021 15:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xm7MxMs6oqkzwyDsDCu2psTMjwceySVOJUdtTYPqDgo=;
        b=OjP9IlxA0VqhuspZXVfG3U1AGaZn+yfZmq1Gbf9r7VUA961CLdLcRaYpK4kBqt/CTi
         PgqaLnOcKQ72e/dKvQYEFpAoopiZv6sclQfObJDNoFXsPMwUwkqjzZ5toKBi5hoq9p5k
         XRCncH61iBvgvvAGL+th4ET7/Zrrec3OEzQMcPkyMYkyb9FtNbJ8FDMioSgc/CDRY4ry
         Fa5yGyn8Oo7amt4RyeBRk/KEE0ux2vrWxWkkrjEEM7gNxp97zJpTaP/C8mzNVCm4part
         yn8OC4mayGx9MYJ+vSS0Q8Paw5lCZC/oX4Y26rD9TpSL8RPIx+H47oUHIucTFz05jEXI
         Tl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xm7MxMs6oqkzwyDsDCu2psTMjwceySVOJUdtTYPqDgo=;
        b=UTvs5r8UVKPVxx0oxV1iMsIGY3gIowxtH6cysbnZLsmHAJmSi0OQ8mEfklN3lCUnsN
         BVjU2iRroaUcoyrWzgVWQoXmzPFS0Y64JgvVoSTJvc1joXQenm9Vf6FclsfCNRWC+gb+
         auIRARZ6+ibCWXsA+Y9e1G/B8m4OrmehJv2tP1OH4mITtbFk1PgJbcRusqR4Cj3Rdano
         6u8hugBbNGG7YZICuCgvh6AX33OURLsTTMSGzW7urtUTF7B7nIcX8CY7yl6bhtFSPGC2
         1/YzGR4ryRSIzdq916oJpLwutf/OWQPtsH5Vpm+IkjQulWquwYUPXsdZh1Hkb2BYf+Xt
         A7kQ==
X-Gm-Message-State: AOAM530OHoQUUomO0guyfAaEp8x/fQYMnWjanJBXQk2aVIBpBCoK//Yc
        Iv2d9sewQFMeo4yGHI/RtDQ=
X-Google-Smtp-Source: ABdhPJz64hZ1wztW37NqkrOS5nSppL6Wnju7K5VElKwHvgADegMu8rB1/7/dbfl3FXMc8C1G5WZVMw==
X-Received: by 2002:a17:906:9745:: with SMTP id o5mr6190110ejy.344.1625349746323;
        Sat, 03 Jul 2021 15:02:26 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:26 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for headsets
Date:   Sun,  4 Jul 2021 01:01:57 +0300
Message-Id: <20210703220202.5637-2-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A lot of USBHID headsets available on the market have LEDs that indicate
ringing and off-hook states when used with VoIP applications. This
commit exposes these LEDs via the standard sysfs interface.

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-input.c                | 2 ++
 drivers/input/input-leds.c             | 2 ++
 include/uapi/linux/input-event-codes.h | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 4286a51f7f16..44b8243f9924 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -798,6 +798,8 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 		case 0x4b:  map_led (LED_MISC);     break;    /*   "Generic Indicator"        */
 		case 0x19:  map_led (LED_MAIL);     break;    /*   "Message Waiting"          */
 		case 0x4d:  map_led (LED_CHARGING); break;    /*   "External Power Connected" */
+		case 0x17:  map_led (LED_OFFHOOK);  break;    /*   "Off-Hook"                 */
+		case 0x18:  map_led (LED_RING);     break;    /*   "Ring"                     */
 
 		default: goto ignore;
 		}
diff --git a/drivers/input/input-leds.c b/drivers/input/input-leds.c
index 0b11990ade46..bc6e25b9af25 100644
--- a/drivers/input/input-leds.c
+++ b/drivers/input/input-leds.c
@@ -33,6 +33,8 @@ static const struct {
 	[LED_MISC]	= { "misc" },
 	[LED_MAIL]	= { "mail" },
 	[LED_CHARGING]	= { "charging" },
+	[LED_OFFHOOK]	= { "offhook" },
+	[LED_RING]	= { "ring" },
 };
 
 struct input_led {
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 225ec87d4f22..dd785a5b5076 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -925,6 +925,8 @@
 #define LED_MISC		0x08
 #define LED_MAIL		0x09
 #define LED_CHARGING		0x0a
+#define LED_OFFHOOK		0x0b
+#define LED_RING		0x0c
 #define LED_MAX			0x0f
 #define LED_CNT			(LED_MAX+1)
 
-- 
2.32.0

