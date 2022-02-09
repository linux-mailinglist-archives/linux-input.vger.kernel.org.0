Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACE894B00C2
	for <lists+linux-input@lfdr.de>; Wed,  9 Feb 2022 23:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236577AbiBIWz6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Feb 2022 17:55:58 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:34590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236586AbiBIWz5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Feb 2022 17:55:57 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91EAE019775
        for <linux-input@vger.kernel.org>; Wed,  9 Feb 2022 14:55:59 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id x4so244516plb.4
        for <linux-input@vger.kernel.org>; Wed, 09 Feb 2022 14:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vm/cV6FYDT+Lx9WNAQ4ji/uvsuD1Mn+JgYVp1tPCrfc=;
        b=FAImFDTtEmYTZo/1em3aetOFOlJ7KiALiEZzAP9S6VJccFf9uWS3oiDouR3RlWNhC/
         w2xuCkEjjM9DxhhHUjSmm6/DokOFlq+9QwsmgxlwkUapwRgQOZJW1Bbc1ve4UZyAQ3Jr
         eQCTwT6MZ31raD4VZSpcDPIFrAtBu4SOxtUtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vm/cV6FYDT+Lx9WNAQ4ji/uvsuD1Mn+JgYVp1tPCrfc=;
        b=2ZU/3ctNObyMOVtIbMnUf5tTf/Y3UZns0sMX4IeY+WryzulDaGwpXK5bwjpFPgYje0
         cVb1Cp775Tk+ItmollP9iqkPbjavQKfWVvmdbkgE269Zp3So+J+is8RPeasowaYmzie8
         MLMeDSAFpY9vqsQCi4FJahx0tiwOIEgl+PMEtgK/t7XY2Uzo2j7vjYd9SuD1stXry1/y
         hHrb7qgYotCBvhRpxCEQkt+KMuIiqPkC/Jkevng979lBcGvmL4iBC7HQbUv8R1LDTYZG
         JLqxm41uRUzing1wtYf0gB8FG36E/1D9Bk1WS+HGj736KWIE3zhosVIW8V+jA6ys2azM
         n/fA==
X-Gm-Message-State: AOAM531cgw6BhRqzcpAq5gcY3hwzfjIJSE69bJq8lGNYpYrqa1Bs5HLS
        EJ75yy2imfnnwctIVmAqCUitvg==
X-Google-Smtp-Source: ABdhPJyDpICcFtWrDeN23/PKeYsWz+4mpeFE8ppPzdHh+kxkJJSI8jwsQ7CWpBfLKMoGfRPns61W9g==
X-Received: by 2002:a17:902:8f8d:: with SMTP id z13mr4542483plo.118.1644447359407;
        Wed, 09 Feb 2022 14:55:59 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:5193:6865:e38e:3a5b])
        by smtp.gmail.com with ESMTPSA id b1sm5982015pgb.66.2022.02.09.14.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 14:55:59 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     benjamin.tissoires@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Sean O'Brien" <seobrien@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 1/5] Input: atkbd: Convert function_row_physmap to u16 array
Date:   Wed,  9 Feb 2022 14:55:52 -0800
Message-Id: <20220209225556.3992827-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
In-Reply-To: <20220209225556.3992827-1-swboyd@chromium.org>
References: <20220209225556.3992827-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
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

