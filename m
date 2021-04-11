Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F5B35B133
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 04:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235009AbhDKC42 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 22:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234991AbhDKC42 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 22:56:28 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D475C06138B;
        Sat, 10 Apr 2021 19:56:12 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id o123so6891339pfb.4;
        Sat, 10 Apr 2021 19:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kl8rMjMXuj6cBDVw8taKm3mwuU9tiU2czLtgJ2JcpSA=;
        b=uu1D02zsOB4E8TOKnRVBwHJoVXRCgkvLb4MtVnrpwGPZFyxkKpdbBlwQbmMeryzFX7
         puJXmIDv3jmV/jxocq/BUoLAxUrRUcBN4cJCTr6ZQ0riZfkD+LJgu/tPZsMFogT75edD
         twUe3mZ+ZduH4Jihq6YLZiJlN4qc27yyBVsVH7crFZwlSZNAouyqWSihEf6a44TQvPSR
         Riie98YlD/gg/EhAX0bXgU/Wtg5qy93LF4WJ6K6KhDcDYLOT7yMPo+uIC+5XDjVvJBLU
         UvUCvdnVteGGKmTUOtAdUGOYYRQuPNqwsID/lu+HK4d3qWC8qIjql+4V8Rk2Y6QcZKqs
         BEbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl8rMjMXuj6cBDVw8taKm3mwuU9tiU2czLtgJ2JcpSA=;
        b=FoKZZEmUGe67keVXYec02rhjlcTjPrlcNUE4y/26l3jiD4JZpqeYt5RJkbevo/G5qu
         d8bOHwtE66ywLLjnEVMBWn31xItjqOdwcF87qoTiIyBZwU5//uO0FPzdgWCIPULpzB34
         eLWaPUEuzvUNHmcqDBO9KWYJMF120mHLiJOVxZYvOwgP4N0Mj95GbQI5s0xZjoH4Lmy7
         U+jojTYGG82/Y3CIuBlHQRdM1KLZxbSjcN4yCQpmOxlw4DQfPClW/KryiHPa+NnRaIdq
         1NDqsFpnEwZpHA0ic6RHOYxSyzb7W0kS6hWDbDFFof1Wv24+tC9tx7zERWG3mX50fY5G
         e6bg==
X-Gm-Message-State: AOAM532q6qMLjEhVaUoXcrcXYu42mZeHUqZlxl3rpqHRPCc6X+uQ0Kcl
        uRyxXkIvzDj+bxlGyV16atA=
X-Google-Smtp-Source: ABdhPJxxp51keRrO/YRVzKGssNZdwXZ00ImjHm40l/ESWKSyaLp9lvQZZX/0bnIMt8miWi1Wpwggmw==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr6578047pgm.444.1618109772170;
        Sat, 10 Apr 2021 19:56:12 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:a9b4:ff60:6655:5c5f])
        by smtp.gmail.com with ESMTPSA id fs3sm6207001pjb.30.2021.04.10.19.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 19:56:10 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] HID: hid-debug: recognize KEY_ASSISTANT and KEY_KBD_LAYOUT_NEXT
Date:   Sat, 10 Apr 2021 19:56:06 -0700
Message-Id: <20210411025606.2744875-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
In-Reply-To: <20210411025606.2744875-1-dmitry.torokhov@gmail.com>
References: <20210411025606.2744875-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add missing descriptions for KEY_ASSISTANT and KEY_KBD_LAYOUT_NEXT.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-debug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 982737827b87..4d2b699daf8d 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -929,6 +929,8 @@ static const char *keys[KEY_MAX + 1] = {
 	[KEY_APPSELECT] = "AppSelect",
 	[KEY_SCREENSAVER] = "ScreenSaver",
 	[KEY_VOICECOMMAND] = "VoiceCommand",
+	[KEY_ASSISTANT] = "Assistant",
+	[KEY_KBD_LAYOUT_NEXT] = "KbdLayoutNext",
 	[KEY_EMOJI_PICKER] = "EmojiPicker",
 	[KEY_BRIGHTNESS_MIN] = "BrightnessMin",
 	[KEY_BRIGHTNESS_MAX] = "BrightnessMax",
-- 
2.31.1.295.g9ea45b61b8-goog

