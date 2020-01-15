Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEFF13B8D9
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 06:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbgAOFM5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jan 2020 00:12:57 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39075 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725957AbgAOFM4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jan 2020 00:12:56 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B5F1D2213A;
        Wed, 15 Jan 2020 00:12:55 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 15 Jan 2020 00:12:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=D98v2uAcTult3
        PQU33a4vT0Zg4C0UFnIOjrqJQvWS0U=; b=MCyrB0gu/NReSpXDBOtdD7GJAJxIP
        8EGD2u+uMk/32phcTlozZmuMo9f2EHyZi4yuaD0euNDKEdzm+k8gyYn4dL+BUw1L
        ZV29HtrYk3EypcglvWdNSnwbmGDf2itw32RuE34yO7ws/Y8uVhl9QbEOnyayUnMu
        ypVUXGDkaQ/2mD4LA46/ATTf4/8IH/N/aUQWnZMmQkDOGdSE9LCG2Y8vUl9Ri5lm
        2PE852Nnino/VuMwpgHAWGwzawfGbcZK0C6jy5FYcqgEjRlOz56ppuPo0ehj8aB2
        HJK4hTT8Tj8UDgMorHshmjrYnlt0PcxoqYDPU9fd+Y3ko7rX+hjv7OPfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=D98v2uAcTult3PQU33a4vT0Zg4C0UFnIOjrqJQvWS0U=; b=ovSfeyh/
        wrlUhsPSArepQdaMSyXGSXsjHHCzu8oNZc7vUJ9q5uClp3zz/NkTAsuimAhBIEUc
        K/h1VH6RFwXMaOWyATgm6XAXdShh9Yqh40+J5/jJwuTSgCE4VAtFwR1yMJbOENcE
        /Gpmz6v0e+QNdBF0Bqqb4t/zKfX4YKqG34I5TMj/msbkJLxlYKCIyOAQuARM/FOx
        HByuRMGMuQfx46ChMQZ0hmFM6sDaSpDbiuroqq96J7IWmgzzDVBaizly9UDMf4yk
        VKJyVYmciPaHGuTVkSv6oKly2qk0BSAtRyJDj/oUjhx79mRE6ttH08h004dTkZ44
        Nr8oZydiNs1fgg==
X-ME-Sender: <xms:V58eXksWDN7NM_WbbOcXmFcFS5cRFIol_XHi1xKm0Sk9fZdGVbpnYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrtddvgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecukfhppe
    ejtddrudefhedrudegkedrudehudenucfrrghrrghmpehmrghilhhfrhhomhepshgrmhhu
    vghlsehshhholhhlrghnugdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:V58eXkvYssv-rlOzE3ktd2diS5asJObVBMDtWoiF2mNxLZJI60dozQ>
    <xmx:V58eXnRWwFx5nSbnbPi6Eaa-fNxf8WmES1Ows7A0kGBLOnwspWSmBA>
    <xmx:V58eXk0alpgCO_llI_tyZLhkGjqpxA5YznyBrIEeByVkUUCYvselkA>
    <xmx:V58eXhYPcIWqekD18DVSwLcp4XzmAKJDbAjPcjwtZ7A0YS8som65IA>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2C99A80066;
        Wed, 15 Jan 2020 00:12:55 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 2/2] Input: axp20x-pek - Enable wakeup for all AXP variants
Date:   Tue, 14 Jan 2020 23:12:53 -0600
Message-Id: <20200115051253.32603-3-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200115051253.32603-1-samuel@sholland.org>
References: <20200115051253.32603-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are many devices, including several mobile battery-powered
devices, using other AXP variants as their PMIC. Allow them to use
the power key as a wakeup source.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/misc/axp20x-pek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 0ace3fe3d7dc..1872607e87c3 100644
--- a/drivers/input/misc/axp20x-pek.c
+++ b/drivers/input/misc/axp20x-pek.c
@@ -279,8 +279,7 @@ static int axp20x_pek_probe_input_device(struct axp20x_pek *axp20x_pek,
 		return error;
 	}
 
-	if (axp20x_pek->axp20x->variant == AXP288_ID)
-		device_init_wakeup(&pdev->dev, true);
+	device_init_wakeup(&pdev->dev, true);
 
 	return 0;
 }
-- 
2.23.0

