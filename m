Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28C6297BF6
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 12:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1761074AbgJXKvW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 24 Oct 2020 06:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1761072AbgJXKvV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 24 Oct 2020 06:51:21 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C710EC0613D2;
        Sat, 24 Oct 2020 03:51:20 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id y12so5401286wrp.6;
        Sat, 24 Oct 2020 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=rrZ3j3y190qnewJxPY2kJ+oCMGra/jto2aa+jOaGvrcU6L+UrykEAiNhv5flz2HIC5
         /tuiI0L0OYa3x5W6O6oMCRIzasXMlUDqGEztkjjUKkPnQqIVFmphswT5llVZhVbffDFj
         8h9QrrsZPBjK5Y/xGs5LiWzm+3UQvem1M48pJTusnYhH0COQJ5nQuklC6aDgF+3utJVu
         FfRdIFc3REClhUok4c347ZfGPAjofbVFV1UBWz7XiX8FUN1tqr/yx94cOS3q5yiCsgsp
         9/TtDL6/hS5JX0hxWk7x2zJTiqxXnKgjM+M8qF3LDS0+wMkXeWU1SCDhyVn1p46zXEZI
         OCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=P3BJ7NsC2d416+o5HjHIhWTByZryTmMl0/Vs/wTzSRQCPHu+kYTl17cuvVstr14kpA
         Gx/GQb30Lczm6CPPiLy+FaUlJ1ODZe1oA/6P5+VrRVzQR5zzf107zS6mNKlGhKocU7/v
         4qWgdSQCeNxzaXH+TOx1qaiC7a/dzkvz+5xWA1LnQRCFmWNxcm/KKl6n6rSR/KWLtqgn
         BBe1EokWy2NQl8uyYyvDbbiVqlJl6cJnOXwZZcgSQxpIQ3zFVENeRKKRLFCGKoeYULTW
         c2fGjvZ46pLyhS8iM+OISzZpCUlUZqMVOk37yk7Ses+3Y99PkM2OQcazkrE+OuQfG/I8
         5Zgw==
X-Gm-Message-State: AOAM530VdaeXtc9HSc51e4Xaz6Q7avDtvmetXQd2R9i4ft46KjZeMvw8
        v0X2adjs8Oaao2BBSSARHlg=
X-Google-Smtp-Source: ABdhPJz71qU7Nz31JlLFaaQZDQJ95/cdp2uH9/LmsIFUT+dTNzfXB3bB1Qbjes2Qp5XQC5hyk7mjIw==
X-Received: by 2002:adf:fd09:: with SMTP id e9mr7232776wrr.241.1603536678930;
        Sat, 24 Oct 2020 03:51:18 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id 3sm8792632wmd.19.2020.10.24.03.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 03:51:18 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Sat, 24 Oct 2020 12:51:09 +0200
Message-Id: <20201024105111.15829-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201024105111.15829-1-kholk11@gmail.com>
References: <20201024105111.15829-1-kholk11@gmail.com>
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

