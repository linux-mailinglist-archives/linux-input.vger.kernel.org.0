Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07F4166A22
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 11:41:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfGLJlY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 05:41:24 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37878 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbfGLJlX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 05:41:23 -0400
Received: by mail-wr1-f68.google.com with SMTP id n9so9274320wrr.4
        for <linux-input@vger.kernel.org>; Fri, 12 Jul 2019 02:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCPAVIoBuVICJSah+Q7UfWDYKagBj0M35hF6OR30pG8=;
        b=XTv+fxtBppMxkNUV39HwSKjm+deYXMOAp6Ae0Cxil9saa5GRQbgNN2qbAu8xmovzhX
         Rizm8MeFlAfIZQDiK2g63C2f3c9YL2Y589epi9ViyKSFWM/9Swhk9LjLmF8BJzQLK5el
         bpOrLB/yViwvEwiROw1QWsjAijEiIKYpCCwPBWviZElDCA0LyvPfXuKDbWDkVHGx5Nl5
         aJQjmT0cJ8zJGAyym5GDlImqqUu0CaB9uGG0fdQAP8JxWbdc5ww23koVWt+TLzMuKiyU
         o3yOBRYh3+2ErTbTK/K9+uFFnKPdeFVf8tTxwXpOrqi34Riypne26yTXkeBM66HbHnaf
         XDCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCPAVIoBuVICJSah+Q7UfWDYKagBj0M35hF6OR30pG8=;
        b=f5p3Nucsay0+wI/L3cgRbL8yAyam0JWoQrja+e4l5Q1j5hA7vnymidWD4JUOlPjBX2
         8Kt2ezve5mgRwkXMUVqQmsiFPSm/4PUS5jKwAmRItHmRq20V0E3FcrCsNGn69A7X4d4D
         EMQeg7SVhbYopQgQHMnHdX12f/00DTmoWvvPUGw1PmaqRVKK5gIfvNnciIpDn43jh4Lq
         eOjLlsp/JEdqwzWF0oYifVhj+RjUKdLadoevwp+KpGy7hrf+wjNwd9oNo8ObvMPkJguf
         nBIncDoz81eeM8XTJVTF1UjSQq7IpWXyK4a08OinDhKAI7HBQclaw6SiaTvd3khJZ5bJ
         9waw==
X-Gm-Message-State: APjAAAWXJPg06cjZX+d+ai48InZ22eeuKJ1vrLyRiFye+GveEDcqLNNI
        Q3p9VKgeOWeB1gDM/9NDkjwsVg==
X-Google-Smtp-Source: APXvYqyrQ+MUolkbRBUnnn+5K9p7+mItRVyATvV7pPrRV17zZ3oBg9tIPdRguwVSaC+rpzEMJP9FTw==
X-Received: by 2002:adf:fd08:: with SMTP id e8mr10072939wrr.147.1562924481709;
        Fri, 12 Jul 2019 02:41:21 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
        by smtp.googlemail.com with ESMTPSA id p18sm7310891wrm.16.2019.07.12.02.41.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Jul 2019 02:41:21 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, jic23@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        baylibre-upstreaming@groups.io, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 1/3] dt-bindings: Add pixart vendor
Date:   Fri, 12 Jul 2019 11:40:48 +0200
Message-Id: <20190712094050.17432-2-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190712094050.17432-1-amergnat@baylibre.com>
References: <20190712094050.17432-1-amergnat@baylibre.com>
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
index 18b79c4cf7d5..120529f40c7c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -705,6 +705,8 @@ patternProperties:
     description: Pine64
   "^pineriver,.*":
     description: Shenzhen PineRiver Designs Co., Ltd.
+  "^pixart,.*":
+    description: PixArt Imaging Inc.
   "^pixcir,.*":
     description: PIXCIR MICROELECTRONICS Co., Ltd
   "^plantower,.*":
-- 
2.17.1

