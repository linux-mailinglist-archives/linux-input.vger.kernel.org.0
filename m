Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3307636E89
	for <lists+linux-input@lfdr.de>; Thu, 24 Nov 2022 00:46:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiKWXq3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Nov 2022 18:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiKWXqZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Nov 2022 18:46:25 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AD5D08B0
        for <linux-input@vger.kernel.org>; Wed, 23 Nov 2022 15:46:24 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id jn7so16158155plb.13
        for <linux-input@vger.kernel.org>; Wed, 23 Nov 2022 15:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GYM94BK5jOKxwjQapo3+0rxZpxWo/HNBHuhrQBd6z+E=;
        b=fsgMU5jh6bhYT5vNigv9YvRgR+GjBU6wHfYZ0IHJSKRiAGPFGEllYJQFR4EdowNFLL
         k1mD4C+vjik5SYX5xpIgsVfLB7U0mWDzaFW/cFuw2z6C/s4EALsPfFiczvHNC9utcW83
         D7qBCy3Nh9UoonQpzw07rIDWVOQJb3wSlh3/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GYM94BK5jOKxwjQapo3+0rxZpxWo/HNBHuhrQBd6z+E=;
        b=l/Lp1R4p1W5+Zo6svVWiOTP/3F2jFnOBQdt4MCIB8kjbEsFdK9MD16Pu88WaRLN2hL
         OvoNIh0Pn1ncPMySqNZSR8fYvRzgyfPWVfc6dNwi+8UTucAs/dDBJEqifz5mPvlIwMoR
         LTP5T3fAI/YrUVpNI2QH150CZyGjb8fg8pVHLsef9p5kKgqsX/v2Rs3fRnA7ChWhTsoY
         zJxRPZxWTKUMZqYbaoyXknyuA5B98ba2b8ZYvhqIw3qTl7nJLdQ0adGfSCRWvR13gJCi
         ly6L8c/aYZBT1E5NIKsZ+aTyAMEwJfvuJCwSVpwYJatLM6M06ckezggk9r4BNM2+O/88
         0flA==
X-Gm-Message-State: ANoB5pmcVJjQLlbP89sMteqyIwC1eGq0xKmQ/tqBi55HLWIV5UE0+C6L
        QPkK9iXk5qCDbfwhYs1e9bt5xA==
X-Google-Smtp-Source: AA0mqf5KLH3mzZVDxS7IHw8X8/QtUJOX2YP5UlPgvgZ1gVL593UHDCC8RJr5Dt0ZsA+4WCRlFMxe8A==
X-Received: by 2002:a17:90a:668b:b0:218:8666:e77f with SMTP id m11-20020a17090a668b00b002188666e77fmr28116164pjj.0.1669247184198;
        Wed, 23 Nov 2022 15:46:24 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com.com (30.202.168.34.bc.googleusercontent.com. [34.168.202.30])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001783f964fe3sm15025400plx.113.2022.11.23.15.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 15:46:23 -0800 (PST)
From:   Jingyuan Liang <jingyliang@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org
Cc:     hbarnor@chromium.org, dtor@chromium.org, seobrien@chromium.org,
        Jingyuan Liang <jingyliang@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH] HID: Add Mapping for System Microphone Mute
Date:   Wed, 23 Nov 2022 23:46:19 +0000
Message-Id: <20221123234619.91313-1-jingyliang@chromium.org>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HUTRR110 added a new usage code for a key that is supposed to
mute/unmute microphone system-wide.

This patch maps the new usage code(0x01 0xa9) to keycode KEY_MICMUTE.
Additionally hid-debug is adjusted to recognize this keycode as well.

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---

 drivers/hid/hid-debug.c | 1 +
 drivers/hid/hid-input.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 2ca6ab600bc9..15e35702773c 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -972,6 +972,7 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_KBD_LAYOUT_NEXT] = "KbdLayoutNext",
 	[KEY_EMOJI_PICKER] = "EmojiPicker",
 	[KEY_DICTATE] = "Dictate",
+	[KEY_MICMUTE] = "MicrophoneMute",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
 	[KEY_BRIGHTNESS_MAX] = "BrightnessMax",
 	[KEY_BRIGHTNESS_AUTO] = "BrightnessAuto",
diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 859aeb07542e..6396ed434b37 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -781,6 +781,14 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 			break;
 		}
 
+		if ((usage->hid & 0xf0) == 0xa0) {	/* SystemControl */
+			switch (usage->hid & 0xf) {
+			case 0x9: map_key_clear(KEY_MICMUTE); break;
+			default: goto ignore;
+			}
+			break;
+		}
+
 		if ((usage->hid & 0xf0) == 0xb0) {	/* SC - Display */
 			switch (usage->hid & 0xf) {
 			case 0x05: map_key_clear(KEY_SWITCHVIDEOMODE); break;
-- 
2.38.1.584.g0f3c55d4c2-goog

