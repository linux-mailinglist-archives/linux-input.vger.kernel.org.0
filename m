Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F13A34E393
	for <lists+linux-input@lfdr.de>; Tue, 30 Mar 2021 10:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhC3Iyv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 Mar 2021 04:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231269AbhC3Iyh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 Mar 2021 04:54:37 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F18F8C061764
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:36 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a1so19041215ljp.2
        for <linux-input@vger.kernel.org>; Tue, 30 Mar 2021 01:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WeDMmUHMqTW6OH9fZV+W9CUsFCKVXgQjWfbISHyWnmo=;
        b=qQ4m2s7ext90HzptdeeG/jREjBptW9hyrZcFLN4TBNbeizr2atRcTioxUnH++RKGcR
         3haHGYFTVYD1yvPZWOlcnHBJlt/MBl0t5g3uveI5bS+BS6yTtvMATJqz+J7Ye12xKw2p
         1qY8I9vsQ/9WN7e21UASG4kojxtFtWcLascetWPEa2TA3EIIIiC3y7WJTQggoXKZaj5T
         FVZ5kTAvLup5rTe0NDSQXwcsCzwWuggjug3HQOHhqSwyKqZROpDELVnnYRVStynOw7cd
         fqazuBzXppiFNZjCjTFLOgkUc+oMcPMov884h/f9FSySsmuir/SiNpivoJgaWYVgbqQC
         2F4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WeDMmUHMqTW6OH9fZV+W9CUsFCKVXgQjWfbISHyWnmo=;
        b=CBJgIglL4FUpVRcuDqerkuuKJ34KTWakc3cNcVduoMl3noRQarTIG7VJ3RvRIOc18P
         cBCqdvEOp3fcZw1Bt+z35Lpm00iq/bbBE6Ig0lp1Y+3ML5XHn2euPjpS5xkbu9wTQ/lx
         2Qvc2DWvrDWyqGLufwCOFdHEoZUbgqufxAqbxkvvgMKnoJKeHnpeQ2dMDfklvJnB8VRA
         pSTJsYSN0ZQ0iF8qTkVegsb1+4VzlZFvfT1yVPUcQhaWCnzNa2AerVdxa/M8FEE8y41C
         w9xIcRgvd1YpvuYQ7Mx/Gf+1ekZxT01KItfjVlWKaWXf9RdipCc2vZj8R18CPqcCCy36
         r/Gw==
X-Gm-Message-State: AOAM533iz+3d1bKrKztuCHWB7vy9LQ263YjecaF6JKGgH3IpFSeA1yQ3
        GEaSp8kVvcWFdNeOLAKR+aeRdQ==
X-Google-Smtp-Source: ABdhPJxHAkR7LbIwYmmYmFHKP/J5wK3XOC5M2Z+k1wnWyQBkOU34Uaqp6ZLaQrIL6ya7ECfAZ61aPg==
X-Received: by 2002:a2e:a177:: with SMTP id u23mr20494915ljl.286.1617094475521;
        Tue, 30 Mar 2021 01:54:35 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id 201sm2104238lfm.108.2021.03.30.01.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:54:35 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 6/7] Input: cyttsp - Set abs params for ABS_MT_TOUCH_MAJOR
Date:   Tue, 30 Mar 2021 10:54:23 +0200
Message-Id: <20210330085424.2244653-7-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330085424.2244653-1-linus.walleij@linaro.org>
References: <20210330085424.2244653-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The driver is certainly reporting pressure in
cyttsp_report_tchdata() with
input_report_abs(input, ABS_MT_TOUCH_MAJOR, tch->z);
so we should also advertise this capability.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
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

