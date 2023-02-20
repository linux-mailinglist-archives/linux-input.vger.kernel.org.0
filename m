Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A5869CE14
	for <lists+linux-input@lfdr.de>; Mon, 20 Feb 2023 14:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjBTNzr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Feb 2023 08:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232574AbjBTNzq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Feb 2023 08:55:46 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D87A1D939
        for <linux-input@vger.kernel.org>; Mon, 20 Feb 2023 05:55:45 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id s22so1704194lfi.9
        for <linux-input@vger.kernel.org>; Mon, 20 Feb 2023 05:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DE5alLbVy8X6VmLqkrTKXnAIc5UYOF+41WkrcJJn5G0=;
        b=iGl2W5X5EQLO43Kpwlp7zf+nkLaWQAz70M1gq/R/JttbaDhQoacKuhNV3Kc36ptO/z
         +4U/4NniaJF++prM+LkFJ6vzvv7Ix1m6/Uynb1ZC/5lLhRPpZXJ+RdwugmIltFEG80m1
         9WxHjtCn9GHtNYY0kb5qJ14EBGbTXQfOz5drlFMTgdNb4G/uxupYwH3JrUh2yaWhPKfr
         7PXnrBBICQOfcSQ+NLDh6YM4MWMYaXtaw69bjL6aJjBqt59UdpFGidLoHAaGfqsCMz2t
         hQeGlaEVtUypNUBWNT1Ys/oEMKuZqT2AbWfU+JKVZW5hF1MdAOIL56YUQKvVZwbBqi0R
         ARew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DE5alLbVy8X6VmLqkrTKXnAIc5UYOF+41WkrcJJn5G0=;
        b=EMbqe8/aaKlOd2X9+ZXKyPA2BB4Kl7ekB2Tjq+f8B98aXWUrlFCvQQftNuKO7Eteen
         a1w2VDuqaXPdt8+s4X0NdjBTd/Lq6SItiR0udEgr49CvbKoQ4dY1wLEQG/czBp7WSy7l
         fT/e2BbD9bJ+cps9+4NBOytxVW5EXCMudNJKMwR2UTM5Mt14ME3Xglna0A7hkEsLn+FC
         BFhyw7Yx3b7YK+M8jo4A656Eibb296EKkodtFZUR/EXBvidphvBkxXyFu37o6QonF1IQ
         F/L1GVH/cG32gPWf+kxEkwqwPZeAfok2Ek3nBYAh9ErBJ7jfV5YLpTfrrnNQphCvmCye
         gnhQ==
X-Gm-Message-State: AO0yUKUQSTlHUD68uMFFO222M7xrWrDfSH8ImYx82UQaXa5XbrIWyudl
        HXjJ3iYvdrOjUTC6WxjlgWyFTA==
X-Google-Smtp-Source: AK7set8IpEHuh6XOU3Ps6rH+1G9kJdpMfhhkYJ58mn7/QBI2XD92krslfMrBgNjq21OPoMouwOXPfw==
X-Received: by 2002:a19:f00d:0:b0:4dc:537c:9229 with SMTP id p13-20020a19f00d000000b004dc537c9229mr146526lfc.30.1676901343735;
        Mon, 20 Feb 2023 05:55:43 -0800 (PST)
Received: from fedora.. ([85.235.12.219])
        by smtp.gmail.com with ESMTPSA id r5-20020ac25a45000000b004db513b017esm1529652lfn.45.2023.02.20.05.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 05:55:43 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] dt-bindings: google,cros-ec-keyb: Fix spelling error
Date:   Mon, 20 Feb 2023 14:55:31 +0100
Message-Id: <20230220135531.1987351-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The dependency had an obvious spelling error. Fix it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/input/google,cros-ec-keyb.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
index e05690b3e963..a8abdb39623b 100644
--- a/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
+++ b/Documentation/devicetree/bindings/input/google,cros-ec-keyb.yaml
@@ -45,7 +45,7 @@ properties:
       when the keyboard has a custom design for the top row keys.
 
 dependencies:
-  function-row-phsymap: [ 'linux,keymap' ]
+  function-row-physmap: [ 'linux,keymap' ]
   google,needs-ghost-filter: [ 'linux,keymap' ]
 
 required:
-- 
2.34.1

