Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D952358449
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhDHNMq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhDHNMp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:45 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FC6C061762
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:33 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g8so3889505lfv.12
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rB+Uj9Rbn2xqB0YtuwwjNW8xA1jhA5o/KbB6xl34qfI=;
        b=M9nzOE9ui4stAiFlevwmfrEaPsnFGnNW/70ic3dc+MUdBa0K/si7SVhlZMDSyJbWzn
         X03j3P2oiM87pK9BhdedoCgCxdc+Rm/2q4hRqU3e2OWRxU+5n+qKUckXglInxLe8UaE3
         qFkIFP/8nqxLusyGPcPkaKc4e62HWaRg6G0dWz0sD0xCJXRNh6wopchKeKKXxu3Jxwp1
         H7/rNdMQB7l5qgl8jnkR9EtCZIv1jO/lEG8bMzX9ZttoOn8InwOKhaFfjl8sLslav+d+
         n3D2fxoVZMxj1cwacF8TPThf3pofuzVvdL3O0tZYlT0QSs+fjf6LUjqoWsW3Or/Gx8Qp
         NSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rB+Uj9Rbn2xqB0YtuwwjNW8xA1jhA5o/KbB6xl34qfI=;
        b=Y3Orl4aEDk5s6y9QrZ3tKhtWCW1C7qzEkyxFFeP9coCpIR+T0GuG22nCTC/I/qp7Z3
         31/hjw6EehwNN3RmUHsaltjKCtT6yTFTZxm2hzDvzDM3ZVdE5fxDl/x2WFqYlbQFARFk
         MIsIzH/oyHQLopEOYJtQg7mAxLTSR1DuR1GeUTTeUnbCjFT5NfFmuRSe9AE2Ti1adFRh
         novTOAeIO78RaZPRZdQf6ZG2WEyybj9ADgEGHZoFZ5CoAz7gf1V0qHJWbPp6/kAj+Yan
         3zyVSmB1b5fTCZ11zIaGo+aM+7QEfJyHcRXgzxaFZBETs76xl+XgMUbqrycWAJsLPM+X
         YG0Q==
X-Gm-Message-State: AOAM53125b4Gkgp3gREu0LNyqeZWVk3KS7BZw8UXMHSuPVMPHZ8RJt8r
        snMWN28rLGjx5G4G+OkCL9UUlA==
X-Google-Smtp-Source: ABdhPJy8Np9bPlbHm55raxU1iqh7Nd9lkRjhfrGXENw4oGXm3p1W1lY6HXOmG6FaRRnahh1Fn6HnWA==
X-Received: by 2002:a19:911e:: with SMTP id t30mr90047lfd.292.1617887552105;
        Thu, 08 Apr 2021 06:12:32 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 8/8 v3] Input: cyttsp - Flag the device properly
Date:   Thu,  8 Apr 2021 15:11:53 +0200
Message-Id: <20210408131153.3446138-9-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210408131153.3446138-1-linus.walleij@linaro.org>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This device is certainly a very simple touchscreen so
we set INPUT_MT_DIRECT.

The sibling driver for CY8CTMA140 also sets
INPUT_MT_DROP_UNUSED and experimenting with this driver
it clearly does not hurt: the touchscreen is working just
fine so let's set it for this one as well.

Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v3:
- Collect Javier's Reviewed-by.
---
 drivers/input/touchscreen/cyttsp_core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/cyttsp_core.c b/drivers/input/touchscreen/cyttsp_core.c
index ac412bcb15d8..fb71cd0d2070 100644
--- a/drivers/input/touchscreen/cyttsp_core.c
+++ b/drivers/input/touchscreen/cyttsp_core.c
@@ -672,7 +672,8 @@ struct cyttsp *cyttsp_probe(const struct cyttsp_bus_ops *bus_ops,
 
 	touchscreen_parse_properties(input_dev, true, NULL);
 
-	error = input_mt_init_slots(input_dev, CY_MAX_ID, 0);
+	error = input_mt_init_slots(input_dev, CY_MAX_ID,
+				    INPUT_MT_DIRECT | INPUT_MT_DROP_UNUSED);
 	if (error) {
 		dev_err(dev, "Unable to init MT slots.\n");
 		return ERR_PTR(error);
-- 
2.29.2

