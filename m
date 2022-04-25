Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 466B250E333
	for <lists+linux-input@lfdr.de>; Mon, 25 Apr 2022 16:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239362AbiDYOej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Apr 2022 10:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236505AbiDYOei (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Apr 2022 10:34:38 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B9E2CE1E
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:31:33 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id u3so21167808wrg.3
        for <linux-input@vger.kernel.org>; Mon, 25 Apr 2022 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
        b=QiN4139opvnc7CzgbwFybNYp1p3HrZRT5GCNAgla0IVM2Zrl5QTbNwNt7O6QWpiq5c
         q6aozGBMEuD/hUZ+T5epxetNThR1L4cIfvuoI13PXL/jFD9gZ+VWcNjBmz70A5PG2rci
         e2/svw3agvKn4K+x9FgPUk07rU0TEUq2zSZ13z1b6qtrofG2F8ncB1eGFCBfcKE/zv/q
         Qrur4q76PDloWwTneErY1Pd0sUCFQ0EwN+sg89GAJm8TpnbEI+PdLLmXj5xqKnHRAXK2
         2jfMMqmjoahdP2tEKgAy63jvuySR0jTe3oGPhe78+TIoNhxvnbDVkGUd+d9Ju9h3tkES
         8P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Ec2V5shBteoRtCqtxfW2R62kxRNZBNcV3MF01Vbbug=;
        b=UbuLOXboh4Bepcsa25e7/skuXO/1O6oea6oRG2UQh2VF2q7CX2ReU/wWR0jNL89Skh
         oWBQem8G4lgtkalSAZYkVDVWFUARGYVcGe+g9Wfaymc7WGMJyPPeNi99Y2pA5/sEsBIi
         YsCs3lwVLWoYqMzPZBvPvOQi0QYdjElEDvT4G7reDWpTmC+qTEb9ihrH5kfU5CTsYUHd
         mNTbeURFgkhKDNCt3+kOs+h4u+uTNLpTl66Ruuh9lbU1GPCKO1TYOKCNYt/d51jCblS/
         pUlLjwA3Y8JwGCu4eLoYNgeQQryFD4LThmaxbrqvNkNpmLjEhsnCEBaHoB3AeG2bQSZO
         ZW3w==
X-Gm-Message-State: AOAM533pDIFntNgnq6SkYt68Ad/4sA64TyZQDpSFK4D8yodN8NV3raaM
        tSsbTxxSQg6NkJxEOuug9ZwrzXTFQgDadA==
X-Google-Smtp-Source: ABdhPJwVJGTJ+1Rl6zqnCeUHjHWgEqFfE9hWxTo8PFA94FMtT7qnou41+6gxfsBIHbspyhCxwJpuxg==
X-Received: by 2002:a5d:4645:0:b0:20a:db5d:258f with SMTP id j5-20020a5d4645000000b0020adb5d258fmr4355178wrs.135.1650897092310;
        Mon, 25 Apr 2022 07:31:32 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:ce86:3a65:67d7:726d])
        by smtp.gmail.com with ESMTPSA id s13-20020a5d4ecd000000b00207b4c92594sm8679525wrv.59.2022.04.25.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 07:31:32 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-input@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] MAINTAINERS: input: add mattijs for mt6779-keypad
Date:   Mon, 25 Apr 2022 16:31:25 +0200
Message-Id: <20220425143125.163799-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As stated in [1]:
Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Add a dedicated maintainer entry as well for the driver to make sure
that I can help with patch reviews.

[1] https://lore.kernel.org/r/20220421140255.2781505-1-mkorpershoek@baylibre.com
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5936f2d9d8ed..d092414ae7be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12139,6 +12139,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
 F:	drivers/media/platform/mtk-jpeg/
 
+MEDIATEK KEYPAD DRIVER
+M:	Mattijs Korpershoek <mkorpershoek@baylibre.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+F:	drivers/input/keyboard/mt6779-keypad.c
+
 MEDIATEK MDP DRIVER
 M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
-- 
2.32.0

