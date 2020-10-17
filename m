Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 303652913E9
	for <lists+linux-input@lfdr.de>; Sat, 17 Oct 2020 21:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439319AbgJQTCO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 17 Oct 2020 15:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439282AbgJQTB7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 17 Oct 2020 15:01:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2F3C0613CE;
        Sat, 17 Oct 2020 12:01:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b8so7111705wrn.0;
        Sat, 17 Oct 2020 12:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=sHLOFZo0TFodQdq0qeEmrvShlmZ9eatFXSn/LuchFBPmbSuFAU516t9DD2NTSSImFC
         RiKvAXlN1HKK5i/kbFWTKJjtqyTZ9SsShSmumUZpvBmzNJ1zJGywy4fl8TwP9wklWJZ2
         RGg5il/MWZHHAvlcxuzDEcm0PDysDd2XzqdsG+SroXNpttNCz5o3/hCtKPrZgAvSfmdi
         XNIKE1RIAmElXN+N3Ra3DNBqOJKrvUiRL7IR8wPiI6/7RbEeIuYnc10VmC4O1ZOrie7Y
         mR+uddUt09jG5KofZfS549gi4E7GogKQZZkxCHXiWlL7ahJBhI0N8Y3nvsoAombkAhsZ
         zY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=HFZvjCPJMn7eTVcB5kI5j07Fg5cGHZQGUqVvNzlNz+nwGdLv1ZbKd4JiJrlJf7Gc5L
         owuo/xR8YGCk7U4yT/AHDdV91cDPV//15ExGS2XI2W1qFpffnxwqjj7pzIOp1uunkzuG
         2JTV1eoQ8DSzRYWZuH++3k/zMfhWoNnZkVX70JJmCf+qJHzFdM7AV1FIyH06Ha3WFq6w
         vziVGohYmHd2/pah1jVVbgH4ScnXwFTs62CmPITnlmHsG26VdEHs+d6WsVyxJSSpwYmS
         jt3Hla2FDU/U9g7xpoOq21KBo909vx2ebYgR2dH+yjK8liVTPKo9LUIzBY15EpC5hkvo
         5hkQ==
X-Gm-Message-State: AOAM5309/jGNV4HfBc5XqG10YZ2SObJGZuIw2hrd0i4tlmCiVkpuTLsZ
        keBJRMqWBwVa1kJAvyGtQSI=
X-Google-Smtp-Source: ABdhPJz0JPQGmg+LIR8g2ZD9ObwpMtMW49aqa3s+67amfCe2GuE5bgSKXXXqESy27IzwYfmhtthYhw==
X-Received: by 2002:adf:ee4c:: with SMTP id w12mr10878393wro.22.1602961317536;
        Sat, 17 Oct 2020 12:01:57 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a5sm9583793wrt.80.2020.10.17.12.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 12:01:57 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org
Subject: [PATCH v5 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Sat, 17 Oct 2020 21:01:50 +0200
Message-Id: <20201017190152.12780-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017190152.12780-1-kholk11@gmail.com>
References: <20201017190152.12780-1-kholk11@gmail.com>
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

