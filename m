Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 400633432E5
	for <lists+linux-input@lfdr.de>; Sun, 21 Mar 2021 15:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCUOLR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 10:11:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:59423 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229933AbhCUOLM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 10:11:12 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 6AEC05C00D4;
        Sun, 21 Mar 2021 10:11:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sun, 21 Mar 2021 10:11:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=73eyW0QPCYbw5
        PMkKRHmXWFQ/7vYproNzQAhCUm7xPU=; b=GhRRITL9yva56qnM6NKqbDBGb3RbF
        s3AaYK12QOqKp1cAQItkbqe3WPG45osWWd2JWfjzHEtB/6C5r3kW9fJXb9smEXly
        VQQgc75kgzdqnIPEcVu60/NaU3opbXwv3iWnXoyaQO5mt+2VKTrKF0VQWteGLTkE
        N6oxZ+Vb5oQTTXMALpwlnIzgWx9aOj+3RZc0ALQOCwFBfrXURXi5d44VWWnTkrot
        1qVzniRmEIXihCnOh33JGriVqIhUo0+SkuoGd+orUuyopA9+KDrnM3hMthUEzYtS
        fbdRbmq86DxN/G6HWN7SI262mm5q3CFkJyIgSDPop3gl/M4vKVp7AODGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=73eyW0QPCYbw5PMkKRHmXWFQ/7vYproNzQAhCUm7xPU=; b=RllLcYq9
        W3mABuiTigLuo9ow79swj/ih0IhL9XzzVzncHCyVON/Ol3s+LsetfZhqfj/sAbEC
        nCT5dn+8WzlglIddu5jJPMEUkUtRbb+e5xQXWNcMhAzFFUWXChRtO6GIHtCEnYyT
        wjoL5tR9sWFaHq/IFhR5019oGliQ2VDQQWR1iDfgKKvkoX/RljN0PtwjWfzfewhI
        DbwGn2iwK+Xkr4kNcS6ALBrB8g4A9ZigV6QbjTUBhH/HPYZdVzReUQfF3kK6695v
        ltC8LtwWrQ8b5lOcHr+37xJF4MdMuxlFML8KqsLTdcDsDyAegga9IL81tp+vzgpD
        ww/nNs/W1d7Jwg==
X-ME-Sender: <xms:AFRXYAISCh5zqDmXx6dvBXCu3H5KvAWrNZIgJ1wHGDbPkGOuXCyKPQ>
    <xme:AFRXYAKTRXSj4YZDoJSL9zOjRvJnZPu8QXD0aVGJ64d_9vsNZgnzUAx9uDVWR8FR1
    MSQqhwpMnViNKh1H4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegvddgiedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpeeinecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:AFRXYAu86zyCabh6JpyWZcw_582hubP9yRvIiAWCY9vTpmScxvhdKA>
    <xmx:AFRXYNZeWOTCXbgLKWcEisum3sbcMyY-JeuliNx1TN8_nWU-77SbhQ>
    <xmx:AFRXYHZpYNxqdhxKBCXgjNLXdtoNsici9uHIHgdcSY9SI-iw1XnsUQ>
    <xmx:AFRXYDFPl1cEnkw-ebNuof2pV7q32AmPIYTHGtuTPcTpNTwqdzCVYg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id 78E802400CC;
        Sun, 21 Mar 2021 10:11:11 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v3 8/9] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Sun, 21 Mar 2021 10:10:48 -0400
Message-Id: <20210321141049.148-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210321141049.148-1-alistair@alistair23.me>
References: <20210321141049.148-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable the Wacom I2C in the imx defconfig as it is used by the
reMarkable2 tablet.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 70928cc48939..cd80e85d37cf 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -174,6 +174,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_ILI210X=y
+CONFIG_TOUCHSCREEN_WACOM_I2C=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-- 
2.30.1

