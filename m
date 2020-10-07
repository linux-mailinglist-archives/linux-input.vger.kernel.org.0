Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E190F28667F
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 20:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbgJGSFt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 14:05:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgJGSFs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 14:05:48 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3188DC061755;
        Wed,  7 Oct 2020 11:05:48 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id e2so3482363wme.1;
        Wed, 07 Oct 2020 11:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=S9aCpKuz0UACbiki/55c3dBW+gR4Ih9cmM7d4fahKaqxW9XgFEjrebmhMligP+6Uvo
         xURvRAwaEI4OpVIyFyUinJ9PzbK+r6qkHVVtJtGj8bAf+co+z9pYUl4v/8PXWqJ+elvt
         P2ndEf1iySAohXQ3UBzUqLStt0WGmQA1r23W/xSP4of8e0cNDy6x28UW9gNATRFLI976
         g+0IkrziLOZbFIT+3Rheti+FPod9TpuEcS7udaKz/AC5JWK0ykEE39KZFxl9Zkbz1rpd
         BXBcFZESK30tFAVGTuFs5TZU2YByHbX0/sHqaOteIx4p3o3l9vQl+sYSJ/9DoTxOxDno
         W/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=fe9ecTQ+WLjOdYH4qc442q1vWF/cwdmRnuPYpzs5iyJlkJdqW0ZeE+OssqwUNM1TI6
         2/gLJUGtZS8BPi8a9D/aDkLnYqFMZe9cKaKo4Ufs2WaBbBAaZFVJ6kRIpmJHPOTclaLh
         LbfzY0aU0f8NFkjHbvbfo0LUCVf0PSsPfCXyk5Ex7/ifMvxglDWzEqgEl6sFTqAWLBUW
         ChaLQ4Fg0anYslKxo1N1IU94c1PZf3t7vVcS+2vydOsw1nBGKwDt2CpPvdWClI2xvgSy
         xexl9lPE7FXoneSoLSrtnMY4XQy8Vkkpn1RwSBNc/JfmiU9lLACufstlf+SWAWVajjYH
         +L6g==
X-Gm-Message-State: AOAM531rTsFvJftqG4BMvCFEViUWLYbjSZPDY0M82Pc+M6yzP9lt684G
        Z3OhxUtNOPhfA/fM2MBKUFE=
X-Google-Smtp-Source: ABdhPJz4iAfF7M8EtCi1T9+y6EyvyYGcdio5obLsehB3LnAweJ4QgXtb56uLG7vba7ijsDeQpVi1uw==
X-Received: by 2002:a1c:2d53:: with SMTP id t80mr3727772wmt.125.1602093945541;
        Wed, 07 Oct 2020 11:05:45 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a17sm3814496wra.29.2020.10.07.11.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:05:45 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Wed,  7 Oct 2020 20:05:38 +0200
Message-Id: <20201007180540.322257-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007180540.322257-1-kholk11@gmail.com>
References: <20201007180540.322257-1-kholk11@gmail.com>
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

