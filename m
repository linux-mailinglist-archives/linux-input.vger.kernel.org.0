Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6FE70E599
	for <lists+linux-input@lfdr.de>; Tue, 23 May 2023 21:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238398AbjEWTcG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 May 2023 15:32:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238412AbjEWTcA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 May 2023 15:32:00 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A480E59
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:34 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64d2a87b9daso140526b3a.0
        for <linux-input@vger.kernel.org>; Tue, 23 May 2023 12:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684870290; x=1687462290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpsS8VkinDsLSpsgSW7KF2muDpJUwIny3CFZoqp4G90=;
        b=hWqq0Swswmd8lErnPiovBkcfxgY5fW5GYwu2zeT/+9HsYv9Eu/590YhsjkuNU9jXPj
         bnipsucMcvVDl6qyTBS/HmZh6aI87qQP4CRgijYcWWavqMcRbFDx/cCy1/wdYqJHTcoL
         sbjOQ0xEnE6uB5b/431ug5s/rTWOCZWGTZrvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684870290; x=1687462290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpsS8VkinDsLSpsgSW7KF2muDpJUwIny3CFZoqp4G90=;
        b=HfUNYYiHEVB92Wvv+o7w1Unwr1FQztb2bWGPXyjv4Sm+6J7JUcOP9McZ/s1IMEHBJ6
         848spjaktCc62KPGEtZABPtvL5FB9z/KVa3FTmQOVYEsdyRYobTLn8GztfiDutjltmik
         X9Jy/xS5W6VmYIhNzfcJ0l3A+gVe/TOhZGMQZkza6ZHjRV/wb/EFIeAaE1VO+bVcDFam
         gcf+sQ6aHwQaInoNebpoa2Kpmk0NF5mYq6NDJSnD1hdKMn4aKUUnHQgNqzSXEzi2Ux9z
         WRQL8E3hNC6eD6a/L2Kx7Pzn8n8HMh4GXPi3kwz5xStLIgu/z+RZzSxVLBw8j6EYyCCz
         G7RQ==
X-Gm-Message-State: AC+VfDyX4DTYLh4CC2Wm4EARJF6DJ2Wie3Wg+A/BeLgCU83saxrFu7Nu
        KTSIGiHvsZHu9SJcW8BUjAMM6Q==
X-Google-Smtp-Source: ACHHUZ4rktXX4DoIg0CPYD2PQ1xh+dmDzZ8tM/1YWsUwkTPU9OT6oPlM+OtWgc/sN0M65KgYmS5dHg==
X-Received: by 2002:a17:903:32c8:b0:1aa:e938:3ddf with SMTP id i8-20020a17090332c800b001aae9383ddfmr20632405plr.7.1684870290410;
        Tue, 23 May 2023 12:31:30 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:af98:af9d:ed15:f8b3])
        by smtp.gmail.com with ESMTPSA id y18-20020a170902b49200b001aaef9d0102sm7109947plr.197.2023.05.23.12.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 12:31:29 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>, hsinyi@google.com,
        devicetree@vger.kernel.org,
        yangcong5@huaqin.corp-partner.google.com,
        linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, cros-qcom-dts-watchers@chromium.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 9/9] arm64: dts: qcom: sc7180: Link trogdor touchscreens to the panels
Date:   Tue, 23 May 2023 12:28:03 -0700
Message-ID: <20230523122802.9.Ia06c340e3482563e6bfd3106ecd0d3139f173ca4@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230523193017.4109557-1-dianders@chromium.org>
References: <20230523193017.4109557-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Let's provide the proper link from the touchscreen to the panel on
trogdor devices where the touchscreen support it. This allows the OS
to power sequence the touchscreen more properly.

For the most part, this is just expected to marginally improve power
consumption while the screen is off. However, in at least one trogdor
model (wormdingler) it's suspected that this will fix some behavorial
corner cases when the panel power cycles (like for a modeset) without
the touchscreen power cycling.

NOTE: some trogdor variants use touchscreens that don't (yet) support
linking the touchscreen and the panel. Those variants are left alone.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi        | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi      | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi         | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi        | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi   | 1 +
 6 files changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
index 8b8ea8af165d..b4f328d3e1f6 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi
@@ -104,6 +104,7 @@ ap_ts: touchscreen@5d {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
 		vdd-supply = <&pp3300_ts>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index b3ba23a88a0b..88aeb415bd5b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -116,6 +116,7 @@ ap_ts: touchscreen@14 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 
 		vdd-supply = <&pp3300_touch>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
index 269007d73162..c65f18ea3e5c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi
@@ -43,6 +43,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
index 6c5287bd27d6..d2aafd1ea672 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi
@@ -102,6 +102,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
index 8e7b42f843d4..0785873d1345 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick.dtsi
@@ -99,6 +99,7 @@ ap_ts: touchscreen@10 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <20>;
 		hid-descr-addr = <0x0001>;
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
index 262d6691abd9..f70f5b42c845 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi
@@ -154,6 +154,7 @@ ap_ts: touchscreen@1 {
 		interrupt-parent = <&tlmm>;
 		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
 
+		panel = <&panel>;
 		post-power-on-delay-ms = <70>;
 		hid-descr-addr = <0x0001>;
 
-- 
2.40.1.698.g37aff9b760-goog

