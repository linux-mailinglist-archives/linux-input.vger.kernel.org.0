Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55FB4647BEC
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 03:06:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiLICGt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 21:06:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiLICGe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 21:06:34 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F9799F2F
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 18:06:33 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id q17-20020a17090aa01100b002194cba32e9so6595647pjp.1
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 18:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riB7LtyZ0lleKlmY9G6ocrA6pcHo/IAGW1ay3iZp0eQ=;
        b=X+JYtgj8sgUEsF7jToHxDCYTMglL0aIOZ4+loh9W8HStvg47PVkIykK/WViQN8qXBK
         GjYQ508/LrXK1k0wxNZCEu3/JqnBdZOnrAFBorD3+i/CA07NkAFrocN78evZiRColHr5
         uftETNCdoUP898da50ms6V//mnUDPs9xOTcmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riB7LtyZ0lleKlmY9G6ocrA6pcHo/IAGW1ay3iZp0eQ=;
        b=wUNsheiiyjMTw+L+z96ioQN8FA56ZE9QMd5pL6+ClzaPw6f3uOP0j0D0pgB96rYIix
         pdh9R9q0Re/ZrUBkx5w8i0v7bVNd96HZoLBecSFTATaUnL7jyEk2KMAONuULX3AIOIfM
         aLdgA8L8lusKraAzwtd0oCgmMrr9NQY5epgJRg+CNcDd4+D4GIhWrRScgod44tk21r8S
         n00gxA1HIkZSE3KindnvUS62fMivWieC4nVHeukmdiaq7LzXP2v7SD75OIOAi53GEmLW
         KsFd3f/+v/EUb+Pw/sSLfxtFhfCiLsWvDz9Et4xk+FmijzViLbu8dqI4Y0BXg2mHHxnS
         CPwg==
X-Gm-Message-State: ANoB5pndySVqt83MHbUd3pgOcsXM74XT72X0qThPyUy58YXapfvJCt9O
        ih9d8+BrnlauryhfjLU8dzSA7Q==
X-Google-Smtp-Source: AA0mqf5e81mya60xEl8F+ZSr8VdEDiUyt7BQLEsWUnydTPCssdcQFKXLZ9EuWMLf5QY19GrOyKTGFw==
X-Received: by 2002:a17:90a:199b:b0:218:72de:1f77 with SMTP id 27-20020a17090a199b00b0021872de1f77mr4054831pji.6.1670551592946;
        Thu, 08 Dec 2022 18:06:32 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9a82:7898:7bf4:b4f])
        by smtp.gmail.com with ESMTPSA id h3-20020a17090a648300b00218ddc8048bsm233473pjj.34.2022.12.08.18.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:06:32 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, mka@chromium.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: qcom: sc7180: Add pazquel360 touschreen
Date:   Thu,  8 Dec 2022 18:06:11 -0800
Message-Id: <20221208180603.v2.4.Id132522bda31fd97684cb076a44a0907cd28097d@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221209020612.1303267-1-dianders@chromium.org>
References: <20221209020612.1303267-1-dianders@chromium.org>
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

(no changes since v1)

 .../dts/qcom/sc7180-trogdor-pazquel360.dtsi   | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
index 5702325d0c7b..54b89def8402 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi
@@ -14,6 +14,27 @@ &alc5682 {
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
+		hid-descr-addr = <0x0001>;
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

