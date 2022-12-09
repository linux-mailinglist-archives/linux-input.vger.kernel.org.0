Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 727BA648775
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 18:13:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiLIRNa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Dec 2022 12:13:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiLIRNY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Dec 2022 12:13:24 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E9C45A0F
        for <linux-input@vger.kernel.org>; Fri,  9 Dec 2022 09:13:20 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso8813636pjt.0
        for <linux-input@vger.kernel.org>; Fri, 09 Dec 2022 09:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXmK3nCiI+cY6qMJ9PawYnDke2Ff9u+237akMobAAqY=;
        b=IqgadLnjVNwyCp2QMMG0Nu8AsLBPgJgJ3n8Je131hOobY9YARQ0RMklSCn/mpKZ/DP
         Ro2PNmTYWvF/xo/40eE+NsHshil39bw/D+I2JWiRk3M1SRUzPSiTLu6MpVQlMSzjfcYl
         fZUOMiob21JBgRv01lTZvlInVn+OKcqRRPHgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXmK3nCiI+cY6qMJ9PawYnDke2Ff9u+237akMobAAqY=;
        b=YRsQk/ArhC630jib6WxAPSO5SEFjHDrI74J2lnrqB5VQ94bm2viq97iOtoe5/+IL+h
         tB1JX20ngBjc95NJMYt/Rg7d6gfQ9yIClS8LtSV5LR8g3C8iE71q69Wza1JfS4E1UZ9X
         eTxlGMSwocujZAxnsF8GP9aOgAzbH1YdSjWXR9kVKq1AT+UNGGy005vUoq+W7CrsRfL2
         /C+eXgqTL9i9jiaFW47h8lKEbb7rJIFky5bsEOppZHg40i1KN8nxFUQFLuA6m24SNX7l
         aCaRtdsPXRfGWOy7cYs6nEyqPrCHyBj4Knt+drJP8s+zVInJBzE+sqc+mdTRvPbRGcPa
         UHbA==
X-Gm-Message-State: ANoB5pnbd1N/bCDOOwnj73t7g6tVwgf1pcn67gYlHvkuRIKd4e9wHok4
        FdUEnoWO7qYdCYMKl6BH1BPCzg==
X-Google-Smtp-Source: AA0mqf4E+hKNzII74vjCTHWDSOlIGqI7LLSVAx/UJE8yG1YELb55UaxBwq/en6iLoY+Fp7tg31MhsA==
X-Received: by 2002:a17:903:4283:b0:189:7100:c50e with SMTP id ju3-20020a170903428300b001897100c50emr7136974plb.48.1670605999890;
        Fri, 09 Dec 2022 09:13:19 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9a82:7898:7bf4:b4f])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902da9000b00189c62eac37sm1597503plx.32.2022.12.09.09.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 09:13:19 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     swboyd@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        mka@chromium.org, Yunlong Jia <ecs.beijing2022@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add pazquel360 touschreen
Date:   Fri,  9 Dec 2022 09:12:40 -0800
Message-Id: <20221209091234.v3.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209171240.1614904-1-dianders@chromium.org>
References: <20221209171240.1614904-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchscreen was supposed to have been added when pazquel360 first
was added upstream but was missed. Add it now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v3:
- Removed hid-descr-addr

 .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
index 5702325d0c7b..ff9dd6857f8b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
@@ -14,6 +14,25 @@ &alc5682 {
 	realtek,dmic-clk-rate-hz = <2048000>;
 };
 
+ap_ts_pen_1v8: &i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	ap_ts: touchscreen@10 {
+		compatible = "elan,ekth3915", "elan,ekth3500";
+		reg = <0x10>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_l>, <&ts_reset_l>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc33-supply = <&pp3300_ts>;
+		vccio-supply = <&pp1800_l10a>;
+		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &keyboard_controller {
 	function-row-physmap = <
 		MATRIX_KEY(0x00, 0x02, 0)	/* T1 */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

