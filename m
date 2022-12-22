Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1FB3653C37
	for <lists+linux-input@lfdr.de>; Thu, 22 Dec 2022 07:40:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiLVGkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 22 Dec 2022 01:40:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiLVGkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 22 Dec 2022 01:40:09 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99620F5
        for <linux-input@vger.kernel.org>; Wed, 21 Dec 2022 22:40:07 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id 21so586353pfw.4
        for <linux-input@vger.kernel.org>; Wed, 21 Dec 2022 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=msi-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogjfcvh43nFxWJnnPvXd6MYBOFhDNuD7/XbMbc0+9WA=;
        b=OqJZAB59ID/EzzKS9/X9ntb8J7R7YMFxMetxuTncgZUdrwhQvJLh4p5Sav2sFoi8mt
         2a1c6MqnDvI+ivAsreUmGbzRrEWS6Ne7xJG1d4A53UebPLmzd1Pa8tDe7GjG8TiezO/6
         RX3ets/SdfR+vVv2p7Q5vty8/r7r0CyOtXGjBMIZ/wAoexF8E+vfKQZBJMeJz1fzC1wf
         kGvBj6KGPPJYgXCpjevDUyjKxYTs3HV1KpbqFkrDI3V52seVMREMtFaYB/or/SXpERhp
         HZV3EIwmeltNCGNYIqRw5p23c4NqBCTzhpornJPeDZrL4xG/buHQYF0X56VXvRUd1/z9
         Z4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogjfcvh43nFxWJnnPvXd6MYBOFhDNuD7/XbMbc0+9WA=;
        b=TarWLlSDtQo9ZIlOuufkjNZkAw7HQvHOPb0bMujHmIByBB9vgaX79fGhM0Z5by9yEX
         ekv9Hvh5CLH3aIaSZxHJYWe3Ohp87HobMv2b4UJJN40UTyRLFUBr45diPMF87GUQ79+3
         TDN4Xg0+qxt14GlLWyE5NLdWAdrrlvOEY3PbeWf8f9wWenHZSlUKJsYlBeDp5Ten/eJk
         x4JybTRCzldmNP0eG8x4ge2+xutypFKSZsYNi8wSOWiLjDnLrgWN1jVCEtFPOZvaasGf
         oZ5Lx5S27IEdRfRoSquuTFt8A6DDj+HHhABu38ewEDYMdBDMj9nDlBQ1YtZ33bI974pP
         QZeg==
X-Gm-Message-State: AFqh2kr+pWqkkiq/6BsBYtEahxHv41w6jGqTfLGGxOGHhDL1qC2uiUEl
        CxTWIfY8mOrNq5OvMuvzUoB4NA==
X-Google-Smtp-Source: AMrXdXtmMLjak80VM38E7Wd9D1fLmvnMYfL4vab5F34++EowJdAgClZfDHjQ/eCnN7G61+SsEnuk5Q==
X-Received: by 2002:a05:6a00:1485:b0:575:b783:b6b3 with SMTP id v5-20020a056a00148500b00575b783b6b3mr6658062pfu.28.1671691207118;
        Wed, 21 Dec 2022 22:40:07 -0800 (PST)
Received: from localhost.localdomain (211-20-230-25.hinet-ip.hinet.net. [211.20.230.25])
        by smtp.gmail.com with ESMTPSA id q15-20020aa7982f000000b00576f9773c80sm11684539pfl.206.2022.12.21.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 22:40:06 -0800 (PST)
From:   Joe Wu <joewu@msi.corp-partner.google.com>
X-Google-Original-From: Joe Wu <joewu@msi.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Xiang wangx <wangxiang@cdjrlc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        chrome-platform@lists.linux.dev,
        Benson Leung <bleung@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Guenter Roeck <groeck@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Derek Huang <derekhuang@google.com>,
        "Dustin L . Howett" <dustin@howett.net>, Joe Wu <joewu@msi.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Lee Jones <lee.jones@linaro.org>,
        Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Date:   Thu, 22 Dec 2022 14:39:50 +0800
Message-Id: <20221222063950.26018-1-joewu@msi.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add 3 extra buttons: 'brightness up', 'brightness down'
and 'screen lock' to support monitor manipulating function.

Signed-off-by: Joe Wu <joewu@msi.com>
---

 drivers/input/keyboard/cros_ec_keyb.c          | 15 +++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 6f435125ec03..e7ecfca838df 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -100,6 +100,21 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= KEY_VOLUMEDOWN,
 		.bit		= EC_MKBP_VOL_DOWN,
 	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_BRIGHTNESSUP,
+		.bit            = EC_MKBP_BRI_UP,
+	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_BRIGHTNESSDOWN,
+		.bit            = EC_MKBP_BRI_DOWN,
+	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_SCREENLOCK,
+		.bit            = EC_MKBP_SCREEN_LOCK,
+	},
 
 	/* Switches */
 	{
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 5744a2d746aa..a2073ed43972 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
 #define EC_MKBP_RECOVERY	3
+#define EC_MKBP_BRI_UP		4
+#define EC_MKBP_BRI_DOWN	5
+#define EC_MKBP_SCREEN_LOCK	6
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.17.1

