Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA5612798F4
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 14:48:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgIZMsC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Sep 2020 08:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZMsB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Sep 2020 08:48:01 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14426C0613CE;
        Sat, 26 Sep 2020 05:48:01 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id q9so1930402wmj.2;
        Sat, 26 Sep 2020 05:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=SEWL1LcYCe8q8flYFLaJm70M8HbFHHuKVK0NntGKnhzIvoU3lv/AZZmoqPsQxwiGHU
         UefCHqduXCx5CZuBzIkL6lgj7pd4efRy+87f+dGYS5Dy6AmYk/yMjUXWeP6GK75xgbdr
         N44oeZR8hnZgZ1OT4+wIWLnlM26vJCb9Iq5ULoxe85UoSY7fchcYaUqDiqr3+xZhtsBi
         xk3Cl9ZYToCQI5RglTk34aHtVAbNa0ytH25Q3vfq7wu7F2IjG/4yCfXQXFC4CZsvzYzh
         ny6K0HSkwU0yeh2dHnhBrw2bRHeQEBOMy0kG0rAbUFBf1NaQN4XDe5I5y0IGh15JVWMH
         5SGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cGK0y4DdjN+ht1VXSEDsJItbDCIWKoPEWxNpiJk8/U4=;
        b=n7zVj1Jvt1HkThjzYDGwUsKuOGnoP4SC8uLX6x9NLgk8KLd9E/IMMldP6jXoMAmTmL
         i66eFbeIatE3pB146vOdhkMLt4wbqPpv958g4o4695+mIYO8sZZFhAQqEqr0c/PZ/viw
         nDNqWNh5Pq6ljfBQF0ts07ZP6ft3l80MoxFwxGXwYclYkWfCahebtx0A1kvpqg070ZlG
         Tk3e+veaLScmhMXIlKMCx4BXpKNdI4Nw4GYQKwm/7MH4TRph8gvfoJvMLVU1VoAOGL2m
         BqXEIeqypakU9mTImhqW4Pjg9Qw89NdAe7410MEF6NQzSM/XpGhnFiydJ8Lb4WGeHoRI
         Xpug==
X-Gm-Message-State: AOAM533A72h+Hzs5xaYZvXA7OzfmPBBQjuOrabRzq6Z1sRQJIIy4osI6
        /DrDgD4pqgGDYwHaIsDimCk=
X-Google-Smtp-Source: ABdhPJxo37uourJ46XRWLvxmZzM8+oOEG7q8GHJAx2zSAKfOVrTpEIs05YzhAsOIuwAEwxFZhjdvKA==
X-Received: by 2002:a1c:bcd4:: with SMTP id m203mr2499914wmf.70.1601124479728;
        Sat, 26 Sep 2020 05:47:59 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id i15sm6909901wrb.91.2020.09.26.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:47:59 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Subject: [PATCH 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Sat, 26 Sep 2020 14:47:45 +0200
Message-Id: <20200926124747.12465-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926124747.12465-1-kholk11@gmail.com>
References: <20200926124747.12465-1-kholk11@gmail.com>
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

