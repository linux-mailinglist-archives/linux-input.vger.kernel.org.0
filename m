Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3DF22993CF
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 18:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1787808AbgJZRax (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 13:30:53 -0400
Received: from mail-wm1-f50.google.com ([209.85.128.50]:32799 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393463AbgJZRaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 13:30:52 -0400
Received: by mail-wm1-f50.google.com with SMTP id l20so5655311wme.0;
        Mon, 26 Oct 2020 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=q/rB2RywKggVlQCSJsk637rsN8lr2OE8iewhWnMIiWUcwNNPYMzPIB0UZEtI5YcRKU
         wi2Ufc7vOlhql6MNicbhfh1HKU7Wz8Mrs3kNV7HtzKhOthOqL9oogyiVPKI7wtS9YQQ8
         pj46qgpDydiRuSVunhGjHh5oTUEoMPTRCY5js+CxAqVdBshEuI32uPYyfAHVF6lnWHwh
         OMP5BvJG8I3t8lxKNFv4AvUxNCqdlwu+xi2ONQEAdjDakXB/e65R/gTswZMnEhxzVMnV
         filfXNuox1lPrF9b1nMpXqesREpe2wgnrcn/cwOI6HLyVFU9qTwkCCKl8WpGf96tMN9o
         dw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7Vqgqp5RCTym5rMfv9j6RqUwYhfreT6N/fOFNGIusQ=;
        b=XR8M2jlyQUb/+sGk6jWoRP/UjXxLCoWO7W2sa9M3sRrlpHYGjxhASz8grKQUql6qT1
         gUbTRMXbwp6bX2vSq3L0uGfSdNjfYrRES6YAo9LkIezAD1uM71NOa//TmQLoD9A4uTla
         U/9WTqB17+orNH/bQr3VFNtonRxk+NQIXcJUsfqS3KW+moAc+rpyKaDL+6QxMD2K2GGo
         HLjdDMWCItQmH+y+EpJvpOY2HPwaEtqt/jiVmCd+f1Wyo8ILmrdXX4YmHT63K5T5ptUR
         bbQJG3od0fy2G3GKwQI5IzrtbXiP+wDLWgjl6cyFmet6nW3Nl3GZoiHk0Rkm5qsepGNq
         O0OA==
X-Gm-Message-State: AOAM5335jGSU5luRWBiHcNQHUd484RP42+sVfYYIm5GEFk8w1tGEveh5
        91rccxaow9X0AolZYfUBbXM=
X-Google-Smtp-Source: ABdhPJxEsIQeiLxNtqR1jh8jCWo56KmV0OQyJYidcdeThJ131tFq9OJAKcBhwqONu0ibEny30UsjJA==
X-Received: by 2002:a1c:2402:: with SMTP id k2mr16937198wmk.158.1603733449948;
        Mon, 26 Oct 2020 10:30:49 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id b18sm1996808wmj.41.2020.10.26.10.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 10:30:49 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org,
        devicetree@vger.kernel.org, krzk@kernel.org,
        andy.shevchenko@gmail.com, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/3] dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
Date:   Mon, 26 Oct 2020 18:30:43 +0100
Message-Id: <20201026173045.165236-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026173045.165236-1-kholk11@gmail.com>
References: <20201026173045.165236-1-kholk11@gmail.com>
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

