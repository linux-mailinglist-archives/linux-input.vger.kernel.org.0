Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 761F827A0F9
	for <lists+linux-input@lfdr.de>; Sun, 27 Sep 2020 14:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726610AbgI0Mf4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Sep 2020 08:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbgI0Mfz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Sep 2020 08:35:55 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99AAFC0613CE;
        Sun, 27 Sep 2020 05:35:54 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id w5so8683366wrp.8;
        Sun, 27 Sep 2020 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=b+8A5E3E0c29+ifkXvz/ENqbKfpvVI6/D+a29XgN3s9Fct2d80iPkZnKO3/SfUnSy5
         z3qHH3ZEEx8tLppXWVcMVGJr/zpyW9O24N9ddGU36JEfdxxfnnotkWjTymeCI9rPkDIi
         C8ZWZ4thODtLkYO2yFDuFIzwChC5J3U01XvlyNy2PjORneecI1OhyXyJmb63QuAO03ek
         xkeGvDNW8LH3gwhbt4OL1rIRLOZQZCERNrlAaikcPpi5cWDqVSNJ5B4uKr/1VNVTdfRV
         uUXrUqLaNTVoMPSXv7RTBsKC6tOgm9llra9PNVZRAyAMCXiUe8KEV7fo+A3xa2JSFuBr
         CtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=CTJ4Q9YsSsqhVruEqQHMqC4HY12whWlpV8uE4MxZkFlFczQ2UbLGhtuT9qi+hKdMED
         jzMK4rjOUAyNWmFjNSXM/rIWo/0lJnSgQRfnqEjuPAMLm0qXjiUswV39hPxOACV3QMO9
         WSFTjkt6sYWuW3gQo2XOWtVkVhJRqUVkIsuSia51Emi+CLp//JVRlwrwOHpbuWtn7gUc
         cGWCuVVQORbjoCTXnNrsmyLOUSwlt9ZcyupGrdPrx9k+w7z74KuSMMbath7Jjn1qvx+Y
         /diYWNspCSKbhNuutDqdn6R/L0vd+BwoSqmn1OYc0kugHS4bjYPX8NnMERqcejNIgk1O
         e3fw==
X-Gm-Message-State: AOAM531+aYonRw5AJ57FYzr4W1ABkDyy0fg0beRsPNkwp0nAoHwFVGX0
        ofY5jPEr8P6aXLbMApc/TcU=
X-Google-Smtp-Source: ABdhPJw9BrxAV84oScdxoCChMHSDZc3QO9KFTgLfGor3M/MDhrV444ieBsb3D5R41Oqg2qV08RMv2w==
X-Received: by 2002:adf:eb04:: with SMTP id s4mr14857095wrn.81.1601210153176;
        Sun, 27 Sep 2020 05:35:53 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id y6sm9470090wrn.41.2020.09.27.05.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:35:52 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Sun, 27 Sep 2020 14:35:40 +0200
Message-Id: <20200927123542.553852-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200927123542.553852-1-kholk11@gmail.com>
References: <20200927123542.553852-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add prefix for Novatek Microelectronics Corp.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 66e45112a8d7..f98ea0af487d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -740,6 +740,8 @@ patternProperties:
     description: Nokia
   "^nordic,.*":
     description: Nordic Semiconductor
+  "^novatek,.*":
+    description: Novatek Microelectronics Corp.
   "^novtech,.*":
     description: NovTech, Inc.
   "^nutsboard,.*":
-- 
2.28.0

