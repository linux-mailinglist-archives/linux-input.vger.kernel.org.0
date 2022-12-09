Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A585D647BDF
	for <lists+linux-input@lfdr.de>; Fri,  9 Dec 2022 03:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbiLICGb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 21:06:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbiLICG3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 21:06:29 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBA87D07E
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 18:06:28 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id s7so3391968plk.5
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 18:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M88P4SMh5VCPJCyuLc/w2B8fWJUsM71IvdRT7VAjmHQ=;
        b=XIV9gS7alHxSUtR0tKaSg1ZlTvjuvanMhkxu9gP+QpjiM2dNoCFBdqxhXqHxm0gQxK
         fiG35WMYsI4gJmDpVdNgZQIe+pWpRzesNMP0PihtGP8T7c2YYBxNcXh1lAAHS87CMrD3
         naYNadu9ysQ3fHsQ1mFE0avh4w5DRqRtW5ZYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M88P4SMh5VCPJCyuLc/w2B8fWJUsM71IvdRT7VAjmHQ=;
        b=Zzixf/oqXSLUAG/rX6xr8Bwbv+5L++UPMN4z5b2SVE+DuAMYuXQ/2+RiUa8GGGzvJV
         sUZQ4zYdfhZ86Jzc6ok0igPyWKBFXLk4aKPECdqgohYJrHG6JM+R0r8ADU2PiCdmBNkJ
         6B6ch1J14lVr0gC5uvJ9EVPNjBQ87XYQTYoj/rNLk3MLXb/Y88DKEwW7oFRnULWtdvyC
         spZ48zj0MG9UAF8PVHoRNNP8W0PdicL9R5H7b86eBuXq6en2pNZNmu2rH0W3lN4q0TsT
         uFqFrR+MF7pZ4MPkrIp3cdE6zQCZbzaJ4CiWFh1HfbcLMcKfw9msaYp/FKrJY3SY0QvS
         VZ6g==
X-Gm-Message-State: ANoB5pnYCRO+1FXVyWhD0Bk1xiOkL+sM08WT/gHwOmySY3USKm700Kdl
        eIk83Si7+9ju51xn5ir7UxeVUA==
X-Google-Smtp-Source: AA0mqf7krx9sgecPRwfwbatLdx7a2LUAZpwNfCjIW4cK+SLxXzqoatENDBySUKpqsRQPnNfvmPf3cQ==
X-Received: by 2002:a17:90a:f614:b0:218:87cf:1bed with SMTP id bw20-20020a17090af61400b0021887cf1bedmr4772786pjb.2.1670551587920;
        Thu, 08 Dec 2022 18:06:27 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9a82:7898:7bf4:b4f])
        by smtp.gmail.com with ESMTPSA id h3-20020a17090a648300b00218ddc8048bsm233473pjj.34.2022.12.08.18.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:06:27 -0800 (PST)
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
Subject: [PATCH v2 1/5] arm64: dts: qcom: sc7180: Bump up trogdor ts_reset_l drive strength
Date:   Thu,  8 Dec 2022 18:06:08 -0800
Message-Id: <20221208180603.v2.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
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

On at least one board (pazquel360) the reset line for the touchscreen
was scoped and found to take almost 2 ms to fall when we drove it
low. This wasn't great because the Linux driver for the touchscreen
(the elants_i2c driver) thinks it can do a 500 us reset pulse. If we
bump the drive strength to 8 mA then the reset line went down in ~421
us.

NOTE: we could apply this fix just for pazquel360, but:
* Probably other trogdor devices have similar timings and it's just
  that nobody has noticed it before.
* There are other trogdor boards using the same elan driver that tries
  to do 500 us reset pulses.
* Bumping the drive strength to 8mA across the board won't hurt. This
  isn't a high speed signal or anything.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index f1defb94d670..ff1c7aa6a722 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -1376,7 +1376,15 @@ ts_reset_l: ts-reset-l-state {
 		pins = "gpio8";
 		function = "gpio";
 		bias-disable;
-		drive-strength = <2>;
+
+		/*
+		 * The reset GPIO to the touchscreen takes almost 2ms to drop
+		 * at the default drive strength. When we bump it up to 8mA it
+		 * falls in under 500us. We want this to be fast since the Elan
+		 * datasheet (and any drivers written based on it) talk about using
+		 * a 500 us reset pulse.
+		 */
+		drive-strength = <8>;
 	};
 
 	sdc1_on: sdc1-on-state {
-- 
2.39.0.rc1.256.g54fd8350bd-goog

