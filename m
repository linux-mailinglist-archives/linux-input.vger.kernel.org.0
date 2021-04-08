Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EAA358448
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbhDHNMp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231446AbhDHNMo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:44 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086A3C061761
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a1so2221678ljp.2
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=olpPcQyA4i8jA1zfF3uYSdUT7/y4KQjokOlzlpJlQ1E=;
        b=Wtopn/cK+KcqJHtS89Aycpg+eLf/64oQvLgxAg4cH0r+bGViDWUc4sJiII1JvB6HB6
         Diyr2f5aVceZlzUq6MeFwc8VAizUwXaiEhSvFXqK5AnffEcd646JIs0PN0f1viJk7PRx
         yimRk+RbmX4QUyhmYl/QyfQWkTA9Xu2jcX4ZB+4gSblSHwqTxwshl9Ir6kpPfjHsmuyp
         l/BbhIorYdQ5wtOXnvr+gqUo4gy6fWk8ZoreT2Z51gaPQ/AlCTGHxr7igUpg4Uvg0d+W
         oWGsEU2llGPmKBiFwgzhKmlJ2bDaPXigAe/xbSICo4ztJgLifKtMjOdSfLG52N701KC/
         IdHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=olpPcQyA4i8jA1zfF3uYSdUT7/y4KQjokOlzlpJlQ1E=;
        b=B/Qx86HgZB5T4ThpsoavRODKkvoNvfGi/fa8lXx8pV7TaDOxg6a6wUNngzNyC7qyN+
         S5WvZjq2HhX8/EIg/UOA0ZY6rrhppQbjV3FgE6Mqhs1kBorsjPHz9Lt+oQkMJb5ojVmX
         NNd5km2z6pUYewt3nLRDc+nBpirPJOko2EiO8OraiOy2BHrsNU2LoE2HeznmZ6WvI6nr
         fZbDpAbIJmhLFEmiW6X7mLM1nKMfk9NtDxNTk5ri/eQCXDEScfFyUn9H0+eT118Ejwbi
         Kk6qfbjTGJM86qj+2M1jztwZ7cSNcwkueRtg6ZpXVsRdtdaoi0+UDvcCQ9DG4W3q3iub
         Ipjw==
X-Gm-Message-State: AOAM532iP/Xuazi+ljbjdKTm3AE+IC6U7f0DsgHy2PP98S8m5NV+eRuj
        KXHR+JwqVp+7BxFl6enFGaf3YQ==
X-Google-Smtp-Source: ABdhPJwzGznodfAmiszfj1zUk9q+aiW5Pq/PjJhaBxqyqF0mj9/pYCwno5ky2ojv7ncimXnsesVuow==
X-Received: by 2002:a2e:9098:: with SMTP id l24mr5745728ljg.150.1617887549040;
        Thu, 08 Apr 2021 06:12:29 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 7/8 v3] Input: cyttsp - Set abs params for ABS_MT_TOUCH_MAJOR
Date:   Thu,  8 Apr 2021 15:11:52 +0200
Message-Id: <20210408131153.3446138-8-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver is certainly reporting pressure in
cyttsp_report_tchdata() with
input_report_abs(input, ABS_MT_TOUCH_MAJOR, tch->z);
so we should also advertise this capability.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's Reviewed-by.
---
 drivers/input/touchscreen/cyttsp_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index 8ae9f00e5e31..ac412bcb15d8 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -667,6 +667,9 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_X);
 	input_set_capability(input_dev, EV_ABS, ABS_MT_POSITION_Y);
+	/* One byte for width 0..255 so this is the limit */
+	input_set_abs_params(input_dev, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
+
 	touchscreen_parse_properties(input_dev, true, NULL);
 
 	error = input_mt_init_slots(input_dev, CY_MAX_ID, 0);
-- 
2.29.2

