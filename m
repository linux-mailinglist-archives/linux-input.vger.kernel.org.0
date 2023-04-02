Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1A86D3A29
	for <lists+linux-input@lfdr.de>; Sun,  2 Apr 2023 22:10:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230292AbjDBUKV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 2 Apr 2023 16:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbjDBUKT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 2 Apr 2023 16:10:19 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C1886AB
        for <linux-input@vger.kernel.org>; Sun,  2 Apr 2023 13:10:17 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id i5so109704701eda.0
        for <linux-input@vger.kernel.org>; Sun, 02 Apr 2023 13:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1680466216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QYEoj3HNykDYYL4XbvupGelYH0ebBXdpkyODlCn0pFQ=;
        b=Q7TzE39DQ+L0qB2Qih8MrfiRtgoebzX/vDV9Hs1ivN5YUoBKGDuLNuSZMGLdMoTOI9
         qusPXgoWIaxMR1t79Y0Lo1/hRqdm94kPlaOEFI8lcoJviD2+RDFhbSKVva2WJeVyUDvR
         wwN/js2Ky8cqIlHxrQqil+yqnt0VBTe7p51Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680466216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYEoj3HNykDYYL4XbvupGelYH0ebBXdpkyODlCn0pFQ=;
        b=lP+1yFs7FQXmELNIIDkOwfaA2gd1cyWDF/jOlxnaaE/vfsRxeY09Aij0T3yLnS75yC
         l/ky3uld7Ge26/vG5WzJ+n2Qz5YkIMm+UHOcR/CVCm5B7u/+mjMTe2xUfTrRZ2yUYUL+
         L61BL01/IeOx6glhIidwAGNjj/LbYjXRiwUb8OxLCz2JbmPZktzhZUPiFL5MpBxkFAMp
         q2/gUXm07lgLfCppP+iGQ9fdi0D7ftA631dpU1xyrpiKdtLGHwASrNZmesiRnehXgG9I
         PEv6QIv/KapJ1B3zdTHcfa1jegZmU0AcaB4tqeIJ5T/i/QRKzl8moTiGEB2jeMAUiKLQ
         u7Cg==
X-Gm-Message-State: AAQBX9cps9mnRJFRfXyDKzohhPGXCZpL4UMqdLWdD3Bd7hbzwCDCFwnl
        RVTyYxEuLahjkCIKz1cCHfWrlQ==
X-Google-Smtp-Source: AKy350b5JLZFUTSDU8ZpZFMocLI5FyB0PP46Z/gJrBT/pcsxuQGUn8ZA7sF7NcLdHGCnIeOvzy1lSw==
X-Received: by 2002:a17:906:f754:b0:92e:fcc9:aa22 with SMTP id jp20-20020a170906f75400b0092efcc9aa22mr16072121ejb.37.1680466216192;
        Sun, 02 Apr 2023 13:10:16 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-95-248-31-153.retail.telecomitalia.it. [95.248.31.153])
        by smtp.gmail.com with ESMTPSA id gl18-20020a170906e0d200b00924d38bbdc0sm3553127ejb.105.2023.04.02.13.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 13:10:15 -0700 (PDT)
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
Subject: [PATCH 3/9] Input: edt-ft5x06 - add spaces to ensure format specification
Date:   Sun,  2 Apr 2023 22:09:45 +0200
Message-Id: <20230402200951.1032513-4-dario.binacchi@amarulasolutions.com>
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

It adds spaces around '-' as recommended by the Linux coding style.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/edt-ft5x06.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
index c0ad3e4b6662..c96fe6520578 100644
--- a/drivers/input/touchscreen/edt-ft5x06.c
+++ b/drivers/input/touchscreen/edt-ft5x06.c
@@ -183,11 +183,11 @@ static bool edt_ft5x06_ts_check_crc(struct edt_ft5x06_ts_data *tsdata,
 	for (i = 0; i < buflen - 1; i++)
 		crc ^= buf[i];
 
-	if (crc != buf[buflen-1]) {
+	if (crc != buf[buflen - 1]) {
 		tsdata->crc_errors++;
 		dev_err_ratelimited(&tsdata->client->dev,
 				    "crc error: 0x%02x expected, got 0x%02x\n",
-				    crc, buf[buflen-1]);
+				    crc, buf[buflen - 1]);
 		return false;
 	}
 
-- 
2.32.0

