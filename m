Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79D47647610
	for <lists+linux-input@lfdr.de>; Thu,  8 Dec 2022 20:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiLHTUf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Dec 2022 14:20:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbiLHTUd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Dec 2022 14:20:33 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B1672A406
        for <linux-input@vger.kernel.org>; Thu,  8 Dec 2022 11:20:32 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so2532010pjj.4
        for <linux-input@vger.kernel.org>; Thu, 08 Dec 2022 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mU15PmQ7y4jCLhzpRiDgBwZPVlqL2rxQ5MC828vQiLw=;
        b=UtZBnVwuE1PrB9zKCulUevgNmkD3pmq5tiL+Ard+l0p/FsDDyKgRZOr6mI5GO/cwi0
         G75JjAG+E2Zf5gO0nim5H8WlklfKjtuSB7iRUKUIXLz6Soe4y5w1JK98KRj2z3F/rGRi
         cdz6Gvr6WqpUlCm8Clr2G2YPnYKsm5asVhARM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mU15PmQ7y4jCLhzpRiDgBwZPVlqL2rxQ5MC828vQiLw=;
        b=OH2fZablU4hw5+a+/dH18AQckwan+W98PKcbxSsPsjXpCqG5/i4c6v3PfRTsFapNs/
         e6f4qEhbsKs0OcFLcVk9zcin7Vzs70Kuho3CiFZcpsT17p4+o9c067PSlgqAKmA5N6+s
         h+gDKDJY5kbvkUz+RutcCvMGcwKPNwRL6mMn81aB/P4WNFqc5mK6TRcLdZYKYcANmhpg
         Z8+If+MiyT0HXOII96nBcN/hdkXw32uc4zWVIzY2VX22Rba4BjSZM/3bW6oLlcXqt79q
         LtS7XI4Fvr3+Qxm2HB4e+ht7UmXVQHHxxVfkqjusgS3ZvCkFHbBswiDvZcOuviPmLeX1
         ZWLg==
X-Gm-Message-State: ANoB5pleeNLa38UkcRmUr0VbiaC1povgyFOksh/KUEgPYDHJaGl42WKF
        JwaceaWuXj9fVnW89gq8b4HexA==
X-Google-Smtp-Source: AA0mqf4yVAiZHjwlp/KwHCa/AKRbwhwwJPJpOKG+mWu/pk9FEGcH6atyJYZwqS+NbHGnEnd3Q0MT6Q==
X-Received: by 2002:a17:902:6b05:b0:185:441f:7087 with SMTP id o5-20020a1709026b0500b00185441f7087mr2916552plk.12.1670527231917;
        Thu, 08 Dec 2022 11:20:31 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:3aa1:2c62:9ac:4468])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902e5c500b00186a2274382sm17112019plf.76.2022.12.08.11.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 11:20:31 -0800 (PST)
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
Subject: [PATCH 1/5] arm64: dts: qcom: sc7180: Bump up trogdor ts_reset_l drive strength
Date:   Thu,  8 Dec 2022 11:20:02 -0800
Message-Id: <20221208111910.1.I39c387f1e3176fcf340039ec12d54047de9f8526@changeid>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <20221208192006.1070898-1-dianders@chromium.org>
References: <20221208192006.1070898-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
---

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

