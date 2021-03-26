Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B11B349F19
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230338AbhCZBxM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:12 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42189 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230289AbhCZBwn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 292FE5C007B;
        Thu, 25 Mar 2021 21:52:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=Fi4qfAKGJys5lTo7IxdIoYS++m
        MALYmFVb1DZrJgwWA=; b=XyKATd5hEKnCMZzI/SPB29Yzb733DLTJoLXCOPYAS9
        jzXGICK4Sbj28eGto73tMvNh8LIHva9AR8dfjvOQoZLAa9wbYCUrdasPlsj3waiD
        5y9eNx/PArlmhWW4w8NswKCiNSAuyFYpbukqgI2vfJrPxqJBiSh1iKZndIa23dV3
        /CKEpx74s5Mxm0o5hIg40riYUY0HQv8HN5Y02t89jbjRieXjwwTlPa/CYk5h5cI1
        cA4E8lFwlINhQi2Ygh7dbJrsEvhc79MVxpKV2PjMDoRxWGIyXN1PiQhIoRz3pYyk
        kSpje6SkJ1E7yXwsTXuKAWPahLfljga7W3Q9rRYiJcoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Fi4qfAKGJys5lTo7I
        xdIoYS++mMALYmFVb1DZrJgwWA=; b=KIS0cCbJW3d8DXGummY4sXhJ8klpLNJCh
        gB0LgJH394dhCOv5gknsj9SIwLMV9fSIIz1gfQ6pixft1n0fn2KYR8dtkhFuHWbX
        qdDP5SffbFnFjVOCFl2Y6/7n57cKSgU68dCy7T3xsICKpJUH+NvHE3XiJ/4YJ/Hc
        UA4oelEbV2t66CIrK44qskyUy/sp8iyqTfQ19XXqP0EiTGdVMYwwJ4IFfyoDfPBJ
        RoEOJvs+CkAJKPsVJv81XExoMco+zl7GMNRF4RUpDxShyXM7F5nsoABW2Vk5Ocnc
        yoZhI7LXMyYI9056lnlcOD8aYfAlI4vfQ1118ymd2E99KHgwCDBJA==
X-ME-Sender: <xms:aT5dYAAOiG2JfoV3bmkUKELoPrmJIWnVTnj5PE-3cV-qMiy4g7Z4lQ>
    <xme:aT5dYCgSeA_B-3gC5ZLhRv9UKg5Yk6peuBzCGZrkmXiLgXtDtt29o7cn-S7jmCesd
    Si4MwC5hSuqKRNVTaw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepudelfedrvdej
    rddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:aT5dYDkDsNqjLqY1aBSOJ9i_5-m-iQYZydH-O6IsjvImIr6pcsQDbg>
    <xmx:aT5dYGwBRuuP6_i9ABYJc-RYSZWoBn6PlPwixAznwicvT9S-m2H8VA>
    <xmx:aT5dYFRn6UXkgMd31hWi-yRx9LbYqIQX1oFOzvvD92JvM-JK6A-tAA>
    <xmx:aj5dYHeF4DONngX5xZYZZ57EnuRsFesIS2NddddDjkeeiLBWXyLfTg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id DD8C21080063;
        Thu, 25 Mar 2021 21:52:40 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 01/10] dt-bindings: Add Wacom to vendor bindings
Date:   Thu, 25 Mar 2021 21:52:21 -0400
Message-Id: <20210326015229.141-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a8e1e8d2ef20..996f4de2fff5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1216,6 +1216,8 @@ patternProperties:
     description: Vision Optical Technology Co., Ltd.
   "^vxt,.*":
     description: VXT Ltd
+  "^wacom,.*":
+    description: Wacom Co., Ltd
   "^wand,.*":
     description: Wandbord (Technexion)
   "^waveshare,.*":
-- 
2.31.0

