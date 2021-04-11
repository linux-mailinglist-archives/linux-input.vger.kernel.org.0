Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E73035B131
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 04:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbhDKC41 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 22:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbhDKC40 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 22:56:26 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138CDC06138B;
        Sat, 10 Apr 2021 19:56:11 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id t140so6725725pgb.13;
        Sat, 10 Apr 2021 19:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8aVGITkFnZdJUFZyLeM717/3kVXSiIqRZAvMjZr15k=;
        b=cYz+eatAhkFH/2f4Hqcr+qqN5USaw6ASc58yCVenD8SxD6mkRGDBIf16w5CTMoXQMO
         CiOpGdJgj6OODNMYm6V4tinXJGbn2R2n+m5LDbHvz2iDJZ6H8cpOeEw5p3zzXnsVeiD4
         aGkUaEQ1t6scj1l1hWLycuirjvugrjV7GzAoGKKv5KvxYU9gY/nZsvcFVojMOp+SVCbm
         vCvOX89tyAihV658oxoAhW+a0259dfb9GBxGteLa29BKuM2jJbmar9uYYoJlcHmoLXZ9
         iB6cXIZ3OUVyqC0fMUByTkAlxFtM0GnCCKaBS13nbPi8ogmRwr6jdHZILlzWh/7fHbzR
         sqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h8aVGITkFnZdJUFZyLeM717/3kVXSiIqRZAvMjZr15k=;
        b=GsGvUkzcH6OidIsfL/nFxSwfVisOg85wpBBPtSZaYQ13WieQcwGGW782xBDA8stmY/
         9/QWqMTyFYafTHzIVn0JuTzFFGywDyUgEMnVgAUV38V5MkrLQnGt2qbE0Kr2RVnNI9pa
         SqUTwDsDFYBu8Z/VeodU6+4C32SHfsai+EMgzhu98joQ7DKlm+wIM5763MIi3rn5OVGt
         98ZO6T75ACDQ/1Gt6SiDrsziwuhZn0pWjewItFbbyT/1m6HNcW1xiFXX+D22enUP2nOx
         iODFYOjB2YxsNxm+WSZ1pBuvX7rSsSbc5hiaBnt9vpi6zMyEFfY9YilcE/lSnMHcxhSS
         dddQ==
X-Gm-Message-State: AOAM531EFheQ18KdbS7P/twi+0nUS7oXDxMRRL1fZInr2mMJOcXpAckY
        Vr7mO/AQuQqW6vtdNfbA+UqFr3l/9ME=
X-Google-Smtp-Source: ABdhPJxMDkglUU7qbyL5M9DcQV2TgN60Kb03gyz2GxGfm0vDv3hxPY/WLh3D8Tzz9DxigGLSNU2EWg==
X-Received: by 2002:a63:eb49:: with SMTP id b9mr19766250pgk.318.1618109770346;
        Sat, 10 Apr 2021 19:56:10 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:a9b4:ff60:6655:5c5f])
        by smtp.gmail.com with ESMTPSA id fs3sm6207001pjb.30.2021.04.10.19.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 19:56:09 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] HID: hid-input: add mapping for emoji picker key
Date:   Sat, 10 Apr 2021 19:56:05 -0700
Message-Id: <20210411025606.2744875-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HUTRR101 added a new usage code for a key that is supposed to invoke and
dismiss an emoji picker widget to assist users to locate and enter emojis.

This patch adds a new key definition KEY_EMOJI_PICKER and maps 0x0c/0x0d9
usage code to this new keycode. Additionally hid-debug is adjusted to
recognize this new usage code as well.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-debug.c                | 1 +
 drivers/hid/hid-input.c                | 3 +++
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index d7eaf9100370..982737827b87 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -929,6 +929,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_APPSELECT] = "AppSelect",
 	[KEY_SCREENSAVER] = "ScreenSaver",
 	[KEY_VOICECOMMAND] = "VoiceCommand",
+	[KEY_EMOJI_PICKER] = "EmojiPicker",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
 	[KEY_BRIGHTNESS_MAX] = "BrightnessMax",
 	[KEY_BRIGHTNESS_AUTO] = "BrightnessAuto",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 236bccd37760..e982d8173c9c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -963,6 +963,9 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 
 		case 0x0cd: map_key_clear(KEY_PLAYPAUSE);	break;
 		case 0x0cf: map_key_clear(KEY_VOICECOMMAND);	break;
+
+		case 0x0d9: map_key_clear(KEY_EMOJI_PICKER);	break;
+
 		case 0x0e0: map_abs_clear(ABS_VOLUME);		break;
 		case 0x0e2: map_key_clear(KEY_MUTE);		break;
 		case 0x0e5: map_key_clear(KEY_BASSBOOST);	break;
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index ee93428ced9a..225ec87d4f22 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -611,6 +611,7 @@
 #define KEY_VOICECOMMAND		0x246	/* Listening Voice Command */
 #define KEY_ASSISTANT		0x247	/* AL Context-aware desktop assistant */
 #define KEY_KBD_LAYOUT_NEXT	0x248	/* AC Next Keyboard Layout Select */
+#define KEY_EMOJI_PICKER	0x249	/* Show/hide emoji picker (HUTRR101) */
 
 #define KEY_BRIGHTNESS_MIN		0x250	/* Set Brightness to Minimum */
 #define KEY_BRIGHTNESS_MAX		0x251	/* Set Brightness to Maximum */
-- 
2.31.1.295.g9ea45b61b8-goog

