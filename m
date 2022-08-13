Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B980591C58
	for <lists+linux-input@lfdr.de>; Sat, 13 Aug 2022 20:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239664AbiHMSx6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Aug 2022 14:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239591AbiHMSx5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Aug 2022 14:53:57 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC613F09
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:53:56 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id d71so3364106pgc.13
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r6cCM41kUJ/CHseUbJisNQXJTPGeGzFDlY7IBpxgiEs=;
        b=sUT7DOv3XdI9kJ5ET6LVLlmv0D33aXoFvOYIeVTs++Mh/4J/ua7ypuGEGmWuhp6vvZ
         qwRJJQn9ZiKHMhmKg4CpFr0+3Y/3vz2sXx9AQz8Ikk71UvQ8hkKKtKqGT9FFygbtLytL
         PHMiaA8iuBniy5eiRemkN2Z50xofDapNwohsy25M1AVCxm+RAexT33cbudp5C6c6LcKL
         36fEnw1bifwFuF9pH07J4kFlL50G7neX1pMgGC1jZmedZoJeWJkTkXMgRXw4BG461mlX
         bvfPagQy6A0R7pr60z1MMKeqO3+eBferYhcmyGboyCZoRvhPl444obt7PDs56J9OShhF
         epGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r6cCM41kUJ/CHseUbJisNQXJTPGeGzFDlY7IBpxgiEs=;
        b=QwttsPmXcgQpHPETc7lOIv2t18uwEj6ABvDNJbF3OgCzhuVxBrn1KZKtvRiIZG5I1y
         NEwI4aC4vyA0vvvuN7iOjrWgVEzjyOqVDvCLyUg+JNSccla5aQBQdkS4ab64JiIky4P9
         priBrW2hhHNxGwNOuKWs7oc5SPKRTBckIw6anPu/6lb1D6kKV+cmbe1hKE2AznkMml/K
         WpwSidvxS8rIIjlCs9Ok0Ys+sW/esjnh4doyLY+cdoafGCztuU4yrvs7arcok+z2T1mS
         nqqyiDYve2mMhiTjaoiWyeGw//nurPem8w98nmXvXeKvpl1zttcRnhCCmGjiLDmJ3Sj6
         vzxg==
X-Gm-Message-State: ACgBeo019Z8nhg9aOb5tMfUDNPQTHSqhsQ1YxX/j43N1ayiGvSNwC3M+
        razadhu2igZyCmt7/BuNZFJikA==
X-Google-Smtp-Source: AA6agR5jZoogtcA8KmI2CHSBGbkOz6Zq77ZcdPtMdmo5J4QauJ7QbHmqH2EnHVeOBlc7f9FXtOTOXQ==
X-Received: by 2002:a05:6a00:1996:b0:52e:b0f7:8c67 with SMTP id d22-20020a056a00199600b0052eb0f78c67mr9433021pfl.20.1660416836406;
        Sat, 13 Aug 2022 11:53:56 -0700 (PDT)
Received: from localhost.localdomain ([2601:600:a07f:e6ac::1c])
        by smtp.gmail.com with ESMTPSA id fs1-20020a17090af28100b001f246f2a423sm1972183pjb.17.2022.08.13.11.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 11:53:55 -0700 (PDT)
From:   Nate Yocom <nate@yocom.org>
To:     dmitry.torokhov@gmail.com
Cc:     nate@yocom.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, hadess@hadess.net
Subject: [PATCH v3 2/3] Input: joystick: xpad: Add X-Box Adaptive Controller Layer button
Date:   Sat, 13 Aug 2022 11:53:42 -0700
Message-Id: <20220813185343.2306-3-nate@yocom.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220813185343.2306-1-nate@yocom.org>
References: <20220813185343.2306-1-nate@yocom.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds a new quirk for controllers that have a Layer button which has 4
states, reflected as an ABS_MISC axis with 4 values.

Signed-off-by: Nate Yocom <nate@yocom.org>
---
 drivers/input/joystick/xpad.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index c8b38bb73d34..83a4f4d07af5 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -80,6 +80,7 @@
 #define MAP_TRIGGERS_TO_BUTTONS		(1 << 1)
 #define MAP_STICKS_TO_NULL		(1 << 2)
 #define MAP_SELECT_BUTTON		(1 << 3)
+#define MAP_LAYER_BUTTON		(1 << 4)
 #define DANCEPAD_MAP_CONFIG	(MAP_DPAD_TO_BUTTONS |			\
 				MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
 
@@ -131,7 +132,7 @@ static const struct xpad_device {
 	{ 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
 	{ 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
-	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", 0, XTYPE_XBOXONE },
+	{ 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", MAP_LAYER_BUTTON, XTYPE_XBOXONE },
 	{ 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
 	{ 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
 	{ 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
@@ -927,6 +928,10 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
 				 (__u16) le16_to_cpup((__le16 *)(data + 8)));
 	}
 
+	/* Layer button has a value of 0-4, so it is reported as an axis */
+	if (xpad->mapping & MAP_LAYER_BUTTON)
+		input_report_abs(dev, ABS_MISC, data[34]);
+
 	input_sync(dev);
 }
 
@@ -1623,6 +1628,9 @@ static void xpad_set_up_abs(struct input_dev *input_dev, signed short abs)
 	case ABS_HAT0Y:	/* the d-pad (only if dpad is mapped to axes */
 		input_set_abs_params(input_dev, abs, -1, 1, 0, 0);
 		break;
+	case ABS_MISC: /* 4 value layer button (such as on XAC) */
+		input_set_abs_params(input_dev, abs, 0, 4, 0, 0);
+		break;
 	default:
 		input_set_abs_params(input_dev, abs, 0, 0, 0, 0);
 		break;
@@ -1715,6 +1723,10 @@ static int xpad_init_input(struct usb_xpad *xpad)
 			xpad_set_up_abs(input_dev, xpad_abs_triggers[i]);
 	}
 
+	/* setup layer button as an axis with 4 possible values */
+	if (xpad->mapping & MAP_LAYER_BUTTON)
+		xpad_set_up_abs(input_dev, ABS_MISC);
+
 	error = xpad_init_ff(xpad);
 	if (error)
 		goto err_free_input;
-- 
2.30.2

