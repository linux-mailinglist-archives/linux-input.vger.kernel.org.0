Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8D913BF986
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhGHMBy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:01:54 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:55935 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231802AbhGHMBy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:54 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6B5A758057A;
        Thu,  8 Jul 2021 07:59:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 08 Jul 2021 07:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=RXz/Mrv2ZOQSs
        988OYbwQ3ZEBSjlxX/Dj7PYFF7OJuM=; b=dF0OYEY0zGBKPIoHlCRLk+L6JHUG5
        qUpSTYGVb7d0f93Hj8m0BVpjIoPL5AWjtAsc0ZwKv50Ryqh+XJB6r7BCcR5uhm9O
        BZCDu1gA1a3cef1OAK0fOf3agKxKbzXqmx3hWGArLw/KxSQ4tLGLzd1gWAjuxkGq
        qQDQFbNk1Z0DNLtSvf4nO2EJklUKPeXjAUYWQwp2WZVtujTO0jy6L2TBzJ8ih70M
        u3ea/9k62WrbHMumTfQfbJ0Wm4z0TLCbMkQ0jtF8UprJSBDDSlhFziJ8/7H857kk
        TRBqUPyj+aRNiCakPV7W206zBr3AofN3WKDZ9Zot0Xa/quGHbGpR/CWKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=RXz/Mrv2ZOQSs988OYbwQ3ZEBSjlxX/Dj7PYFF7OJuM=; b=s0olmlAx
        6xVl4kdGFEty1qGTQE9x/wrNEzUchFO0QAvodoM7YEH8iJCfBB3vreV9IvSajEEp
        SEhLOURUUAraRjfBl4Uv0mUpxQ4noF/a0ebqZKUaAqp0ZsaN83ySRrcU2pJRG1X0
        PPib2vRIqwTCV6ect1C80KwI54uCqoLS1k1GitQmPZ9SHk3pFza2b27OLVivzves
        QNQntdAj45pTpsQi4kiEoEZtRMndnTciJcgGkb+V3f36ytFth1qO1KKRrGoIHXrx
        YiCD4j98CxwXr9atMPxwNtvzOJZbuB+q8BhrrCunuGISpbJNVbW8/+mnjWyGsGED
        24sqB3XE8+xu4w==
X-ME-Sender: <xms:kOjmYNUzwzzDkfN1f31Y_6lwdXEj1DNbNqrLXnb3wzNdcwIgP7ol0Q>
    <xme:kOjmYNmLAAZNy1Iid-jgwRiSq-q3mTJ53JA8K5rEkS0NYXoirat_HFCnnBxx3ROUX
    cfWM541EajRA3Ds43c>
X-ME-Received: <xmr:kOjmYJbZTB3digrm2eOmXchEgOSDe23S7piIZdxFkurhTebhs_UbiScOhxpPmWh3yrb52_mq74vMKvc0kjY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:kOjmYAXVYHQLCLwtuJ_IgNT_RXeTdrrS8MGvQOajmL_3L1bPV3JI4w>
    <xmx:kOjmYHn1fH8V4nPF2-TMmPGWNUFHlHsrZPVTWZnI40DiXB-urJbdOA>
    <xmx:kOjmYNfWMUfp6-1L5sSuO_u7h4ipSYCSnqYKrct2_tGuKjBaA2et1A>
    <xmx:kOjmYAfY34O-Iq4WkcXz8AnMPtQ10ZShvkjh7GsHVd5pOY3oqTI7Fw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:08 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 1/9] dt-bindings: Add Wacom to vendor bindings
Date:   Thu,  8 Jul 2021 21:58:45 +1000
Message-Id: <20210708115853.281-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708115853.281-1-alistair@alistair23.me>
References: <20210708115853.281-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2bbc27aae977..0199728d2eaf 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1244,6 +1244,8 @@ patternProperties:
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

