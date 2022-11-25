Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF2B638D3F
	for <lists+linux-input@lfdr.de>; Fri, 25 Nov 2022 16:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiKYPMF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Nov 2022 10:12:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbiKYPLv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Nov 2022 10:11:51 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E4340913
        for <linux-input@vger.kernel.org>; Fri, 25 Nov 2022 07:11:30 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id z4so7202883wrr.3
        for <linux-input@vger.kernel.org>; Fri, 25 Nov 2022 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=FunvwomMzazOiQHP9qjCeutiSj78INhnnswMu9jRrTVOSjAFlaKYxWo7ImMhfIvYZO
         So1dGYemTGTky64QkEVbNSBzkLAh2NBEpvPFTkWy7eeGtd1Mr+8Bo8ICx+AMWjVJeeFO
         YDQc6yIbf7q5E7Pjy1g7sJMPvXCkCU7x/9cAyMd2dMf6yhtx19JaT+f8G2clhIr/rECV
         +VN3ya4t/vxPEUebs7bEXzzMyUjvmVW3OimMLwrXL1dNqY2ovWwUTSccsRwABZCZjphq
         kWwCSdk/Ia7qTa1RnLytfhBgUiJlILGrrn3TOppX1xoJu5AqpbzKv2ukGmrttpYG6GF1
         ockg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/qGjMKoEF7UDLliJtrbx4rWqxj8RHaEUJHMJYnhdEk=;
        b=xnEQcPPuxP0vyj2lcJheP5eDmWvYK2poH/rzkDa+GWu3IvyWoAlCm4ktK+kTOt1NTH
         EctoRPiAun3PRQwzgO0aLy1cMEDVL2qSElpxPz9yKgI96CAQ9GYuVXISjzTIhmIm61B9
         lwYW3FBZIPaZuKervSjNKRPQKwaBZhLK+DxqBIxHJ637hQgWJvpuWVVKkA93em/0dUZW
         ohDRqgOkpSgQKSGjbcULQjeGK6qrBLHg9/5bLcwH+C8/95gke9VfIdkOF2f2fk0e7FfO
         oNZQMG3s/pZCQgL1tHKrvHTdkxhCeFvCJsfftObpqFF3UBHEH8va09aI+MGgsEa7skl8
         dWDg==
X-Gm-Message-State: ANoB5plnUHZi9phfzVE+oTmkauZlzR9D6J6tfhPhpoY3I6zI2eyveq+C
        njqgh+g5e5BoVBuU1kAlwBQiRA==
X-Google-Smtp-Source: AA0mqf46m5/6QUU4T4g/4nUu+fFMz6S02mOIp/205JUHc3bTBuU1MmMK0hz7g+iGfTFHme0vn5ab2w==
X-Received: by 2002:a05:6000:1d92:b0:241:6e0a:bfe6 with SMTP id bk18-20020a0560001d9200b002416e0abfe6mr15597315wrb.34.1669389088896;
        Fri, 25 Nov 2022 07:11:28 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id w10-20020a05600c474a00b003b435c41103sm11565885wmo.0.2022.11.25.07.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 07:11:28 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Fri, 25 Nov 2022 16:10:18 +0100
Subject: [PATCH v6 07/10] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v6-7-4f589756befa@baylibre.com>
References: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v6-0-4f589756befa@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Mark Brown <broonie@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Flora Fu <flora.fu@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-leds@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=0w3mp8M+1h003hGCAyGu3KsDIgwbdfb6BOTNA6p/zCk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjgNsXiaEwliHNuhNheU+36o3pNrBgk4Gv1o/ishDA
 jjUr+QuJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY4DbFwAKCRArRkmdfjHURY0zD/
 4g1XdePNaAEhYmAPAZwxgsV8yEQqZY0CP2rp1y/DApiMmbGJHpJD/BHm3+rHIQgJD2NPuJcqW+LgfJ
 UYy7gV+YrcCu3woZmwQYAjbxDTOPCd/6gtGRpVSPD7I5RX0nHxdvJnXUz7HSx1QT78r6Rk6ZnMc7VD
 4OCSMuLKABzsY+BAqLLYLrZsCh6mc9B1AVpSpS7g/rIlGPHzyZ+Hyh6TMRosMd+4mQAqC8JjD4xuku
 6RegXsvTxn1mFj6gXvtc2Kg6/DIxO03E1il67dA3jbNlkDiCXSIeIPCcn5Rlvd/MmsCpgB0SBEWBiv
 gIuhCJn0/kHPMaGQy8pfuUbYIbBSGQCo6wtYQ/r9iYTbchx4MQrly9NsnfpYR7fC/nAofyU1tZuSp4
 8N3JRmuc7PoMtauy9MeZC34Df6yKgXps32+UUJfd0RR4LvQSgOU+3a8PhNZtgbn9o4R13ki4H3IhOR
 hK/IlfvGj2/gx0rhpTi1pTfhLdDHfXRPrllImPBDnF3cfOTlzM8D02Mt3/pnW9ITCRJbAl0Jo7EI4r
 bu6Ee11cqSZxt7FmEG6bUHQZ2whgnjj2/BBrFTMJbWY22wSTB2fZEtVbTurlX+slo/KRUhuYhmyfp2
 TmVta7emISErzdz9F7YgG5rtKOdfrMANuq89yrx0pI5py+5s9xHqAsttUvmw==
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

- Change the node name from "mt6358" to "pmic", "mt6358rtc" to "rtc" and
"mt6358keys" to "keys" to be consistent with the generic names recommendation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1
