Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9956E65B4B9
	for <lists+linux-input@lfdr.de>; Mon,  2 Jan 2023 17:07:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbjABQHK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Jan 2023 11:07:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236541AbjABQGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Jan 2023 11:06:41 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 321C5B1F0
        for <linux-input@vger.kernel.org>; Mon,  2 Jan 2023 08:06:31 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id fm16-20020a05600c0c1000b003d96fb976efso18861464wmb.3
        for <linux-input@vger.kernel.org>; Mon, 02 Jan 2023 08:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=2FYgXeeIyu1zUMzH/LZdQxaJyDELlBn2SDXUP4TeGozc+CIUzVBKYvJtKUdiC3dnyJ
         kAh+w1SXjD0g5OL7RE2od7x2qLw3DF4CnnBsNsJIG2lz7JEtRt9SJv1fUa4261UTfBEI
         tZ201UfpbSTLIfbr+aEU8FRzTjc1DpUVbtRbguXYY9TeLHHVk2ktIWq6/CCFO8TneO33
         S/UuABhmM+NRus1/COyp7oKQsQ1oZxKHyn3Y7oh6aMf5GXDFRmAJIqIUN/3+iq2SDku4
         Fy74IIUiEzI6pIB/PFNL81KAr0kRAcQCuQodHUU0v8heTP9FsNone5AbHiZ8eaFxGQX8
         ZCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK0CnlZOX9M/iM8SewTczZ0sLEDRfVMf5U5O9npWUVY=;
        b=DseulTYHBSm4r8R3BhhG2YyA2pXX2UGR3Go3X38G2xIe9/pcF+JqYIQZeyQsu7EXxB
         XIX7uaBpw4K50dCGFi/dKMvEgw7N6ZfiZuxAcsOm32LTceMIzjtM5j+2gjCmD4JFf+x+
         RYWsEgyRKI1e7GCl7akVKnuBwyeYKvP6OS31d3wWytsxXKFE9YK/iOBQpSUSEOD/2MRD
         4gbEQCZi4NezU03fn7iuS8fRZ0I3ssvxsPx2C7g4QD6Nl5QVnk0kjn9uU8koTIgx50pK
         zXbhjYYhgT9Hk8Dy/6Fjm7c0PRKSdZzGXv1nqJB3LQRas7JGhkRZjF4zfKULT2p/fRm+
         VWvw==
X-Gm-Message-State: AFqh2kpoSO0kTSJedtWNNGKbXCD43ZYezDvB+1qQ/JomcXgfQSzzN7Fi
        F3mZZ7+To1v5mcJtqyIP/4VCAQ==
X-Google-Smtp-Source: AMrXdXupzOcRaXBrx7YVEhlZ93ZDS9ldjMOS7DXOq9vFmlo8LA1CwXuVnAMi35jYHSvujzgP0Vk3sg==
X-Received: by 2002:a05:600c:16c7:b0:3d3:51a9:dba1 with SMTP id l7-20020a05600c16c700b003d351a9dba1mr29457203wmn.20.1672675589712;
        Mon, 02 Jan 2023 08:06:29 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id t5-20020a5d49c5000000b0028cf987d944sm11868020wrs.33.2023.01.02.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 08:06:29 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Mon, 02 Jan 2023 17:06:06 +0100
Subject: [PATCH v8 5/6] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v8-5-560caaafee53@baylibre.com>
References: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v8-0-560caaafee53@baylibre.com>
To:     Mark Brown <broonie@kernel.org>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Pavel Machek <pavel@ucw.cz>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Alexandre Mergnat <amergnat@baylibre.com>,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1289; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=sciAdvxNeIHiHj/noxHzFC381BQRCLfnWiRAfVX/Ztg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjswD9o0BjsP3A7sJoIm9QQ5qlHEZuTTfCJFpCVdWv
 uPpfN5eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY7MA/QAKCRArRkmdfjHURe5uEA
 Ckh312DH3eo7sZbijdFcHI5VVIWhIUuOiMk0O6cpP1Jinf5vEQ3F5UxonV6IAtQlCnZnbWsa282XkZ
 hHL8zClliOlZtAQcklTp0hTL/bvJ/XrnmcLE9x0AuCSNJoGuYQD4n5tNn5INUZITXzf6iUT/EPQ1N5
 ficr2TG6G00ONIM0JOj+rBnXar6RLI3y9BSyT4Q64HrZRZNp2nenNU69xeI3TxovZhwyJqNELnUSg2
 f2QN4RfbHkMKnRRzS7ha4LP9x2ZztEhSFuuPHtnRdxIFBntCjhbGhDm95iCr8lCIKmVnU/Ut23q/FK
 FZg2Grd3kBSilbxMaW1xrrH3XhJKvZJ6kJsNrVFuVi4tsBrGv6RtUGHWdAZu4eqdGtFF7VCfaalXT9
 DNbmInwZBMGr7sFAZ0+6NWGWtLwlRS9UNroM7+MHk5+2H07rE4V8setqk3+amFGkEbc3lLclaE10Zy
 T5cSLg+AFkorQEOOnIziWBkp9bZJmcG7/hOwY2lX4WXR4MtqqSVjyUYa7sfEJF5XybKKcSZy3oAMdu
 4akf8M8WfxzdSOVggVqjDVmq4mCryqMn7j+mDNHNhmCNTqtv/hBcgCkgTyRcgzxD/yryiyo9JKaGZ3
 c+3uhvN5VVHgGuXyyjxLkqkTxO1G9EgT6daxyCo/9DQTsdteNXV1F2ZWTtQQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

- Change the node name from "mt6397" to "pmic" to be consistent
with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..a8f5c48e1782 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -913,7 +913,7 @@ &pwm0 {
 };
 
 &pwrap {
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 0b5f154007be..755df5694234 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -300,7 +300,7 @@ &pwrap {
 	/* Only MT8173 E1 needs USB power domain */
 	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
 
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		interrupt-parent = <&pio>;
 		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;

-- 
b4 0.10.1
