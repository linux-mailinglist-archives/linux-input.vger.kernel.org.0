Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAED03DE8C8
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234453AbhHCItY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:24 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38925 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234641AbhHCItW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:22 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id CD57C5809FE;
        Tue,  3 Aug 2021 04:49:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 03 Aug 2021 04:49:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=U3smuC21xiclnAcPm0Ugo61M+O
        k4GIAM2qkc0U+vSB4=; b=nKqkO4vVYQVSPC3CwB63cLS2wQOqI45dGp6q8AWmxB
        Vz0wv6dmoSqcPaAjpzJYUXDA/+3evLAw1hVPucjotzW/K55gOdg92Lrr8+JAFYmg
        e6uz+2CO4e9onYN4uMYyE4fI4oclyamIIa01PiN04GLHk1LLAUlTcBfNHxIwg+Tr
        u2R2ea6uM4jQFZpqQV9YYfqXpzD1mucuZVeJNd9E2uQwkYBOPYEn6bxKH4WQ8AFO
        8j7NSD7oOECrHZgJYNbylj/w7yNZ+0LFd4SF0Mwe5I6S8T/TFAgicu78myV0BbtI
        ugnBUWfO9Y6K/lbLWltoUSQ2Kks3z++tIu7qN6M7tp6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=U3smuC21xiclnAcPm
        0Ugo61M+Ok4GIAM2qkc0U+vSB4=; b=AWnxIELfCTMxO01+IGKFflnRMNVV/0jqI
        QAppWoPTRQjyDtLC0NNMVT7xJLtcRwlzZSJk0qi2o1S2JeXgNoKhAe8pI7SNxLNL
        asPFs72nssHezIp7QYNfIO1qSrMeNpRilS3KIfgTVXDGqPjlstTYpoCTfD3QqEma
        9v2/nSU4Am73YCRBbTR/V5OVqkQ7t4o4+CYiBMvrR2kt/jQuai6pPZ4Nwj0oz6x2
        nk1en5U76o3kFg7WzgNBMx61ZfPjwczfWTYVwoQGEQTGNQ5jDL5mIr8RDJEzOtqy
        mp3zydIObNUqk2wkBJyou4mdmyFZcv0ap3kwxAb+m1cA4RJnKQGNg==
X-ME-Sender: <xms:BwMJYaFW47IH0axo5urKZsh2xa3IuwU6fe96OxyitE4EqmX6v02aTA>
    <xme:BwMJYbWkAi0cTDYAPdXoum8ulUykgj2-ruLwfHCT3zH-ZK3-7zunfYiTSId39PMgx
    yoFF2z7PWeDESIXJsc>
X-ME-Received: <xmr:BwMJYUIXV07pwyOC6Lb7SSnYYK8uYRTw6GVz3LlZqMasn5bqwFFdNuws8WtwwxJqyjWPgVfEqTThczuiLKU0IBauNUf8ClRFzmokiLDzAwhbXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehlihhsthgrihhr
    ucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenuc
    ggtffrrghtthgvrhhnpeejleeihfdvtefgtdethfdtgefftdeiffefjeeiffefveeuleej
    heejvefhffeukeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:BwMJYUGftYuBn9HoaWOfTWagVIQIGrH-zgDWA-1IrmtEUufTh94SnQ>
    <xmx:BwMJYQX5mBNivNtjC0Q7Pp6uYzJeu63cL9-gMp6UJT-NNzWPmvxoMQ>
    <xmx:BwMJYXMhXy_9EMSIx_touVSTHC9baC9bq_KXiBHgTA44jl6-dGarlQ>
    <xmx:BwMJYfN2HEy4ALqJfJa5X7t-N2YnYInfF01jObEYncIcfkhMD1KWUA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:05 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v8 1/9] dt-bindings: Add Wacom to vendor bindings
Date:   Tue,  3 Aug 2021 18:48:54 +1000
Message-Id: <20210803084902.336-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Acked-by: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 07fb0d25fc15..71da86e7b3a2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1250,6 +1250,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^wacom,.*":
+    description: Wacom Co., Ltd
   "^wand,.*":
     description: Wandbord (Technexion)
   "^waveshare,.*":
-- 
2.31.1

