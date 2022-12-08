Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E297E647617
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 20:20:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiLHTUj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 14:20:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiLHTUg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 14:20:36 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B4499F08
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 11:20:35 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id a9so2468680pld.7
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 11:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtJpVPTjR3+tHW4ZAsKi6ZeDCRthwe5efj4GVpBmxAs=;
        b=ffwgN8uE9SL85C/Va1myHLoiUBLtcIfijgTVQy/h5ctIq5eaiuAtLJ/whuPeuP9/s+
         tRZlTOzztFg5Cqxb7Kq1D+br5dM2i06yjSwfofpoUzA3fKPWfNBk5jwdtJlYANWUuqIW
         wl/ROE4R+66WuQhJgaaSlZtnZmZzzW3xtnjG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtJpVPTjR3+tHW4ZAsKi6ZeDCRthwe5efj4GVpBmxAs=;
        b=TFa4u3h75JB8wLAyrckMKhGGMHWQqL9xSShHga/Sv/TQNV5uhavwoP3YXH6ZiX29YZ
         8x9HQxapgIpK2m8L1dQQwfi4tni7UxMmcSPsAsgLFSQmvecELGD7m+qX6EDVJcnm4fLj
         I+3FGaKoAQcFMJLBoCBK06+kz7kJ9VWGsH23BOpoWW+/qwjwVPN+wg//4DtTbdMWjWnB
         LmZ340HhsFObbrSmBOuzrZdWmgnFI1WLM1HO/s1GewnRkNA04l8gwSyl/gEkOO79EgiB
         gvtCUqwUkFm+KAwQbEfAJkGGcs5sutS0gHWlTEb9DFXG49Vlbe2q3e5zce1/gu0slWWM
         dLGQ==
X-Gm-Message-State: ANoB5pnbcwWZeawsYGd0fziuyC8QQ2AF06nFY2jR8tn93CbCMxkyhK/D
        E5M1/yUI5UpCr04x4S3r1EBZCQ==
X-Google-Smtp-Source: AA0mqf7iizQgzHEJ4C/aUnLxmQepVKEiquAj7KH/sW3cQX7QttsENfP77svR0s+gqOBPU90RcIJUDw==
X-Received: by 2002:a17:902:c745:b0:189:9519:87b6 with SMTP id q5-20020a170902c74500b00189951987b6mr2424138plq.5.1670527235158;
        Thu, 08 Dec 2022 11:20:35 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3aa1:2c62:9ac:4468])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b00186a2274382sm17112019plf.76.2022.12.08.11.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:20:34 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: qcom: sc7180: Start the trogdor eDP/touchscreen regulator on
Date:   Thu,  8 Dec 2022 11:20:04 -0800
Message-Id: <20221208111910.3.I7050a61ba3a48e44b86053f265265b5e3c0cee31@changeid>
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

Now that we've added the `off-on-delay-us` for the touchpanel
regulator, we can see that we're actually hitting that delay at
bootup. I saw about 200 ms of delay.

Let's avoid that delay by starting the regulator on. We'll only do
this for eDP devices for the time being.

NOTE: we _won't_ do this for homestar. Homestar's panel really likes
to be power cycled. It's why the Linux driver for this panel has a
pm_runtime_put_sync_suspend() when the panel is being unprepared but
the normal panel-edp driver doesn't. It's also why this hardware has a
separate power rail for eDP vs. touchscreen, unlike all the other
trogdor boards. We won't start homestar's regulator on. While this
could mean a slight delay on homestar, it is probably a _correct_
delay. The bootloader might have left the regulator on (it does so in
dev and recovery modes), so if we turned the regulator off at probe
time and we actually hit the delay then we were probably violating T12
in the panel spec.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi | 18 ++++++++++++++++++
 .../dts/qcom/sc7180-trogdor-parade-ps8640.dtsi |  8 ++++++++
 .../dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi  |  8 ++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
index d3cf64c16dcd..b3ba23a88a0b 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar.dtsi
@@ -85,6 +85,24 @@ map1 {
 	};
 };
 
+/*
+ * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
+ *
+ * Sort order matches the order in the parent files (parents before children).
+ */
+
+&pp3300_dx_edp {
+	/*
+	 * The atna33xc20 really likes to be power cycled to keep it from
+	 * getting in a bad state. This is the reason that the touchscreen
+	 * rail and eDP rails are separate from each other on homestar (but
+	 * not other trogdor devices) Make sure it starts "off" at bootup.
+	 */
+	/delete-property/ regulator-boot-on;
+};
+
+/* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
+
 ap_ts_pen_1v8: &i2c4 {
 	status = "okay";
 	clock-frequency = <400000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
index e27a769f8cd4..5aa7949b5328 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-parade-ps8640.dtsi
@@ -34,6 +34,14 @@ pp3300_brij_ps8640: pp3300-brij-ps8640-regulator {
 
 &pp3300_dx_edp {
 	off-on-delay-us = <500000>;
+
+	/*
+	 * It's nicer to start with this regulator enabled. The
+	 * bootloader may have left it on and it's nice not to cause an
+	 * extra power cycle of the touchscreen and eDP panel at bootup.
+	 * This should help speed bootup because we have off-on-delay-us.
+	 */
+	regulator-boot-on;
 };
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
index 3188788306d0..e52b8776755d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-ti-sn65dsi86.dtsi
@@ -15,6 +15,14 @@
 
 &pp3300_dx_edp {
 	off-on-delay-us = <500000>;
+
+	/*
+	 * It's nicer to start with this regulator enabled. The
+	 * bootloader may have left it on and it's nice not to cause an
+	 * extra power cycle of the touchscreen and eDP panel at bootup.
+	 * This should help speed bootup because we have off-on-delay-us.
+	 */
+	regulator-boot-on;
 };
 
 /* ADDITIONS TO NODES DEFINED IN PARENT DEVICE TREE FILES */
-- 
2.39.0.rc1.256.g54fd8350bd-goog

