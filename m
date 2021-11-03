Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2A94440C9
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbhKCLvd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:51:33 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:41497 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231960AbhKCLva (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:51:30 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7DFA058074A;
        Wed,  3 Nov 2021 07:48:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 03 Nov 2021 07:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=OwbeNYUWTx6i5
        g1znngcyGY+RAlSxZxZx4m1p69wH18=; b=bSSjxUWH1o1sDdmw6UayZciPfawQE
        aQ2+j7FmQdY5HDvy8T5PXC1wjgkAAFt6Dw5WnF5lHU4YO+/eMT0gS8SGYp+ZVf9P
        m6ZcpFiDf8cVLKYGQTbbBMO1uAFosejqWAPLzMjItiNr8K80HnzLkQVbQDP4KIeF
        /V91/MGo0GUHSklqcII1SJMBJ4xRn5wm6Am0elxoKhFXXvAbXSIyVA66+OuyjBMc
        3RHyJcuMg3kVxjDbby9W57tCgZtgimaCk1yoTL6/i+tDkexMs0gSVkiAsr+ubCVY
        QOO+CEYNxJ1kawXJ0fTLK7xx/m/JwQ2lEutetBIS6qq2kvI9vnleikbgA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=OwbeNYUWTx6i5g1znngcyGY+RAlSxZxZx4m1p69wH18=; b=RTSNHC2d
        WVVyt6vd0DBMTu1q8A9u670NjB0U+1Ai/h+6ZlM48GIySIsH9YwJKozxBO0Xw4Hl
        3z6ZW2Q8bHoazfrjBV26DEmFuC4qHjwbDvBJ5noBOvfZwoQN0OPADBCoJNbt9MKz
        kVu6qolKMulGJRrfl2JhCqg3USv/oNERn6abWOVtXqzJfvsMAAC82QX+vgKEi5C8
        JaTzIKrHOVJLhyiKAV+Pr5OmqWZMWFK70xK3X/XtNCwWoz9YE6+DZKNBiQ9gZvaU
        H2/8wvIvYehNotPE7wVB+KMj66FQ5wLW5vP3gFASCd3ZKCcHJHLLuYrp7ulFpJ1e
        k1n0FiVq6tcFTA==
X-ME-Sender: <xms:JXeCYUpXwy73jQiDJCnvk3AHT2N6u_GIl2554KFZEPOpnLn92WhE5A>
    <xme:JXeCYarCxlUV8G5q0BZVhYdYGKHZedRlZHSKQt0giShbXgTxpS0CDdnBu3lBstcXF
    ibbNZeHpBc6dXZUino>
X-ME-Received: <xmr:JXeCYZP2nfAfIfSgR5YCBvrsAYkrGRzNTW8QTO90wajqwCtOImsf3v7Bzet2tgp5rY2WeqbuJKE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
    ertddtnecuhfhrohhmpeetlhhishhtrghirhcuhfhrrghntghishcuoegrlhhishhtrghi
    rhesrghlihhsthgrihhrvdefrdhmvgeqnecuggftrfgrthhtvghrnhepgeegtdetjeekge
    eguefgheeuvedugedvteejveeiudegvddtkeffkeehtdetudfhnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhish
    htrghirhdvfedrmhgv
X-ME-Proxy: <xmx:JXeCYb56MW3dYXsmuqqPcD0AMBEB1Kjs4UT4THGQdha3w1yerojmug>
    <xmx:JXeCYT67wxn73qiWu2mgTLf1Ah2msKl4B4ltGzuNYiz_8HMdg4Zt5A>
    <xmx:JXeCYbgJn7TtCTbTXInWwy4BI0k7_-rWitubvWRM_2UmAsfZElQPig>
    <xmx:JXeCYQyZp7pXEqWyTlVzuLe943KM-hTDgS2KVZ59yBKFL4unw91mLQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:48:49 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        andreas@kemnade.info, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 3/4] ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen
Date:   Wed,  3 Nov 2021 21:48:29 +1000
Message-Id: <20211103114830.62711-4-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211103114830.62711-1-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
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
index b2db0d6509bf..969c970aace3 100644
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

