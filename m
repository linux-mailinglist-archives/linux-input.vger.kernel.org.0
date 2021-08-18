Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECD2A3F17ED
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:20:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbhHSLVT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:19 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55325 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238127AbhHSLVP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:15 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 0455C580C0E;
        Thu, 19 Aug 2021 07:20:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=32Umrmr7bVOCf
        HszrT7/dKCGNVfpwUR3PiX2IsuXkD0=; b=G7jqzqC6yTovn3LCiMtb7p0KUf2+9
        Y4RIDiopXJetGWEE4rQrZxhNqsUQ8d4Jo2VSo4Zoz4RkJepxxfbPtuE+KIOGnbmq
        089xqLCFJ31yxqgV8SqVl+4XO4SWUEfRIcAo1vRDhsMNOGIwXs7DiCH0/uezNWBC
        arByJysxScbcq5KUsf09SoXqUoWrAqz7wj8pZKGnPJANP/X+vW5fDoxCsKBzJlIW
        UvoApDWdbb/pn2AGkbaaEsJxSq6yQSSSdQNvCoH9My6Xp1FvKVnyRWFsE6zZZn9z
        CFoZ55LNS/J0rOZTtDYNQGDpfTLxdOg39uk4A9WAecJ46YUeczRTMVAmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=32Umrmr7bVOCfHszrT7/dKCGNVfpwUR3PiX2IsuXkD0=; b=liXOY+Lj
        W7WaQVAekz4qYU1oSzl6GxYpdrXTHy/lE/uhSWbB6ysgkCX/f/gqT0FoF5cDaEUu
        0bLcQSE77of1gKxSZkMpNbU5R8x9xebN1h/t4K2xuCU0LSChWxjjcBQvYcbBA/wV
        RRi/vC4S5fESEyRJLOT7fIQ7ePn/w9SUbjaTJpJQMFUNA50mIMP62gQG27+P+l7j
        RgzJGYK0eMCYtHcKTjnus64eTEwgJcUbMpOsRwvmuKsm2t8++mbwfLlulh8wvVG+
        S4Q1nLKP+gp86SyPFXwObs6hYGsV+mJOdO8Fjv6g2vHRG4LjsxL8qW0Xk42TebPX
        Vakk+V5413Tnyw==
X-ME-Sender: <xms:hj4eYZBywfROU_llM5HvL8DUCTzXoLlALWLKONGGypU6gio8684RzA>
    <xme:hj4eYXhDAcg-VGJk2-WFua9lyZbh29uIjAwZcDgeNlUNl1_hnZKiRiKrJrpoeo6hi
    nvyt8ST-yJPNrLBycw>
X-ME-Received: <xmr:hj4eYUniJ4Xuyf0NPaQ6UnjLiHx5ssW6HveGtoVm97IUPjf-qP9Rih6rOQ-V1nkVey6-I2cKI3TlUFF7y6VbzUtdVXfXAo6jMOPQieJtt9T9SqT90Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehlihhsthgr
    ihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqe
    enucggtffrrghtthgvrhhnpeeggedtteejkeeggeeugfehueevudegvdetjeeviedugedv
    tdekffekhedtteduhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:hj4eYTxbeLUheQrmEN8PP6RAldFblwSIjsF2QEPQO__tTWj_lALpYQ>
    <xmx:hj4eYeSEysUd6TrLDRz6IwZWZ0MVCK5AF5KuAdmIdWxarLW0SHWJsw>
    <xmx:hj4eYWYJtuXeKXjJ7CUpmIgAHo_CBvngcp0-j9PsxrKZow1-I70TPQ>
    <xmx:hz4eYaZBGYDduvNm-_nr473I7c0f31fonhhsH1apFOpxGTLIanKKzA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:34 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v9 01/11] dt-bindings: Add Wacom to vendor bindings
Date:   Thu, 19 Aug 2021 01:49:25 +1000
Message-Id: <20210818154935.1154-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210818154935.1154-1-alistair@alistair23.me>
References: <20210818154935.1154-1-alistair@alistair23.me>
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
index 4dfaae537daf..31745c45dd92 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1252,6 +1252,8 @@ patternProperties:
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

