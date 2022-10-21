Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3116607355
	for <lists+linux-input@lfdr.de>; Fri, 21 Oct 2022 11:09:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbiJUJJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Oct 2022 05:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbiJUJJA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Oct 2022 05:09:00 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C1891A3E0E
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:58 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id b4so3887452wrs.1
        for <linux-input@vger.kernel.org>; Fri, 21 Oct 2022 02:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=BU5GmauMtsJbxzoW3M8HF62Q7USBINYhrQ/egAo+/CMIP61fhSf3FXUMjyVSa2WBHf
         /Z4PSiX8Xd2LX1WvsFq28WsS4NeInp94H8nMYbEoyqo3CsGilMXyp0BLuG67ON5Yl6jA
         BXpRk5f8ERR64ZlctzLNkyf15csMfMS4E/axdBE5wsr5RGg7VB1k0v15MSHJIX1vFcBH
         8MYKuet44iMzdgqvU1gXl/i4wqanCCuXQ9v768QOOS8s2/pHu99rk9B5HhHPoZeDExx2
         ubfnNxhGHUTrAs82eDdt13qz+lkgGzmspxCUMQ8gWpJ2tb1lUvX0zPvuiHw4oNdT3chn
         oXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2dHjCbjXW/wRyX5RnrOPDvSbncypen+BqayjwLtgH0=;
        b=tTzFfuYHYlWXcJnsspa2bjxbYowkkhNu4zJ+wrhvUfVTEcGBzcDufnBlFg1+r87aQa
         1S4JULE4j0lxefNSEPFhH8nfcMQM3Ak1gTTRSKj0XAimS+Oru6f94PMQMw2ddnQeLNY4
         A5ovpfoZ+7CJR2r4LoSiCrP5wPyGRA6ZczNVGIN1Py0fgLfvfkM2bGr69FnvYTVeGobp
         pKZ5cI8Q5hM+eEsP9ajWbLKR3IZnm8uI5EXSrd68aBLyGOykQyyInufuBSzs4zwK0e1y
         seMfvcyLpY4wFHydnoMrCfh2Jpy7eKR9bAtWUJb24C2K+EAI6PH28aJU49uBZbtw21Ny
         IcPA==
X-Gm-Message-State: ACrzQf20y5GRdVw99UZCiu0Nes/Og3gei06hofa7XEvQkoFUL23OO9CG
        wa/81j9aH0H7R5wYduQjDL5ibA==
X-Google-Smtp-Source: AMsMyM4vO0yNr28tbHpM8g1MSlGVGP7Vj5xzvPmdhEoMPgTUDOfA9SeFrlyVcnh1b4YCh9ibtT/C2A==
X-Received: by 2002:a5d:63d1:0:b0:235:9aeb:e365 with SMTP id c17-20020a5d63d1000000b002359aebe365mr5572793wrw.77.1666343336475;
        Fri, 21 Oct 2022 02:08:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c444a00b003c6f27d275dsm2230286wmn.33.2022.10.21.02.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 02:08:56 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 21 Oct 2022 11:06:44 +0200
Subject: [PATCH v4 08/11] mfd: qcom-pm8xxx: drop unused PM8018 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
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
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/mfd/qcom-pm8xxx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mfd/qcom-pm8xxx.c b/drivers/mfd/qcom-pm8xxx.c
index 2f2734ba5273..601106580e2e 100644
--- a/drivers/mfd/qcom-pm8xxx.c
+++ b/drivers/mfd/qcom-pm8xxx.c
@@ -497,7 +497,6 @@ static const struct pm_irq_data pm8821_data = {
 };
 
 static const struct of_device_id pm8xxx_id_table[] = {
-	{ .compatible = "qcom,pm8018", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8058", .data = &pm8xxx_data},
 	{ .compatible = "qcom,pm8821", .data = &pm8821_data},
 	{ .compatible = "qcom,pm8921", .data = &pm8xxx_data},

-- 
b4 0.10.1
