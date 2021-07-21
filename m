Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D333D1097
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 16:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238954AbhGUNYb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 09:24:31 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:45931 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238938AbhGUNYb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 09:24:31 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 96AFC5809C2;
        Wed, 21 Jul 2021 10:05:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 21 Jul 2021 10:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=X1X2+qYvDkQAa
        133g2cfXkjossTVwdp97+1vx5XvOdw=; b=pYFhuLzVy3cAV3Kt6dVo/2dW/y3c3
        nBZ3Tgf5DPLFK9bvUsIpRukaswYrOjgSNlDiZjdNsRkxKCNrz4g6/MIlQDd07Zr1
        h/4xzdkirdq9j5wl7u/QLXBQ53RlLaMq986ad9pZn5oxLuv2z2cgTBVN8eQQKh6H
        Yc/Isx7FYLFBHLHAg+RWgLN72I86OHlBdgtCD/4eS9oGssSwjdAvHxTs630t/xFu
        a/IMmleM2p/1KmGQbAmcKmSNxwOzsF9lP4G1soHRLvHOY7OmoN2Nlq830vogV/4K
        tPz/zsVOgNoPw0KcQcEq3i5GWx6jStAbjltSFfYyrx6EmZZCjRbOSUN+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=X1X2+qYvDkQAa133g2cfXkjossTVwdp97+1vx5XvOdw=; b=bE5HVXNI
        tWD24/bPMsPvi1cBAjEfgy56TTXCNYTzxWGSUmRx17L+45EcYvEwivZzxLBCC6x8
        Mp1kv9AQd8JkFVDNDV0GkbRm8lFoN6X19KuPnzWxe8z6Xq/pfEWxvN0BzstMQQJ9
        3GfazLHTWVnazo0g2tE+nwl8VJPXi5mnYR+gWiGOGlgEAnP6pe7YsMOu8Iq75rOH
        hRzmpi2K9XS1ZUKghAk2pEsNd1v44OUPw18bg1sRFxPQ9vAxtEilnIlkx78/p+Fd
        KmgGz9oOd3J7Q0IYVHd3OqgYoHB8rIBpd+FATPnQ16IY3m26daTHftk5pm4excWX
        IP1dSkto1eqdpg==
X-ME-Sender: <xms:kin4YL91YcOXZgv227qYSUVOjpS9jb3LWqabakCevcxh5-8zSPUzzQ>
    <xme:kin4YHvYUjYCzUAuTZFwgygbYwFVbxOR8ZMYkglKeeWXYSzzn9FoX5pw7BbFc_yC6
    UhmQ9ihLnVu6wdNGCk>
X-ME-Received: <xmr:kin4YJAGicLiuBGqMcKGxruBseYv3__A7okp7H0LC6hePjhCHP0MQJuGCv1TcZ4SVyzQ_Xza0a8Ki_r29PItcbdDRFyqMHLaGYw1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
    evohgrshhtrghlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffojghf
    ggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcutfhiphgrrhguuceomhgrgi
    himhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvghrnhepveejieejtdevgfff
    gfejuefggfeutdelteekgeetueeftddutddtgfffhffgueffnecuffhomhgrihhnpeguvg
    hvihgtvghtrhgvvgdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kin4YHeX4CGTe0zvH0h0n-7N1yu0VarygpZTYcqq2TFPktu-P755tA>
    <xmx:kin4YAMsrUTABXc3cj4YWZzJyJ8kNDJ2O6XDHBCZ5Z9j1yDR_eaAig>
    <xmx:kin4YJkL8YDGCpRsZHjNzHQI1iK4s4LmJmgN0TVXVMi4Hugac3HnjA>
    <xmx:kyn4YPqDNrqJtHF51Kkcnh5nblv_TVBnOBN_VQLPEzpWY7afyef6dA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:06 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 18/54] dt-bindings: input: Convert Regulator Haptic binding to a schema
Date:   Wed, 21 Jul 2021 16:03:48 +0200
Message-Id: <20210721140424.725744-19-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Haptic feedback based on a regulator is supported by Linux thanks to
its device tree binding.

Now that we have the DT validation in place, let's convert the device
tree bindings for that driver over to a YAML schema.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jaewon Kim <jaewon02.kim@samsung.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../bindings/input/regulator-haptic.txt       | 21 ---------
 .../bindings/input/regulator-haptic.yaml      | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 21 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.txt
 create mode 100644 Documentation/devicetree/bindings/input/regulator-haptic.yaml

diff --git a/Documentation/devicetree/bindings/input/regulator-haptic.txt b/Documentation/devicetree/bindings/input/regulator-haptic.txt
deleted file mode 100644
index 3ed1c7eb2f97..000000000000
--- a/Documentation/devicetree/bindings/input/regulator-haptic.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-* Regulator Haptic Device Tree Bindings
-
-Required Properties:
- - compatible : Should be "regulator-haptic"
- - haptic-supply : Power supply to the haptic motor.
-	[*] refer Documentation/devicetree/bindings/regulator/regulator.txt
-
- - max-microvolt : The maximum voltage value supplied to the haptic motor.
-		[The unit of the voltage is a micro]
-
- - min-microvolt : The minimum voltage value supplied to the haptic motor.
-		[The unit of the voltage is a micro]
-
-Example:
-
-	haptics {
-		compatible = "regulator-haptic";
-		haptic-supply = <&motor_regulator>;
-		max-microvolt = <2700000>;
-		min-microvolt = <1100000>;
-	};
diff --git a/Documentation/devicetree/bindings/input/regulator-haptic.yaml b/Documentation/devicetree/bindings/input/regulator-haptic.yaml
new file mode 100644
index 000000000000..b1ae72f9cd2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/regulator-haptic.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/input/regulator-haptic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Regulator Haptic Device Tree Bindings
+
+maintainers:
+  - Jaewon Kim <jaewon02.kim@samsung.com>
+
+properties:
+  compatible:
+    const: regulator-haptic
+
+  haptic-supply:
+    description: >
+      Power supply to the haptic motor
+
+  max-microvolt:
+    description: >
+      The maximum voltage value supplied to the haptic motor
+
+  min-microvolt:
+    description: >
+      The minimum voltage value supplied to the haptic motor
+
+required:
+  - compatible
+  - haptic-supply
+  - max-microvolt
+  - min-microvolt
+
+additionalProperties: false
+
+examples:
+  - |
+    haptics {
+        compatible = "regulator-haptic";
+        haptic-supply = <&motor_regulator>;
+        max-microvolt = <2700000>;
+        min-microvolt = <1100000>;
+    };
-- 
2.31.1

