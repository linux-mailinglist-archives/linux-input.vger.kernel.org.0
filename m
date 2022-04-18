Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C18504F76
	for <lists+linux-input@lfdr.de>; Mon, 18 Apr 2022 13:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236355AbiDRLoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Apr 2022 07:44:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiDRLoY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Apr 2022 07:44:24 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD0D1DFFD
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:44 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id m14so18286982wrb.6
        for <linux-input@vger.kernel.org>; Mon, 18 Apr 2022 04:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tl/kRVRuiJ42P+3vyybYBp2N1GhcwJ6H+RfpOsqlCJo=;
        b=brOL86SqabVVN+aIfhdMEj4XqTHyXMSEuTGE3/NvBD0CoLJ2ODREsogBRuyZi094WR
         32VQIm06SbuL+091a471/+TalVPVqhqzk2pTp3PnLJ1ucFtmlKehNrZUnnSrmwZnysrT
         yrIr5mwOa1p20d5lJRIWqj7rafT8Qn48Ri2IC2B/Z/I4ubzynS6qXulOoBLMYGC2tNN4
         /US0IIMIPt0ZtLJsoTtEWrFjCBUd8JjW57qpmRirRWaFZRID/O0J/JmT9GgAyw5U/7sb
         TomZHCilRK4ijWZkhuxh7WDGiZHA+DoysaLOd+SmPil5xeDfr222bxwJNSYCtRPlTgim
         4uaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tl/kRVRuiJ42P+3vyybYBp2N1GhcwJ6H+RfpOsqlCJo=;
        b=SzkwEYYUPSMXfDEAaZ0yvhU+tOkgBW0WlJzjq8MJtGrUov5nSnbsY9ShT1ht+Li+MA
         MEY/x6iQYGpcxW1J61UDTzF8dowIIPQQeWv/zL6l5ER91C3pKnPHuPmTDGLY/jTYHPwS
         rgIzG0BtQemjPZ7e0JX7zrR5Q+aohomkMSZNXJKvdc1v084BDeMBtpN2IDmP3bp3jYxD
         QarhmSQeo9CKusaT24OnnyJpfNwWFyW56LGXcN3ELF7PH80a5rO/QjhBmHuT6SmIJk5A
         VaQB5HjwffLw88dbkgMg6tqvSjt+9UmGdAPNiGygm6PpfhJJyoC0N7mbrYvgbyhqayJa
         eyfA==
X-Gm-Message-State: AOAM5338ClbcfNtKkzimKnERhxHt7YIrYMcJdy2wlBKfREBIMbFY9Spw
        SbRI0nfj1U7R742iFu3FDFHWUw39lefGyw==
X-Google-Smtp-Source: ABdhPJyLaSf5batHwPOaOlbZckFTN71TRFtHf8OAADvKqQGRS1st2gOzjVCzlJE799MsWrMNxv2GpQ==
X-Received: by 2002:a05:6000:156a:b0:20a:99bc:987f with SMTP id 10-20020a056000156a00b0020a99bc987fmr2815524wrz.569.1650282103405;
        Mon, 18 Apr 2022 04:41:43 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:2205:7500:31a3:8b23:14e3:7ccf])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b00207b49d3023sm10007211wrq.44.2022.04.18.04.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 04:41:43 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Santosh De Massari <s.demassari@gmail.com>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 3/3] Input: xpad - Poweroff XBOX360W on mode button long press
Date:   Mon, 18 Apr 2022 13:40:22 +0200
Message-Id: <20220418114022.23673-4-rojtberg@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418114022.23673-1-rojtberg@gmail.com>
References: <20220418114022.23673-1-rojtberg@gmail.com>
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

From: Santosh De Massari <s.demassari@gmail.com>

Newer gamepads turn themselves off when the mode button is held down.
For XBOX360W gamepads we must do this in the driver.

Do not use BIT() macro for consistency within the file.

Signed-off-by: Santosh De Massari <s.demassari@gmail.com>
Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
---
 drivers/input/joystick/xpad.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 2a45733..ca4efa5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -89,6 +89,11 @@
 #define XTYPE_XBOXONE     3
 #define XTYPE_UNKNOWN     4
 
+/* Send power-off packet to xpad360w after holding the mode button for this many
+ * seconds
+ */
+#define XPAD360W_POWEROFF_TIMEOUT 5
+
 static bool dpad_to_buttons;
 module_param(dpad_to_buttons, bool, S_IRUGO);
 MODULE_PARM_DESC(dpad_to_buttons, "Map D-PAD to buttons rather than axes for unknown pads");
@@ -619,11 +624,13 @@ struct usb_xpad {
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
@@ -775,6 +782,23 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 	}
 
 	input_sync(dev);
+
+	/* XBOX360W controllers can't be turned off without driver assistance */
+	if (xpad->xtype == XTYPE_XBOX360W) {
+		if (xpad->mode_btn_down_ts > 0 && xpad->pad_present &&
+		    ((ktime_get_seconds() - xpad->mode_btn_down_ts) >=
+		     XPAD360W_POWEROFF_TIMEOUT)) {
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

