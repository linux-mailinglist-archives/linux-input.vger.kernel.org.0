Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DF668CCC3
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 03:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbjBGCtN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 21:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229882AbjBGCtG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 21:49:06 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33733366B5
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 18:48:49 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id f15-20020a17090ac28f00b00230a32f0c9eso5887105pjt.4
        for <linux-input@vger.kernel.org>; Mon, 06 Feb 2023 18:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR7ruv35Qv2TJdi+hb5jSOiaV9SREkd+tD+3wSx+p6o=;
        b=I/dDS/7/aq/F71hBSixMoQhmOnHuXMaj4Gu8pVRWSBCxP77H7aRnbunjchMAzDsu3H
         EK+oxIIDoDiFMjNzXc4aFvzy8BYeVkCpbanOwknlhoqlocl3kud9TOo7xSVpU8An8MO1
         /OhgsooZYMUfIRWnZJZYprfyXICN5kGFzree8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sR7ruv35Qv2TJdi+hb5jSOiaV9SREkd+tD+3wSx+p6o=;
        b=bg+WobbvQe6HQ7AAzSxa5BCtLFwrc3Gs7d/w2XlC2M0xf7tZ9IlXTo0sJNwqkG9ixC
         w/4bn0QIsV2yE1/48gOBXDC78nuBBPk4W+VY5fs8ViUNiRY6VQs4SFQD5eZ+4rHqfJ47
         F1EG7STlRwoQ4cNZwjufi81pk6GnZxZB7HX314ivTH+gTL5uvSnSuZSPg2PcXhRduvEP
         YB/69QLBlUeDJXl1htLekg4rTpqWAW8KzpYC4CaT66S46G5TnxvzF1jphn28si0ofLv+
         W4N2acn7Fls7CTG5h0JxLFcnAf27zEvRXEjuuqp3mtDbRLDdINdn34EFwfSs/GH/q6A2
         VKLw==
X-Gm-Message-State: AO0yUKUY3ytLql/kmCxCRD8+4OJLlSaNcbm6fGsh0f83ePTQDomp6qy/
        1IJc80e4BIBv8435fxLqNNP9lw==
X-Google-Smtp-Source: AK7set/ujCEl41G9OUvH78qbpCbjatAiV4B04Ou2nFyAB2tImELNnn/ViZ0sW8r4i89QtNjIv9WUTA==
X-Received: by 2002:a05:6a21:3386:b0:be:bea0:7137 with SMTP id yy6-20020a056a21338600b000bebea07137mr2236057pzb.5.1675738129232;
        Mon, 06 Feb 2023 18:48:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:48 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, Stephen Kitt <steve@sk2.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] arm64: dts: qcom: sc7280: Add 3ms ramp to herobrine's pp3300_left_in_mlb
Date:   Mon,  6 Feb 2023 18:48:11 -0800
Message-Id: <20230206184744.2.I13814cefc5ab3e0a39ebd09f052e3fd25d4e8f1d@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
In-Reply-To: <20230207024816.525938-1-dianders@chromium.org>
References: <20230207024816.525938-1-dianders@chromium.org>
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

The "pp3300_left_in_mlb" rail on herobrine eventually connects up to
"vreg_edp_3p3" on the qcard. On several herobrine designs this rail
has been measured to need more than 1ms to turn on.

While technically a herobrine derivative (defined as anyone including
the "herobrine.dtsi") could change the board to make the rail rise
faster or slower, the fact that two boards (evoker and villager) both
measured it as taking more than 1ms implies that it's probably going
to be the norm. Thus, let's add a "regulator-enable-ramp-delay"
straight into the herobrine.dtsi to handle this. If a particular
derivative board needs a faster or slower one then they can override
it, though that feels unlikely.

While we measured something a bit over 1ms, we'll choose 3ms to give
us a tiny bit of margin. This isn't a rail that turns off and on all
the time anyway and 3ms is nothing compared to the total amount of
time to power on a panel.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 27f479ff9d80..ded36b5d28c7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -108,6 +108,8 @@ pp3300_left_in_mlb: pp3300-left-in-mlb-regulator {
 		pinctrl-names = "default";
 		pinctrl-0 = <&en_pp3300_dx_edp>;
 
+		regulator-enable-ramp-delay = <3000>;
+
 		vin-supply = <&pp3300_z1>;
 	};
 
-- 
2.39.1.519.gcb327c4b5f-goog

