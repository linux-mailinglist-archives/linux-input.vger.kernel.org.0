Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0372350FFAC
	for <lists+linux-input@lfdr.de>; Tue, 26 Apr 2022 15:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351206AbiDZN4p (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Apr 2022 09:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351199AbiDZN4i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Apr 2022 09:56:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6A615CEC6
        for <linux-input@vger.kernel.org>; Tue, 26 Apr 2022 06:53:29 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u3so25607962wrg.3
        for <linux-input@vger.kernel.org>; Tue, 26 Apr 2022 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NSPijaD+f/0zVFm+Yx4b1C0MDA0Gs9+IxO2aTwmm2dI=;
        b=5sTu3reUZ/D7WVN5H8YcW9y6Y/Ke/a9s9ssXnYuXVl3+HJJLMSn76Sq9pGMUjZXNmG
         FXkQZ692OnMwQdwxU5ROq2/KiIocmS/SOAiWtUn8/HhNl8y+lst/JLZky1DhheOp5iM4
         68Sx6S1uNoljHsGtihJ509m2G25Z2c1nufEVMiDGuL0dAHkxC6C95HyPqvwywaAF7t8k
         iI0OffFTm1qRTZhwPjkoIB+Fz3gJrk20veXfnZ137JCCc+pNSptpeTT0EHH05BAKP3WY
         WQC/ZabeUhtJn9uMN73R+2Af7QWGFHXopGVnv5ctNDJT1P6n88ghPBU+bWyrl45oG1gX
         zvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NSPijaD+f/0zVFm+Yx4b1C0MDA0Gs9+IxO2aTwmm2dI=;
        b=QssZfOIojzIDBfXJEi5t6Qed+fU64XJoltAhSjCFBktgQ9ObHpE4CzMpU28lbA3jPg
         Q2j7a5n/sisbEyjTMPrOb8HSuGZwnCGyyXA5/cY+5oHU0glJ6jhBlc5SpZjgbobygH7f
         qL9gmNYbV4evZHuGHShdXvcMQ633cZGU2vVg7pJ4Mio3K1WDOFpMUKTkU9XIlilg3Ugb
         pKw3HS/GCrNPZ/uxpsPHwIW/rEMmaR8TmW7TRox37GlBgNncHe7rhbWDW41+4hDiSswW
         Tg2sRfKH23NDzWbg5RU/jE7Bswswwjzl4E/NfqpDOfbbtoK2OpNQPQSXu0HqZm0T5lAg
         7wGQ==
X-Gm-Message-State: AOAM530gYLXtIpARbbl22ZjgjVuhoH685XqRgdQgIPD/XOFzmNxhAvIL
        vtYI8X5hq5rSV8CQtAJN7rw1eA==
X-Google-Smtp-Source: ABdhPJw0lMnT3QLeM/7DxRZav6cl/N5O7FfTfXNSrQ2Cx1+4fJUzX917Psb/7srV8MG9taEy0pDw1g==
X-Received: by 2002:a05:6000:1ace:b0:20a:ad7f:d616 with SMTP id i14-20020a0560001ace00b0020aad7fd616mr18465795wry.327.1650981208364;
        Tue, 26 Apr 2022 06:53:28 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 06:53:27 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: input: mtk-pmic-keys: add MT6359 binding definition
Date:   Tue, 26 Apr 2022 15:53:06 +0200
Message-Id: <20220426135313.245466-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding definition for the support of the MT6359 keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..afe9062a4dc7 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -13,6 +13,7 @@ Required properties:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
 	- "mediatek,mt6358-keys"
+	- "mediatek,mt6359-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.36.0

