Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C052B363DB2
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbhDSIjt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:39:49 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55341 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229635AbhDSIjs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:39:48 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1C2DA5C007E;
        Mon, 19 Apr 2021 04:39:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=0HKqazXNqfs4VKoNzw2xDM3usy
        hk8xBQeC7/PRjOD9E=; b=qMnuHtJiOEkMXLi/hJw/4FtT6/MXzjAvJ1O5N/xbkC
        1Kvkkb97ovqpmwWazC7lPzh1xMUMOKoLg7DP4uMGK2Glp4HcH3YWgWqGDCRJGu0L
        K4KN/CZh9G5Nv3N+BX9SfSaS0VucTFXKx0vTctZdZrF5NA13KssAwnNvqxGDv4It
        CJscA5hSTdQGt7hJFwJZuORN4g7u3AP2+dmdcA9RjonV/QOTtKkMSONDEsrEArMU
        u9IKxDAR9+Bq9tOk+vRtDucKV1oKBQ1lPoX1Y5PWhSMfKaBMQWN0XvDzRZ/p8etL
        r7wKgqXGYk9L0IF0tJX6snVHjmhUEVzG9zAT1TyHPzrA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0HKqazXNqfs4VKoNz
        w2xDM3usyhk8xBQeC7/PRjOD9E=; b=kX++TCxmYialEnCplTz6SimctZ2mzZg61
        4S/KVCHw3wxvDRcb1cd7d5/PU59WSg2AGxr8BNI+Ss9/lYZJ91Z0Ne6D5cxke8wn
        RQcDyN9fjHxAXR3+Ul61rZJqSPniyG46QiMAHfUkUNsCffvYZlKYScClqzrLTJ38
        6AxbW5aAVoANG0XQwpoO+Wk3pSaHVkJeeGfk4LitLB3L02dFFTLM2r0rJya/xMid
        rzJcetqXgS8OPjdPBwHiBVFXKKIOknE150QsK9iATRjig+l4a0zXbyQ5Wak6nWuw
        R48rqYfGE5mb8hQ17Nov/krf3JrjEw505VFnGW/51+h/9fpyH4pjQ==
X-ME-Sender: <xms:tkF9YPSe19kXzeaABENHK3UZig9l9teXjBigi4y-EQ0reEvqX4Oqqg>
    <xme:tkF9YAwChOIskZqaAofxx5gu-8jkefBLZsD3OxU2Z73J1OcHuSUbDPE4uycjPWs0z
    2vnkbom1343QxTLnhQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepkeelrdeggedr
    uddtrdduvdefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:tkF9YE3_e06EyoOAe3HkXm_qDWMUn5aKGF0aeJZoyocP3yAwa9WpcQ>
    <xmx:tkF9YPBNCjhpgEPsGCscFFKZNrnwQMA17DRVXTFs1jAmvhE-aHJRLg>
    <xmx:tkF9YIiT7FOg_10gXfT_VRDVx8sgMNRv155JaPlvBlky3rbVs2Lvng>
    <xmx:t0F9YBuw8qWiAsXeMoSj2EyftMn_-d92_2BfOILxbZyTzGGgi29buw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id AA9CA1080063;
        Mon, 19 Apr 2021 04:39:15 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 1/9] dt-bindings: Add Wacom to vendor bindings
Date:   Mon, 19 Apr 2021 07:00:56 +1000
Message-Id: <20210418210104.2876-1-alistair@alistair23.me>
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
2.31.1

