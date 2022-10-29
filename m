Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F044F6124F9
	for <lists+linux-input@lfdr.de>; Sat, 29 Oct 2022 20:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbiJ2Std (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Oct 2022 14:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiJ2Stc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Oct 2022 14:49:32 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D37ACC3
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:30 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h2so7491628pgp.4
        for <linux-input@vger.kernel.org>; Sat, 29 Oct 2022 11:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WsDngtzbH8iLQIC4V2H8QEUMeIeA4FhN7pdVWlrDwnY=;
        b=C9flJKjh3YnHed5QMNQHVgYDXcebkyWCLAPi21gxNCP3wgEQCu/33A+2uTt9lEX1+m
         veb1Xj/8kM9XUKuIlpWGOeeV6lfbhviOhFePmSyshxCA7/EQrRSQWrBJS3PeqjAT7zfq
         nebg/wgMlSnAAs3yu46vVBn6ytt7kxt0TYWgObqzJfMKlYhC68Wow63CWZVGWy2MSoCM
         OqwypJ1TvUScxGFh9eT7Up4c48MD/rV5T9nF69bs1KMCeiaIGzuR4UD8kjQANIntnktU
         KOqpH5wIf7mx5ECw0BQgXSU7QsHHkaV9OjlvpaYhLtiFGwzNVlHbYX55TSvPO76m+KO8
         3E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsDngtzbH8iLQIC4V2H8QEUMeIeA4FhN7pdVWlrDwnY=;
        b=sN4dPsjSkj7j3gP288pze+YvyUmAv5Mi+5BKs/VcXt3tYbbUEYwUv+NXVIId2jBzUm
         Kf9OLL6CQuXXM37SKcl0CN6vwotsVu5NhDsJqZSB7HNgJjiQzy82yWf5tNWC8JtRKlLE
         GDXxS4DcY5Gq+YeL/U+9myDek3cglxkQImg1MqlF+f3ePMkXPbHcCNQ8y8/hzRLcXEZd
         nEgKQaY7f8AGxXt5Yr7PYSTSup/lpBrDhuLRUqZ4dNHrlXI4KTSezRStPu+d4UtqdqcM
         +5UhSw8SVACZR2W14/Z6tBlJItWmE6LcqNmOEml3r5Ps6thVlersmAABhvBAfubVq9rN
         0uSQ==
X-Gm-Message-State: ACrzQf0tnSBPYGCCgLI2zzr/cqCwXQe76sQ/mPvdHxRfOHnj8UIr9NoN
        lubN552RXhloqDTI0IzqwX7edw==
X-Google-Smtp-Source: AMsMyM7694Ffr+PkrnAiPyd1gcjkekR1nSVkQn4HCKLMQwwOHqNGFO1X9XxT9B5Km/VAE4pIrUYw0Q==
X-Received: by 2002:a65:6d86:0:b0:438:f775:b45d with SMTP id bc6-20020a656d86000000b00438f775b45dmr5041912pgb.291.1667069369649;
        Sat, 29 Oct 2022 11:49:29 -0700 (PDT)
Received: from localhost.localdomain ([76.242.116.65])
        by smtp.gmail.com with ESMTPSA id gb7-20020a17090b060700b0020d9306e735sm1377566pjb.20.2022.10.29.11.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Oct 2022 11:49:29 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH 07/13] HID: playstation: make LED brightness adjustable in ps_led_register.
Date:   Sat, 29 Oct 2022 11:48:45 -0700
Message-Id: <20221029184851.282366-8-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221029184851.282366-1-roderick.colenbrander@sony.com>
References: <20221029184851.282366-1-roderick.colenbrander@sony.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Make the max_brightness adjustable through ps_led_info struct. This
paves the way for a next DualShock4 patch to allow larger brightness
values.

Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
---
 drivers/hid/hid-playstation.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
index 319f400dd946..662c6f220571 100644
--- a/drivers/hid/hid-playstation.c
+++ b/drivers/hid/hid-playstation.c
@@ -60,6 +60,7 @@ struct ps_calibration_data {
 struct ps_led_info {
 	const char *name;
 	const char *color;
+	int max_brightness;
 	enum led_brightness (*brightness_get)(struct led_classdev *cdev);
 	int (*brightness_set)(struct led_classdev *cdev, enum led_brightness);
 };
@@ -703,7 +704,7 @@ static int ps_led_register(struct ps_device *ps_dev, struct led_classdev *led,
 		return -ENOMEM;
 
 	led->brightness = 0;
-	led->max_brightness = 1;
+	led->max_brightness = led_info->max_brightness;
 	led->flags = LED_CORE_SUSPENDRESUME;
 	led->brightness_get = led_info->brightness_get;
 	led->brightness_set_blocking = led_info->brightness_set;
@@ -1459,15 +1460,15 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
 	int i, ret;
 
 	static const struct ps_led_info player_leds_info[] = {
-		{ LED_FUNCTION_PLAYER1, "white", dualsense_player_led_get_brightness,
+		{ LED_FUNCTION_PLAYER1, "white", 1, dualsense_player_led_get_brightness,
 				dualsense_player_led_set_brightness },
-		{ LED_FUNCTION_PLAYER2, "white", dualsense_player_led_get_brightness,
+		{ LED_FUNCTION_PLAYER2, "white", 1, dualsense_player_led_get_brightness,
 				dualsense_player_led_set_brightness },
-		{ LED_FUNCTION_PLAYER3, "white", dualsense_player_led_get_brightness,
+		{ LED_FUNCTION_PLAYER3, "white", 1, dualsense_player_led_get_brightness,
 				dualsense_player_led_set_brightness },
-		{ LED_FUNCTION_PLAYER4, "white", dualsense_player_led_get_brightness,
+		{ LED_FUNCTION_PLAYER4, "white", 1, dualsense_player_led_get_brightness,
 				dualsense_player_led_set_brightness },
-		{ LED_FUNCTION_PLAYER5, "white", dualsense_player_led_get_brightness,
+		{ LED_FUNCTION_PLAYER5, "white", 1, dualsense_player_led_get_brightness,
 				dualsense_player_led_set_brightness }
 	};
 
-- 
2.37.3

