Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 962383FAA40
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234867AbhH2JUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:20:33 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:51791 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234584AbhH2JUc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:20:32 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id CEC41580B0B;
        Sun, 29 Aug 2021 05:19:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sun, 29 Aug 2021 05:19:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm2; bh=UKA+mD4oTh8sYLLli6c3hx8ym4
        5MRs9xbz/z6p375ME=; b=AvOfauNwab4X4x1DTdL2cM1nVJCYY71qMig5OvZpKF
        to0nJih0kS+z5YUFObEno4GbFf/OamBPDOhtPnY+LvQ+3Xz0m1Fag35f9na5mHOH
        Ul/H8q7xl2SNDLXe99WCuwGvSA7eqOYY82XkhzyNbjxLNDRtrOhGJneCLfp0vWtz
        BJS5D3T6RF+vsmXxativ3sLT8BCgg7Og0YpGhjm1N+zt38E0uT0mPsLQXeBiiygn
        ZHR82hDpk4KXlKOJhG36duV5W8KJgi9x34sfSJL/PpJBg6XbUILWzsK0n/gKJTQW
        nEMIwMka4F1BqHM7tXvGoC3Z6eeUQUTNqC2PsbFjypfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=UKA+mD4oTh8sYLLli
        6c3hx8ym45MRs9xbz/z6p375ME=; b=XbWVvJWXNM2dCIA2e3EoqPiAyeH6TfHPU
        6rJS9VF9A7da1YOtQdpi683nGVdXdNPRwICNGwA5bpqdhBikP1aKvnnxR0gtiPxn
        l+/CcnVycI47RpiwXj5njQRwWKJOLGOLISQPeM+z/iA4yw9ga6bVReqLkeV/5YYk
        5eheLMnEnE0Q72XrzRFZgHzZSq9cu9R67sTzTv6VKiIyWT2Vcq88KZP2Cq0Kcw/Y
        uy9xL9NXrhsAIEmvANSNp6kKgGnThHD3fowOXzQ5nZTInSL4olxoT47G2ZN5KV6s
        A+j8DZPpCHW8sBSbQ9RnYhW0WNnQuVqWOidg5gLL1bLtJkTG3mImg==
X-ME-Sender: <xms:KlErYcf-XbFCu1BmTYMH89QEpM3XgNszWdsxo0IPpmHYY5_pF2aB6w>
    <xme:KlErYeNgVrEAaVe64pWeSHUJKkDja0sysO1aB31LqDZrUbubL9YFXUbnLjgvRQ03X
    jxdYGV5doXwMwpEHMg>
X-ME-Received: <xmr:KlErYdiKdz_q5XlZ0_CtG_Pt2XL19Jks8_cgg82dZWdI9bzaOSYKQj6urPjHG7N6OFbCFycul0TQE8XZpkiUyxdPLVdJ_rT3cGLwBZ_fj2EYP3qcEA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:KlErYR-apwB3tIZ4Fi2EUMeA-cZzc_ZMoKkW2FolexpXrpIJKbzB0Q>
    <xmx:KlErYYs9rA4OLnu1xM4oystt0200K3qiw7A3fybw95dZw6OI9tbBnQ>
    <xmx:KlErYYGyq8VKFZN39OiBDlxhw9oZ0Trsj4jTxH7KHpr5voExIZiRHg>
    <xmx:K1ErYYFnBwniKcVzrgBVHodzLUiCcOlRJdoF_HlB5k7bEzmg2S4_pw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:19:33 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 00/12] Add Wacom I2C support to rM2
Date:   Sun, 29 Aug 2021 19:19:12 +1000
Message-Id: <20210829091925.190-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the reMarkable2 (rM2) for the Wacom I2C device.

This is based on the reMarkable Linux fork and with this series I am
able to use the Wacom digitiser on the rM2.

v10:
 - Add a new patch to determine the generation
 - Use generation to determine if tilt is supported
 - Address comments from v9
 - Remove flip-pressure
v9:
 - Add two new patches
 - Fixup the device tree interrupt line
v7:
 - Fx the compatible name and documentation

Alistair Francis (12):
  dt-bindings: Add Wacom to vendor bindings
  dt-bindings: touchscreen: Initial commit of wacom,i2c
  Input: wacom_i2c - Add device tree support to wacom_i2c
  Input: wacom_i2c - Add touchscren properties
  Input: wacom_i2c - Read the descriptor values
  Input: wacom_i2c - Add support for distance and tilt x/y
  Input: wacom_i2c - Clean up the query device fields
  Input: wacom_i2c - Add support for vdd regulator
  Input: wacom_i2c - Use macros for the bit masks
  Input: wacom_i2c - Allow flipping the values from the DT
  ARM: imx_v6_v7_defconfig: Enable Wacom I2C
  ARM: dts: imx7d: remarkable2: add wacom digitizer device

 .../input/touchscreen/wacom,generic.yaml      |  68 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx7d-remarkable2.dts       |  61 ++++
 arch/arm/configs/imx_v6_v7_defconfig          |   1 +
 drivers/input/touchscreen/wacom_i2c.c         | 262 +++++++++++++++---
 5 files changed, 358 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

-- 
2.31.1

