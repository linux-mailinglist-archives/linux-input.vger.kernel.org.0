Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B653C715015
	for <lists+linux-input@lfdr.de>; Mon, 29 May 2023 21:55:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjE2TzR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 May 2023 15:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbjE2TzP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 May 2023 15:55:15 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6187DF7
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d20548adso2184463f8f.0
        for <linux-input@vger.kernel.org>; Mon, 29 May 2023 12:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685390108; x=1687982108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+8Rw2y5WP9VcSj9EyYejwuXLfgRWkxo9rWVJHrYrOc=;
        b=V8B3WOa/iSQo5P6q/qjDPQAQsi521hcgYSEYWPNfwnnuVvpGou8DBgO2EJ8qFaG5T+
         SptqQ2PtwRtQIWtsLluexEnBa6NW7FAconkfa15P8cejLc4LhUex0ThZ16ZOzoidpyJa
         fIn2Rt3Wppml4/BOQDhle7g4Of/CyicV7esgn5+AYq0ibSMWK4vTYAWkFwIdhJpmoW8F
         MqqhKL3AQuEjDyCZ54XzUrbB8oX/R7phCKEBChoHMCK2hgr6soRe/vhCEcc40DxdP0Wp
         GEBiVJeS+jJ9LY63hfxlXl4R9Nvx7EqrqFFgAM1jx64G49OjesQvyjo3hHL4Y9qKMjHr
         MsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685390108; x=1687982108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I+8Rw2y5WP9VcSj9EyYejwuXLfgRWkxo9rWVJHrYrOc=;
        b=CHWFBV106tGE1XTGojm0r39DnbHoQ5PvAy3l27k6a8cUI/yFJMvJk5CWtnzO7AJZxN
         4IODsD/unVlrbLm+qgq9WEVZJFzkhoahjigqc0Y0TujsEMWG2icCOcyqy+pA8kRoMuXh
         AXjbaAE0d5KRWIV3Td/eXsnnSMzX/o8JBceBK4jYcj/DpCQKqjXO2fefKEhAEfM7LvWq
         oAGCDds8rcYsj0t+zGBKDAKO3BTWFWVoo93eR+tZqv7t7caDv01+DMwc5o7Y2ATGqsY1
         aBjs/KPDGaPcayYvfOyiO1q/20CC0xjXvChr+lFaocggrUPklSMqzhNs/n1IpyHv6mYV
         XIKA==
X-Gm-Message-State: AC+VfDz36G2kk454Pil6HWwEX3ZRwWgcJGMufrk7aNuokT76l3t5C2Rw
        Puo5gk+5zbvhzb1174G3f6wh1g==
X-Google-Smtp-Source: ACHHUZ5W/5A7pmfLqBfknw4qghuufoPJD05qAoJcXBL5noOhNjtrWP3sFx0vKj2wjDcNQ4hpWdve7w==
X-Received: by 2002:a5d:680b:0:b0:30a:e643:251a with SMTP id w11-20020a5d680b000000b0030ae643251amr6045500wru.68.1685390108002;
        Mon, 29 May 2023 12:55:08 -0700 (PDT)
Received: from lion.localdomain (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id t7-20020a5d4607000000b0030647449730sm887364wrq.74.2023.05.29.12.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 12:55:07 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Date:   Mon, 29 May 2023 20:55:06 +0100
Subject: [PATCH 1/2] MAINTAINERS: Adjust Qualcomm driver globbing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230529-pm8941-pwrkey-debounce-v1-1-c043a6d5c814@linaro.org>
References: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
In-Reply-To: <20230529-pm8941-pwrkey-debounce-v1-0-c043a6d5c814@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=682;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=ESgc8ghwuzImeSlxOXFpkxKhh/wnGcBX0k7YH8BdKOc=;
 b=owEBbQKS/ZANAwAIAQWDMSsZX2S2AcsmYgBkdQMaZAD8O2gObC25Fa7T4fyOnrJ+csMuxGRm7
 hn+KV14XqOJAjMEAAEIAB0WIQS2UaFGPGq+0GkMVc0FgzErGV9ktgUCZHUDGgAKCRAFgzErGV9k
 tsZjD/9IA9A2PzIeIhb4UQrnwMJbZcyZpmpl6Kh/gKvYnRUJ6K5bVbMaMrMIa05VQjX6gSODq1t
 9tNR2gM49toYJC8tbi4GWcWgVSHGpI4KvQoRD14D6ucuhTzpjJ6QFLHKmHktkhY0MQ/RWLNtZUt
 uUHI1IZF8w2s/3XWqw8z8hmKGdbHtd3tIz58DiJnFFwt0utIWk/X9++PFxx+7fGoriQk1LSmw1o
 X5crzHUU3cDCiEmcBbSFC72AtP661zN1i4OWXbNro7zm0QqPolsPw/cF9X1Jd0FD24rN4QY61Z8
 0Luf83LbIMSt8mZR9LsH4kkKfCzVy9lKTNFddXUxTpQ1KOYen8iaSARFwJ3Y7V2OzHNfcfuR2U5
 T0PgqESO69S+l2elYCxRy5hdjdqO1EHa12hAbKMW+SsWaFeBHkWFRloFod62gHs8Uhs2nkM4+8M
 80X4h5ZEvUBGPMqCcWCKIagTwJouPU+2crhxE4J30CEywg4BF6e8hj9MZEmxEP2K4AvKTDzYmOK
 Mss0BtY5lRLJuRj/UaXuXElRd8eK5cY/YioSSyi+ea/3TaADkxJmCR9OwMcvjaGmRrHaNxPBHcs
 1qM5Z11oviUtWfBkZtDZIiulCF2EOmVHKxzCVj1SgREgAyPDHnPem+GXTXFqJzoxEPIH1CBCVmc
 7GPF7afX1/MNDCQ==
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The only drivers matching pm8???-* are two levels deep, adjust the glob
to match them.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27ef11624748..86b7842b44ab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2577,9 +2577,9 @@ F:	arch/arm/boot/dts/qcom-*.dtsi
 F:	arch/arm/configs/qcom_defconfig
 F:	arch/arm/mach-qcom/
 F:	arch/arm64/boot/dts/qcom/
+F:	drivers/*/*/pm8???-*
 F:	drivers/*/*/qcom*
 F:	drivers/*/*/qcom/
-F:	drivers/*/pm8???-*
 F:	drivers/*/qcom*
 F:	drivers/*/qcom/
 F:	drivers/bluetooth/btqcomsmd.c

-- 
2.40.1

