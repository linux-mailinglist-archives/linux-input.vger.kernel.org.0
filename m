Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98181169249
	for <lists+linux-input@lfdr.de>; Sun, 23 Feb 2020 00:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgBVXVz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 22 Feb 2020 18:21:55 -0500
Received: from vps.xff.cz ([195.181.215.36]:34178 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726881AbgBVXVz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 22 Feb 2020 18:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1582413271; bh=ZfpciIj4N/ohC5xxET/7O8AAxYB9cySsBo6ydi0t5+E=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mBIbednIO0f1b1OU46STOHFWNVaSoDFgW9GXvd/AxkhWoElcraX72ilVHdTdRtHbB
         wS/hbfGVmYtFnU2ZvVuRqm1pmCotSeoX4JbTDB7OT3smhLf9ka5SZJNiQuZMjBJw4g
         o2Tapz8AEKRv0T6titDi7YC14Z3/qawG3YLziTMM=
From:   Ondrej Jirman <megous@megous.com>
To:     linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     Ondrej Jirman <megous@megous.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Luca Weiss <luca@z3ntu.xyz>, Tomas Novotny <tomas@novotny.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: input: gpio-vibrator: Don't require enable-gpios
Date:   Sun, 23 Feb 2020 00:14:25 +0100
Message-Id: <20200222231428.233621-2-megous@megous.com>
In-Reply-To: <20200222231428.233621-1-megous@megous.com>
References: <20200222231428.233621-1-megous@megous.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It is possible to turn the motor on/off just by enabling/disabling
the vcc-supply.

Signed-off-by: Ondrej Jirman <megous@megous.com>
---
 Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
index b98bf9363c8ff..f8f4093a0a454 100644
--- a/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-vibrator.yaml
@@ -24,7 +24,6 @@ properties:
 
 required:
   - compatible
-  - enable-gpios
 
 examples:
   - |
-- 
2.25.1

