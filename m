Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83DF2B0367
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgKLLEe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:04:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgKLLCW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:22 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CA6C0613D4
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:22 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id c17so5485225wrc.11
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZQVGs5MUcX5FGl2B0GSyWePcq4JNp/6FjWRufhPjYcY=;
        b=VhQygiOoSK+sK6f7HkMc+o9zkzRaUN+FSCWD/crO0V8nHR27+xLSjUbKSc7ltAkPPF
         rKj75y4G0aMj+ioqRWIGJh3F+bT/AD+09bJhZbAB96sZxXR/Crg81ZwIGo5zsGerQWBA
         eIYAOm5DgjWp+COQ6NBzaN/KucO3rUnUxAeENnEm8gy98aPkLD3Xo/C88T8/t4IBcAIM
         lgRvlS/F4PFpNaNjjEumIbmGtiJucF4sKa1D44J24lhAAz3vzUYyeGRQYe1haqmg+Gxv
         EY8KDPXq2mAuPrplhkjUh9QrE5J8/mpjUTn/IlBeZ0kPqKXZg6HRI2kTL2tU+veHFUME
         hrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZQVGs5MUcX5FGl2B0GSyWePcq4JNp/6FjWRufhPjYcY=;
        b=lsgs634L2XC56hSNXMoBotcncBVIFcKq7yvKPs8IxsB8DPYnf6cG8XgC88KZAmchHl
         RqWLKrgdV2SxysHPUiPGeEQKEcL1rf/BnIN6dnnxFl3vVOqPu5UFdtCvqqVEYIBXN03F
         kcU/mXL3if/lxJVHyHrmo5nfE0RYp/DpdFximFupS3HpW5XvNiBZ5mwNNqtTlI0jpyPl
         49dA/4DZZNfh8Qzs3gMWNudpwQ03u/HdNQV4eYQunSe+cXhMMdhDUvamzuTM2rtfnmbb
         TP9oskpGzJI/CCfVY053y4fqpWuqbffRWoOPj8iWXoypsY+v56A9DXmiilaMG+yfRvYL
         9Crw==
X-Gm-Message-State: AOAM5313A5Usx8yDG0Unh1KK38RFy3ex5lXCPi646QBk4fpFKr0Q91fj
        PohpYeYw0QvnNNp7inr46TsC/g==
X-Google-Smtp-Source: ABdhPJwYLGSBuyC85zWYlngJC+Pi/QkUTlnPMLHlWOimyhWy+xhqiTpOPwSU0SIRVvfPM06uTF+WLQ==
X-Received: by 2002:adf:e544:: with SMTP id z4mr1114555wrm.83.1605178941187;
        Thu, 12 Nov 2020 03:02:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:20 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 10/15] input: touchscreen: surface3_spi: Fix naming issue with 'surface3_spi_get_gpio_config's header
Date:   Thu, 12 Nov 2020 11:01:59 +0000
Message-Id: <20201112110204.2083435-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
 drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]
 drivers/input/touchscreen/surface3_spi.c:225: warning: Function parameter or member 'data' not described in 'surface3_spi_get_gpio_config'
 drivers/input/touchscreen/surface3_spi.c:225: warning: Excess function parameter 'ts' description in 'surface3_spi_get_gpio_config'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/surface3_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
index 72dc4c562a4e1..1da23e5585a0d 100644
--- a/drivers/input/touchscreen/surface3_spi.c
+++ b/drivers/input/touchscreen/surface3_spi.c
@@ -217,7 +217,7 @@ static void surface3_spi_power(struct surface3_ts_data *data, bool on)
 /**
  * surface3_spi_get_gpio_config - Get GPIO config from ACPI/DT
  *
- * @ts: surface3_spi_ts_data pointer
+ * @data: surface3_spi_ts_data pointer
  */
 static int surface3_spi_get_gpio_config(struct surface3_ts_data *data)
 {
-- 
2.25.1

