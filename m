Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B3E0647615
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 20:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbiLHTUg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 14:20:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiLHTUe (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 14:20:34 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D0A99528
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 11:20:34 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b13-20020a17090a5a0d00b0021906102d05so2526575pjd.5
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 11:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXZFKzf8SEbO5MJF/tbRe/Hy6ddvI0OXNJGHZyfmauA=;
        b=RtJ6gvU4u20lqWyhOPFyXMpF2NNgS93C/PcBqKyQgBoFU/M+fleiQZVu+iLC5JcJ7M
         k1BnmfKE+l26w6sOkxNlZblsmHXxnqW6B51hWf7K1Fx8xpIAta67G1itL2XTPNVkTqMF
         rTDYvm+ygXrkJIXQrKCfRD4GXpt6a3f9bTeSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXZFKzf8SEbO5MJF/tbRe/Hy6ddvI0OXNJGHZyfmauA=;
        b=RURZPsvSRTTN/H6ZlGGg3Hzgzuxp1U1afezRhn1m7wGFwn7ev12UVJ1Ywnwgic16VK
         HZvLKLVhMEfoE4GT/8ZpW73Hs9/RwnmmQV9erpgdCI5Bi4kxE3s1uDZgBiRzS5E+RI42
         gpaOiJ0GzbZDmU8WWB6M5mNTT9Z+Bf567D20GgJXOu4o9o8FT2MrVc5Ai5qozlVAojFw
         oQctq1c27GkPfs7s/vjgiyTomYb2gOLr+LvkLEgKoPlnasqr2xCcgioA/4ozkRQ16rn7
         SE3Elh7Jit0uFZgBwSx637VtBzKpGIR7dqKhMMkY3f4D52nXg58uxQw2FaSe2ZdM3+r1
         Op2Q==
X-Gm-Message-State: ANoB5plXlzxBnnZQkD6/8S0zxEFZhO1BxET+NPffaqLGDmeSdrq0tcbp
        30AH9oQ2SLZsT6uTbwN4DlrREw==
X-Google-Smtp-Source: AA0mqf6oAueA5N3ojF9g2UU8lo98Akl0XQg6efVKCgb/OgaGdyGx3oRASvhK8156nzOWVHnnI212Nw==
X-Received: by 2002:a17:902:ab57:b0:189:4de5:6c7f with SMTP id ij23-20020a170902ab5700b001894de56c7fmr2866574plb.3.1670527233568;
        Thu, 08 Dec 2022 11:20:33 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3aa1:2c62:9ac:4468])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b00186a2274382sm17112019plf.76.2022.12.08.11.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:20:33 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     mka@chromium.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Yunlong Jia <ecs.beijing2022@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: qcom: sc7180: Add trogdor eDP/touchscreen regulator off-on-time
Date:   Thu,  8 Dec 2022 11:20:03 -0800
Message-Id: <20221208111910.2.I65ac577411b017eff50e7a4fda254e5583ccdc48@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221208192006.1070898-1-dianders@chromium.org>
References: <20221208192006.1070898-1-dianders@chromium.org>
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

In general, the timing diagrams for components specify a minimum time
for power cycling the component. When we remove power from a device we
need to let the device fully discharge and get to a quiescent state
before applying power again. If we power a device on too soon then it
might not have fully powered off and might be in a weird in-between /
invalid state.

eDP panels typically have a time that's at least 500 ms here. You can
see that in Linux's panel-edp driver that nearly every device
specifies a "unprepare" time of at least 500 ms. This is a common
minimum and the 500 ms is even in the example in the eDP spec.

In Linux, the "panel-edp" driver enforces this delay for its own
control of the regulator, but the "panel-edp" driver can't do anything
about other control of the regulator (for instance, by the touchpanel
driver).

Let's add 500 ms as a board constraint for the regulator that's used
for eDP/touchpanel on trogdor boards. If a given trogdor board stuffs
only panels that can use a shorter time or stuff some panels that need
a larger time then they can manually adjust this timing.

We'll only do this minimum delay for trogdor devices with eDP (ones
that use either bridge chip), not for devices with MIPI panels. MIPI
panels could have similar constraints but the 500 ms isn't necessarily
as standard and there are no known cases where this delay is needed.

For most trogdor boards, this doesn't actually seem to affect anything
when testing against shipping Linux. However, with pazqel360 it seems
that this does make a difference. It seems that the touchscreen on
this board _also_ needs some time for the regulator to discharge. That
time is much less than 500 ms, so we'll just put the eDP panel 500 ms
in there since the board constraint should be the "max" of the
components.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi  | 12 ++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi   | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
index ebd6765e2afa..e27a769f8cd4 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -26,6 +26,18 @@ pp3300_brij_ps8640: pp3300-brij-ps8640-regulator {
 	};
 };
 
+/*
+ * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
+ *
+ * Sort order matches the order in the parent files (parents before children).
+ */
+
+&pp3300_dx_edp {
+	off-on-delay-us = <500000>;
+};
+
+/* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
+
 &dsi0_out {
 	remote-endpoint = <&ps8640_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index 65333709e529..3188788306d0 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -7,6 +7,18 @@
 
 #include <dt-bindings/gpio/gpio.h>
 
+/*
+ * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
+ *
+ * Sort order matches the order in the parent files (parents before children).
+ */
+
+&pp3300_dx_edp {
+	off-on-delay-us = <500000>;
+};
+
+/* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
+
 &dsi0_out {
 	remote-endpoint = <&sn65dsi86_in>;
 };
-- 
2.39.0.rc1.256.g54fd8350bd-goog

