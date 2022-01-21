Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEFB1496058
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 15:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350814AbiAUOEV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 09:04:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380950AbiAUODw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 09:03:52 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A72A4C06175B
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:30 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id i187-20020a1c3bc4000000b0034d2ed1be2aso27828096wma.1
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=b9Qbow8A0YPWPn3/lM+2GnA7PMQAnbZ2M1lFPHFZxvI=;
        b=iLBvT1rCA9fzZwk3qDs+fOqABHEY57jiB8s6aoCN2xtmXNgFBPi8cTSJ6M+sjOxfKD
         ML5LjOJJmQaxWaMgHGMOkqXx9FAKKH0RSJ1gxob9voRk1h+hqcb65A5NZPYuLrnO8+oQ
         +fUCJzkLi8vOoZ+YUkDI9ZNFiaoLd8UJ8E1xmD2qhNdmzv6lIUii/8wLPBslyy5gyxy5
         ieiVr8m+9jjE5ZKvDwjg0mCUp/wjjSs4n0VXMOsRmZ14yBIGPZqIcBMt8uqGi9S+jzvd
         3qZTi3PzWk/oNQMoTRkjYQ/Rk35xR1gJyFyjXMa4cWfPOUwATdabAQivzxwD6yRZ0NBF
         b4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=b9Qbow8A0YPWPn3/lM+2GnA7PMQAnbZ2M1lFPHFZxvI=;
        b=cRVSFr1o89OBewwuZYBZ4VwDfrz23E7aazzBA2J5CboruUFKOmeEiCB3N1zcZ2l0o0
         bTZvRSdHHla/S1mmgXllQutye4pVcQAV+vsoxgAnpI10GWW2aVMLeOuCilMEi38I+gOC
         Z0KiyQR4+SzO/2+suY49jaG9HVytPjFUzQ5yBq1FUUh66hXawUXOL9Kpj5fnwhi7tYR7
         8gLfF0FoZqwCgJ+qDtrenqDXBAFc1XvsDR49ryi1olt5MRRf/leuC6q7zuJRHzb+SWrx
         DoI9tw4Q1TwaFn38hGvQWUCfRmNO64UPtEG0+WzJaTaecx6+ir1hhoj2CZt/Dn7W+jXs
         WpnA==
X-Gm-Message-State: AOAM530SfaNN/4ZiUiwBMxavYKu1AK+hsgWwunZyvgSfb/adkw+Pb94F
        reSk6qAeHLgVNJWsHbVqa07G7g==
X-Google-Smtp-Source: ABdhPJze8JkZPt8YeJNz4+qQXr+QI1NypQGJpv1iLMTMx8IGenCg7ujdHDkOBgABZTcC58knzAWJHg==
X-Received: by 2002:a1c:1d45:: with SMTP id d66mr899724wmd.24.1642773809302;
        Fri, 21 Jan 2022 06:03:29 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr. [86.201.52.205])
        by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 06:03:29 -0800 (PST)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/4] dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
Date:   Fri, 21 Jan 2022 15:03:21 +0100
Message-Id: <20220121140323.4080640-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.32.0

