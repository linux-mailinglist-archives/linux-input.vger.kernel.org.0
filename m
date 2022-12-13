Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99EB664BFB6
	for <lists+linux-input@lfdr.de>; Tue, 13 Dec 2022 23:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236694AbiLMW5E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Dec 2022 17:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235771AbiLMW4w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Dec 2022 17:56:52 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CAF2315F
        for <linux-input@vger.kernel.org>; Tue, 13 Dec 2022 14:56:51 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so5177129pje.5
        for <linux-input@vger.kernel.org>; Tue, 13 Dec 2022 14:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2LLC++8cnF0PK4OfSedthmJQr/WkV2sIMOmkn1v+J+I=;
        b=bR/7hxvtOxutPItAcsbB6naBTI1eL7X31g5BqaPhEPFGKlNqu45KrDa0ArZsBJGrvl
         8gmYLCVoIhgh/y9GC+yayBpNgwXt1fBVq/ENbfYRxSdtjhP154jT/OBIcrBtg7DMcMW+
         8dqoedDjHQkwZWJNhlONoXbJt5Fns6oyr/79E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LLC++8cnF0PK4OfSedthmJQr/WkV2sIMOmkn1v+J+I=;
        b=HxalkoQfobZ944zkbh2yT8ZA95Zrrvw6fUkWerAmTYElax3p22jDsjAVhMR51yUWNm
         WaSmBTvnBBzzkJhQGMRDq37SSYurysa/ezHWVMgNdl0AvEMl3I2dQeB3SYfHy8qLNiLP
         88GQ/WzUy+JCmHICwzf6miDGpdl1vkzxsZkOoP2jZ5FgkldQulQ0SvsbOGlvlKEBO/3M
         sp3RCZRpZ/Qwiblu8oM1qmiGluBS25+SUbzGHQ/oV74XVwMFZ8RcabkPj4Dy6+mBTQU2
         lJL7vJ4YcC/SPm8U2G+tgdGu0QtlKKMMpCoKsdDjUNo0znD+UP77TxVRyTemL4BnAU4R
         MJkg==
X-Gm-Message-State: ANoB5pkbbyjor6Y24i62A/QcZBuLYZnbD7xxZR8zDFqzaAcjWxTzizuR
        u/a2yb2MNmqzlusXGmOakkJ62A==
X-Google-Smtp-Source: AA0mqf7eE998To6FOb6YO/Jx87Z34d0HT3ZCsPdgxT/77XhI7rLviMjzLgu7Wl/MRrI7kK9/Dj4neg==
X-Received: by 2002:a05:6a20:d393:b0:a9:2166:3049 with SMTP id iq19-20020a056a20d39300b000a921663049mr27661671pzb.0.1670972211105;
        Tue, 13 Dec 2022 14:56:51 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com.com (30.202.168.34.bc.googleusercontent.com. [34.168.202.30])
        by smtp.gmail.com with ESMTPSA id s1-20020a17090a13c100b0021932f01929sm46057pjf.26.2022.12.13.14.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 14:56:50 -0800 (PST)
From:   Jingyuan Liang <jingyliang@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org
Cc:     seobrien@chromium.org, dtor@chromium.org, hbarnor@chromium.org,
        Jingyuan Liang <jingyliang@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH v2] HID: Add Mapping for System Microphone Mute
Date:   Tue, 13 Dec 2022 22:53:30 +0000
Message-Id: <20221213225328.3538581-1-jingyliang@chromium.org>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
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

Map the new usage code(0x01 0xa9) to keycode KEY_MICMUTE.
Additionally hid-debug is adjusted to recognize this keycode as well.

Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---

V1 -> V2: Replaced "This patch maps" with "Map" in commit message and
addressed review comments
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
2.39.0.rc1.256.g54fd8350bd-goog

