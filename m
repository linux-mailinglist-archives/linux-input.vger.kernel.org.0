Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 372B73F17EA
	for <lists+linux-input@lfdr.de>; Thu, 19 Aug 2021 13:20:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238133AbhHSLVL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Aug 2021 07:21:11 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:53583 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238165AbhHSLVK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Aug 2021 07:21:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.nyi.internal (Postfix) with ESMTP id 75389580C10;
        Thu, 19 Aug 2021 07:20:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 19 Aug 2021 07:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=sAdWszoOj2svyqf8eF6HULPZvx
        y85kvcw4Lt0LXbXz4=; b=MPNiZ1jzB//bDmBL4LWlTojfIezZBWg92ReG3gIQsz
        hNxWC0nRpD1LsUWX3BAA5RwdaB+d7Aa+ay8G+bdorAY4rgI8/UQNTGpqzJHtG8l+
        PNZ09NUvNGdxBF+GM6SXAUheODdPPuxFunjtRZL1uVosldOIF8wBSukGGr2+abv2
        FTqQWHRq8mCJ2CuFaNxdrW3Ot/Jqp3JkcefrSYF9CREHqHZTKAk3CEox1e6BynGy
        MjQ0tF8++DO2skPqZnpYMYhffoGxYuf/K+d1VWbMFMCa4KhIrP2nbQCfCnOBNP/N
        MGWDebQlRZ7IGT4W9Uc8gMlwy0pyHbHmZrfE0cUn+MhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=sAdWszoOj2svyqf8e
        F6HULPZvxy85kvcw4Lt0LXbXz4=; b=qiZEmdVN+3UXHja3LEOslcvu8Qz0amYqk
        QjxF6DjA6x6MkCCfa5wWLDkFZrXE7M7Tl4PssLQdJKMYJkb2rX5JgnKxswne4pge
        2ezcagLAS+oYz09J7AVXNhR704sbKr1EDIkTGS9domFwQMO0lQ1c+UtjRlHSFSjJ
        AAqngtOnLa2Hhe+Cevl/V8ZK4/fI+x6bcuyddWYnHXDI4wBRalAbZLrM1y+vWD2g
        UQ8H4R3S/rpdMqDFbFQyZGeoyz63oH29eX47nqYNZ8Xar7mBOVmLjrJakTBs4T+h
        UjtAKNXH8VuLTwlYI58Jk6eNKIxv96wAvlGNwvWfBVa9wLW3Xq18A==
X-ME-Sender: <xms:gT4eYX-lBVG_Lms7r09fD7L9TwMJoq7-3hfPsaB3wU-nkIxABmGEKQ>
    <xme:gT4eYTutIY1jtZXnqOU3-lFwtcgqDA5vqCmwIh8xTEIPlwgPqHgSm8dyodIY5rW2O
    Cb5EnUfEgm5xR9xWrQ>
X-ME-Received: <xmr:gT4eYVAcviwvmAt3p4eH7b7SX3nUzZDl5wGj6-AB8F6jD_lMBG4ciCYB-GqqNtLpOtmpsWyYhAkCzZPYQrOq0HUTVkXxSQBXTKxS93UJ9D7gvzHvsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertdertd
    dtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghirhes
    rghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepjeeliefhvdetgfdtte
    fhtdegffdtiefffeejiefffeevueeljeehjeevhfffueeknecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrg
    hirhdvfedrmhgv
X-ME-Proxy: <xmx:gT4eYTdaBZlmzDjyHJd4p3y0BVLILMcUG_oAaw0rvcD0xGlXniX3Vg>
    <xmx:gT4eYcOXTA9ZNYJHTuK3GuA2hEznafdty1MJ33M8jxuYXth5AuKMPA>
    <xmx:gT4eYVlsoNbmVD5ZU_HPcEjcBE2UM87gxW9pHXvknlV0CpY9e7irAg>
    <xmx:gj4eYdGgZPDur3ccmbFSKEQcj22MM0IXXs3mN3-9X0hl6aMDUgjEfA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 07:20:27 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v9 00/11] Add Wacom I2C support to rM2
Date:   Thu, 19 Aug 2021 01:49:24 +1000
Message-Id: <20210818154935.1154-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the reMarkable2 (rM2) for the Wacom I2C device.

This is based on the reMarkable Linux fork and with this series I am
able to use the Wacom digitiser on the rM2.

v9:
 - Add two new patches
 - Fixup the device tree interrupt line
v7:
 - Fx the compatible name and documentation

Alistair Francis (11):
  dt-bindings: Add Wacom to vendor bindings
  dt-bindings: touchscreen: Initial commit of wacom,i2c
  Input: wacom_i2c - Add device tree support to wacom_i2c
  Input: wacom_i2c - Add touchscren properties
  Input: wacom_i2c - Add support for distance and tilt x/y
  Input: wacom_i2c - Clean up the query device fields
  Input: wacom_i2c - Add support for vdd regulator
  Input: wacom_i2c - Use macros for the bit masks
  Input: wacom_i2c - Allow flipping the values from the DT
  ARM: imx_v6_v7_defconfig: Enable Wacom I2C
  ARM: dts: imx7d: remarkable2: add wacom digitizer device

 .../input/touchscreen/wacom,generic.yaml      |  66 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx7d-remarkable2.dts       |  61 ++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   1 +
 drivers/input/touchscreen/wacom_i2c.c         | 203 ++++++++++++++----
 5 files changed, 297 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

-- 
2.31.1

