Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E872363DC2
	for <lists+linux-input@lfdr.de>; Mon, 19 Apr 2021 10:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbhDSIkP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Apr 2021 04:40:15 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:59889 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237966AbhDSIkK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Apr 2021 04:40:10 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 42EFB5C0081;
        Mon, 19 Apr 2021 04:39:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 19 Apr 2021 04:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=ATQZFgAJhWZiG
        ySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=NWgKqur5sEft9KwkGah1vBfDqqggx
        mcqci3IoWGvhuA3cRVSq15znbn2VZ+keDl1wW5I7nszpWh9YjNeRmqwui+0pqO21
        hfcKNGpNL6GX7f3LMtIuCm27bBRNuuTPNfVYZ+yrph0ki5xZ/YWXpFtOqMDH0/HH
        PR3NWXf3J8s33EccInBfN3oGJU2piI3qRimQQ9EDFKIucEf8ffyZyeVlf6TkYF94
        9/yIedw1L8hGcMX+oc/+sV/1Vaj6RNsg1OD3qPrBDQ1FVDlvZF43ELGkSf+HqX96
        7rGh59O3S+ike1In1D6oB8S2G5R1MXM36h8TcUwEiqhPc2UyiVKD7j2sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=ATQZFgAJhWZiGySupWX/oJS6Wb8DhGdjsY6S4Ar60bs=; b=Q0stw50Q
        wU/8UoU6h5d/NzMds66GSlume2VmusiTgz43VLhUg0BVm7TWuVtCWXx0boFYfQ4w
        hVgWYO2Qf/eRltjxRyQykeV6fVUKez1OC5XwPeJEKGZAw+zjrL6fNjJmnUyv8AK2
        HAEY4IqKEgVYTIm8yFV2E3SdOX4SdNKc6FUYkFjSOfu2uK+WcB6923ESFQjbqcoT
        Um0BqKS71bKPlh2w812j3aCFMcNEOIpQ5poPhXZWLZEDDvdm6Vs1xqdrUBHrhRL0
        ZYtgsG8cudNpX/17mx+3U5x0f8r6hHYpd9wfn8f3Kb0q1ALdrZiY9NBohexLJ6pM
        DwaK/5D2TWBu/g==
X-ME-Sender: <xms:zUF9YHnRHEX4FucKuJqf27f0PoC8MKEaKlK3jsnFrUntqIpqvgJxoA>
    <xme:zUF9YK0C-qIsmEYRRk29Gnwdre4n1e6OH-SG1KPg3G5t-puLHtkDyqx8_4uirD4_w
    ku0OeWNIrJ06p7VctE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgr
    ihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeeggedtteejke
    eggeeugfehueevudegvdetjeeviedugedvtdekffekhedtteduhfenucfkphepkeelrdeg
    gedruddtrdduvdefnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilh
    hfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:zUF9YNrptndxjGE8kUTIc37ousq2h1WQ8vfAf0GgbwbVZgcZoN67ZA>
    <xmx:zUF9YPnZ1jRhgwIa1_jozfrSzCz4egUlSnR1Fk_k9g27w9lJg193Sw>
    <xmx:zUF9YF1JIKNnWOeVOhzWH8xpQWEgz6UNJ4LObX5PNwTV1rJIW5r7qA>
    <xmx:zUF9YOyeQ7gMLJwRm7k6r6MUSP2wvjs3ydVUY2aw61GI9DwRMdHVAg>
Received: from ThinkpadX1Yoga3.localdomain (unknown [89.44.10.123])
        by mail.messagingengine.com (Postfix) with ESMTPA id 9D3921080057;
        Mon, 19 Apr 2021 04:39:38 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v5 8/9] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Mon, 19 Apr 2021 07:01:03 +1000
Message-Id: <20210418210104.2876-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210418210104.2876-1-alistair@alistair23.me>
References: <20210418210104.2876-1-alistair@alistair23.me>
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

