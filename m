Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13F58349F22
	for <lists+linux-input@lfdr.de>; Fri, 26 Mar 2021 02:53:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhCZBxP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Mar 2021 21:53:15 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:54621 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229919AbhCZBwu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Mar 2021 21:52:50 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 04E5F5C0161;
        Thu, 25 Mar 2021 21:52:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 25 Mar 2021 21:52:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=kvtLRzFj0nTx0
        VbY6ToA4jpOg4Y0/rSNr9AP04Ed8oM=; b=d/6ED73yUeKwIFceRFEli53FWWpnd
        cRtISJwMRO+L81l7aTIu/m/h0v30GLCg7PMCW9BCb7Q960oFhneeyR5KAnVbL64U
        jN+7r1hBhsVuYz6OjERCmhB3QVYtf0eHOO4gFd3EqMS8N1DAKH4AMa9zbjaarkxJ
        4bsxdwHcL9poKzYJ5/fs3Lww8cbbeWIJknfNhHQd9Uhz8h0pserRKz5+FvXVPfEV
        UNPRzsAKjPK2H6AMjdrBjrR5wzNY64kP8KaAqmacw1xfVDz2LOmG+bTIJI7sI1sL
        zWtTKNcj53MjmUw8P4Fl5c16Cy7oJJ3WzkVGsG6f/wzYw1shUdXXQXAZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=kvtLRzFj0nTx0VbY6ToA4jpOg4Y0/rSNr9AP04Ed8oM=; b=K5QAbN86
        us5ldNSV81ZwWlT9CoAzhnPWSxPBPDvQwQli6AFMjRlDa0Q/0H0haGpOZWLqTihV
        vtOArXOsjV6hncZAvtPN5n7IF1ggrarGeB/CuzrGzifuAd30GI3LL4jELMSnyhlA
        JjTfGUbXv9MlparsW9Y9MtmwgkmntJfcsDnylRo1UZ+mL2CPsmqY8imD2xkFeueW
        /HpRZv37fKT33211dV5FGLxl2jnF4KJaHClocaLYtn4cK0QmJfDIEixMUCnIgoc9
        l3IR8RhPJmZPfTKaQmAv3ZrpZ/bSqfRu68PhVuVPXTpT0lrHToD3bPmTy7refuTS
        qRn0wrggitRhpQ==
X-ME-Sender: <xms:cT5dYJITNHJb8wdO9Jwx7tLHrLDVPnQAXhkALDN70Mzs-bFiE-Wguw>
    <xme:cT5dYHLse4w5Mu9k49IGMP2zg7YcGbqvgsnN0u9ulyVXOaLjgQXUwEMfpObaeODXA
    _8zq7Z9rlaTr2-Px2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepudelfedr
    vdejrddufedrvdefheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpegrlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:cT5dYLGZv2TRCuz8NfRg6fNo7C8jT-2p9cPnFuRqg82hokY6BCdSLw>
    <xmx:cT5dYMlr-tc4BTl33b7JU6KNcMw1wLITXNpY3np0wLNCSztkg45oBA>
    <xmx:cT5dYIJnbV-YHOWR8-GT_bDhdV_9fn4V6e_YHOJDFAuSGMDmOLpNtA>
    <xmx:cT5dYJXGMMAjHpFK7IODLJO9Ex7AJM1UvjQBnEpIfluTyaOrIlIK6A>
Received: from ThinkpadX1Yoga3.localdomain (unknown [193.27.13.235])
        by mail.messagingengine.com (Postfix) with ESMTPA id DA79D108005C;
        Thu, 25 Mar 2021 21:52:48 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 09/10] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Thu, 25 Mar 2021 21:52:29 -0400
Message-Id: <20210326015229.141-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326015229.141-1-alistair@alistair23.me>
References: <20210326015229.141-1-alistair@alistair23.me>
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
2.31.0

