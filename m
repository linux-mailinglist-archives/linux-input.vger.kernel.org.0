Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C6657B1955
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjI1LED (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbjI1LD6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:58 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBA6CDD
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50435a9f800so19651114e87.2
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899012; x=1696503812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=t/EMW/ZkOfzBKLPp0fPEAnbgkjb+LZ6VgtvkHPvfNClf8lmlbBpUPnWTUKD/mpavvl
         XhtTEGE1THArAnLEwr5IkS9gr9/78kZv7yFUbVoTT7v7M6YPGooTWSjWVce9N8LaX4D4
         iQzj0iCZ44G18cwT1MaUmIJ+nnMv1V0ODBQwE0Vkzv0y9Q+a5Eu8MlkaM4EgDKKQdKMf
         t4WU4J+6Xb+k5BIJBxjRmKUVfrSbNOFR9Q/qETGOFfvOHa9h7T2K/BwDDhyGJIZmQ7NE
         xgTK3jPfqrKbuBPN9Xuf781oxrFs97X2DJoshJwyj7YOfmrTd5tn7Nqv4xn3gpP++dJb
         6tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899012; x=1696503812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OFX9JomlQAWrg2wVtXgvkj8bMtfCZmpZ79ww1DHQiqs=;
        b=R6JZe94h/c/xF5WpChwLLIwr3yYBScsmrXtbG0ilq8nTCJ96E4IHhgInQkqwO+xaS/
         GkTPeH0eCvsTmZO9n16e08zEjjV0hFB2uP/WzAiaI5d6WjqEYOd/Pg48aTeqB8CEbv9w
         yvEjLs+sJv7rNGB/+W0piczX0TORWc7Y9FrMUDsDb3abSn7IqEjzYtNnCAue+JhAkZlO
         voKnMuSBE3O/56Iv/zoO7hsZ51pNUTfvW7KzdKrw4nX8TvTdpw2xtxxyetDK84giRdKd
         5jmEN7ok9NAtccDPrmUsvO/xNyHh6ufiwH5me0q+VCkZyAt095iNaXO+Lv0oPDHyy6/z
         +LiA==
X-Gm-Message-State: AOJu0Yz1795x36hIZri06YeWAiv2xTZC+4vhh7MkFJZkJGO4aavgb3oh
        fdP3RQ1fD8Dx4/M1T/W/n6b7Iw==
X-Google-Smtp-Source: AGHT+IHdEfPI24XGfVGZEfYWZKHcs+lEBcRXhLp+C5z556VudXi8sGfQagUsYFtsfVN5X512utV2sg==
X-Received: by 2002:a05:6512:1388:b0:503:1bd4:5e43 with SMTP id fc8-20020a056512138800b005031bd45e43mr1025434lfb.40.1695899012070;
        Thu, 28 Sep 2023 04:03:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 25/36] ARM: dts: qcom: pm8921: switch to interrupts-extended
Date:   Thu, 28 Sep 2023 14:02:58 +0300
Message-Id: <20230928110309.1212221-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Merge interrups and interrupt-parent properties into a single
interrupts-extended property.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Konrad DYbcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index fa00b57e28b9..360a179670c5 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -11,9 +11,8 @@ pm8921: pmic {
 		pwrkey@1c {
 			compatible = "qcom,pm8921-pwrkey";
 			reg = <0x1c>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
-				     <51 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 50 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 51 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15625>;
 			pull-up;
 		};
@@ -32,17 +31,15 @@ pm8921_mpps: mpps@50 {
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
 			reg = <0x11d>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 39 IRQ_TYPE_EDGE_RISING>;
 			allow-set-time;
 		};
 
 		pm8921_keypad: keypad@148 {
 			compatible = "qcom,pm8921-keypad";
 			reg = <0x148>;
-			interrupt-parent = <&pm8921>;
-			interrupts = <74 IRQ_TYPE_EDGE_RISING>,
-				     <75 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&pm8921 74 IRQ_TYPE_EDGE_RISING>,
+					      <&pm8921 75 IRQ_TYPE_EDGE_RISING>;
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
-- 
2.39.2

