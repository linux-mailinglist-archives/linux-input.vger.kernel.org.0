Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A62014AA110
	for <lists+linux-input@lfdr.de>; Fri,  4 Feb 2022 21:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237211AbiBDUU2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Feb 2022 15:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbiBDUU1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Feb 2022 15:20:27 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4187C06173E
        for <linux-input@vger.kernel.org>; Fri,  4 Feb 2022 12:20:24 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id l1so1635550pjn.4
        for <linux-input@vger.kernel.org>; Fri, 04 Feb 2022 12:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hIUv1MO1iy6sJ6WYNc3M1xUaiyEzoDA2Zqsi2W+B1jw=;
        b=B8DEv/UQfza4NiLvx5+FMWS6eWfCad/NG2Iuh8em+mborNFxW36oGKfNmHA+k4EKbv
         34upCx6i1VyR6H4elqTcDjAe8qi1FNjWGIiP8Vy04zHa2/mbZA7gHiEaFMqZMA+Xl/+9
         79Vo0YX5u7mvKXUbwRZGUMoxx0AoPsQNr3aTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hIUv1MO1iy6sJ6WYNc3M1xUaiyEzoDA2Zqsi2W+B1jw=;
        b=uUunLNr6XEvStr7XieeD7OZMtuWggZboyGmwQCJXD/5g5+MHeO+P7onyFvmiFJr219
         aIBTr8cURQTYJKG8ok6eGyv2zYbkeKtEZ8ejtVZaxGgD83Daxt3EmQ21mqFNYlj9C6/2
         iYZC1UUsfmt6EEH+AQCaTzgdK3oUgkCXXIb5otvAloXON11noxMTcw9Ri/TTSgRqt+ic
         HXLvxwLpC+bdX4qmHD68NaQxSqmpfya5L5PZWihpspJSrMit5SoKKo/OnItmmXfF0xw7
         2bQwM2pzSAXg/xPBrBqNRXcvqv6xTpQLrrsP7XsGeED0hMuklzwkw0rafFI1KvPrzHUS
         yQ3w==
X-Gm-Message-State: AOAM531DmiN8kVqfKuQ9rWsGnRJ+k46/NunhDUENYwCnyXaopXPpYDhF
        hfbtEtXAsUQ7djrIP61tHPFlygIOKwGsKw==
X-Google-Smtp-Source: ABdhPJycvyGMuUD4ZFKKoIUOW4gSawF+pLMxgQJKQNHGGkgRQruC7lpRN2AOdG33xdVZhvw1ElNrNA==
X-Received: by 2002:a17:903:41c6:: with SMTP id u6mr4932478ple.6.1644006024339;
        Fri, 04 Feb 2022 12:20:24 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ba2:dd59:3b59:18bc])
        by smtp.gmail.com with ESMTPSA id q17sm3385561pfk.108.2022.02.04.12.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 12:20:24 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH 1/5] Input: atkbd: Convert function_row_physmap to u16 array
Date:   Fri,  4 Feb 2022 12:20:17 -0800
Message-Id: <20220204202021.895426-2-swboyd@chromium.org>
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

This is a u32 array because the device property is an array of u32s.
Convert this to a u16 array to save a little space and to ease the
transition to a common physmap function in the next patch.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Sean O'Brien" <seobrien@chromium.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Note this makes a large array on the stack (32 * 24 = 768 bytes). It
could be moved to the heap with a kmalloc or we could accept the extra
16 * 24 = 384 bytes for the vivaldi_data struct if it has a u32, or we
can be more precise and make that a u16 pointer in vivaldi_data and move 
the array to the heap.

 drivers/input/keyboard/atkbd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index fbdef95291e9..721cde982637 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -237,7 +237,7 @@ struct atkbd {
 	/* Serializes reconnect(), attr->set() and event work */
 	struct mutex mutex;
 
-	u32 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
+	u16 function_row_physmap[MAX_FUNCTION_ROW_KEYS];
 	int num_function_row_keys;
 };
 
@@ -1202,14 +1202,17 @@ static void atkbd_parse_fwnode_data(struct serio *serio)
 {
 	struct atkbd *atkbd = serio_get_drvdata(serio);
 	struct device *dev = &serio->dev;
-	int n;
+	int i, n;
+	u32 physmap[MAX_FUNCTION_ROW_KEYS];
 
 	/* Parse "function-row-physmap" property */
 	n = device_property_count_u32(dev, "function-row-physmap");
 	if (n > 0 && n <= MAX_FUNCTION_ROW_KEYS &&
 	    !device_property_read_u32_array(dev, "function-row-physmap",
-					    atkbd->function_row_physmap, n)) {
+					    physmap, n)) {
 		atkbd->num_function_row_keys = n;
+		for (i = 0; i < n; i++)
+			atkbd->function_row_physmap[i] = physmap[i];
 		dev_dbg(dev, "FW reported %d function-row key locations\n", n);
 	}
 }
-- 
https://chromeos.dev

