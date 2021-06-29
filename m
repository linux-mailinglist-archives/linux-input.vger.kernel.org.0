Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E30B3B77C9
	for <lists+linux-input@lfdr.de>; Tue, 29 Jun 2021 20:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234413AbhF2S2X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Jun 2021 14:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233843AbhF2S2W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Jun 2021 14:28:22 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEE0C061760;
        Tue, 29 Jun 2021 11:25:54 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cx9-20020a17090afd89b0290170a3e085edso3064731pjb.0;
        Tue, 29 Jun 2021 11:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=u/6UWA7ctrHsSbnwm4aIjgzhxXKmYH8AmE03qul2tjE=;
        b=Kc3AmH7ISBDlp2uBDPoPEEe6ErlktdvQCxficV34qOTKQI0je687lG98Yyx2gBEeXO
         OWIFrpdkV2et2dvANGCIQVTHapU3GbWcoPDQqMqOeKVdICo//PSCgiVj+QySfs1PlzhJ
         Ezl8/FGF4DhAnNI+Sj4JvQ2V80+81u6NnH2fD9xO71L0Y1GDq2FTbnpOy4plfJk1VPFp
         CB3kkxbJc8jIHGW7wwALeWs+orB/7hCu4Gn2F5LCpN10zY17vWJmxxJ4xqEqc6ngLMwT
         Lf3kk5FYkXyuVwN42kNY0fQqJo/YuZgVeDldSH/CyQg1voEhPWa6spIzUkxdxzt3biNE
         oIBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=u/6UWA7ctrHsSbnwm4aIjgzhxXKmYH8AmE03qul2tjE=;
        b=bYvOD/KzEZrFn4wesngCzILMX4KzQhsWWVjWU5ZWvCezAG9e96kXBZvk4ZOLHO1dOL
         ZRiungd6F99564+/vRN60eAyZDLxS8lzIc3IY5ulf1Eq0ryQco0qudi4uz/yhRnCBS2Z
         HUIL3vmsvWCTMlLqz2xarftOVAUe4PAC2ff3Dlwl9BhbSowohTvjze88bapSJoCBvESw
         NlO88ZYk8WPmBz/aKsQp+d7Nm9choZNB0jUQvM2ycrhClBCqvLUlaOkKLIiO8wXQRaj2
         Kp+3s+TEGc7SSatPxsAeCuyuiY9ZB+T6qyUfIGcpk4Sh1R9FZwBOGeNe9qiE7Z8t6mat
         aiHw==
X-Gm-Message-State: AOAM533+RK7SAIPjTZrLBPRUv38SFqcJ+inXCyI6+nH9oMWZz5VlQ5H5
        y1C8ZNX5FwCbKhCWCV+KQCo=
X-Google-Smtp-Source: ABdhPJwuzmxm4aF1jiWRpiCNBTPwZkmU4cBHZ3VlUv3GXwn6QSSfZ8eiGeSbkZynzEcstDzMB15sxQ==
X-Received: by 2002:a17:90b:3612:: with SMTP id ml18mr159229pjb.209.1624991153535;
        Tue, 29 Jun 2021 11:25:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a179:bab4:eeba:e548])
        by smtp.gmail.com with ESMTPSA id b10sm17245359pfi.122.2021.06.29.11.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jun 2021 11:25:52 -0700 (PDT)
Date:   Tue, 29 Jun 2021 11:25:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Kenneth Albanowski <kenalba@google.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] HID: input: do not report stylus battery state as "full"
Message-ID: <YNtlrrKZVQY4byVa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The power supply states of discharging, charging, full, etc, represent
state of charging, not the capacity level of the battery (for which
we have a separate property). Current HID usage tables to not allow
for expressing charging state of the batteries found in generic
styli, so we should simply assume that the battery is discharging
even if current capacity is at 100% when battery strength reporting
is done via HID interface. In fact, we were doing just that before
commit 581c4484769e.

This change helps UIs to not mis-represent fully charged batteries in
styli as being charging/topping-off.

Fixes: 581c4484769e ("HID: input: map digitizer battery usage")
Reported-by: Kenneth Albanowski <kenalba@google.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-input.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index e982d8173c9c..e85a1a34ff39 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -417,8 +417,6 @@ static int hidinput_get_battery_property(struct power_supply *psy,
 
 		if (dev->battery_status == HID_BATTERY_UNKNOWN)
 			val->intval = POWER_SUPPLY_STATUS_UNKNOWN;
-		else if (dev->battery_capacity == 100)
-			val->intval = POWER_SUPPLY_STATUS_FULL;
 		else
 			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
 		break;
-- 
2.32.0.93.g670b81a890-goog

-- 
Dmitry
