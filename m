Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 481BC3A7BF3
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 12:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbhFOKdh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 06:33:37 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:34921 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231706AbhFOKdf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 06:33:35 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5339B5807DE;
        Tue, 15 Jun 2021 06:31:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 15 Jun 2021 06:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=ATQZFgAJhWZiG
        ySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=QQ4HFdf0zD7LjSbCP7CPujaDpyZh3
        SFAtUwieQ9k58kNNp+ESWRuKOOVEeWI/ADaro2/8+zs1sPw6U5HmbCLOAZk4riHf
        bfuQP0yOsgxY+K3j/BmgcXdTBY64rwCTw6QTDD+tjBCOPiRRP+tn4RUjTN1PkbO1
        Q4iL6mSwhzlYpROeeBfvp0oCgvzqZUHyAIP1bH06SsWfv9LrwzPSaV/RejDCqS4o
        alKEnDcmkkvUPqY5zthlF8IIoBvoEcRd7IK76ZtC8Gdjm1pd4zQvZNO00Apl2cV/
        n2mF6H1MfhmRHJRyEMe9GU+HKaUGJFAqaoD2P+rVzC1Xx9W7euQMFgu0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=ATQZFgAJhWZiGySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=s70wL3yB
        Bah0XOYE67ImGWZmUKfabNrigF3MqE8ROt2kmD4vnk+7I32ZgnIrSiu1hg5S1jgq
        BTtINqXPdPvVvyZgs150ZoYCk7I2hGdrojllbD7JuNSBCXiJMAk+sW4Pr2EYF2Rs
        GCgpyG9wqYDyc2ltX3qzMKQzTxooOTGKzoz49bX0gs4zw21H+yNeK6n6kxKaBz3M
        3MY3cl2qzSXbVLEY0TpliwEtOmRSiOmWNGy9n9/o3pyzZgtJCDng9NNe12uBoFfd
        +mF8xrMJN/NGDGpE9OPJt1zKeoZmjRcjXFrMoCA6u7uOIotguMImo9/fPctw8SGl
        cL+X/8LrFC9J/A==
X-ME-Sender: <xms:g4HIYEIOFK7zzkUuqo_FvObx8NZS6l70sNDxzVL8qg8Xcdfz15T1QQ>
    <xme:g4HIYEJ6J8y7kJlT_VPoQvhj9SUWShgbivlbhBgxvr-cHI73vPZIg9RdpDlBwLzWx
    p6bMZ683T1YnVLUjIY>
X-ME-Received: <xmr:g4HIYEuy3kyIT1Dtlh74Y6P7nCr_TKoKMXY67bAEAILlUsuWdYdiJPkZSBKLrbqAumsClBCr36ABE_NG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvjedgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrlhhishhtrghirhesrghlih
    hsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:g4HIYBa4CHvv39Q0Vmz0d2a1HnR5aURzhvyn6Q_fMxhZPRb-egSinQ>
    <xmx:g4HIYLbppTygEH8PdP03_7G2w-cwQU0UXVdxmzI46bUFNp_PYredOQ>
    <xmx:g4HIYNCiTKuONETUyNbyXdnAUo31v2gwEOcg4nFBzIODTNymNINYDg>
    <xmx:g4HIYJPDmmOXZTr3zW-A-vGi-SP1YfKVg6E6ZELgdLiRaxcvozEWjg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Jun 2021 06:31:27 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v6 8/9] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Tue, 15 Jun 2021 20:30:13 +1000
Message-Id: <20210615103014.798-9-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615103014.798-1-alistair@alistair23.me>
References: <20210615103014.798-1-alistair@alistair23.me>
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
2.31.1

