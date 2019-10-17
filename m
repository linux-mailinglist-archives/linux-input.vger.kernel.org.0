Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7474DA616
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 09:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407994AbfJQHMv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 03:12:51 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45546 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407993AbfJQHMu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 03:12:50 -0400
Received: by mail-wr1-f66.google.com with SMTP id r5so984805wrm.12
        for <linux-input@vger.kernel.org>; Thu, 17 Oct 2019 00:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=02ptUi820rtgb1rVywdXHHVh+A6FBo6gb2V5cVn00l4=;
        b=TMCOuFGslVYaietD3Npaye2HNfQyRxbQihRWW/0tacQLD/VcOtmBgnO21eTt/nyM+f
         yeNG7TvCKABshRGXDI5Lh5arQn0Rg5ZRQE5owPHB9yWQZLU0viVX5zHNHY4jcFe+saPl
         pEK3jQ+5P5JVqc9u9OA2ZcUDiIvr6Idfwl7muzVO905/jq7CpQZtc2KBiV37gTLZlydL
         5IAmyx/D6uHUKZ3xbK1cV/TOSFS+NTjsy/4Bc6bnDTRP8+CHeB5ebrSPm1kfJd5QNGWg
         +xgi0+y9lDv6DKi1IZOa0kmWI4BW3HjJlvWhPyjjVepYpEb6sis1TRBIgFN/BxVlINeZ
         bUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=02ptUi820rtgb1rVywdXHHVh+A6FBo6gb2V5cVn00l4=;
        b=KQxeXKzS6jJ0ioxWt9GPdfD67ha1oK0DMNgrmcOlQTs3ZGlZlDvI5RXh6OwD+H7iO5
         6k49t6EVf0ioF7Nrg6MLc52evyDoHFN9d5g4hQ9vVLtLmZ6DZnEn7alP49OBRnyqsRXB
         vov0bcMHV2BVhKGeZp7Xwww4vvr+4CW5XdC3JNFgosazNjbTRDptSGwgXbI4pqL4gg10
         yXPfMO2ihRCj/4R1SndF/4Ll/Jf/IoWF+dETbJ9Mwx2pFJM8gXt2q689fUH8Hs0U/If0
         xUrOcSQurQG3xERg02eYVDcbp6706ePy7tAxm+E6T5fdCIcTNjUHkgTZlTxjlcqu7aYb
         vXYQ==
X-Gm-Message-State: APjAAAVp7bNefcTR66ZlqgZ4R4Yh74Rz1opukc1luw4HWPMX2z3MwxBY
        JtK1DLzwsx/9yVSG6bCe47u8IA==
X-Google-Smtp-Source: APXvYqwavR8cAD6sd1m49Q97NupEKTiiZz7QIevjs5S9SSkZYg8tuEDju8swtsi9FLS3lhJYAoVutg==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr1666117wrq.227.1571296367586;
        Thu, 17 Oct 2019 00:12:47 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id n22sm1156689wmk.19.2019.10.17.00.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 00:12:47 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 6/6] MAINTAINERS: update the list of maintained files for max77650
Date:   Thu, 17 Oct 2019 09:12:34 +0200
Message-Id: <20191017071234.8719-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191017071234.8719-1-brgl@bgdev.pl>
References: <20191017071234.8719-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The DT bindings for MAX77650 MFD have now been converted to YAML.
Update the MAINTAINERS entry for this set of drivers.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a69e6db80c79..c05e6fd6aedb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9903,8 +9903,8 @@ MAXIM MAX77650 PMIC MFD DRIVER
 M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/*/*max77650.txt
-F:	Documentation/devicetree/bindings/*/max77650*.txt
+F:	Documentation/devicetree/bindings/*/*max77650.yaml
+F:	Documentation/devicetree/bindings/*/max77650*.yaml
 F:	include/linux/mfd/max77650.h
 F:	drivers/mfd/max77650.c
 F:	drivers/regulator/max77650-regulator.c
-- 
2.23.0

