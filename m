Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41D64C6425
	for <lists+linux-input@lfdr.de>; Mon, 28 Feb 2022 08:55:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbiB1Hzj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Feb 2022 02:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233756AbiB1Hzj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Feb 2022 02:55:39 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 726D4606E5
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:59 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id v4so10398614pjh.2
        for <linux-input@vger.kernel.org>; Sun, 27 Feb 2022 23:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H1m4Zi6Ns02mUbm+534InG8jnE+hMLBdIMegNJHG0gs=;
        b=n66Nb6ih4kVIXFgoUoaIsoH9PyiNVF+SqCUNHizLTZgGOvlvgnsd3yniEzh/ylGOx5
         4YhqLtQImKkRbTSlIppbjCH0T38UUm7DHVezKFV9GH7ZrTO9UHa/ZuNqsf5ynCY5NOWV
         mNPKN5bkUk94Z4ueaxuKs6NFSQQZV6ozZ4fD2facfUbLhD0l3D7Y3nbSSlw7VZ19KVTr
         v2vNupTY6YOmOVM67w6HLrpJ/Xr5Ue3eI07/ywnmg9jSnu4kaEz33q3wvOExjVeRgJfB
         RnEBcCBXHwTSHJyxPhLYM7E5e14nBwmdBf2XEAkCKQVll4/zO57Kn7fekaw7JZE4GySx
         ioGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H1m4Zi6Ns02mUbm+534InG8jnE+hMLBdIMegNJHG0gs=;
        b=3KjsaoLEqh4KPjn7mOF+tm0fy8kQC83l3pLt9GhCqGg1w0sJJjoWPbSU9izz6+rFfe
         cbqAnzT4PnTNa+MDMqJVdllYXuSY1U/pesOH/KIk1MV3nMBXWUzsuHK90e76hYEqwkpZ
         C3CqOUUZeR02p6tQaETFiVxxGKzQpM2Swyjk1cye7s20goByXyCV4XWKrrLp31r6Ipvm
         MasE1UYLH8vw9+oc4JtzpPwNNmX798YgEsCiJMf252xT+xZ+u/GbDtDBSQjWIyenYbT7
         TyZ/kB0YzypC+Y5FTWJfHCHaheOZIJBVWjl2FeH8IkCrQwk4S0R9+7YRhvNE7FhRZlzn
         nX8A==
X-Gm-Message-State: AOAM530YlE9Bmushbk9GGS2wzVkQNHtqD1S03kwXvnQRNFZ+Rwzkz+Rb
        LaRTOMlp0Um/ZooHaZCxpEVmh1JVsj8=
X-Google-Smtp-Source: ABdhPJxHOqbWdqbdXGss84caU4vpc5Sd3PD7MlaRsV4G2kiyyKKli9a/aH1DIiXY3N7RzbRgsQU2kw==
X-Received: by 2002:a17:90a:8d85:b0:1b8:a215:e3e4 with SMTP id d5-20020a17090a8d8500b001b8a215e3e4mr15111091pjo.175.1646034898648;
        Sun, 27 Feb 2022 23:54:58 -0800 (PST)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:43a2:93b6:ebd7:94fd])
        by smtp.gmail.com with ESMTPSA id d13-20020a17090ac24d00b001bcd7c2b2c3sm10718517pjx.16.2022.02.27.23.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Feb 2022 23:54:57 -0800 (PST)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>, Jiri Kosina <jkosina@suse.cz>
Subject: [PATCH v5 5/5] HID: google: modify HID device groups of eel
Date:   Sun, 27 Feb 2022 23:54:46 -0800
Message-Id: <20220228075446.466016-6-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.35.1.574.g5d30c73bfb-goog
In-Reply-To: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
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

From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>

If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet Mode
Switch of eel hammer will not be detected by system because the
hid-vivaldi driver probes the device. When it is set to
HID_GROUP_VIVALDI, system will detect Whiskers Tablet Mode Switch
successfully and also support the vivaldi keyboard layout.

Tested-by: "Sean O'Brien" <seobrien@chromium.org>
Acked-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
[swboyd@chromium.org: Expand on commit text]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Link: https://lore.kernel.org/r/20220216195901.1326924-5-swboyd@chromium.org
Patchwork-Id: 12748989
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index 5d774c9c596c..7fd342081183 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -582,7 +582,7 @@ static void hammer_remove(struct hid_device *hdev)
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
-	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+	{ HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
-- 
2.35.1.574.g5d30c73bfb-goog

