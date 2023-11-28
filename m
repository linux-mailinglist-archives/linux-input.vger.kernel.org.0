Return-Path: <linux-input+bounces-318-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2B7FC82F
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 22:48:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D11E01C20E9E
	for <lists+linux-input@lfdr.de>; Tue, 28 Nov 2023 21:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B15644C9B;
	Tue, 28 Nov 2023 21:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E7510EB;
	Tue, 28 Nov 2023 13:48:21 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6d7fa93afe9so3521392a34.2;
        Tue, 28 Nov 2023 13:48:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701208101; x=1701812901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t7ww6mzqGGsPSUlmzuVBNdpMvbBkDIB8lVn3IEY42Yw=;
        b=OUSOzlMkutmpO/8LaqU0b2QWTG0+mxb6y24078ZbqgagW0UPA7YESsUkkZ/cPgqjbq
         oEnjZUK2wNR3Gnb87gtV2C5KQbtoV+CTF59u28WtZbgcDENDW+cjh0PG5qJoVEcD7gy0
         C32R0sCHWh/aS1h9m/wE2HpUNI+eZEsrSfDTr1yNzbwFy8A0fKP2IsTGPCR2b2z4ktVy
         chOfLxxfveaOImGxilUoX75LgJwwBMRQtk+SYO9m/L74TBbgGF8FJPxx6Z9R7eoJx/jy
         zOPtWV530Ycoi8flaG3QrZd0xKGTREbKFNOgCpjbF1F1kNLf6a9K4n7CXgL/XBNDHV+i
         JtBA==
X-Gm-Message-State: AOJu0YyqPZM4L7YFzf4q+4oZVRBoEzqy2r0XBCkPL5OXf9yCTGUZb1s9
	3r5G3OtfxSARG2YNBeZm/A==
X-Google-Smtp-Source: AGHT+IFfsLzRsqEDpTBO+1cbp0LH2t58zWoYprlXnC0BcWPBMKo6S3NXELnekLsFxwV0oLfQIukP3w==
X-Received: by 2002:a05:6830:4390:b0:6d8:1889:72af with SMTP id s16-20020a056830439000b006d8188972afmr11498728otv.2.1701208100908;
        Tue, 28 Nov 2023 13:48:20 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id be5-20020a056830350500b006d6496747b6sm1789545otb.80.2023.11.28.13.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 13:48:20 -0800 (PST)
Received: (nullmailer pid 3975986 invoked by uid 1000);
	Tue, 28 Nov 2023 21:48:18 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: input: mediatek,pmic-keys: Drop incomplete example
Date: Tue, 28 Nov 2023 15:48:16 -0600
Message-ID: <20231128214816.3975893-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The example for the Mediatek PMIC keys is incomplete as the binding is
the full PMIC, not just the sub-functions. It is preferred for MFD
examples to be complete in the top-level MFD device binding rather than
piecemeal in each sub-function binding.

This also fixes an undocumented (by schema) compatible warning for
"mediatek,mt6397".

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../bindings/input/mediatek,pmic-keys.yaml    | 24 +------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index e34c9e78d38d..70567d92c746 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -90,26 +90,4 @@ required:
 
 unevaluatedProperties: false
 
-examples:
-  - |
-    #include <dt-bindings/input/input.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-
-    pmic {
-        compatible = "mediatek,mt6397";
-
-        keys {
-          compatible = "mediatek,mt6397-keys";
-          mediatek,long-press-mode = <1>;
-          power-off-time-sec = <0>;
-
-          key-power {
-            linux,keycodes = <KEY_POWER>;
-            wakeup-source;
-          };
-
-          key-home {
-            linux,keycodes = <KEY_VOLUMEDOWN>;
-          };
-        };
-    };
+...
-- 
2.42.0


