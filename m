Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EF786792D
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2019 10:05:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfGMIFW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Jul 2019 04:05:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42009 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726532AbfGMIFG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Jul 2019 04:05:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id j8so8007049wrj.9
        for <linux-input@vger.kernel.org>; Sat, 13 Jul 2019 01:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PCPAVIoBuVICJSah+Q7UfWDYKagBj0M35hF6OR30pG8=;
        b=VyOLpZSo1+lXygJnf7L4tUyVOCvRuvglGR+cOpoMEp+aWlzqFfR0oFDg6Ca9Xyo+AZ
         iwt8F+9XEFXRioksk0AOG7h1zmgXCRhkJiX/BdVnMGLlAjcR543kaqU3aBJe+GqiWhAb
         5J4/EtZ2uHB8VZPW9j1oQxHR3U46wSFjAxyHVNTq6YKwWj6GLnjBYXujHfKfMX4jWc5N
         a4mhxWB7PFeXv5NRvj48T/1pFPXVtO+mcD79EjRloDw2TXUKKHVY3yeKHIy/LvqyDI/5
         dLdyCv8oT4tomgqaSPriTKiHwUQ40mRrqSeTg6psi4ejBHHQhN3M+jHRgGH/f5FPCUeu
         X6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PCPAVIoBuVICJSah+Q7UfWDYKagBj0M35hF6OR30pG8=;
        b=as8IUHohxvqFwkqQkEhfCd9EblolbOrYBD37Rjq9KwPwtJxDQhQ7baQ9ot986kKuHh
         rbYaa80jmPqR3l2+J+PJYYL2WqeOAgTeSd6m+dXb1h1tJQ3M8tL0P5NspJVWn/YJS1xl
         DgLWYwlSgKKdRSG+mgbn6kcoemjmIBLclnVpvxqW9QpICGyTSIYqHad3gJHSRKNSocsL
         OFUh1B88aYmfXEZRwXoaO6ZTLknd60vRvoxzUmtpO5Sg3Rb50GptgiMk4wHR3SrVPY4q
         xEpupxiqKdfp5ZzhYjWs3ispIsTczqY57V1+F7ps4rbTy2Ux7MM74LSFXtiZIWC2vRD9
         vC1w==
X-Gm-Message-State: APjAAAW1k7u8pG6ylxLQh+54NEkKwp5e9/tGbx1APCkO4UxUeZrMBPqX
        ZryNQ8S5sUIoq4qUENtpSnySWw==
X-Google-Smtp-Source: APXvYqzwLKvM1hEt5S+/RZGioP8rLTZCageVp8c98fn1RIYt39e9v/S7ytPFoajyUtUAlye133fipg==
X-Received: by 2002:adf:de08:: with SMTP id b8mr16247723wrm.282.1563005105302;
        Sat, 13 Jul 2019 01:05:05 -0700 (PDT)
Received: from pop-os.baylibre.local ([2a01:e35:8ad2:2cb0:2dbb:fac9:5ec0:e3ef])
        by smtp.googlemail.com with ESMTPSA id o26sm9621634wro.53.2019.07.13.01.05.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 01:05:04 -0700 (PDT)
From:   Alexandre Mergnat <amergnat@baylibre.com>
To:     robh+dt@kernel.org, mark.rutland@arm.com, jic23@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        baylibre-upstreaming@groups.io, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v4 1/3] dt-bindings: Add pixart vendor
Date:   Sat, 13 Jul 2019 10:04:53 +0200
Message-Id: <20190713080455.17513-2-amergnat@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190713080455.17513-1-amergnat@baylibre.com>
References: <20190713080455.17513-1-amergnat@baylibre.com>
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

