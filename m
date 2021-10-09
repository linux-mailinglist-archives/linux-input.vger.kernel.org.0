Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6D7F42798C
	for <lists+linux-input@lfdr.de>; Sat,  9 Oct 2021 13:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244721AbhJILpj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Oct 2021 07:45:39 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:52987 "EHLO
        new3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244680AbhJILpe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 9 Oct 2021 07:45:34 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id EC1B4580571;
        Sat,  9 Oct 2021 07:43:37 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 09 Oct 2021 07:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=J43BtjyZnQwL4
        OMfKwgMiiGT+yp6DVRSuLYO3c4jh2I=; b=JMpZog+Hvk5/KYipXD6rrNZ5juqXp
        twjG/fqX/7N4AqpTkz8wJlTfSoKCqD/c7MRj3ngTDRIIqDtPUO8fhHDXwBqGeV1U
        egL5K2yCoiOfarq8hnFrgejWS3hUx2v+TW8PQUvXb3cH6gy0/l4LGWO8IS93gnn1
        /hS+R22eih/UNI2Br7g2eE1JzYX8Bk3dMozTEAKgGcCyQGsrl9dYFDrYNgI0ECl2
        1hvanaJpPP9U+dPUmLqs6M1rm2CEOVtmWveru9Nc/oYxaXmJlXwvZG5uzpTCEMRP
        h1XOYjgFwzbxOVNRJktX0gCq0UgZAujFfWD+vGcEZG3X2c8A8i3rczpVQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=J43BtjyZnQwL4OMfKwgMiiGT+yp6DVRSuLYO3c4jh2I=; b=Q5kbgMvj
        e9EYpeDiiB7Fn08mRm+1dkALbHplb9aCjq4q/7P+yNJ3AoohWAy/r4RUj/sBrhHB
        9qo+HUd2kfQVjLCUsg0kUlrxn8yCNHmi6qJ5TuSS5ummcdmkV5dNUl0C6hRnmlmM
        yZSwRukpbqaDHhJz4uWP4y+HJ1rrhZ8AB2HRE4otx9odLdf8qhbCmohag5hkceNh
        x0P6jQwwC8/4Bm8+T/6OYZbdSk5bs6HRzhpx7bafV2biiXIyCfV1m6CcTkWacFC7
        eMou3tnk5Ym7HvF562A0EhRutTYCxmN7xajBWRo2qs56gL0T9wUTN94LpZFDtFI2
        AJHJ79blhddBSQ==
X-ME-Sender: <xms:aYBhYQosPY7kME9Ld-vxxmC-a-T_FnvfKlW69Z4Oc9sIurAtAz01tg>
    <xme:aYBhYWrYyhJfRnW4Q6LJqMyyPyMddC9U0g5fOY9-o7PaMK0emLHu0-NVCm1VfEFoT
    xfz0XXkGa-ssPIEORc>
X-ME-Received: <xmr:aYBhYVO55aPnElxA2EG4x3UwVR5cUlr67BhWjxPWz1XWPwJMC-QEi3dYO4rI0JMAluFHAcoV60VGR8qNmjUfhWNw-k7NnbzoPOk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtvddggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:aYBhYX7mt0RP60XYCmP49w2wb2LQ4uNASrBT4RGylRE6QpTpejkrgQ>
    <xmx:aYBhYf4bzncDtz83QouAGCTGStESvwOvzxyqgA7RnqMp0T-ERC6QCg>
    <xmx:aYBhYXi79sKMh5ZmAOzWXK9B4tuAtOxgyEQmPBoTmota3y6fEUdbjg>
    <xmx:aYBhYcypC4cJWOgccdkVVEc4mEf8wD6YwfvTxtl1xc2Bb8Zj6shLTg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 9 Oct 2021 07:43:33 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     linux-imx@nxp.com, jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v11 3/4] ARM: imx_v6_v7_defconfig: Enable HID I2C
Date:   Sat,  9 Oct 2021 21:43:12 +1000
Message-Id: <20211009114313.17967-3-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211009114313.17967-1-alistair@alistair23.me>
References: <20211009114313.17967-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Enable HID I2C in the imx defconfig as it is used for a HID compliant
wacom device on the reMarkable2 tablet.

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ccee86d0045d..8a54a4d0181a 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -320,6 +320,8 @@ CONFIG_SND_SOC_WM8960=y
 CONFIG_SND_SOC_WM8962=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_HID_MULTITOUCH=y
+CONFIG_HID_WACOM=y
+CONFIG_I2C_HID_OF=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_EHCI_HCD=y
-- 
2.31.1

