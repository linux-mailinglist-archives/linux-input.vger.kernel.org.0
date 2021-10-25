Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 055CB439512
	for <lists+linux-input@lfdr.de>; Mon, 25 Oct 2021 13:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbhJYLpO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Oct 2021 07:45:14 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:35447 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233216AbhJYLpL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Oct 2021 07:45:11 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 6DB2C58050F;
        Mon, 25 Oct 2021 07:42:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 25 Oct 2021 07:42:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=7eUd6wgxjre7V
        AV++0QCRjfQV1kP51FNe+5lTce7Sbw=; b=jxRZw+gpwqOy3Nq+s2G7TNtM0tsKs
        5xnRkjUsayR3yQShgNo6RSr7506WxMA8RvcFDsivRiRZYXM0mQb4AOzwp8gABm+c
        LAkzjJ3x5qoZ6mdr0oKufhCsPTNqZZ2WxU3l7yCCRW6U70Ij/P9LAI5Qp4RkCqGM
        mL6/MMEBZxfILIk6eji/ZXNBQ/m5/Q9Ov8aG1ghpryi4EUfAH8GPx91TFHXCAPKN
        poN+Lx3xVgGbD+SvkzK267T2+UEZxvkATPtyZlOcuOuIuDTV+XbTOQBtSD8dHgMd
        L+0tDpiY+7WuZTWkon91CCcEzCuw0EuDf/hBPU32li9ArW92inuBCHXNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=7eUd6wgxjre7VAV++0QCRjfQV1kP51FNe+5lTce7Sbw=; b=HnBRgrke
        /DnykOCO2WI+i8eDctpp17XznaAnKHF44l+IRzbhiMC4lMNIH/uPk9XRig68jKVD
        v5lG/XAAbpRurL8VpoclHdBzPk3YC/DFD82H1p9ooOyOV5+UixOM6blwT029ytx7
        cFw1kt1rPxDGzrBwlUy5FcJTCaGPtu/oNKE/OrhSAogcvjV06/H+bb822gFf+rWP
        MaHesgi3dH7lA1+RDX/QegEj5KZtgsPDL3xqKDtQvqn3SGULHq17ZALy+6tsLvK0
        Jxo3EX0vn8r+IZUhGP14Rx1Zoh9Qnxjis9KhXt7Zl3sZrhxNNayKAt1c37hhtm4E
        qwT5U2dqRQnQuA==
X-ME-Sender: <xms:OZh2YafGHLAcconKWXgn1c7np3OkRLTUresn96JDtTKMY6--m43C3A>
    <xme:OZh2YUO7pBJOlMFVIDTwXlN1cQ2ph1bc59NjCwvUUiebu5KlJgq00oeXEkpFW2-oZ
    spbAtuubBj1bvxVXnQ>
X-ME-Received: <xmr:OZh2YbhFhqNA-UHqoTDGaJRII3eSBYouTfdMBhIZi2we9VCs0MTHqwojjOkLLs5YABZfS_a6BF22>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:OZh2YX9rUl0Yc51UElfJzeOT4ypnZVSJAVJw-2S9oWWTQiFZSDUCRg>
    <xmx:OZh2YWujA0AQ21q3YzK5rDKBdX4KUdVQ6yDUdUAN68VSjkmgY4xcYA>
    <xmx:OZh2YeFS6XdcRoFk43tZ-CwyQTGaIrglLZECtHA9g-rAwP4YwHEzxw>
    <xmx:OZh2YXnmFQVSoK-wGw6Tn2phPm66OtB4p-Fih1TE3o-yJ-rArc-KkA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 07:42:41 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Cc:     andreas@kemnade.info, alistair23@gmail.com,
        dmitry.torokhov@gmail.com, linus.walleij@linaro.org,
        robh+dt@kernel.org, rydberg@bitmath.org,
        mylene.josserand@free-electrons.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH 3/4] ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen
Date:   Mon, 25 Oct 2021 21:42:13 +1000
Message-Id: <20211025114214.44617-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025114214.44617-1-alistair@alistair23.me>
References: <20211025114214.44617-1-alistair@alistair23.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Signed-off-by: Alistair Francis <alistair@alistair23.me>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 5e4128dadd8d..1590370a431a 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -172,6 +172,7 @@ CONFIG_TOUCHSCREEN_ADS7846=y
 CONFIG_TOUCHSCREEN_AD7879=y
 CONFIG_TOUCHSCREEN_AD7879_I2C=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
+CONFIG_TOUCHSCREEN_CYTTSP5=y
 CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
-- 
2.31.1

