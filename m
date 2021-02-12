Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB9A131A2EF
	for <lists+linux-input@lfdr.de>; Fri, 12 Feb 2021 17:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbhBLQkz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Feb 2021 11:40:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231251AbhBLQiy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Feb 2021 11:38:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1BE7064E36;
        Fri, 12 Feb 2021 16:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613147892;
        bh=/r8OlkVb1UZ3ooJxgAqMaRYOERuR7leTS0IPlTRu2SA=;
        h=From:To:Cc:Subject:Date:From;
        b=UJV4wdzJ1WwvVfz5RcPglO/NNQWEjx6It0Z5G3Gmv4luzlE9K3hVoV9O042vrQKqy
         RuWNsIgYVK2GGhoLbU84XKv+SIp7ctc28v1s806tAAVg3qiv5d3bqjtiwpbnfSt5zF
         WYhQtH6Jwmvr6Yrr7DmoYZQZYhpyWJTkQV5PQDwyHNCGggccDURIHdPVR2LJU6SVbI
         SHKfooN4tlygJ4Hvf2zXhbszBM71dTqylzFRVlNXB8OB4BDs0rx+KdzCfk+GvFAMTt
         W5aqVYko4ykK2P47Odf/6hXV9t5vNq8p8SuGHVh9cD3plqeMB12jLRv8saUr+C1hk7
         MTACSSE2oQG2w==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] dt-bindings: input: atmel,maxtouch: add wakeup-source
Date:   Fri, 12 Feb 2021 17:38:06 +0100
Message-Id: <20210212163806.69996-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The touchscreen can be a wake up source and it's being used in DTS:

  arch/arm/boot/dts/exynos5250-spring.dt.yaml:
    trackpad@4b: 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
index 8c6418f76e94..eb69a8fc8498 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.yaml
@@ -53,6 +53,9 @@ properties:
       or experiment to determine which bit corresponds to which input. Use
       KEY_RESERVED for unused padding values.
 
+  wakeup-source:
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.25.1

