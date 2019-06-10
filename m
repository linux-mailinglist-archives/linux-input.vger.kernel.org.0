Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 703343B22A
	for <lists+linux-input@lfdr.de>; Mon, 10 Jun 2019 11:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388873AbfFJJac (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jun 2019 05:30:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36202 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388604AbfFJJac (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jun 2019 05:30:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id n4so8433407wrs.3
        for <linux-input@vger.kernel.org>; Mon, 10 Jun 2019 02:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SwJw3j7/7gnElwksFcendAVLydFxmN7dLijaWX2YTuk=;
        b=KZSI8mtVLDmfWFKHeculnx3pQhWjeomoz92Kvj0hEjAn4j99lQpDa42qJtIglBAzDg
         M5tvyDV2P5ZJQq7LvoWuElO8WpIz1k5sWPrsHcIlhIH7ns0u24a7KWLeWshMK/LoJGeh
         ARlATeqT/53AVvm+L4iS3jGee7ggWoBuJON9KWj07SEWLjssNTNGP7fH1PJQx/GjNkZc
         fz7XSIUWi73sdV65I6ctQC8Zs//rStasSGECPzp0C925IRzv5x5Gvyiq4EcEF2NQOZGV
         7mCJCgYdZRvsV7tftKkek+7b9tEtct8q2B5eMY+9K1iElLioHP5bJ7HVyoNIXsO5K4ZO
         2+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SwJw3j7/7gnElwksFcendAVLydFxmN7dLijaWX2YTuk=;
        b=iFxrL/HwAjhnf7D3WZW1ra9Kl11katBYwF5AOp6j7IAiwkQFP1zgg1gfJKnHaQLauU
         p1wWdFbqFui+GjpYMR1QjNm4r/F8Q05xgYxfnnbVq3kojNxwlCeO/LVq+QhVisLgNU7o
         hXAuzom/wzFXfPIAg67RQIr5nUllYMNvp+mrTFcPKivuZ3fDVJ7DsqoV/AbC7WgAwwbN
         MV/rB2tKobLXSa6pgAgvhnAWrbgg/tm3QJuYy+qzJQf4j+ODJ1ZC8aN0CD4MFjozPx5R
         rjbEvyPTwA5X4apNdsGCfcREfQbZUxMGQ1p4CVBuWAI65g6yjWVcyysoz1O91CJqONUJ
         E5ig==
X-Gm-Message-State: APjAAAU6RquXNQNWkgX6rCIHSJjbcvNU8fOuXzB9uC0GYspngJpZGIrf
        ZtjgFCQKH0gFyO+/9oNpWFvGCg==
X-Google-Smtp-Source: APXvYqyp16e0fd32IZJUm1h/bwNECayAr89DfYqv93+JSv43LKn4yVOBrY/u2r8Aded7JI70uzl/zQ==
X-Received: by 2002:adf:f50c:: with SMTP id q12mr16830734wro.300.1560159030618;
        Mon, 10 Jun 2019 02:30:30 -0700 (PDT)
Received: from pop-os.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j123sm11881943wmb.32.2019.06.10.02.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 02:30:30 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, jic23@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        baylibre-upstreaming@groups.io, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 1/3] dt-bindings: Add pixart vendor
Date:   Mon, 10 Jun 2019 11:29:43 +0200
Message-Id: <20190610092945.6330-2-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610092945.6330-1-amergnat@baylibre.com>
References: <20190610092945.6330-1-amergnat@baylibre.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PixArt Imaging Inc. is expertized in CMOS image sensors (CIS),
capacitive touch controllers and related imaging application development.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 33a65a45e319..ac5060e8de8d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -661,6 +661,8 @@ patternProperties:
     description: Picochip Ltd
   "^pine64,.*":
     description: Pine64
+  "^pixart,.*":
+    description: PixArt Imaging Inc.
   "^pixcir,.*":
     description: PIXCIR MICROELECTRONICS Co., Ltd
   "^plantower,.*":
-- 
2.17.1

