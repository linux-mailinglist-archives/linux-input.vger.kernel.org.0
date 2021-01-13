Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE972F42CA
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 05:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbhAMEGe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 23:06:34 -0500
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:52943 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726023AbhAMEGc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 23:06:32 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 18EB919F7;
        Tue, 12 Jan 2021 23:05:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 12 Jan 2021 23:05:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=WaS8/78gDwrUX
        gmgRZUlIKgc3Lq9AqgE9iKAVPo1S9o=; b=lqGyIJVbl43S9Pjl8Y9VUTa6/RdSK
        8t4EYFwiEoSuYOdrc4vOFXSH8onIrj9M0GNdli4oen8ByANid8tRRbO8PEAA1R+e
        f4YbE2hTUidNuuzxUiPMJnpWJxm0SyfxOGDlruAgZSBbUyPXUnlp33xEbBqXwDoq
        bwlnMOApElzAyOWBTXKeBcNQSosaQRCOwqYW2Y81LSC/f/ecUMlEeKP4QR9NgZyD
        qdK9E5jHVP4kFMBavDBaBIomnTzaZJu45LCz+vrpsl+UBQGqvIpQQ6iI7CC7qDGI
        SoqCxuaMAOlRXQ2IlpWbZPBkIvexamPvIidsQn3hbxIplA+MFi22bTPuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=WaS8/78gDwrUXgmgRZUlIKgc3Lq9AqgE9iKAVPo1S9o=; b=SgBm+OOn
        wQFbVLzBHL4NPEdfZq/RtaHCO6NLyKr/JmdVAWwm59dI8wjROR40J6EkRTbmKOmy
        UrCMLLPgMCgvKuYNEm9oc6ujXipf2xRGjMtmIjy8+RbXePLlxH+fQbCdqoHJk+/G
        fp5aN3OtftGZXOwMfQcZ9VuRMk+C71pyd30BQre/Ng28gonHRqxk769Rc52DXiSC
        XBZK20X5ET1+fySmaWrZS3CRGT2wRRducb6ribHT3ZhqVDbmv+mAcnmC4LcmyLcU
        b44Z4Zk1p34QXRB3GG/APrnc5aKgKCcFCnRCmKRgc15dTHBioKq7sWdECiV6OJvf
        R+P9pIwZF1vC3A==
X-ME-Sender: <xms:mXH-X7B5mV0k4QMWi0syMPjG2zXy3lAgYm4MLYOTDtCQqCI-jyNXlw>
    <xme:mXH-XxgM49NfuH0eRZUNjE7WAZB78hCOmthkxnjmBfT-G66HAOgoqSlSzeVjyt22e
    Z8WxHfo8D1NhPbUOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddugdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhuvghl
    ucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecuggftrf
    grthhtvghrnhepudfhjeefvdfhgfefheetgffhieeigfefhefgvddvveefgeejheejvdfg
    jeehueeinecukfhppeejtddrudefhedrudegkedrudehudenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgu
    rdhorhhg
X-ME-Proxy: <xmx:mXH-X2kOCiLfseWDq1ii3OUQCWPI28_uI_gWGr5VqEgdvAMr3sBHIQ>
    <xmx:mXH-X9zk6SIEjKmQPTyi0SyfGMJ8M264PxuoQi7ch7a_A-sig1yllg>
    <xmx:mXH-XwTeRwAEgr_W5PcaZiprgl3ud6D6Kb5aCjGR8gIkdWvK8ULM5w>
    <xmx:mXH-XzFj7dfbgLZeb187pxDzK3oBu9xb9wdSfW0_3xZwQOBhLny4FwAghl4>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id 16EF024005D;
        Tue, 12 Jan 2021 23:05:45 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2 3/3] arm64: dts: allwinner: pinephone: Support volume key wakeup
Date:   Tue, 12 Jan 2021 22:05:42 -0600
Message-Id: <20210113040542.34247-4-samuel@sholland.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210113040542.34247-1-samuel@sholland.org>
References: <20210113040542.34247-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

PinePhone volume keys are connected to the LRADC in the A64. Users may
want to use them to wake the device from sleep. Support this by
declaring the LRADC as a wakeup source.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
index 2dfe9bae8c67..7f37f9fea0ab 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
@@ -196,6 +196,7 @@ &i2c2 {
 
 &lradc {
 	vref-supply = <&reg_aldo3>;
+	wakeup-source;
 	status = "okay";
 
 	button-200 {
-- 
2.26.2

