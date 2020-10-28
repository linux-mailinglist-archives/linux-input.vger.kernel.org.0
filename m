Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE8429DF85
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 02:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731049AbgJ2BCE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Oct 2020 21:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730534AbgJ1WNJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Oct 2020 18:13:09 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37EAC0613CF;
        Wed, 28 Oct 2020 15:13:08 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id g12so669792wrp.10;
        Wed, 28 Oct 2020 15:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=A2QmttkI2fe6dA/2YZGL64pX8xVnqR6evtzrPGT+ldsFPQcVmv1JwRorV+t51DAGQk
         gGOhIou6GLz7/wQpic/qi0h/5wxwyYmluu2JJQ5DOsbSMm8oTfmOg4Qb8vcZsUFlE7H1
         y3Yf26m+/4UUHX2zheGb6YiHC+km8BUKiPxcct3iK04Q5OPp8TJVTcTk+jZyo9e6zdHB
         MVcMVjkkSRulUgoNbPIU8+pQN7bxJjifv3L5K+DinD0VbLGa45KtADz0NTsaNUKjON2R
         iMJ3m35zbIyNJL7Rvmuf5G9vM6QPoj4qVCIGM2FkFyYnlD0zVwAJq7qsNbT13hRuFKlM
         Zr1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=oMn6d5UfWQ1dJTxaaE4ACTXTj5YYglJdfX/ryLSd8W946rnKFlqND1d75mOnV47fpc
         psS8t991pSOMdQYeWIlR8YGecH28sop5RyuP9OhraoHAyiMonK81Kp+XRLwQyLLtIlvx
         1n3GAlJbchsVgygG6sCCBgcnbHILptBqg/BHYLwOk+DF4ueojgG3J2ZRPpLcDBbOVon0
         rl6gqSejd6VFsgSbNgPJ+Cna0UnqaW1ya5Rnmu393QNzuhKkvtF1VdQTVpOQVSRsof0w
         EKEfkXImnzBBa67dOkaJ5/4zOVJ30TeDP3flwK30v50kdyIfGbMfdjSrZ/Xt/mm19P2e
         78jg==
X-Gm-Message-State: AOAM531TAzAYqC3Rgw8f/P4HtAb0tcoA2Hi08pZtjqFLJsMtNU4yRuED
        Tte+72mIVZkx/kZrl2j0jn06RINN4sATMyem
X-Google-Smtp-Source: ABdhPJxm6cfbG6QjUkuAqgjbUqmYmPAAy0t2sdXju04r3h0/YH3Fuj3gbcmR6HtqNnJfop1leFoS2g==
X-Received: by 2002:adf:bd86:: with SMTP id l6mr1665232wrh.205.1603923187610;
        Wed, 28 Oct 2020 15:13:07 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id x1sm1318928wrl.41.2020.10.28.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 15:13:07 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com
Subject: [PATCH v9 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Wed, 28 Oct 2020 23:13:00 +0100
Message-Id: <20201028221302.66583-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028221302.66583-1-kholk11@gmail.com>
References: <20201028221302.66583-1-kholk11@gmail.com>
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

