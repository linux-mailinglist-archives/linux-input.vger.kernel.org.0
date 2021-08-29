Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D7B3FAA66
	for <lists+linux-input@lfdr.de>; Sun, 29 Aug 2021 11:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235036AbhH2JVd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 Aug 2021 05:21:33 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:51723 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235037AbhH2JVb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 Aug 2021 05:21:31 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id B1955580B0E;
        Sun, 29 Aug 2021 05:20:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 29 Aug 2021 05:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=+EvKAZLb0ChvJ
        XRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=IsL0lGMGzdrbDy3UQF0vHPOy0Gj5H
        FSDR9kwvrc4s0DAG9Oz25nWJOn47bE11SRvEHJoM2CKEFusjAvRjXuMKtu1VHBEI
        /ye1tRE49eKMCkgkbA1dFrBpAxmf0O8MGuE9jLOLXc9f0AMSmwXiajCGhUKmbMDA
        bkm7XBP1DonjgX3TSsoNBwvGTWqzGpMOhEoiQGzD1s5Fj00H7UkKQQ5tAfonMx9f
        Dcjv8NnXatAK15Oprqj7qo2L0+yHrUGV91f3R6ovHjCbhUGsckX0CfjSL/eY2Y3M
        QUKAVUxjtyIo9ONPnvS+uyskOc0YoywSELaBAXr4KhP8kHqDXaVtaA+yQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=+EvKAZLb0ChvJXRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=TI1CQMh3
        dvrD305oINxawyyUrdPycT4sg55Pv39GNL7fsRViHvzIY5VCQ9mMuPHvzOGYsfqV
        NFPi7dRqPMyrC9TjV70me1xtfBs+QN6+KNDCiy5Ev2TK1pRWj8FxesA4j8i112yP
        cXda6/R8zCCAj2mK3LknVo6fFlmbZq/+J3zxA7YeVUB1ZqE4BL4RkzldAiDk+CZT
        tc2PQ+KwLDwXeGhDD5wilma9XMb1OaZbGEFWUcEtn1X6gtX9/WrxCjRhYJtJapbl
        JchNEDbMddPkRTi25CsyvXVH8WzN3At3WFhY8GEO1q0rRpO/hrXOmX+C4xsoGY+0
        EZ1HmSPPMUh9sQ==
X-ME-Sender: <xms:Z1ErYceTScbDbIhWjR0vDSBgD3z2kC-il7SxL199N1DvY3ITRFamgQ>
    <xme:Z1ErYePRgp0QhZlWCIBs7xbamSnEdPnBB6-OWZh_vnJ2jiaeHvM_Wawo6k3JoogFt
    X6Aw5DsUU03NHH8iV0>
X-ME-Received: <xmr:Z1ErYdin6eeBCPpJ4jr7Bo2akaUhABg9L7SEOn1kn7mBLf0HDLwEFbCrGBdd113dh3rhLQVqyQDgLjIzwJDtO9gXtFDj7TQA9QGCuiSP7CVqsRzr6Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddujedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:Z1ErYR_zS_tm-V79tuyedsENO8Ruo7peJmqCTEy203L1pHDyUVnFJQ>
    <xmx:Z1ErYYsinHpl3Grn9GNTCYc52GtYNydbPV62JgfpLEJvfqkXxPQgNg>
    <xmx:Z1ErYYEzjl7PmRK_nURbFWVy3MHfmME8Ltyr3oerxMjSyeCQ6kQOXQ>
    <xmx:Z1ErYYEojBOW8rBB5e46n-20mr2_831MYSgAaoXL1dzsnLIoo9aZJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 05:20:35 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v10 11/12] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Sun, 29 Aug 2021 19:19:24 +1000
Message-Id: <20210829091925.190-13-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210829091925.190-1-alistair@alistair23.me>
References: <20210829091925.190-1-alistair@alistair23.me>
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
index 079fcd8d1d11..477dac1edc75 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -176,6 +176,7 @@ CONFIG_TOUCHSCREEN_DA9052=y
 CONFIG_TOUCHSCREEN_EGALAX=y
 CONFIG_TOUCHSCREEN_GOODIX=y
 CONFIG_TOUCHSCREEN_ILI210X=y
+CONFIG_TOUCHSCREEN_WACOM_I2C=y
 CONFIG_TOUCHSCREEN_MAX11801=y
 CONFIG_TOUCHSCREEN_IMX6UL_TSC=y
 CONFIG_TOUCHSCREEN_EDT_FT5X06=y
-- 
2.31.1

