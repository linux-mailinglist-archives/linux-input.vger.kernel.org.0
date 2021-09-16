Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF3140E52F
	for <lists+linux-input@lfdr.de>; Thu, 16 Sep 2021 19:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242004AbhIPRIu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Sep 2021 13:08:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54162
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348369AbhIPRGl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Sep 2021 13:06:41 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 49DB440260
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631811918;
        bh=DAQLma/XFbnrzjxI0SYUnJSqV8B4gUk20L1uJrWXJWA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OUC8wvI9lFdeH42blmIE2cJcIHmvVg419YJWCWjn+oKuskCqECGmAvWH4QwKXvd+P
         UMb3ceCGUU3TJlBUn6XPRw6hazSjW+ffstGZoyfszQmZguzcDjTh0upbnk4Xe+0yM6
         NwRyf48hw6r9sFH0j1zUJK8AC7URcEb90D5Y9jR4uuX8MpeSj8AK1wKbiVUE9T7Bh3
         BTp4pwXUUSBDzHZiikN30G8AgOBnl0lzKMo3hDV6whkjcBdnD721MFtCX7t0E49Vds
         riPOpf2Jx92qT/sHr+FZxt2H3nHjFxvCvKuu0avCEUobonCCMlpEkSbMPBIu+Qvf5P
         yqPydJMZzi6HQ==
Received: by mail-wm1-f72.google.com with SMTP id b139-20020a1c8091000000b002fb33c467c8so3391588wmd.5
        for <linux-input@vger.kernel.org>; Thu, 16 Sep 2021 10:05:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=DAQLma/XFbnrzjxI0SYUnJSqV8B4gUk20L1uJrWXJWA=;
        b=gWucizVPYW3wH9H3dYI7RNfp28VMR5GbriUAxOgjfj9WDlGkUqzQujl/ijrLl444XA
         34aEm+v22ENN0BNAxPNUMjiAAsjiuDQ5grVLFu7sxkgqKfnD1fHCdOd2cGDNZTD87TkU
         UTXUxVGNbi2iecqtHMvsL4zRhcf2OG/Av2440/VyRVtctjYCSQTPwiU8qVXJ5Cnc00oU
         vAUJsmqh+qZuyFVDJv2e5DcAALkPJjBkSqL+vIO8R5iR3gTDm/T+iWbp5o46NoX6lXh6
         89vZPoFV9OwBvFO0QlilCIfwc9yxl/D1AEtQqRM5AXRg3WvfnOfqQXwTzLAE+r7nGRbH
         cFNA==
X-Gm-Message-State: AOAM533vTKPMwvencEXSktlusnJ/9zk+Hl3l3v5sjOkLV6x+wBzC99L6
        HxHXzoWfZY1wQknn8JQzUbrm8lkZnxo+gSzvTJPvao5bbvbwhJ99LJmQLHLk7GUv7FvwN4vwKvz
        9TvdLi8X7qvfYY64Ps/g/MyteMfF/Jccs+UV6NWw7
X-Received: by 2002:a7b:c947:: with SMTP id i7mr10785726wml.136.1631811917594;
        Thu, 16 Sep 2021 10:05:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx85llb8FjD0iSpfE2Kxi3/C7Wdiex3TjrHEMNpETw1JSJEKIQNgnjj3crKHdSsn0588cTSqw==
X-Received: by 2002:a7b:c947:: with SMTP id i7mr10785696wml.136.1631811917336;
        Thu, 16 Sep 2021 10:05:17 -0700 (PDT)
Received: from kozik-lap.lan (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id c15sm4139446wrc.83.2021.09.16.10.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 10:05:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH] input: max77693-haptic: drop unneeded MODULE_ALIAS
Date:   Thu, 16 Sep 2021 19:05:14 +0200
Message-Id: <20210916170514.137977-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The MODULE_DEVICE_TABLE already creates proper alias for platform
driver.  Having another MODULE_ALIAS causes the alias to be duplicated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/input/misc/max77693-haptic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/max77693-haptic.c b/drivers/input/misc/max77693-haptic.c
index 0d09ffeafeea..4369d3c04d38 100644
--- a/drivers/input/misc/max77693-haptic.c
+++ b/drivers/input/misc/max77693-haptic.c
@@ -424,5 +424,4 @@ module_platform_driver(max77693_haptic_driver);
 MODULE_AUTHOR("Jaewon Kim <jaewon02.kim@samsung.com>");
 MODULE_AUTHOR("Krzysztof Kozlowski <krzk@kernel.org>");
 MODULE_DESCRIPTION("MAXIM 77693/77843 Haptic driver");
-MODULE_ALIAS("platform:max77693-haptic");
 MODULE_LICENSE("GPL");
-- 
2.30.2

