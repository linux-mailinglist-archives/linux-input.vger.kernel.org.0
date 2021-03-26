Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638A6349F1A
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhCZBxL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:11 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:41449 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230045AbhCZBwn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:43 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id CF6365C0101;
        Thu, 25 Mar 2021 21:52:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 25 Mar 2021 21:52:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=XE2V5arHmzlU3
        KCragEOdE9ppzrztZxOw4hXXe60udc=; b=HpMQ8jQevzM2WyTMNi9oN4skydOP4
        73Ds+TwMfgCYQlqBCac3ah1nq8M7mZbn4mdXEVP6eNL8On37i2LBV/d/hgOe4Rpi
        8jpGFEiOoczAKoeI2ejlw39dB1sLnNS7QBBk5+mNmmCQuGeJtyNNv8anuVulwRxg
        +jsgOE3vYDA81Pgn2Tcrl9ThOCeOIiOeO3GTelZnJ4wiH9ubZ0DV//t/nGs4mc+h
        TWkMyWcbgAIylX2nJYEwB8USdzsVu4+mDrt9PYj39NqOH1IRbbXqxniPIuz9BlUL
        dh00rftlr+HkIl4erYWx1vx96fMpRvRLsu1ZJIabVOFC70flxJWe61/DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=XE2V5arHmzlU3KCragEOdE9ppzrztZxOw4hXXe60udc=; b=Y+VbyK8+
        Ai4EIMMwsiCvxL0K7Z+MAkRBs0TTZ9QLCTwGpZvRtxWFMnsgUR+ayVPQD940C3by
        pl/cFuDOHpejCa7R62yMWATUMXbJaMxxGZdnGNsjsIachynFd68jNaxL9IkG7zxf
        huc38zyOmuWCRJpWsBi3sVynOHOfAKIEAb9yqBqitHOoOSxIMxvm8brRFhDXWBOR
        Y3wXBctCfbnrhQIQsVq0XCESh5pqOa4/UDhlQDi22liMTz+NEk3tmOJm6EMfF2sV
        o1YUCKEU/9mFsQJPs5PXjAnbNjnPdLYiGo3ILWY/bAl6T3r3zxiy2BU+ySslR7T4
        23m9xUB+s13NWQ==
X-ME-Sender: <xms:aj5dYOIuvHweBRn1U9wpR3iY8J8Tbw-cNEY8zs-zRaCPSSqFO7hGDg>
    <xme:aj5dYGIejarOKTSy3wbif6Z0AYseLvgPgrEiBro06YO7qvlG_U03LxF0mu5lZR8qe
    6x5xyWINF2muQ5iBNk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpefftdfhgfeggf
    elgfekjefhkeeigfelleefhfethfehfeetleeggeeggfefffdvtdenucffohhmrghinhep
    uggvvhhitggvthhrvggvrdhorhhgnecukfhppeduleefrddvjedrudefrddvfeehnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:aj5dYOtTGl2mygmA9QHl8zpfSCqapOTFZJKaJKh6Z-HiLAZc4Aau1Q>
    <xmx:aj5dYDZJIrfF5MpbKrFxEmL7wUTQdrJOR9B_QDogmgJ2CkOuCvqrbg>
    <xmx:aj5dYFZ0a1VJBBd8SIDrXfDp7EqV9xqe7hK0yzSmHwtTIB3QqCp8Jw>
    <xmx:aj5dYJH8hllJuIIR58oZz0VLvJIh_WPUjzmosqz4o9Gc0Ymzpd38_g>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id E366D1080066;
        Thu, 25 Mar 2021 21:52:41 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 02/10] dt-bindings: touchscreen: Initial commit of wacom,generic
Date:   Thu, 25 Mar 2021 21:52:22 -0400
Message-Id: <20210326015229.141-2-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 .../input/touchscreen/wacom,generic.yaml      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
new file mode 100644
index 000000000000..19bbfc55ed76
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/wacom,generic.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Wacom I2C Controller
+
+maintainers:
+  - Alistair Francis <alistair@alistair23.me>
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: wacom,generic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  vdd-supply:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include "dt-bindings/interrupt-controller/irq.h"
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        digitiser@9 {
+                compatible = "wacom,generic";
+                reg = <0x9>;
+                interrupt-parent = <&gpio1>;
+                interrupts = <9 IRQ_TYPE_LEVEL_LOW>;
+                vdd-supply = <&reg_touch>;
+        };
+    };
-- 
2.31.0

