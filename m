Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEADB3DE8DF
	for <lists+linux-input@lfdr.de>; Tue,  3 Aug 2021 10:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbhHCIt5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Aug 2021 04:49:57 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:38969 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234844AbhHCItz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Aug 2021 04:49:55 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id E12575809FE;
        Tue,  3 Aug 2021 04:49:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 03 Aug 2021 04:49:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=+EvKAZLb0ChvJ
        XRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=OhoGu3kJ/kj1bjq2FMrRpamL7Gbrg
        omq9sVPeiOzZfJq1DzPa2qWUZqpv6UMxCat5edCGlnrZ6na/nZlAGKt7+cNZKWfK
        WjjV85NOpbrC5rVlPSfArMMH0mYtgG51rsETWVcc9GrEZqvBw/X4iGOD2YYYfdPE
        TCcMKwGCbv/PVXOcNHeMeaNXstzYihZF1ExbntxpT62OErY9u+CQ9n3EFuQE4H12
        z236ji6zJ+grHZdonxJ95XArYvWMtSRU21gmZjYu97UfHJD4xJfcqOcQWKTLZrcY
        KlCyJS8BevdfBICO06l1t9u6t0BQv52DRvHcVCBjFA8TAM8fHSYPksmDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=+EvKAZLb0ChvJXRDnM9S3OyJUJhWZBps8+iA1VzKiac=; b=gXTwWXc6
        nIgF20/6GGk7Q76uqxjX9u7DAf7zJirjSOFePBcBdLi/DYxV9w7oCqO9FWuhNsvZ
        hd/26ltG8t8CnOXdhqlMG3mWJV5iTVxAyuGCExUwkVi15Wwcvx44JbXqD2eC6x+L
        tXP5wh1hMZvVvEI5aW2hwCO+wYjqFkvFLmOsQsbbsYqBXt6T//eBkg2fBoLfceUM
        1jhBUBJ1XfBRMF7BgTBWRkJ5zuzMqYXuTucDQGPaaOXPw6jkUmMc31MgA8vxRlud
        X+3p8Geaq3rl2+lGIaxXG/n0sbSCLvDHF6fqxxVNdKluJtrR330+DaPqHVK7xOI2
        CTbrmZHfR+Uqmg==
X-ME-Sender: <xms:KAMJYRWpgDWHrjNlb4ZYu-YksDkA7FnxgM7sFg1i2xFUN2opbEpQuQ>
    <xme:KAMJYRn4Ar3AEqQ_Ef0ZKAIGdEYQZGvtpPbaYcTMtfpwUJNx4IjCwoeNYtoVFjBE0
    aGkjcL7X0S95rH05c0>
X-ME-Received: <xmr:KAMJYdZwloExSFA2ThVG93-lRFTwPk00jWW7Tkb3QI9yO8QSjpWi-fAT9hISwd46wFkx2vhjYxJuQzqvMvurwnxshPlxQUJBHB7UTnSWHnjlIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieeggddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:KAMJYUW7mTRKHhsCj9VNlAPn3M58b3qsrDjHgdQNtvGhlRp-QAJJNg>
    <xmx:KAMJYbl-lDk0kyins8txkFVxmHzVvc8xIU3uazwfCNlsx0E_Z2FsDA>
    <xmx:KAMJYRfHhq8NKvqnMSBLKyYxgBiXaX3ptmpjaOVo1hS-6MnMOk_hEg>
    <xmx:KAMJYUcx7COZUYUqCyPWMMiAC-7_EbeRqvd50g6UqdY87mlQTQkdIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Aug 2021 04:49:40 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-imx@nxp.com, kernel@pengutronix.de, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com
Cc:     linux-kernel@vger.kernel.org, alistair23@gmail.com,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v8 8/9] ARM: imx_v6_v7_defconfig: Enable Wacom I2C
Date:   Tue,  3 Aug 2021 18:49:01 +1000
Message-Id: <20210803084902.336-8-alistair@alistair23.me>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210803084902.336-1-alistair@alistair23.me>
References: <20210803084902.336-1-alistair@alistair23.me>
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

