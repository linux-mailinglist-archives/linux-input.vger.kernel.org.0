Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 505807E6765
	for <lists+linux-input@lfdr.de>; Thu,  9 Nov 2023 11:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233433AbjKIKH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Nov 2023 05:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjKIKHS (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Nov 2023 05:07:18 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B1413251
        for <linux-input@vger.kernel.org>; Thu,  9 Nov 2023 02:07:09 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1cc329ce84cso6282025ad.2
        for <linux-input@vger.kernel.org>; Thu, 09 Nov 2023 02:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699524428; x=1700129228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ireTpCfN0lAkDpS22SoHjbEWTJUzLlFEUnZESQj8kY=;
        b=V+U3PVkfF5uxOrXpN8BVULqi55XRpztj0ymrjnICLVyJmKd10JQNEw0fITvjirFT0S
         kik+ceQR3+ctMCdte0jR42wXZWRkoVmrmRqVtcCGiAdVfi/krDrfZC9zTyL2/U0yP2EW
         xRwymNhHUdCT7ZuaIklIrRPeOvpXWr5Vn05ZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699524428; x=1700129228;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ireTpCfN0lAkDpS22SoHjbEWTJUzLlFEUnZESQj8kY=;
        b=D8uMhLE1M4O5C/ZTc0DSItQCtUpFNPlY9JGMTQK3EwdyAgu/vZYOrFQLv2BFv325zo
         iqVXxIYltAKyWq1ZQ2240oDnQZ/i7bAlR3629Uy1l9J2XF+spaUL9e/MM2N9d2LrO1wB
         HBzIGnk6NKPkF7GlijW5UQeJDmrGgNM4+6SOuz+mrN9RuqaQTXZN9uAwMP+psPudNnyj
         37Nr8vz4tAybazTRu1KjhJJ0pGytY7aJZh0yfLiMfnwi4nM7+h8XhdbwOhP/4tdEykVS
         JhDQJ4bwyoCahJYklDqBIQJCUpIaa2wtYtUhLvKFGLCCJt8y2DN/A947PcXVKwqg1Zjl
         O6KA==
X-Gm-Message-State: AOJu0Ywt3UAC2c6DXezvzFFPA6dO2HB7jvYJqFMFyb86gma7oMdeg2A/
        /QCy9FY1t6WJX4+iVqmDBHZW3g==
X-Google-Smtp-Source: AGHT+IFYLvEMMUZ9GrbH908WNtQJvicj83HyjofOmfRWFZrCflNz7TaOuy+rHHNosFSsiJ8aNjo+JQ==
X-Received: by 2002:a17:902:ecc1:b0:1cc:2ed0:5ab1 with SMTP id a1-20020a170902ecc100b001cc2ed05ab1mr5039394plh.17.1699524428617;
        Thu, 09 Nov 2023 02:07:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f57:d4c:468c:5daf])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001c60ba709b7sm3127511plg.125.2023.11.09.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 02:07:08 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>,
        linus.walleij@linaro.org, broonie@kernel.org,
        gregkh@linuxfoundation.org, hdegoede@redhat.com,
        james.clark@arm.com, james@equiv.tech, keescook@chromium.org,
        petr.tesarik.ext@huawei.com, rafael@kernel.org, tglx@linutronix.de,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wenst@chromium.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Johan Hovold <johan@kernel.org>
Subject: [RFC PATCH v2 6/7] dt-bindings: arm: mediatek: Remove SKU specific compatibles for Google Krane
Date:   Thu,  9 Nov 2023 18:06:03 +0800
Message-ID: <20231109100606.1245545-7-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231109100606.1245545-1-wenst@chromium.org>
References: <20231109100606.1245545-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

In cases where the same Chromebook model is manufactured with different
components (MIPI DSI panels, MIPI CSI camera sensors, or trackpad /
touchscreens with conflicting addresses), a different SKU ID is
allocated to each specific combination. This SKU ID is exported by the
bootloader into the device tree, and can be used to "discover" which
combination is present on the current machine. Thus we no longer have
to specify separate compatible strings for each of them.

Remove the SKU specific compatible strings for Google Krane.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index a4541855a838..ef3dfb286814 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -186,9 +186,6 @@ properties:
           - const: mediatek,mt8183
       - description: Google Krane (Lenovo IdeaPad Duet, 10e,...)
         items:
-          - enum:
-              - google,krane-sku0
-              - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
       - description: Google Willow (Acer Chromebook 311 C722/C722T)
-- 
2.42.0.869.gea05f2083d-goog

