Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF143A7BE1
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbhFOKcm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:32:42 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:57001 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231503AbhFOKcl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:32:41 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 71962580729;
        Tue, 15 Jun 2021 06:30:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 15 Jun 2021 06:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm1; bh=PtEEriapq8by9pN0/7eaayeZVv
        GO5nKNyXRGHpCQE2s=; b=BixdAMbOqA2K42rVvynBLSNOGAwmB2paCLyyvB5HAg
        /MRUPmj8+WFohIhjQrBWdyn2VFY2PidrNBDeLTYYGPApXlL0s2TAvxoxveLvKHC1
        ZP52wsbrzSwcnuBVIwP2ehTcDyduYe/JMo7+Pauh9cys2dm/77oxneEYBWgzNeZe
        qMffO/hcnqcp1nb34SMqqDxhB2MBU91cq8lsH3i10lEwgyxMseAigp5dduhTfAeS
        GGWSRWZncJci1KhUSksFvksgtGWdHX3KoRL+wBforUgCeRoCkC6Y8FCWVsfKQKMk
        LwuaxqbDAuu+pw5o1Am3td2lgCsxJVJRmD3g+d1FbrlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=PtEEriapq8by9pN0/
        7eaayeZVvGO5nKNyXRGHpCQE2s=; b=gbiw21aDhPR7PHXpCVrFUjI1p9dJ12dHK
        I54Y16AzE31c7rj0MaA/nssuwmQYOXDnTqsiiSIu0LnuYiOvqVKkr4PN5p7vCC5m
        TaQ6JPGvzmj+y3j6tSEW4KE9YdE+Ldjo8stoUg9cyHtjccsF/Vwr6fXoaETMP0Fc
        Pugd9OojJyOCXtZm2X0dbkTfkl8vqapO0LJBaB/gT4vWyBp1EJolCvu9qL1k3nwe
        tQPSwRm3f/frkAHcLP8dchsXjQOwEVVLuxHDUyJN20jeoZWbzCKL/PPn0urd/TAF
        k83NFIncpnf40eYJ9bu8+t1VGFRS3C/hLGLU9v495MEDe2cvHf/uw==
X-ME-Sender: <xms:TYHIYGZOCeRivRecl0Wp5lb5yAaUTzyVltQqIGSwGjycR4234OXlYg>
    <xme:TYHIYJYhZHaX-i5rFsgBfWZYpeRvDouhlHulpdrgyw28PCMQfC11Yq5pdXGoBQm0a
    cRFyJT7LcHnjhF33Ak>
X-ME-Received: <xmr:TYHIYA9pd2D2omz5X3uGq0GAVpcaNJAddLgnVLnUEODEeMdH6lFgEKlYNFAr38TaFl5-vKTItNS9jmLe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlihhsth
    grihhrvdefrdhmvg
X-ME-Proxy: <xmx:TYHIYIqh8nvGseFFC0uyTKCDpKQx2TGWa_o2umNMWVGNT99fOPUWHg>
    <xmx:TYHIYBqI7JY0HSfqgd5Hb1RY8WBpsVJ94MvXneihwOvdSKLJ-8GR7w>
    <xmx:TYHIYGTr20l-6ISV8UkIO02tR_3oZRKLWvHqrMN1itjHJx8nrUT8kg>
    <xmx:TYHIYFeznt9MfugexWOTdmBiokykrFWM6sXbj2LlG1GJN8AmSvPJYw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:30:33 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 0/9] Add Wacom I2C support to rM2
Date:   Tue, 15 Jun 2021 20:30:05 +1000
Message-Id: <20210615103014.798-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the reMarkable2 (rM2) for the Wacom I2C device.

This is based on the reMarkable Linux fork and with this series I am
able to probe the Wacom digitiser.

Alistair Francis (9):
  dt-bindings: Add Wacom to vendor bindings
  dt-bindings: touchscreen: Initial commit of wacom,generic
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

