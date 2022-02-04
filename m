Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 464204AA113
	for <lists+linux-input@lfdr.de>; Fri,  4 Feb 2022 21:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237276AbiBDUUa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Feb 2022 15:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236301AbiBDUU3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Feb 2022 15:20:29 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 196F8C06173E
        for <linux-input@vger.kernel.org>; Fri,  4 Feb 2022 12:20:29 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id p22-20020a17090adf9600b001b8783b2647so908640pjv.5
        for <linux-input@vger.kernel.org>; Fri, 04 Feb 2022 12:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZuOJxErdx75B/XhX4U4+Jmre2nmp1Aql4lPGNRbh74=;
        b=m44UmiZNIzXcaNlxVsUNeCt11Rnd6XDmmWnZlPfuePWHe9i4X2OKyxylOLPFaVeQTQ
         GVKU2pFVrIGIvBnBq/JmRwCNG3tLeiH0wvEJeRKjX4IWkVuGwOxw55Lewyp4+Wp/85SP
         RyoB4r9/7gS1YxT0S3SlmLN9Iqve51rnPI91o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZuOJxErdx75B/XhX4U4+Jmre2nmp1Aql4lPGNRbh74=;
        b=hgJVhjDQupuIMErhB8uLOozXaQGlhzaY0ogwBgNmVQnRwkaN1cu9XKxhv5/hU4iprL
         XyA2ElO97Cq935P8a4Sg9EWperl1l4GY/nrgSX8kd5aJe9truZCG4T3rSz4lDUspfJcu
         1ssmcQkDp2FaUA8zuO59inOh9nDw9hTU8PWijXYWuRRHjQtIinxoAqq3gZ80P4+gzmwD
         e0YyCBIiFntbm491BxCVanntQ1eCce5+aZS8yelJYTVsjPft0b6hLHorKk4ywsz1TiXs
         hH0O+SeifdDKZaGvbQ2Ja8Fy3GP7f1C23RmyDnSK1acZMVeHQFSlZEgeQQONpc3VhvI7
         ElXQ==
X-Gm-Message-State: AOAM533htGuyPehyh16+U9T30Ya9/y5ArHilNhmSZ7PsOJK50//T2sou
        Pj5CmB/0k2Ww2DMZel2X57EXsQ==
X-Google-Smtp-Source: ABdhPJxQ8ZCRvr4IQgSkocLn59rOK1y0Ck/eM+WqyNBRC6bb6AVM4Yk+ZuuKu16eRAdso434rpNETg==
X-Received: by 2002:a17:902:c155:: with SMTP id 21mr1708641plj.31.1644006028610;
        Fri, 04 Feb 2022 12:20:28 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ba2:dd59:3b59:18bc])
        by smtp.gmail.com with ESMTPSA id q17sm3385561pfk.108.2022.02.04.12.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 12:20:28 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 5/5] HID: google: modify HID device groups of eel
Date:   Fri,  4 Feb 2022 12:20:21 -0800
Message-Id: <20220204202021.895426-6-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220204202021.895426-1-swboyd@chromium.org>
References: <20220204202021.895426-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Sean O'Brien" <seobrien@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
[swboyd@chromium.org: Expand on commit text]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/hid/hid-google-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
index e3dd26ddbd43..8ed75bb0878f 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -636,7 +636,7 @@ static void hammer_remove(struct hid_device *hdev)
 static const struct hid_device_id hammer_devices[] = {
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_DON) },
-	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
+	{ HID_DEVICE(BUS_USB, HID_GROUP_VIVALDI,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_EEL) },
 	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
 		     USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_HAMMER) },
-- 
https://chromeos.dev

