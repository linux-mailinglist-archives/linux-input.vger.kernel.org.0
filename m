Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7014BB32
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 16:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbfFSOUX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 10:20:23 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36526 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729993AbfFSOUX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 10:20:23 -0400
Received: by mail-wm1-f66.google.com with SMTP id u8so2067613wmm.1
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZRfugtSiNnnWHk67X3XyWfWdW41BFsMrlORgFvQpHB8=;
        b=x2KfGd6nmTs2XlXpPmXh7Bn5s/ja/yB+ssgQg0K8PWsdCScEmLdoLMyeXSoFjpaU2c
         4vLChCMeHfz8s5eFGW5PWmUuBW+WhFnm6MdC8XbYfCgCgrqb/neFu7MUF5Aphbv3FJbY
         3rpX7PLEp7KhW+13YKd2whUbI7ot5zYfNoe0B2rQHZ3QXyi33+xLFOjUBeH9m9QtCWlg
         0dtmZYSnjUWrEjEN8p6g2UDu0QraU68hCPFzX4gYdLGA+VpECer59BYjvNHnwkbq8+Zq
         MnvCWzR162k/zGLHSPwXFrA2UV+fLwDGOQ+FMLWoIkohfJQbSjqNZ+e5o/kif2t2GPlQ
         tMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZRfugtSiNnnWHk67X3XyWfWdW41BFsMrlORgFvQpHB8=;
        b=UwQrvMF/nvp/UPEOwMSml+DQeWjA5Ud0wrGuWn5ldOSr7LF5E852Xa6eXS8Es13+bO
         guWbVbRKrBkK17ZYGpAUJkivfWwXF5QJz4XWb6nmFtVg1zLi6vueD9Dd6k/TtD1CH/ay
         iUc8qlMfX8OQ6MA0F3VUhyc+k/ictmPhF73ybyR/kg8xvTHTdorNiVkjPFKpdxL6e9/w
         atMZ6AFDSCe0ttF3FtekOS/JHUhpm7qll2JAK22EOe4694VzgDB3jlPASltTCeqvdLRz
         UTLdW1qPOVtf4PRWHvrjVlUZfFbcjo2MUOj+gkms9TbY5x/ICqBtWCfTOL2rY6u1OD0A
         Z/jg==
X-Gm-Message-State: APjAAAUqbqKNkJywmTX6VRxOF6OsHzFUJin7EA/Tdpi04fqaQ3uJY/0h
        OjD2zap5ZWLP5woTFNBiXcpu1w==
X-Google-Smtp-Source: APXvYqxviKVJH2mGeoI0M+JIBXaftgWG3sqGHPq1gzdOJBj4y7cCwom3d0P0PUFpn9jhuZU7bp+zXg==
X-Received: by 2002:a1c:4184:: with SMTP id o126mr8614067wma.68.1560954021233;
        Wed, 19 Jun 2019 07:20:21 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id o20sm24209979wrh.8.2019.06.19.07.20.20
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 07:20:20 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com,
        lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 3/7] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date:   Wed, 19 Jun 2019 16:20:09 +0200
Message-Id: <20190619142013.20913-4-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619142013.20913-1-fparent@baylibre.com>
References: <20190619142013.20913-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v4:

	* Patch was previously sent separately but merge to this patch series
	  since there is a hard dependency on the MFD patch.

---
 .../devicetree/bindings/input/mtk-pmic-keys.txt       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 2888d07c2ef0..858f78e7262c 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT6397/MT6392/MT6323 PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT6397/MT6392/MT6323 PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
 node provided by MT6397/MT6323 PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT6397/MT6392/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6392-keys"
+	- "mediatek,mt6323-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
 
 Optional Properties:
-- 
2.20.1

