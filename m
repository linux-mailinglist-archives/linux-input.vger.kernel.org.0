Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18E8B25F87D
	for <lists+linux-input@lfdr.de>; Mon,  7 Sep 2020 12:34:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728907AbgIGKeU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Sep 2020 06:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbgIGKdW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Sep 2020 06:33:22 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DC0FC061573
        for <linux-input@vger.kernel.org>; Mon,  7 Sep 2020 03:33:20 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id y15so1074981wmi.0
        for <linux-input@vger.kernel.org>; Mon, 07 Sep 2020 03:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zDegqVmimS9dIJwNDMtty6LSuyVmgMvA+oa1ZvHmVIY=;
        b=gdjLbdpOV3gN6yZT5yR6EraPQlcFbNhhBhstzpB/HgTvOuSG9WyZjmNruLe4HpYA9e
         edlT0TL47uetSEnv9IJ154SPP1ssMzk3ow7nILL3yxn7K5loUHfAm6umGcLDOnseHI5M
         fH1Qlt3eKv19wdRfn6a9BgfVUj69P/VgMkW718b9aWdPkevXrl2ZHZxKfCWZFGd1t4fr
         hQg86QKqz6nQ0DdoYmuT3PEBzw1kthhlKrWGc/fzAZehYPMJF0/EDWdX1QlqAMVIKsHR
         yGBN93/uJuBddwRyC5Hj76ehMUXFzYCRX+HuFc3fqu1/vZSl235e7nOdyY2if9Tock/h
         Qgqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zDegqVmimS9dIJwNDMtty6LSuyVmgMvA+oa1ZvHmVIY=;
        b=cXTy8ptGbIR6+6KPH7nhB0q4vb5c5PYMOe6j20yBUIfH7oFcBLA/uA9y3KJiVMtC//
         Yb3rPyYJsaF4+sFvm2vTBVBDzKP3o7Zi3Lo3ES0ZZtDG8I8yiE4rXMG1SrdctVLISzvk
         u8xa2K/XNic+5rsPl7brPMcTkN8bzp/zANETY0EUj5n1cXYg2/mGxm4UikkjljrXRCj8
         HJkPxodrpHT4JpMR74A10UKci0Vzy5Kpth7I2BvZFkqoHwtjcTWLw/mOAWIcEX0bDGRc
         6izQxu/2EBVcGdiI4B6HkAaC/B5+IK08b/SJHbBFcyenCWv02Sc7ejDO9bjGkbm0ZqGC
         AKJw==
X-Gm-Message-State: AOAM533Zx7laWwLkz30esl4/PEIWNMlRJl5cxwjO2koSEyZtQ2ndO2Fd
        pUTBPdaGB8zGMt7kHqOfxRBFjg==
X-Google-Smtp-Source: ABdhPJwmKB1R49xT+gzxzJMk8hfpF7xfzlN8Z3JZRv87J9pj6lSBqqi2dBpFwiLaZ9qbxtlErOlEOg==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr21202627wmi.105.1599474798946;
        Mon, 07 Sep 2020 03:33:18 -0700 (PDT)
Received: from localhost.localdomain (122.105.23.93.rev.sfr.net. [93.23.105.122])
        by smtp.gmail.com with ESMTPSA id i1sm32395936wrc.49.2020.09.07.03.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 03:33:18 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Cc:     hsin-hsiung.wang@mediatek.com, lee.jones@linaro.org,
        matthias.bgg@gmail.com, robh+dt@kernel.org,
        dmitry.torokhov@gmail.com, Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/3] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date:   Mon,  7 Sep 2020 12:33:09 +0200
Message-Id: <20200907103311.1601907-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-mfd-by: Lee Jones <lee.jones@linaro.org>
---

V5:
	* Rebased, removed regulator documentation because it will be send later
	on in another patch series

V4:
	* No change

V3:
	* No change

V2:
	* New patch

---
 Documentation/devicetree/bindings/mfd/mt6397.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a3825..f051a951ba72 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6392" for PMIC MT6392
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -52,7 +53,10 @@ Optional subnodes:
 
 - keys
 	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+		- compatible:
+			- "mediatek,mt6323-keys"
+			- "mediatek,mt6392-keys", "mediatek,mt6397-keys"
+			- "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.28.0

