Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57AE1B831
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2019 16:21:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbfEMOVp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 10:21:45 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:46613 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729353AbfEMOVp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 10:21:45 -0400
Received: by mail-wr1-f67.google.com with SMTP id r7so14873162wrr.13
        for <linux-input@vger.kernel.org>; Mon, 13 May 2019 07:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AUf8m75b1jcXgPG7N+MQYE2RSkYM8jBGz55TKb5hL3g=;
        b=aEfNnn+IfrPwWIU5xkBCmp50TmqPUsCXSA6rTulbbQ2PC6DDXGfjkMXMgKuHliOvi0
         b3NfiIJRaKglH08KEDtel0WexYxJv9i3cPCXmhFPqZIBGk+3fA1WVqJPot2RNKy++6Ld
         oxSuktx/cNdc/RDX8VW1WKXf26U2yO5PtzKRpUS/JqrqWsUtz9UIHleIzxtpU0eB0tzy
         od84ATyaVGGg2mjYZzCmhUvHiTaqt9I6dY+ps1eps8/wdjvoL5QNPD2M40tchmOkn9Lw
         8Fz4SB5YjUsoh/Uoa7AYS3Ev7afXIUH3TR3+pR8y2oal81KVXzPFSGEzP95FKpEzLOgN
         FaPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AUf8m75b1jcXgPG7N+MQYE2RSkYM8jBGz55TKb5hL3g=;
        b=XkC9xtdydTCXY76ODaw4NPM8hqdvBdWNLTGzca5nMrHbx2e5K8pg7ngTXgEfmnjH22
         Sj3vDlLCgZnGDkX1GNtJaR+znc9OF4Gywwy83iYAAdX/4l6Bo4P7SfbT7hSWZYgUD6Dm
         jyaRy1Z4Sr8x6Uo+U/iQn/ExowFv/pAJrenVrE68b7WAtHjKdlvHPXwa+G7bBkaea6hi
         MbprnZ+PUNvYmrrAnis+/E3MoOABNuFViW4Jur+BEh/OeTr4XZYCk7GEfZF9kM+vDCaa
         f4+QpGN8F+Uvx7h+PS6p8ebDP5Hiic6PGJ4wdOZRovO2t4E1zTDLHP/zrRaCbUst9Wdx
         G9CA==
X-Gm-Message-State: APjAAAVj3upBBBWwfNPhgpFXF7iSWmWCQlDsaMHGkhFlLDuE85FOkfLe
        qqumJb6ombG2ek3VHUFDuHbqEw==
X-Google-Smtp-Source: APXvYqzn91lD6eedmAzVssO5xswe1ZAQaefUBlpsZtRJs7YMayR6NIvT1sEdX34ZQ1nzfs4XhaBA1w==
X-Received: by 2002:adf:ef50:: with SMTP id c16mr1707151wrp.296.1557757303963;
        Mon, 13 May 2019 07:21:43 -0700 (PDT)
Received: from localhost.localdomain (aputeaux-684-1-11-31.w90-86.abo.wanadoo.fr. [90.86.214.31])
        by smtp.gmail.com with ESMTPSA id v184sm21133615wma.6.2019.05.13.07.21.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 07:21:43 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, matthias.bgg@gmail.com
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date:   Mon, 13 May 2019 16:21:19 +0200
Message-Id: <20190513142120.6527-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 .../devicetree/bindings/input/mtk-pmic-keys.txt       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 2888d07c2ef0..858f78e7262c 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT6397/MT6392/MT6323 PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT6397/MT6392/MT6323 PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
 node provided by MT6397/MT6323 PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT6397/MT6392/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6392-keys"
+	- "mediatek,mt6323-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/keys.txt
 
 Optional Properties:
-- 
2.20.1

