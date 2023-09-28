Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9FD7B1951
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231990AbjI1LEC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjI1LD4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:03:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6675ACD4
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5041cc983f9so20673305e87.3
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899010; x=1696503810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=IJPT4t6ermvoLceXU9Cc+Tp0OuR2IkQmgEnQtywkKigQE2AiYXcLx1aUJJ5AuZlad7
         E+M5vQMjthCq/HLV5d7UVbjqenSE0a88aO2iDs/m1cRoUhxZovFa+VzJvdmpnPkMHbkV
         8FbQXt/Quz111gsYgt7N8K+CyLmQEhc7vcXFNbksMNLGtrsB/87GXButLyuNX3XaaEQz
         3UpyujKRLDMPhhbDTixzof30m7u87fL7sg19kkjP0iLtamXXfeAw9uFvEKZZtvcDytM7
         kdXhQmxBzpI2RT0FNjpMvwhLbMXqcw+HBGq1TlXVbVM8FTuPOapwlYzSKUTjq5uS6vAg
         YqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899010; x=1696503810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k892yPv/128pmT+0c+CLRewxWCJSJdHIcCP1VlRPxE4=;
        b=hCr3/TKOGpGfHZbOZXc85ibSEaIT4mF+/rTvti9CXEj/RSKkyhBFHntkspd915TXzr
         8YN7nEtjfHrGH0MCngEaaTEnE32oKlKvRGYc/JvmUGEkLiXtDGXOTCSU4ELb/KjCSG7I
         ttIJOd/S4VRXhRiuvbQeLrLM7JWk+Jc4tl0LDTvwSQAHps/c/SjTJPLIVhexgcavPXzz
         jo2VgxDX+eqKVE1D/GVphu/V39bYhUe3Z6nQSQIrh2KzDWMlLB2AX8RK0oUYx7GxLVkR
         YFpodRtw8ljdQD7fQVyTuKRQAWSK3JScTs8PoXP47Ae5GxiBFMES4Dkt5SBnXLptPeGu
         1mlA==
X-Gm-Message-State: AOJu0YwjNaisrxz2FWV6LPcMlQn0SnG+tmK/Po4Yb34WJfMOLkuxEWgT
        IdEAFZ3O6r2ORvCjE8Iea3sz0A==
X-Google-Smtp-Source: AGHT+IEpPN08S7U6KLOgqow/qZZuEOQ2CCuedHbLWe6iS0SStFZj1s083C+dvbduRXQT4APz641P7A==
X-Received: by 2002:a05:6512:220f:b0:503:36cb:5438 with SMTP id h15-20020a056512220f00b0050336cb5438mr1075108lfu.21.1695899010264;
        Thu, 28 Sep 2023 04:03:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 23/36] ARM: dts: qcom: pm8921: move reg property
Date:   Thu, 28 Sep 2023 14:02:56 +0300
Message-Id: <20230928110309.1212221-24-dmitry.baryshkov@linaro.org>
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

Move reg property to come after compatible.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/pm8921.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
index 4697ca33666f..fa00b57e28b9 100644
--- a/arch/arm/boot/dts/qcom/pm8921.dtsi
+++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
@@ -31,9 +31,9 @@ pm8921_mpps: mpps@50 {
 
 		rtc@11d {
 			compatible = "qcom,pm8921-rtc";
+			reg = <0x11d>;
 			interrupt-parent = <&pm8921>;
 			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
-			reg = <0x11d>;
 			allow-set-time;
 		};
 
-- 
2.39.2

