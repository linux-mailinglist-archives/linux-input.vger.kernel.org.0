Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A40A0504849
	for <lists+linux-input@lfdr.de>; Sun, 17 Apr 2022 18:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234357AbiDQQSP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Apr 2022 12:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234358AbiDQQSO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Apr 2022 12:18:14 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63E6EBA
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:38 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g20so15181486edw.6
        for <linux-input@vger.kernel.org>; Sun, 17 Apr 2022 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/RjKZFEieINWzujg0f1awk2MpC556RjBQaeOJjIhsng=;
        b=eL0AiP3crR09i7K6jKY0Bw6G/+98O/cB8yCXK372sXfQJ+ZXAYngrqIDsFYzJLHQgp
         pEheGpHLWjmjoWKZUBu0PmocjLp5mAbI999/eRnWikMG7QbxOVFA6CZVx2sm8CH1/GG/
         cT+FtCkW6tjF5GYd7eKDTetzkXewwssCc7F65lRBkG612/Ad4JBYbHuJtYzgyj+UtRdD
         8QpHQlNPn6e1U634xmm9DbTranocCwS1hQs4/MUdjuefz3ObWQbrJmkeHuJJCzutEw6B
         5JKxQ9eybLVKxVU3Ii9jW1mS3RHNpmcK2L4y1CLpThIUodO+rncbXNaADz9T9judKC2z
         3mEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/RjKZFEieINWzujg0f1awk2MpC556RjBQaeOJjIhsng=;
        b=4RKNmbisw3qIJ0dqjSkVfXLdtZEwyCNmIPU608hwwnhMR/97wd4pe3/E3Vp3/M4MBm
         hQJ/MEvOdmh7bqyYr3nzZi58nITLTTpokbO2dRbYe6x2AdHNs8XegRg7RGvy/n+Zdn6x
         Mdrm9Qtc2EWGpjskMl+45XyfWsZGENXpNlb3H3MaFZl1F80aUJOVNLICJEFiok6w1lMM
         Gx/mfsiNXw/xm8uHmvgjVfAlFugknSYXR3ubgYbQPL7ngSsSX0A9UeaCf5Cq+VNpCQD3
         NCEz5DuK9bZ7yAwZvSZf4IEO84N4SDyJfmMYawnaNx0o6XEn3F2nYI9nLGgQGyE9niax
         EJXA==
X-Gm-Message-State: AOAM533RzbYBspXQnZBWKS3Iq+CWm6TPVa0u3rhH+uW/SBrZIpBnPNiD
        gakE7FX5XVq9bYeCXZj3cZNSoZzhmkpnEw==
X-Google-Smtp-Source: ABdhPJzqsRpLRS2ZYkIsI7DS+RvyPI/78MvA7zfLFrDjUzeYbytAsBho1YjBpGgo6k8VF1/x5FXxZQ==
X-Received: by 2002:a50:baa1:0:b0:418:849a:c66a with SMTP id x30-20020a50baa1000000b00418849ac66amr8520389ede.234.1650212137454;
        Sun, 17 Apr 2022 09:15:37 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2225:cd00:b8d9:eba8:6309:ac66])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640204d000b0042062f9f0e1sm5772130edw.15.2022.04.17.09.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 09:15:37 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>, lawl <github@dumbinter.net>
Subject: [PATCH 3/3] Input: xpad - Poweroff XBOX360W on mode button long press
Date:   Sun, 17 Apr 2022 18:15:26 +0200
Message-Id: <20220417161526.138019-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417161526.138019-1-rojtberg@gmail.com>
References: <20220417161526.138019-1-rojtberg@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pavel Rojtberg <rojtberg@gmail.com>

Newer gamepads turn themselves off when the mode button is held down.
For XBOX360W gamepads we must do this this in the driver.

Signed-off-by: lawl <github@dumbinter.net>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 7640cbb..a9894a6 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -620,11 +620,13 @@ struct usb_xpad {
 	int pad_nr;			/* the order x360 pads were attached */
 	const char *name;		/* name of the device */
 	struct work_struct work;	/* init/remove device from callback */
+	time64_t mode_btn_down_ts;
 };
 
 static int xpad_init_input(struct usb_xpad *xpad);
 static void xpad_deinit_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
+static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
 
 /*
  *	xpad_process_packet
@@ -776,6 +778,23 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	}
 
 	input_sync(dev);
+
+	/* XBOX360W controllers can't be turned off without driver assistance */
+	if (xpad->xtype == XTYPE_XBOX360W) {
+		if (xpad->mode_btn_down_ts > 0
+		&& xpad->pad_present
+		&& (ktime_get_seconds() - xpad->mode_btn_down_ts) >= 5) {
+			xpad360w_poweroff_controller(xpad);
+			xpad->mode_btn_down_ts = 0;
+			return;
+		}
+
+		/* mode button down/up */
+		if (data[3] & 0x04)
+			xpad->mode_btn_down_ts = ktime_get_seconds();
+		else
+			xpad->mode_btn_down_ts = 0;
+	}
 }
 
 static void xpad_presence_work(struct work_struct *work)
-- 
2.25.1

