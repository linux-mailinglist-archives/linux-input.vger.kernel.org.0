Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB736DD40
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 18:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbhD1QnM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 12:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhD1QnM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 12:43:12 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2831FC061573
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id a22-20020a05600c2256b029014294520f18so4854813wmm.1
        for <linux-input@vger.kernel.org>; Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1Npsra9lTv9v4xN59JKhYP3YKsTPHiSIJ0ifDE3Owq0=;
        b=zUDZjIL2usIB5WXxK/ye4NbuH9+DXS1SfA9xQTM8vq1Dg0Otmpvz9GfHi2opbHEsnK
         FtLetrva6yDTWEssMBaO0U1BGKu97PDRbGkJBJCDLlUCeISqVJmyWvx1rcNZPpd1+en+
         o0onKxEcPszCkG9gC2SOsLJOxZZReh10HmEK7H/qlFs7ED2RMTn2SlGocO3l3cHc8XbZ
         KK/dK54ZXBxKYeRoYlLePgwqmFjTe1BapwtnFKBapqOxVM5xOokZITRx2tA6uypu+T0G
         1jbos3guoOsApl4T+3WXTPmXArr5SGKpUxcJlQ1rxIydrMJX8rMpHjkeit0G9StsQ1bq
         Wkew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1Npsra9lTv9v4xN59JKhYP3YKsTPHiSIJ0ifDE3Owq0=;
        b=D529F4g1sYpNqMYlGEStoKT3Tu18j779Yy+IgmHXfEGgf0M4DahXvmCUb8RF7HozQZ
         fOn8hDK8bXz+09qoAd6vBguQx91Nowa6cJbvQwQABRhmdXanE1YnrEAirKKPaHv914Gn
         k7AdLA7CAgE/h/MvlhVHCCUNL9bMafcV41uUqh5czjs+NxOT/eLue+8hDH9o8QlcV7fj
         4JdAdIcChqbLLhgMFJ6Xoa9P6+sN0Y/krn0tDIM/vaMjyaZt3ClUD8HbMhybsL79fKbh
         4lm2YByiqE8OIIRN3gSTcUQYWNFgL/xhxQzs+jc60pfuwOXG0UYMJSj78s0Fjl32Q2Y5
         vFig==
X-Gm-Message-State: AOAM530uBoeA93HWGIwpwWpvgUWrKj3OKeV4+ADqLtR71j1vxihS2RaQ
        LQQN++M7WPv7GFmlX5srbFy2Vg==
X-Google-Smtp-Source: ABdhPJyWnC5LYX8PDdAFYQdLJOpHsPJILkQ2WJwopTaZ8WFEeAxhvmHUVeqf21SzpLPRGkU+Tw2Sow==
X-Received: by 2002:a1c:f708:: with SMTP id v8mr5666235wmh.133.1619628145900;
        Wed, 28 Apr 2021 09:42:25 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
        by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 09:42:25 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     fparent@baylibre.com,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] Input: mtk-pmic-keys - check for NULL on of_match_device()
Date:   Wed, 28 Apr 2021 18:42:13 +0200
Message-Id: <20210428164219.1115537-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

mtk-pmic-keys being a child device of mt6397, it will always get probed
when mt6397_probe() is called.

This also happens when we have no device tree node matching
mediatek,mt6397-keys.

In that case, the mfd core warns us:

  [    0.352175] mtk-pmic-keys: Failed to locate of_node [id: -1]

Check return value from call to of_match_device()
in order to prevent a NULL pointer dereference.

In case of NULL print error message and return -ENODEV

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 62391d6c7da6..12c449eed026 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -247,6 +247,9 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	const struct of_device_id *of_id =
 		of_match_device(of_mtk_pmic_keys_match_tbl, &pdev->dev);
 
+	if (!of_id)
+		return -ENODEV;
+
 	keys = devm_kzalloc(&pdev->dev, sizeof(*keys), GFP_KERNEL);
 	if (!keys)
 		return -ENOMEM;
-- 
2.27.0

