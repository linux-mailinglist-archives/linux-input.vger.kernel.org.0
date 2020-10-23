Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87942973F5
	for <lists+linux-input@lfdr.de>; Fri, 23 Oct 2020 18:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750783AbgJWQdN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 12:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbgJWQdM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:12 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7497DC0613CE;
        Fri, 23 Oct 2020 09:33:12 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id c194so2251285wme.2;
        Fri, 23 Oct 2020 09:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=R8QmoUmpZjCNFBouSsZKSZ2eq+g0hxxSC9+PovyXbiOErqwLeBzvjjU3nLqwh3wz0r
         qvS14BtGEefVNUyJePcsaX8kvoP2MB7iHRVNuZCTYJRqCGyMIM+BVAlF2UCs+U/G/mps
         DlTX1o1ZukG5YCaG7ZJTIU/AhrHP53hx7V12OT77u6JGgXOP+GgiFIAeHavs7juwOHNS
         VLfk9404NiVsnBx460rjHPyByKoLWssjd264F9VmQUBuz2/AKLlpxOPFYxmLAoJ+20Fn
         JeazATaFa2QqnqIe37/PwfDNWbfSQJtKLIkI6hBkmlLnPbxto/ZHf8UiklKPYiGoCwOo
         wuvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=RDe2lRkLDX4eJKxgQ/QvFeCot8gh09qLbmCiWuJYgltnWNtoAJYe6MiJGLDlSIrJHz
         Uz0qUyHdTrgmAsLjDMuXCpQSMddqJOlLdKX46IpnQB61z8iRtLLP/6H//0as3kz3x3dY
         IJaGaQBA/MKee4wbPldslaxAXKaGore/vEZdxqQ62iEyJGPVnvOrx2i0SY/yHH1s4NPL
         3bKKn6LnyrLJIMwcIBao7gbdTTwSs/Z6P56ee8H4eaun3BE6ZmELPK94x3LG0/km/mhC
         R0P79qC2ZbP72j+vM2Lo9+zlxBssAc8OaEIA9upbc/a0RH72HPpuOQo9+daiwiIYxi/o
         UoyQ==
X-Gm-Message-State: AOAM530hq7h4PULodr0UHOe7BaFq0+dZXwAmvyHCt0m0Xfs4HnXWmULc
        JRB5HfKuwiBjS5dsIZafqY/jvpF9o0dhMgsK
X-Google-Smtp-Source: ABdhPJwMJqrZL0F4WJEj2YrKlKil2Seu8HlteUdBIL1PwSOM9Awl620jYQQct0gooYZpwQoGjUPhow==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr3023201wmi.141.1603470791148;
        Fri, 23 Oct 2020 09:33:11 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id u15sm4334808wrm.77.2020.10.23.09.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:33:10 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Fri, 23 Oct 2020 18:32:54 +0200
Message-Id: <20201023163256.96000-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023163256.96000-1-kholk11@gmail.com>
References: <20201023163256.96000-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Add prefix for Novatek Microelectronics Corp.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
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

