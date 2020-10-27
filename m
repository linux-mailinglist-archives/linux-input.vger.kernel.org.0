Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B8D29C609
	for <lists+linux-input@lfdr.de>; Tue, 27 Oct 2020 19:26:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1825641AbgJ0SMN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Oct 2020 14:12:13 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43289 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1825631AbgJ0SMK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Oct 2020 14:12:10 -0400
Received: by mail-wr1-f67.google.com with SMTP id g12so2951779wrp.10
        for <linux-input@vger.kernel.org>; Tue, 27 Oct 2020 11:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
        b=P2UTQj+r1SEKRJedJWTFLKzP8So657DIQN2igB9WKpnJ856BOvDDfhLzT9DqoAdWF2
         kGplRYYu2HTJ/KE+eIhW6lNcI0+4I03RUL690XQRmlOGVhnMfC9z7AgiiKr43rrcu7Ck
         48qsUdqDxpTL6c0x/WWSVXeMrpZ1T44svS/CO1rtcP6PIONfvEZ6w9Dm16JaqQQW+Fa5
         N7dq/PTYCc6okwxpphEDjOj1VsK0sCgDoiH7qemoPGPyYaZ2o7NSEH1RSbUjqWVQuavW
         4PQH5Tva2lt4aKmDZS5K36KPM79gR3Kz4coyHN2BcqYhepP+5Xb2e6QUlw9MpJjnOBun
         vpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AizmEGLJWCh5e+BIl/5tzrCIJ5dIEIgB9BBqx3BLDyw=;
        b=q9kWnXGB0bKEtWxXNJ5JqMNGuLVSR1QLe4sXcr3r42wMlgkDxk8sein6AK7CT/6gB0
         Y/YmZzaO9WgJ4bPqD+6ir8paScy3GbhkT1rs9Ysi7ukKFk2x+1VAg5WMo08s0iRqTtuV
         omtX8ewQqn51oSjU0nvhjKEFNBgm9RNqNVrBaZz7Rx6ZhKLY/P3/962UL5JyUzOUSnnZ
         KnSyWui3G54ukcxQ0MVpKJgqj2UgPt6urH4hdE+7fAztoFdyMULAXst0Wrn0l6D6yiTU
         sjamTRivZdmisnOCwMa9OihzG1Po4XK/OAuXpwGAMXc251WxfHhWiKG9rn4iFfQS2a+A
         x78w==
X-Gm-Message-State: AOAM530kprQ66a1eA/Mg0ktDmMbx/+nUcOOkrS1pNMsO/x2I/nGYkGxu
        eZwIqMa/bIZI76KHz+p2KTGghA==
X-Google-Smtp-Source: ABdhPJzW9nq4LkblMc0w9V7lubC2UdibGY38QsWzOP+oXqTs8LAZbRDjEIXechCCEn18xtlwRn4ufw==
X-Received: by 2002:a5d:6052:: with SMTP id j18mr4408374wrt.306.1603822328165;
        Tue, 27 Oct 2020 11:12:08 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net. [81.185.174.159])
        by smtp.gmail.com with ESMTPSA id h206sm2801224wmf.47.2020.10.27.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 11:12:07 -0700 (PDT)
From:   Fabien Parent <fparent@baylibre.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Fabien Parent <fparent@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 RESEND 2/3] dt-bindings: input: mtk-pmic-keys: add MT6392 binding definition
Date:   Tue, 27 Oct 2020 19:11:55 +0100
Message-Id: <20201027181157.862927-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201027181157.862927-1-fparent@baylibre.com>
References: <20201027181157.862927-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the binding documentation of the mtk-pmic-keys for the MT6392 PMICs.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

v6:
	* No changes

v5:
	* rebased
	* Rename MT6397/MT6392/MT6323 into MT63XX to make it more readable when
	the list of support PMIC increase
	* Removed Reviewed-by from Rob Herring because of the new extra changes
	made to this patch
	* change the compatible for MT6392 to also contains MT6397 since MT6392 PMIC
	key driver is compatible with mt6397.

v4:
	* Patch was previously sent separately but merge to this patch series
	since there is a hard dependency on the MFD patch.

 .../devicetree/bindings/input/mtk-pmic-keys.txt     | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..71c82687ab92 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -1,15 +1,18 @@
-MediaTek MT6397/MT6323 PMIC Keys Device Driver
+MediaTek MT63xx PMIC Keys Device Driver
 
-There are two key functions provided by MT6397/MT6323 PMIC, pwrkey
+There are two key functions provided by MT63xx PMIC, pwrkey
 and homekey. The key functions are defined as the subnode of the function
-node provided by MT6397/MT6323 PMIC that is being defined as one kind
+node provided by MT63xx PMIC that is being defined as one kind
 of Muti-Function Device (MFD)
 
-For MT6397/MT6323 MFD bindings see:
+For MT63xx MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6323-keys" for MT6323 PMIC
+	- "mediatek,mt6392-keys", "mediatek,mt6397-keys" for MT6392 PMIC
+	- "mediatek,mt6397-keys" for MT6397 PMIC
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.28.0

