Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08597539113
	for <lists+linux-input@lfdr.de>; Tue, 31 May 2022 14:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344352AbiEaMuV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 May 2022 08:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238298AbiEaMuU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 May 2022 08:50:20 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97D56FA2F
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 05:50:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id h5so10466309wrb.0
        for <linux-input@vger.kernel.org>; Tue, 31 May 2022 05:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tEjwaurHVMJcwAgK/RtwUwRV4sLe4udXQl3kl+UTRSg=;
        b=VgN9otLsImmOdEiEQMJvVUswrD4KDRye97AzAK7AqCWUNPQYVsT9mlFSLsIyQadSY/
         aMZexslC1uHQp58ZwYP3iI9BCWRdWMivbS7Hr3dRcDbv6jPk93Jd25DZZ17u32dtcvCV
         yFhgBkcJqPBHGYdIAdWlEFTw8xggBm8krkg/8cZTgP10VsZJ9Bs/1nkiOum+CDcLdJaI
         H0v8nJ9I4lnVf05DworpM4fK7iyPyLkOXVEYF9wq5b1Dwd8aEOgF9F5zC0Lfr29aEsxY
         aGzKv3m4mex1HDs9ejM9W21Bsa1rUulj36QUoAjOi9BPIUaeVRggmppd6Y+1bYe+W6M5
         63uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tEjwaurHVMJcwAgK/RtwUwRV4sLe4udXQl3kl+UTRSg=;
        b=SLDusX/Xy9azH0gwxnEVzctgwjEjgiRswCbEWNAe6B1MuU68fQkV1BMj9SVJQh190b
         DLBBHTv68rlMY6YcL7QrBfeOaCpOEuzUHs7z0jtkTUL3wpoMWp4dwyHfen3CJgmayS7d
         A2N0Eg1q43cjkhW4BUxqWVqfDEAC3ztckMpNJibLbq7Z1qHLx0aKbyqJ3jG4K/CRUlXk
         QTTI9nf0KeA7jtOKhCayAR5BcshbMD8zD3dY23+omecyFtFnzQksgWiBKxPetScXAN3f
         SXidkYPNv6wKx2Jt9ALAvqg92JzMjkue3YlLwRFw6GVncJNNomskiK52wSG2ju9J+qfH
         MgGA==
X-Gm-Message-State: AOAM5302Zqr1qc2zj2Rn3Y6OoWy+XLXy6dhgAtimwE3Y+KLWa4nZMDBr
        2ZoTdgqokDxM8dR7wfoOOq1vDA==
X-Google-Smtp-Source: ABdhPJz+0xRhbxZOvqm4trzphmBLxipyzJg9E3N2RcSx9CyjqRtqduu5UbyVouSGVHu6621tAkc0NA==
X-Received: by 2002:a5d:6da6:0:b0:20f:bc8a:9400 with SMTP id u6-20020a5d6da6000000b0020fbc8a9400mr43886708wrs.274.1654001418333;
        Tue, 31 May 2022 05:50:18 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:17 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
Date:   Tue, 31 May 2022 14:49:54 +0200
Message-Id: <20220531124959.202787-3-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220531124959.202787-1-fparent@baylibre.com>
References: <20220531124959.202787-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add binding documentation for the PMIC keys on MT6357.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..7eb0751afa22 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -12,6 +12,7 @@ Required properties:
 - compatible: Should be one of:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
+	- "mediatek,mt6357-keys"
 	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
-- 
2.36.1

