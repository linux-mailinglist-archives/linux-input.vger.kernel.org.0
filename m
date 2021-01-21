Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8FB2FF615
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 21:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727410AbhAUHsj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 02:48:39 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53259 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726530AbhAUG6D (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:58:03 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 18CE45C00ED;
        Thu, 21 Jan 2021 01:56:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 21 Jan 2021 01:56:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=WilBOyB7V0N1dNH+hL/QeOaRXv
        DqeMrDrx+0C2UAfMY=; b=JVOaYz5l0SrOsyO6Dpw47iI91Z7dDIsxQYj2U2ZcKX
        LHB54qK2eZRqGBaIVBVuY/CGhEL8U43/bCd2+ABc5MGFDsJwnsnpZFWvlZFalnfk
        m8BHU63jZFGCyJr85AAVc5JkAEf/jABnwurggrEFVnnFFvrUTB85lcrDv9BBolOl
        kb8E81tHTEJSg0/svmFLSqMxEmGnLHTK/JaAc7uOTOF8TThja0LVLwBHTnwYZbmM
        CG6UZ3rGS+1PF2P8ceacUTIbTA+T5Hm63djcRO+u0SI+Fc35sQEuWEJ6fJJ4dvsS
        um3SUq7HAaSSkMvSMNS2hTMtxKnN8LES6NeVEN8pKbQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WilBOyB7V0N1dNH+h
        L/QeOaRXvDqeMrDrx+0C2UAfMY=; b=SFg1p7065y9JRI2/tClufybpJFYd4B1+X
        Wu8v5Z3MDDazdJ9XhYRYbe45eMH9mg+DQWC79SqG599z26pQVuOCgWohn+mY1h5/
        nEP9wt2UrjoriPjrMiB5sPsM8D0lH6oDjLbxamNBIr3h1kK1U3Cxv+NOf/Rx6Q89
        A6c8zfIcmgJKD5SzG+jp+pDqY8t5xycDC2vCpfPGxdWSvsmjX4ftZa2JgZy8FMKf
        wVZMo2Ma0Oi45vdlW3Q5KJeK1d6NDAspzz8wfPjmt1+mMLERYUUQItx66cId8nW5
        fxOuT6QomP67+Rkyko+5LRXXOXv7e6OXY4voMCR0jOZKbdTPdXeNQ==
X-ME-Sender: <xms:ryUJYLEIuh6KiRWbtEZl64gvpwVw6NPVIhvBlnLAjuzcbKY8ZTGc_w>
    <xme:ryUJYIXVJgLTBJvFjpGR20xDl-2W_4zsVYMS78cHEmPb1AYGyCBdOpG9zPVdQcf-d
    ywDb6-WgA_tS6_oqGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgddutddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepjeefrdelfedr
    keegrddvtdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:ryUJYNK_WvK4ZiWMv-jSTZ29-wOVZAv0gGVYYmsgL3aTwbd0KRqPUQ>
    <xmx:ryUJYJHEde8YnEvXa51A4tcC8-XnwOhZz32rrE6mZv0hZ3SqSyrhJw>
    <xmx:ryUJYBW8rvOnMBZaV02Tuyn2Nff9kadggvO4Q4dWCV9N2oFcOBpiiw>
    <xmx:sCUJYER6Z7q4oVqgOSubdHy08zS5bMJUDi2kS2xZThs1ds921dEwag>
Received: from ThinkpadX1Yoga3.localdomain (c-73-93-84-208.hsd1.ca.comcast.net [73.93.84.208])
        by mail.messagingengine.com (Postfix) with ESMTPA id C4F3F1080057;
        Thu, 21 Jan 2021 01:56:46 -0500 (EST)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 0/6] Add Wacom I2C support to rM2
Date:   Wed, 20 Jan 2021 22:56:37 -0800
Message-Id: <20210121065643.342-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support to the reMarkable2 (rM2) for the Wacom I2C device.

This is based on the reMarkable Linux fork and with this series I am
able to probe the Wacom digitiser.

Alistair Francis (6):
  devicetree/bindings: Initial commit of wacom,wacom-i2c
  input/touchscreen: Add device tree support to wacom_i2c
  touchscreen/wacom_i2c: Add support for distance and tilt x/y
  touchscreen/wacom_i2c: Clean up the query device fields
  touchscreen/wacom_i2c: Add support for vdd regulator
  arch/arm: reMarkable2: Enable wacom_i2c

 .../input/touchscreen/wacom,wacom-i2c.yaml    |  48 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx7d-remarkable2.dts       |  41 ++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   1 +
 drivers/input/touchscreen/wacom_i2c.c         | 136 +++++++++++++++---
 5 files changed, 205 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,wacom-i2c.yaml

-- 
2.29.2

