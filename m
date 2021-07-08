Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1981C3BF983
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 13:59:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhGHMBu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 08:01:50 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:43325 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231784AbhGHMBt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:49 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id CB80958057A;
        Thu,  8 Jul 2021 07:59:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 08 Jul 2021 07:59:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=yEjWxOGk2YrrSh+LFrvL+ETV5U
        BWmp/CI+DKroRyqOw=; b=JUhzHhsI3PLEx+GyCQ7kW9pSH4bjlB6LpdIwkbGGJe
        uuSw4SkS5FRxqoronEWoQ8TP9bgfgWZdxBGFSGrgVSWMzyn8VHKeTx6ieqj6Un9v
        Dj8IhBy/kxJQ8Yjd8q+x9fYkuhFVUelAYpOllC0kkrKlTg3xjNEbRXAQlZEPdG0w
        VqX54MI8n6L4CI46GSjzGlHfKn1vUCbLYQq+nh8f9agdK0Uid4VqJ/ihp2Mh4Zhr
        L1HCX+eqqYunGso5zqzClcfjtmmJqhviVSOMK4PGqDVBqlTar4TVLuStb7An4vVZ
        42iaAe4OIBltaNS4hevKTjhcPwPQeLXUIiPc+Bu3ZZUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=yEjWxOGk2YrrSh+LF
        rvL+ETV5UBWmp/CI+DKroRyqOw=; b=fEAWrbsX7VglqnE3WF7GD4/kYLSIDTNq8
        XRgMxTnqapgbhXYOUPL0LP2S+q2MJAIa0VVvwX8IWq3fZ1bLcOrzSmdYDrSGwtOz
        jBO9UrzsRAeVjfuXDrHzPmncMsMjMM9EBHqC5L59+mtNtbHoch1nhM4gG9+N6jfb
        zIDkfpvzCokPQlcZZuxAU+06RnR2O3YRnFbUy/PY3AkUqIlNs7gAqPNOghMJ4rSV
        BQ0tOGHmDn25fKjwFZapw4/2GXxKNz2KnXtiSHmdtkxBaeuRXCkTwun12Ix2mpq2
        Wru8ezOnd8YTR2973UYCiUc/KDExFa/m8mRTiU1ZH6+jOQHXtYXcA==
X-ME-Sender: <xms:i-jmYORgTJZIjLrcJ_UmfZXsboB4E6GA2t7-w7Oj3bmwNbmejNtFbQ>
    <xme:i-jmYDw1uO9n481AQtSJfGhfG6Mq03yzARFFsUQM62YHzG4Wic23PMX36hefEOz-6
    3D3xkpIQFpipnb-cvM>
X-ME-Received: <xmr:i-jmYL3q8qMZv6ipn7OixcGQJzZThxDJsvvCrvxHF_eSKkGu47nDaOzmHBhEXZXZNH-BzfQHUsyKzGC4aLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeggdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
    hirhdvfedrmhgv
X-ME-Proxy: <xmx:i-jmYKAsc54ZeaUnEm6dQ7Z-1OX75Pfff4eE2cIuL7qLzfEmHD2w-Q>
    <xmx:i-jmYHiE5RC0RI0jFyvL4n-jJZZBDaeS8ZroNwd2Uof4B7SJjf2lTg>
    <xmx:i-jmYGrTQxarQtN1mw-vLCbJxnJY6R_TIS_EqpwtpeMYbmh82Mk4xg>
    <xmx:i-jmYMYkFqzuXBblbTbppVa2G1qaiwUrWgwt3DVp8DGasMux-t5kxQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jul 2021 07:59:03 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v7 0/9] Add Wacom I2C support to rM2
Date:   Thu,  8 Jul 2021 21:58:44 +1000
Message-Id: <20210708115853.281-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the reMarkable2 (rM2) for the Wacom I2C device.

This is based on the reMarkable Linux fork and with this series I am
able to probe the Wacom digitiser.

v7:
 - Fx the compatible name and documentation

Alistair Francis (9):
  dt-bindings: Add Wacom to vendor bindings
  dt-bindings: touchscreen: Initial commit of wacom,i2c
  Input: wacom_i2c - Add device tree support to wacom_i2c
  Input: wacom_i2c - Add touchscren properties
  Input: wacom_i2c - Add support for distance and tilt x/y
  Input: wacom_i2c - Clean up the query device fields
  Input: wacom_i2c - Add support for vdd regulator
  ARM: imx_v6_v7_defconfig: Enable Wacom I2C
  ARM: dts: imx7d: remarkable2: add wacom digitizer device

 .../input/touchscreen/wacom,generic.yaml      |  48 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx7d-remarkable2.dts       |  61 +++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   1 +
 drivers/input/touchscreen/wacom_i2c.c         | 155 ++++++++++++++----
 5 files changed, 233 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

-- 
2.31.1

