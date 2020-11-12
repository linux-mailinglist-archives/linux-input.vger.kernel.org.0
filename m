Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2920A2B035B
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbgKLLC7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgKLLCa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:30 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1017CC061A4C
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:26 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id 33so5526825wrl.7
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q13pa3CA8d60JdSrIfIwRLUNzuOKQhVdzs81KgY0XSs=;
        b=DWfYoEQOFtYfEfTrbiPpgx57N/JlSCJ4huAeQqgq82lHGI1NufzVJnXkKJqaq11vhZ
         VeVA+N/eSqojHUStJDRxrwCigWwv7eCMz96KSzsB3kuV3Eb2EIpzmBlQPTjxc9AL/lHK
         s+wc8M/Gny52NsLM7ku0PMgtRiQI2PNxzKG296xutecMHWAPLJOmX4/tMlx+TyuAw7pw
         HZKZzPeBkIh9zahDlOl/ds1QHXCL+w5s12NU8J2bm5SIhbUrpuIoE/SVdyQ/gvM+JogP
         SsJVUNIUB1fcFJC3p0azo28xfLbEAbskV8+BqaVJhFx/2Yd1n5m4qVAfn2hWJ4nbaiRx
         97rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q13pa3CA8d60JdSrIfIwRLUNzuOKQhVdzs81KgY0XSs=;
        b=M5bunCqrKM8haN6lBuP1HJj6ADkByMRkCwid3sJzSU8Byc3e4JJoS4yP76b160aOm0
         yeKfjukNAW2eYauull5AiYl0gVcFEuRLpL9tfkGk/kZkzm8e49P1n8uVIug246LlW+Rk
         5+J3V20mn9TEnuEnPsYzj999UDh/FqJ9DwKAn8e07BjRmrymugClVWLeDQoAZQsmqgVJ
         R4+AJZSTTO0dN/v+ZrZpseaZ+3zO9iyuqmz+h78x+jvE+Lgov5uf1jlJFB2OGL3aho9z
         CdiRhHZkUcXGoLxOVnhfRDSnb/lerNNniZ+TBMOxEHSdwtJ+ZDLlikXa0v0IAIM/mk9e
         4vfg==
X-Gm-Message-State: AOAM531hvLavIvp8akrcd37h/dlcW0Mh6u5aaqQW1V8SXHPAbVKpJNCy
        z2Mfs5FQ9XEtlfO8eOjpL42BMw==
X-Google-Smtp-Source: ABdhPJyAuKsKG1ycPinw+5lG50HywDicLjWaFxJdXUPWgC4SSmqOhYseu9rK8+5tlKw8O7CXlS8EVg==
X-Received: by 2002:adf:f24a:: with SMTP id b10mr19242197wrp.352.1605178944840;
        Thu, 12 Nov 2020 03:02:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:24 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "K. Merker" <merker@debian.org>, authored by <andrew@goodix.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 13/15] input: touchscreen: goodix: Fix misspelling of 'ctx'
Date:   Thu, 12 Nov 2020 11:02:02 +0000
Message-Id: <20201112110204.2083435-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/goodix.c:1168: warning: Function parameter or member 'ctx' not described in 'goodix_config_cb'
 drivers/input/touchscreen/goodix.c:1168: warning: Excess function parameter 'ts' description in 'goodix_config_cb'

Cc: Bastien Nocera <hadess@hadess.net>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: "K. Merker" <merker@debian.org>
Cc: authored by <andrew@goodix.com>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/goodix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 80a82a66a0f3b..c1b728e47827f 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -1159,7 +1159,7 @@ static int goodix_configure_dev(struct goodix_ts_data *ts)
  * goodix_config_cb - Callback to finish device init
  *
  * @cfg: firmware config
- * @ts: our goodix_ts_data pointer
+ * @ctx: our goodix_ts_data pointer
  *
  * request_firmware_wait callback that finishes
  * initialization of the device.
-- 
2.25.1

