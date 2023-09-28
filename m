Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB737B1976
	for <lists+linux-input@lfdr.de>; Thu, 28 Sep 2023 13:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231904AbjI1LEP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Sep 2023 07:04:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbjI1LEC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Sep 2023 07:04:02 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB2910D0
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c17de836fbso69684491fa.1
        for <linux-input@vger.kernel.org>; Thu, 28 Sep 2023 04:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695899020; x=1696503820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzXt286sPhU+yVmzfDKl882XWnXgjzSmy9rWB6wpkCI=;
        b=UsPMDAwPQRpJ+EJbZtuawx9lmMdtJieWSX1gGK3SSQAbescWlXW4aSL55JIKbTTgGg
         8mm6H/TEHo8cAQ87J+NGVkdfJf4U+2IMnO4B4PIFLpWAM7EXrLInK+d9zQfQfKMmTLgw
         wN0kImDQcBkjDDV60NlVH+R5/t6VNIqOAcj+o8NT4D9skX+pM2Fywvh/bQepu2tuY37x
         0rUQ8maDH6FHj+vUCj/34PU3OS4H00nA7pKhPU9ycyN5unhGMXmYj+Dihb/82PmnMuwf
         VzVfbZ0XcCMhyx6jhCq7adfjexwbq18EBPO63s5nleuCmoq2955gsM0zdPb/cERGNVeJ
         mqeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695899020; x=1696503820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tzXt286sPhU+yVmzfDKl882XWnXgjzSmy9rWB6wpkCI=;
        b=SCvUOlyqqZz4rXY+L+r2s1wGa+9N+W2Nc1PuoRNWOQBrqb1zKxk3E4TISNeC0KKrbL
         w4IQlKWQ8pEEwmaz590KizWh3nVhVzkqS2oTQf8Dk40l8gLQKNZI+oxOvqDXWLedC9OB
         3lTWvJh6OTQaDMzgVkTll5MCzvBgPIJRHOAusI+oRhaR/sgmFHLO52jdG8zy1KXsw9Zo
         dDbfvgMX5y5V94zXgewNKmM0/br9/F43algit/Fx5hadjvAo9SpPlhU/VfXVAWTNO/d6
         jL8NQJMwxVPfPeOmhDDvvlxex2jRQ9eVfoZkZPC+DM5VlKvEr1d6lMaMk9q50GanbvYD
         BGvA==
X-Gm-Message-State: AOJu0YyMbbpHSmvbaqRb66KsgcE7m55C8xtQEOzn8KZUQGXLQ6b9siYq
        TDVHoP7dL+AF89A9quvw6z1diZS174ZcpNCtgEp5Sw==
X-Google-Smtp-Source: AGHT+IHZzuNkP/8GsAfbpN6MRNbr+OFRBsVahZwSUewqi9EERkhsBg2X+I9gHixCfUmuKRlZwATcdg==
X-Received: by 2002:a05:6512:46b:b0:500:c348:7efd with SMTP id x11-20020a056512046b00b00500c3487efdmr664134lfd.59.1695899020270;
        Thu, 28 Sep 2023 04:03:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a056512040200b005030a35019dsm3052953lfk.178.2023.09.28.04.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:03:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: [PATCH v6 34/36] ARM: dts: qcom: apq8060-dragonboard: rename mpp ADC channels to adc-channel
Date:   Thu, 28 Sep 2023 14:03:07 +0300
Message-Id: <20230928110309.1212221-35-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Use generic `adc-channel@N' node names for board-specific ADC channels
(routed to MPP pins) to follow the schema.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
index 8b70d4a59c7b..bf2527941917 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
@@ -998,23 +998,27 @@ &pm8058_xoadc {
 	xoadc-ref-supply = <&pm8058_l18>;
 
 	/* Board-specific channels */
-	mpp5@5 {
+	adc-channel@5 {
 		/* Connected to AOUT of ALS sensor */
 		reg = <0x00 0x05>;
 	};
-	mpp6@6 {
+
+	adc-channel@6 {
 		/* Connected to test point TP43 */
 		reg = <0x00 0x06>;
 	};
-	mpp7@7 {
+
+	adc-channel@7 {
 		/* Connected to battery thermistor */
 		reg = <0x00 0x07>;
 	};
-	mpp8@8 {
+
+	adc-channel@8 {
 		/* Connected to battery ID detector */
 		reg = <0x00 0x08>;
 	};
-	mpp9@9 {
+
+	adc-channel@9 {
 		/* Connected to XO thermistor */
 		reg = <0x00 0x09>;
 	};
-- 
2.39.2

