Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B268143C21B
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 07:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239395AbhJ0F0E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 01:26:04 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:48064
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239383AbhJ0F0E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 01:26:04 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6BA4A3F19F
        for <linux-input@vger.kernel.org>; Wed, 27 Oct 2021 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635312218;
        bh=/eGAYrfmclwdx7jGRlDUTYADEJYv96FFq23ZZIcfgnc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OyGBgOMac1mR0H7ZN6Y0zok03Ppxt73c12H7gRlTWKnpxeMEtUiQB7GcwgnznnBwo
         X2BZjICOIdpTh2MhOOkQjyPHKarJ++oVFX6G9O8aTsxEoth66JpAnXAxPre8Nf0pEw
         64hGesDJQEVydY4v1IIARaYdaRL8d1QhcOONcSfTVFLd31l3kApNmOC3EFUY3Wr8pa
         LomkP7IyTS/GGW0tHJdjjUprNOVqWIHU5y2SZJh8u2uGPIC4rf9ZiXN2X19NlkLlPB
         lvFRLJ7Os4ujD8MhuUEZr1CXnHlmCIDVJDgQN0lUVnCDT2rEtfPbuAahgP7BnUrjaw
         YOZUelhE7i3NQ==
Received: by mail-wm1-f69.google.com with SMTP id i187-20020a1c3bc4000000b0032ccd252cf3so723425wma.7
        for <linux-input@vger.kernel.org>; Tue, 26 Oct 2021 22:23:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/eGAYrfmclwdx7jGRlDUTYADEJYv96FFq23ZZIcfgnc=;
        b=GHZS1nApeY+AnV5fQiDvsrEz3q4HCWBuL9H4YAT/ulbjDbx1hTOWSSzjKWDFODra8E
         M7vLYU1rpyw2Nt5vWjXb8d//PuOvRwnwEICeVns05ipoPMWQl4FU6zTiyxUfrcRvlt8P
         IHmyu3ns0Ns5Aytt6fhcZA89Oz9z6e7G1WBzJHM5MObRGc5IlfWIZ6BuxN110BgKOAK7
         8bvyziVojQbgW0vFr7VQZ8viXaF9x26+1sTkUFLZx8Bg9/SOAIgBgGGxM2OEfboa8dwG
         BL2KsIWni+o/tGoi5sc9g9TXnIqUDC/AsZwB90YKwkLJmGJBdM1x8t++5+Vul2qixAZd
         IKQA==
X-Gm-Message-State: AOAM530pnzfRFQcA4O4pcje9lY2sRP2OvMWaJzjqmmBjNI1K1ukhn97t
        WXl6bQAUAo4ekObi9oBBv+/lO+ZNMAESHxPl3OyauY6pNO8T+9Gj8dAQvmd2HU0U8ZDVTmfiEaP
        xGLpDr3U2p6EVHKmYTCM6C+j+mzj+fnDbhUsIF5jf
X-Received: by 2002:a05:6000:1c3:: with SMTP id t3mr4710484wrx.116.1635312218001;
        Tue, 26 Oct 2021 22:23:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzSn0tvEVIOmPrkhfc2HoML7XWosKA97vPocSy4io+emZcEKjdlxBCH/7JaC3wgfcVoNGW6yw==
X-Received: by 2002:a05:6000:1c3:: with SMTP id t3mr4710455wrx.116.1635312217804;
        Tue, 26 Oct 2021 22:23:37 -0700 (PDT)
Received: from alex.home (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr. [2.7.60.249])
        by smtp.gmail.com with ESMTPSA id y23sm2442148wmi.43.2021.10.26.22.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 22:23:37 -0700 (PDT)
From:   Alexandre Ghiti <alexandre.ghiti@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: [PATCH 1/2] dt-bindings: mfd: Fix typo "DA9093" -> "DA9063"
Date:   Wed, 27 Oct 2021 07:23:22 +0200
Message-Id: <20211027052323.1788476-1-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device described is the "DA9063", not "DA9093", so fix this typo.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 Documentation/devicetree/bindings/mfd/da9063.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/da9063.txt b/Documentation/devicetree/bindings/mfd/da9063.txt
index 8da879935c59..91b79a21d403 100644
--- a/Documentation/devicetree/bindings/mfd/da9063.txt
+++ b/Documentation/devicetree/bindings/mfd/da9063.txt
@@ -1,6 +1,6 @@
 * Dialog DA9063/DA9063L Power Management Integrated Circuit (PMIC)
 
-DA9093 consists of a large and varied group of sub-devices (I2C Only):
+DA9063 consists of a large and varied group of sub-devices (I2C Only):
 
 Device                   Supply Names    Description
 ------                   ------------    -----------
-- 
2.30.2

