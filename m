Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70DB651C25
	for <lists+linux-input@lfdr.de>; Tue, 20 Dec 2022 09:03:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiLTIDg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Dec 2022 03:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233780AbiLTIDG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Dec 2022 03:03:06 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC2D18356
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 00:02:37 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id 79so7807266pgf.11
        for <linux-input@vger.kernel.org>; Tue, 20 Dec 2022 00:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=msi-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8keCepZ3dfLi7fx2igh9uQOxl5mkPHS3M0dmWSrolk=;
        b=IZpbA04Y8FkJYIOTO3btzMCktgX15dHzpAYDIPQVUsHlEoNpskIkkn9sBll2LGFYN1
         GBzi/zoELV4ZK7kSf462ZlxZrn10xv/Yf23HZ7ULika0ig2qCXIQka2vO6+PzqeXOYJi
         bPFUaNPZmHrpk+sfCR96v+upBWQ/W6TQACTsQkKOVnOW0AJ3LQfg/ul14K7q5rmD9+il
         Ei52zQmUKSbIUTa4wGWMskWSHrca/JRtdhBUgm5Uqs6rl5pssVRdxigy/Lhs/2yBu4US
         7RD1bgbYXeJBFSkg4nGDEiqZE0GE2HDK77inju8h6dNs75F1wwd/Z0EEYeylAjX6UCgV
         k6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8keCepZ3dfLi7fx2igh9uQOxl5mkPHS3M0dmWSrolk=;
        b=faZv04irwDC8Ze97UOJJBpYCT2ENn2bwvXQ2sQqAqOxW5BJOqLB2MSMqTmcmRgxJKV
         ejP1ZGtThU8ZDz//Pa6skn6uc56jHpwXPAZUOGrZFuRSKH9Q5RF/BjumEGxIiN9pNDEQ
         slNiyyLkDrUJ9/ktsWiZAJ7c8ZhrnkKcC2hU2xEfpZ6UL8XQcXPsfFqaPNr+bjMtSsRf
         itFalYvw++CtUEyhmaqqLen+9HWiwJ3UG2LqdxWAViEqJwHFlBlf33qQzB8KVQJmVBjC
         Sja7ssjwi1kEWHveXuh9Ku4qh3BoWLgVFFFVP/tiM4b56QiGWtl/1SorsjBrxRrAM1Ce
         wjbw==
X-Gm-Message-State: ANoB5pmuue+2u0LEIUxukP8v5oow920abEeaCCqF6Zutz1RoeOVReUqc
        xYpHJHZILwKALyjf9SJCLgE63A==
X-Google-Smtp-Source: AA0mqf6/Bt34QrBTtjaJsqW3ObFxjL3yJ6DNzjLGqoyy//U7Au7orP2xnMuERcjQHgLWMODoIqSxVw==
X-Received: by 2002:a05:6a00:d6c:b0:577:a0d:b078 with SMTP id n44-20020a056a000d6c00b005770a0db078mr43609000pfv.20.1671523356632;
        Tue, 20 Dec 2022 00:02:36 -0800 (PST)
Received: from localhost.localdomain (211-20-230-25.hinet-ip.hinet.net. [211.20.230.25])
        by smtp.gmail.com with ESMTPSA id o198-20020a62cdcf000000b00574e84ed847sm7980161pfg.24.2022.12.20.00.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 00:02:36 -0800 (PST)
From:   Joe Wu <joewu@msi.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Tzung-Bi Shih <tzungbi@kernel.org>,
        "Dustin L . Howett" <dustin@howett.net>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Xiang wangx <wangxiang@cdjrlc.com>,
        linux-input@vger.kernel.org,
        Prashant Malani <pmalani@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daisuke Nojiri <dnojiri@chromium.org>,
        Furquan Shaikh <furquan@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Derek Huang <derekhuang@google.com>,
        Joe Wu <joewu@msi.corp-partner.google.com>,
        chrome-platform@lists.linux.dev,
        Guenter Roeck <groeck@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Date:   Tue, 20 Dec 2022 16:02:26 +0800
Message-Id: <20221220080226.17904-1-joewu@msi.corp-partner.google.com>
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

Signed-off-by: Joe Wu <joewu@msi.corp-partner.google.com>

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
index 5744a2d746aa..502f0397a402 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
 #define EC_MKBP_RECOVERY	3
+#define EC_MKBP_BRI_UP          4
+#define EC_MKBP_BRI_DOWN        5
+#define EC_MKBP_SCREEN_LOCK     6
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.17.1

