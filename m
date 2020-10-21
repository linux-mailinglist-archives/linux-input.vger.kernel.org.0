Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9F3294E1E
	for <lists+linux-input@lfdr.de>; Wed, 21 Oct 2020 15:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440284AbgJUN5M (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Oct 2020 09:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2411763AbgJUN5M (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Oct 2020 09:57:12 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD5B6C0613CE
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 06:57:12 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id f19so1513761pfj.11
        for <linux-input@vger.kernel.org>; Wed, 21 Oct 2020 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1TFCsmXkqBmOtz+uaqdsKb+MHZorZoWKpRfZG7ZHGM=;
        b=X08JwVL1cCeksgkrlhPS+uFit5zsmhWE6bFuGKC8PR4jIo2Ih18r1Ye4h077ZNFYvP
         qn4Dz32MLoyTKUreATfqvBENShseRy/7OoBzYxQm+Y+XoUUa/ARHE8GGWHD0jYCQzvwU
         EUFqb4xj5MVejfU3Wb00WIWIfe3PLewaAqfhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1TFCsmXkqBmOtz+uaqdsKb+MHZorZoWKpRfZG7ZHGM=;
        b=MdR8MVoXsMDk0sYEOGc7brRoW/MMwH0SA/KcXPxB8amXkmtloxS4jPsRgytjOO4B42
         9Fzvd0eb7kODH2da5ayJTiIKGgFACOwBSOvpjUq6U1fiLglu++RQIkOLW+uA3H6fxV+U
         lqO7AEn2vLHr7FKGhac/5LvrJRtvFk/6kmQeJwwvqG+xcDfcBJ0B7d1qjZ1m3Vkwg+Y3
         8KMVY3VpNB1UzkN5Sqo1jyROcukAkqGpOi0RwBj0MmQ47wyTMWo2wnniB9GKIUutvHca
         6Zv+8ROJegCV+GYa7xtBiFhCPWkOEZRhsalEYp36DPlQrwiBdUuZ3an3zzvoI8vo9Wtg
         yE2w==
X-Gm-Message-State: AOAM531zMW4M5BXMTJ3aeRNqu6YqYsXF+/EEVvvho6NPtkBVfiVC5NQz
        A0V2q6dOyT7ecZ13s0nrewrCp4iv2LrIaBb9
X-Google-Smtp-Source: ABdhPJz9a2D9o0OoDQ03Q6V0fqHnxXPLve39qPkepO1yaqCtP2+AE1AKwo6KADu1Oz0er7nGSTQYrQ==
X-Received: by 2002:a63:e354:: with SMTP id o20mr3615284pgj.317.1603288632284;
        Wed, 21 Oct 2020 06:57:12 -0700 (PDT)
Received: from kolhar.mtv.corp.google.com ([2620:15c:202:201:7220:84ff:fe09:2d4e])
        by smtp.gmail.com with ESMTPSA id z10sm2317808pjz.49.2020.10.21.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 06:57:11 -0700 (PDT)
From:   Harry Cutts <hcutts@chromium.org>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Harry Cutts <hcutts@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org
Subject: [PATCH] HID: logitech-hidpp: Add PID for MX Anywhere 2
Date:   Wed, 21 Oct 2020 06:56:12 -0700
Message-Id: <20201021135612.258558-1-hcutts@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It seems that the PID 0x4072 was missing from the list Logitech gave me
for this mouse, as I found one with it in the wild (with which I tested
this patch).

Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
Signed-off-by: Harry Cutts <hcutts@chromium.org>
---

 drivers/hid/hid-logitech-hidpp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index b8b53dc95e86b..730036650f7df 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -3947,6 +3947,7 @@ static const struct hid_device_id hidpp_devices[] = {
 	  LDJ_DEVICE(0x405e), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ /* Mouse Logitech MX Anywhere 2 */
 	  LDJ_DEVICE(0x404a), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
+	{ LDJ_DEVICE(0x4072), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ LDJ_DEVICE(0xb013), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ LDJ_DEVICE(0xb018), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
 	{ LDJ_DEVICE(0xb01f), .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
-- 
2.29.0.rc1.297.gfa9743e501-goog

