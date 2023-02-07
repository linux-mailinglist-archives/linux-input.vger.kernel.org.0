Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BAF68CCCE
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 03:49:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbjBGCtZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 21:49:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbjBGCtO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 21:49:14 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6976D367DC
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 18:48:51 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so13378716pjb.5
        for <linux-input@vger.kernel.org>; Mon, 06 Feb 2023 18:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLp+h7RkE9BAbz0zHyr/CLuP3RxRPDj/C10VVagvrZo=;
        b=Xi4CLe1YUFGbQK9fHIDP7TOLa8HqqV10AofMQWhjvwuTAXDntSKh1G/0F0QlQVCzcc
         pEhIqIqhOmAdXm5aLGgYzXsLbW+CsNfBJpQt5WROcPEyPuuo7KN4Ys2FrBfQhEn2+/bE
         tham9kJH0m7c5ZHgU5I9beRFL9JBbZKhyMs5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLp+h7RkE9BAbz0zHyr/CLuP3RxRPDj/C10VVagvrZo=;
        b=KjbhQ8OqBNn++DrTpbvH4YTcHiBgVlCtc0BVBTelQSqZ6YqPL57oL3er8UoeGQ/Hpo
         OBqzN1vdlquHQoQStbc9hKGhi2V1k7xF+e+leN/9I8ZrTOhBi84FT4pv9zNkaT1fpU3W
         xfO4Yn1m9r6Let4MNL3/eIBfnWmyeDnAEodGHZAlXA8rKyjJcF0phNHNOUg1/eP2aI71
         vbjyxHInYcuiXlfPmbzfwHcVoI5s4OMmaaOlWBltp/s6ECx2JJrx+eOLRPEJdCUgWbdH
         etaI542ajc33iaXzTcahaZdfr9o6b2LAXQ3by2yrZLLMWAlrQZd2HSolozPDcH6VRV4f
         JNog==
X-Gm-Message-State: AO0yUKXBBY8/06IpWIhKm4gc+LL0PjHzBWqUHc5cHntls/uloYjt/QBI
        iq/o7Y9ZQu2sS2A4HC8GDJQFyg==
X-Google-Smtp-Source: AK7set9r0K5wQE49Me85/HS+/5oBqNAIPQwnmgekoSvS5JnHCqv7bOYV6QedD5I4PjWRoy5D7U40lA==
X-Received: by 2002:a05:6a20:4421:b0:b9:2705:4e46 with SMTP id ce33-20020a056a20442100b000b927054e46mr2102261pzb.22.1675738130907;
        Mon, 06 Feb 2023 18:48:50 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:29fb:a635:f0df:f45a])
        by smtp.gmail.com with ESMTPSA id s17-20020a63a311000000b0045dc85c4a5fsm6882430pge.44.2023.02.06.18.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 18:48:50 -0800 (PST)
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
Subject: [PATCH 3/7] arm64: dts: qcom: sc7280: Hook up the touchscreen IO rail on villager
Date:   Mon,  6 Feb 2023 18:48:12 -0800
Message-Id: <20230206184744.3.I740d409bc5bb69bf4a7b3c4568ea6e7a92f16ccd@changeid>
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

On never revs of sc7280-herobrine-villager (rev2+) the L3C rail is
provided to the touchscreen as the IO voltage rail. Let's add it in
the device tree.

NOTE: Even though this is only really needed on rev2+ villagers (-rev0
had non-functioning touchscreen and -rev1 had some hacky hardware
magic), it doesn't actually hurt to do this for old villager revs. As
talked about in the patch ("arm64: dts: qcom: sc7280: On QCard,
regulator L3C should be 1.8V") the L3C regulator didn't go anywhere at
all on older revs. That means that turning it on for older revs
doesn't hurt other than drawing a tiny bit of extra power. Since -rev0
and -rev1 villagers will never make it to real customers and it's nice
not to have too many old device trees, the better tradeoff seems to be
to enable it everywhere.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
index 17553e0fd6fd..818d4046d2c7 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi
@@ -55,6 +55,7 @@ ap_ts: touchscreen@10 {
 		reset-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
 
 		vcc33-supply = <&ts_avdd>;
+		vccio-supply = <&ts_avccio>;
 	};
 };
 
-- 
2.39.1.519.gcb327c4b5f-goog

