Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEED7B1979
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjI1LEQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231975AbjI1LEB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:01 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EAC010C9
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:41 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5042bfb4fe9so20106702e87.1
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899019; x=1696503819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=McrecGX5pS5jvcL6enNeoZq2cKd5TqmVvqSSGd5SSSbiE1RoyOODUM3gHTTQm/UvXB
         Lt0S9gpXhJc6tCsj3VrEb/M3zGYQLRMJAcYCoZ8cPQChk1a+ZeBXkfTWpm9Klkd0id9N
         gUk8BPT14tEiPajbltHsOAZN3yZzN+GqlZ9pPRl5WCkY4Ulk/ZfVZQuI4GyMW0nrlCrb
         v7yiiNBULTg2aKOfaoBmQIYI8Mkja3c0LMdJ1gKWbwctzzSSF9rsobfiGYJrT5vONGYN
         EuQJXREOhPhtGPhzYge4AZCAXrN/GQQJepqofw1MT/wD8ybCZnGdTzYz1X+G+IRE4GRw
         uOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899019; x=1696503819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hx4XSe/NLtIIcU8XS/aqeNQhQByGw63IXr2PekRrcFA=;
        b=fSZ9Oqeqhv3FXLrz7Ykly5RMTpU6GjlbAG0xwoV+/2Oxqf3CBW3Ceyxm8c+0EdrQ04
         l4NlBM7mi8ZswZscRX+yrHxMAfdwqw368SeqctmQ30dWW8Cwd3vlXKHsBk0mdpc5K4EO
         X5cninrddpvxVDVd+fO34RYP2KUPW0NwkD59lsvoopRp5p2ahh7Xcu4ZJoyEzYThZXmn
         vhro4hpphivwyQJ84uPGq8GWR/q7qS4BwrfsCkJ8K9rkwvugD84uL9PwLsZs+5aUm5h6
         QkVVfkquI9WBiZSy/iTTbWEVcxbgFw901UNWkw7H85ZGKhNMpjgnN9FkzdkAXRHpfC9d
         yIqA==
X-Gm-Message-State: AOJu0Ywqtn4755puYjGcVLvp03P8X9BU9lj/QnFDGgad7gRWipNgiJt2
        OQjQNHDmthZ4Y7gdIJ8OREVgLA==
X-Google-Smtp-Source: AGHT+IFcfXAcbqZxNRqPcWIczG+2Z0sdN8Y0d++EY7MbLgyLbt6DeSVzavTF5TVYK1k7jBUX7T5xXA==
X-Received: by 2002:a19:6d03:0:b0:503:258d:643c with SMTP id i3-20020a196d03000000b00503258d643cmr761967lfc.21.1695899019507;
        Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 33/36] ARM: dts: qcom: pm8921: Disable keypad by default
Date:   Thu, 28 Sep 2023 14:03:06 +0300
Message-Id: <20230928110309.1212221-34-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Since keypad is used only by some devices, disable it by default and enable explicitly.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi          | 1 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 360a179670c5..058962af3005 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -43,6 +43,7 @@ pm8921_keypad: keypad@148 {
 			debounce = <15>;
 			scan-delay = <32>;
 			row-hold = <91500>;
+			status = "disabled";
 		};
 
 		pm8921_gpio: gpio@150 {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
index a5ea4843db43..36f4c997b0b3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts
@@ -102,6 +102,8 @@ MATRIX_KEY(0, 3, KEY_CAMERA)
 		>;
 	keypad,num-rows = <1>;
 	keypad,num-columns = <5>;
+
+	status = "okay";
 };
 
 &rpm {
-- 
2.39.2

