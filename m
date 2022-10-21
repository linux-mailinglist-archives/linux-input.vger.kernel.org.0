Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887CF607377
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 11:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231192AbiJUJJG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 05:09:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbiJUJJA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 05:09:00 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0555A1A3E17
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:57 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l16-20020a05600c4f1000b003c6c0d2a445so1541347wmq.4
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34uELl7iSr0KkNMrPbDK0p3kOxj5Rp7IXkKhGBvUSAg=;
        b=b2wq9WhYIa+n2Svd4ZNxWXCgZgh3pA+aqFnF8UTGuDJyJpptoDbai4UEAiCWELixwq
         c0Gl/iHXhoC2wLFtVjyHvngC2ZmEUEb24fFSi8WCR93aB1YUqHpXEbwNslMuBpl+Qqt6
         wLRVPgzzOtNxO53p/e31HuD2USrK0TMYAAPSe7N0EF68jPPJklxwi/luiiVfQQDHLWA1
         pOjc4+w7zYrw9WPEHceSf0fMkavum+v8F84zt6EayZOgXfwRgywsJejzKY1othmIyb8d
         3Ca1MdHYhF0riCGlMDVUMSVcheq2lG2tRhA36O5IbSS+7f6xjuNEQt9F+wirTvHRbKn8
         64Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=34uELl7iSr0KkNMrPbDK0p3kOxj5Rp7IXkKhGBvUSAg=;
        b=63CwWEvQXF0kY1RwIiUGN8+C+nSy4IxOPTJkqOs1I+HOkt9UW7s5ELa9EYJNesxPLR
         Pc2BsmMkjGs17s6Wn7BrQZmtMI70x2WSM8iwKellzoUeatcO1bPOAZcR1d0ldpz5kGT6
         Px38QWFD6AS58dc+BBXskIbK6dEX10RiAlW/lXxSec7PzdcH9DYfXq5Eu8Q2lvwebnK2
         gI8tlZbXsVkScAfn4XUYEjwF7OkyX+ZgdIQZ4xwcHD4Gc/MOgMREOXuxvgyYwymjeP85
         1rxXXVnpVSBhCDleTbz/t2+KMHdm4QncSDTECssT0z7EyOGKmawiOtd+WeTU79HQVZZJ
         aisg==
X-Gm-Message-State: ACrzQf3/Y5iqd1vpNdyV6aMxm/nw+tFE8+iZISoZKc6GU8xSs2KsHKOb
        gae0U/bIh9+u5hQVnh0SfW5qsQ==
X-Google-Smtp-Source: AMsMyM7xlc+L/NLeMFdBWutpcPjs3wRebr8BpyfT0fJSmeu6Ux/O+DEwnqBD2KshvcpYBNjd/6Xh4g==
X-Received: by 2002:a05:600c:4448:b0:3c6:fb65:2497 with SMTP id v8-20020a05600c444800b003c6fb652497mr14606066wmn.124.1666343337379;
        Fri, 21 Oct 2022 02:08:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:57 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:45 +0200
Subject: [PATCH v4 09/11] rtc: pm8xxx: drop unused pm8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-9-dac2dfaac703@linaro.org>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The PM8018 compatible is always used with PM8921 fallback, so PM8018
compatible can be safely removed from device ID table

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/rtc/rtc-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index dc6d1476baa5..716e5d9ad74d 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -461,7 +461,6 @@ static const struct pm8xxx_rtc_regs pmk8350_regs = {
  */
 static const struct of_device_id pm8xxx_id_table[] = {
 	{ .compatible = "qcom,pm8921-rtc", .data = &pm8921_regs },
-	{ .compatible = "qcom,pm8018-rtc", .data = &pm8921_regs },
 	{ .compatible = "qcom,pm8058-rtc", .data = &pm8058_regs },
 	{ .compatible = "qcom,pm8941-rtc", .data = &pm8941_regs },
 	{ .compatible = "qcom,pmk8350-rtc", .data = &pmk8350_regs },

-- 
b4 0.10.1
