Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2DC3BA177
	for <lists+linux-input@lfdr.de>; Fri,  2 Jul 2021 15:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232829AbhGBNqA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Jul 2021 09:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232805AbhGBNp6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Jul 2021 09:45:58 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C98C061764
        for <linux-input@vger.kernel.org>; Fri,  2 Jul 2021 06:43:26 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id m9-20020a05600c3b09b02901f246b43bbeso6419845wms.3
        for <linux-input@vger.kernel.org>; Fri, 02 Jul 2021 06:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
        b=cDfr1NhQHx+he4+TgITm2BjN8MbmS2ZamBiuVsRrRnghInJTxPq5GVK7592n3bMasM
         Gwt19Fm9bD6lKrUrLAbkoNsPO2e3K6qaODEPEfRFgOvV8tWWbdsexZ2N/uUBRr+siLCl
         WO3j5j9yvB2OxqcHcCjxTbW3pqqjWyr9BuPdNtWaFMNIL4QXBUqV4fUz18Wo6cd7fits
         DFtLGE6KXnN++YkAkAvgOFB17NeNptuQjy0KH9Z+Reetr6CFMnhI7LVOXdE7Xdey9JRv
         affpusSNYDn/3E2TE3wdm/r7p3168EFhTG4o3rCRawEFHA3f1Fd01n25IZSFHgJ/Isz1
         QXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lzfTe4NYom6dNO0HLbV+l/ZlHA7iI3yej9+BU8sy+1w=;
        b=Mdg3yoZTlCKVAHWoSZDTOl6EJRSvS8/OgO1mie77kawsfxiwiazD0PTM/81Rn8TrdC
         rWzCYj6cf/8J3jrfO0RJFulEcjYjHXeKesVnEwkitSOPcnitPFoto6zRvQj+9x1Z48Wl
         YgiE42J5xqQckQC01P0qjUYOifuQWAARmcvdlKFBVO3TMtCdu4hcbdiMG5Bc0cSLJVqk
         3v2MoZixU8e7wKGN+d8dwfwE1gbeh7GcSJEYOKg8Z+mDmZqZSPsCaoNWK4wpoP+Wa6U1
         3BCFrCEIJd1oJX3o6GJm7b94O39RCgWLBDdREktXTAisACg66bAYVnl0h2R/DHK+CkKR
         zY6A==
X-Gm-Message-State: AOAM5306MSv/nNhS9kG72kdFecu03ARdkH565sdQ6G8DyfXN44VkDNtq
        PiFKSkT69mRda8KfJLJCUoSQYA==
X-Google-Smtp-Source: ABdhPJzQFXRzS5N554NDfExUbHLoRNV22Hjo5b5QbL+c0xKE76ZXSzmuNLVKNHtW5oiQNSxHSQYGxQ==
X-Received: by 2002:a1c:7204:: with SMTP id n4mr16962591wmc.7.1625233404663;
        Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:c5f3:6ae:eaf:87a2])
        by smtp.gmail.com with ESMTPSA id s1sm12595512wmj.8.2021.07.02.06.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 06:43:24 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
Date:   Fri,  2 Jul 2021 15:43:08 +0200
Message-Id: <20210702134310.3451560-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
References: <20210702134310.3451560-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.27.0

