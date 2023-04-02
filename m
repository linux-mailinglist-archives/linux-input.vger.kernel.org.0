Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F05D6D3A30
	for <lists+linux-input@lfdr.de>; Sun,  2 Apr 2023 22:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbjDBUK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Apr 2023 16:10:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbjDBUKZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Apr 2023 16:10:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E307FCDD3
        for <linux-input@vger.kernel.org>; Sun,  2 Apr 2023 13:10:24 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id y4so109580539edo.2
        for <linux-input@vger.kernel.org>; Sun, 02 Apr 2023 13:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680466223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKHTsVqE1aT1cdcOBW/aMh8k9NVa86bMl3ifc5Yx2Wk=;
        b=ZX/RqwIvU3d1R+i4XBGekHVa1JDlG4wFRU98W4Xv93C1RKpIpl8AqMhDMsonFH9Hhf
         FYkGAXyMFxuk35wSKO0r2zzIwlfuurPtD12iPdlKNqCQyv1LM0Prf0aA2wMY6s5GKM+6
         OE8VWzBiI1fJeNDWmFvFldEY0wDcJgVgUhn0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680466223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKHTsVqE1aT1cdcOBW/aMh8k9NVa86bMl3ifc5Yx2Wk=;
        b=GN9V9/lNudOT6DBbxzv9WSUThh9vmjzAVUV2dPsussT9/qEXGe7QsWsrOsRs5/OSNK
         AKmPjb150CIW3azLIOKFfrPrvfKYVJJVvXgFS9B//UV+QWP0/twrpJK+RijY9N45FpA7
         f9K4KMHWreRv4sC63sKAL56dGejXTJmRGrjN3RT02vfh50YBacGrnXw1VjubZKsVv63S
         nkpLm4mdMbiE6zLApy7n2N4LmpVHuL9QbEQXfJ7FFzGdIPczq7/dAVnX028c9/epx2fK
         Q1/TZwU/ELM/FDx/HIcsKgV6qz1k4AuB52f7vnHvauii3yzm7cPASZjiK0f1hGfhtdP7
         gcSg==
X-Gm-Message-State: AAQBX9dyT4k4img1wAYAOJNFQZeQLVsniFmPUSoFQkTFgF6OaHV9t7p5
        9JiDrYbAnPzVFcmGtkW2ToxaCg==
X-Google-Smtp-Source: AKy350bcJ30wLjvIzA6SYVa70CsgGFz3H3xm7zWgQr/X7yWBqVHR+qJnoVuVel+3GF1jQzn6DVO1Xw==
X-Received: by 2002:a17:906:4a4e:b0:889:1eb1:7517 with SMTP id a14-20020a1709064a4e00b008891eb17517mr35894731ejv.30.1680466223564;
        Sun, 02 Apr 2023 13:10:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-248-31-153.retail.telecomitalia.it. [95.248.31.153])
        by smtp.gmail.com with ESMTPSA id gl18-20020a170906e0d200b00924d38bbdc0sm3553127ejb.105.2023.04.02.13.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:10:23 -0700 (PDT)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 8/9] Input: edt-ft5x06 - unify the crc check
Date:   Sun,  2 Apr 2023 22:09:50 +0200
Message-Id: <20230402200951.1032513-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20230402200951.1032513-1-dario.binacchi@amarulasolutions.com>
References: <20230402200951.1032513-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With this patch, the CRC is always verified by the same function, even in
the case of accessing registers where the number of bytes is minimal.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/edt-ft5x06.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index 8aae4c1e6b73..fdb32e3591be 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -240,13 +240,10 @@ static int edt_M06_i2c_read(void *context, const void *reg_buf, size_t reg_size,
 		if (!edt_ft5x06_ts_check_crc(tsdata, val_buf, val_size))
 			return -EIO;
 	} else if (reg_read) {
-		u8 crc = wbuf[0] ^ wbuf[1] ^ rbuf[0];
-
-		if (crc != rbuf[1]) {
-			dev_err(dev, "crc error: 0x%02x expected, got 0x%02x\n",
-				crc, rbuf[1]);
+		wbuf[2] = rbuf[0];
+		wbuf[3] = rbuf[1];
+		if (!edt_ft5x06_ts_check_crc(tsdata, wbuf, 4))
 			return -EIO;
-		}
 
 		*((u8 *)val_buf) = rbuf[0];
 	}
-- 
2.32.0

