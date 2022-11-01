Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8431F614C67
	for <lists+linux-input@lfdr.de>; Tue,  1 Nov 2022 15:17:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbiKAORY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Nov 2022 10:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230269AbiKAORV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Nov 2022 10:17:21 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1F0EE1B78A;
        Tue,  1 Nov 2022 07:17:21 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 326CB1FB;
        Tue,  1 Nov 2022 07:17:27 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43F673F703;
        Tue,  1 Nov 2022 07:17:19 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Icenowy Zheng <uwu@icenowy.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 8/9] dt-bindings: input: sun4i-lradc-keys: Add F1C100s compatible
Date:   Tue,  1 Nov 2022 14:16:57 +0000
Message-Id: <20221101141658.3631342-9-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221101141658.3631342-1-andre.przywara@arm.com>
References: <20221101141658.3631342-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Allwinner F1C100s series of SoCs contain a LRADC (aka. KEYADC)
compatible to the version in other SoCs.
The manual doesn't mention the ratio of the input voltage that is used,
but comparing actual measurements with the values in the register
suggests that it is 3/4 of Vref.

Add an F1C100s compatible string to the list, and pair it with the
A83T fallback. Since the A64 is the same, combined both using an enum.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
index 5d631f7137e78..5efceb3138791 100644
--- a/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
+++ b/Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
@@ -16,7 +16,9 @@ properties:
       - const: allwinner,sun4i-a10-lradc-keys
       - const: allwinner,sun8i-a83t-r-lradc
       - items:
-          - const: allwinner,sun50i-a64-lradc
+          - enum:
+              - allwinner,suniv-f1c100s-lradc
+              - allwinner,sun50i-a64-lradc
           - const: allwinner,sun8i-a83t-r-lradc
       - const: allwinner,sun50i-r329-lradc
       - items:
-- 
2.25.1

