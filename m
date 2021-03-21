Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA99D3432DB
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbhCUOLN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:13 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:60665 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbhCUOLF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:05 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 1052C5C00CC;
        Sun, 21 Mar 2021 10:11:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=gD7UJ01FtJ5YrDw91A6gmdh8FW
        jd+HeYnOc442hiP5k=; b=UApRS2yc3gsVa7NYglT2h0UZBCTtEG3KE+dqj/pj/1
        f8EFNFcl1yRinHCFgWW8WhTEXmi+5m7N7RCf/ibmbCUkKojBYDpuSqZ2yENepTOt
        zdFc1DWsA+s7mSTVNyLIHQOIdBymQKFgLUruNN4l4L6u83WzvU6qnDDQ4S6+7UVc
        TXNizhtwN1c9XrMsMsi/884dMcRMR32+C/DxPz7nGW7s5dsacpuuASPwWAk3KfoY
        JyQuIP447hW94iNFm8zm/tUmXAaneX3lrgfEhdw+/2adS5GWK5lJ67lPOB+IUFhe
        aY6oXwx/VItlYj+lRIQ5vosE2veK7rbrwoPRo/tYm/HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=gD7UJ01FtJ5YrDw91
        A6gmdh8FWjd+HeYnOc442hiP5k=; b=lefm+RoZT4hMjjPR7nMoF4TxuCJdt1IoJ
        h8zfCmvtXQmGca1ND5tRf7hJ1tfBoqrOS82smBX4EljD9fY2FqehZJ6/PtSc6GHP
        sOe5wylUxFLnwMH+CwpI/SI4qNpTcbtpyNHPlkzMPESz8LZm+eQMhScIDAn0bk9x
        /DtVyqlqfXQxFTOvrNd1nk092g2UQDNRq0v/3oRwdkV3Zv6AGxDJTFxCOmgh8eob
        3igpjH6FbiGc+rXj9LeloB/GlrkvFT86kramSfB1X1UbF6KUdAyOWqyg+s73xcAS
        odS7hZ47M96GQNEyoroqU70Cqdkbga4eCKTH6hWKz1tSW4gQKLJmg==
X-ME-Sender: <xms:-FNXYB1uHxIMo3gXfJXcYgmWURQ7xghKMabVHBlCc6cxelbRk5YBRQ>
    <xme:-FNXYIEMAuUWpdc5rvMav5sCsJ69DKEBVm3cT0HNHu6iaMYIxX__zrqXfOBaDqWos
    gNUzfcUwtvxdB2rmtE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeejleeihfdvtefgtd
    ethfdtgefftdeiffefjeeiffefveeuleejheejvefhffeukeenucfkphepudelfedrvdej
    rddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:-FNXYB6RZ7XJAakDNgQEo3mtCM37OpD3-h_bDAdxJNX3PCC821zYtA>
    <xmx:-FNXYO0pBVqisXyt1RKrLzQIDH0ROhqlid_-VEjQlLG6ITbLcyIfYA>
    <xmx:-FNXYEGMnWA-wwrxf2P81_f7oOzUO180HAYUUdDrQgtC9lC0mejObA>
    <xmx:-VNXYIDAKWqDbdXDc3sFFXRvL97Cxv0m33kiElp3D9cO7hcQ94vBKw>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 448FD240194;
        Sun, 21 Mar 2021 10:11:03 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair22.me>
Subject: [PATCH v3 0/9] Add Wacom I2C support to rM2
Date:   Sun, 21 Mar 2021 10:10:40 -0400
Message-Id: <20210321141049.148-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Alistair Francis <alistair@alistair22.me>

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

 .../input/touchscreen/wacom,generic.yaml      |  48 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/imx7d-remarkable2.dts       |  52 +++++++
 arch/arm/configs/imx_v6_v7_defconfig          |   1 +
 drivers/input/touchscreen/wacom_i2c.c         | 129 +++++++++++++++---
 5 files changed, 210 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/wacom,generic.yaml

-- 
2.30.1

