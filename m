Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF28E1389AD
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 04:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732961AbgAMDUh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Jan 2020 22:20:37 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:37877 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733089AbgAMDUf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Jan 2020 22:20:35 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 5AC3121C48;
        Sun, 12 Jan 2020 22:20:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sun, 12 Jan 2020 22:20:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm1; bh=SZrI8XmySgH/2
        cg6dfX8zMCfK+fd6PWSafQgr7UxYF4=; b=lEvrfsmccR9xG7VC+ZopdH2eTncS+
        FnvD7EjVXY/4RsqJbhw2/TDvfUB58iU9qC6gAHXU6dqI7uzK+9dUrV2H97nC4hg5
        AhIkgNoHaUMDwdiqK6QNZAxJH0dkOcYym9epY/42mQNJt40NTIpygPVTXK9BiUMM
        nw6ve29aS2qUGgnB0YOV4IOaOpEtQD4PFzCeJhZ22gritIku4oou0Eaj1HPfnN+p
        b/tCNXxo279VybPVA0KMkq0lxR45q+5x6k6/iZ0W8NwN6X0GWBUYfwjYILt5nEoW
        B03KiPZpoVfPrcBfjJPg0PYctTlYaOLJLYD2pWT3KzCBLz390vD08xP1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; bh=SZrI8XmySgH/2cg6dfX8zMCfK+fd6PWSafQgr7UxYF4=; b=MVfJ1J1G
        K14gbivui6u5RTe3xk0YRtVhlM1HMdZl6vFalW7apkjiHPSvlo1w4rrhZSqGtVcq
        pkfzflCuErbOz2F1NXExgkyRaDTUbBUxHDSA+loZl61XW3aW0I/93EL54Nxrc+Qn
        fXRXlErv/YpkDVQrgKwjY00vihlBhScbnJ2S4WpROgwlom5Vhziy6yEvvQjMDF76
        A1IczD/yL2GUTS6Cyoo0ETyUuvHI14jmqqVes4RPTj7ne5t8Pa2D/lj2V7sqZOHf
        IzOS50GO69hG2cuakdMNgJRV46kGWx9thrfV+f36WD6vgscpQKPkCuwwWQ7cMP6q
        zcnR8xwH5x7EZQ==
X-ME-Sender: <xms:AuIbXtdpRg9QbRibOj37Vdlfoh9QK9xVmxOVraOUK8Ys3kBWYCFj-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeiledgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucfkph
    epjedtrddufeehrddugeekrdduhedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehsrghm
    uhgvlhesshhhohhllhgrnhgurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:AuIbXsK4fgS9BoJ83jp8QPxiZS890tjz1IB8CcQViCrfbBsJvelRiQ>
    <xmx:AuIbXm38dzGtOXTtFdUagadGPp1E3ljO77jYkTz7XLL7rMtU_wOWKg>
    <xmx:AuIbXlYy3sTj1CTG8cCyn4QCzmgIfasu5QbW4VH_P5X0YnCPBWPjVw>
    <xmx:AuIbXqosCmOMUp6RIinclIdGpzIC2E9Sway64M3NHK6E41jRaHHTLQ>
Received: from titanium.stl.sholland.net (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
        by mail.messagingengine.com (Postfix) with ESMTPA id D926680063;
        Sun, 12 Jan 2020 22:20:33 -0500 (EST)
From:   Samuel Holland <samuel@sholland.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com, Samuel Holland <samuel@sholland.org>
Subject: [PATCH 3/3] Input: axp20x-pek - Enable wakeup for all AXP variants
Date:   Sun, 12 Jan 2020 21:20:32 -0600
Message-Id: <20200113032032.38709-3-samuel@sholland.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200113032032.38709-1-samuel@sholland.org>
References: <20200113032032.38709-1-samuel@sholland.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

There are many devices, including several mobile battery-powered
devices, using other AXP variants as their PMIC. Enable them to use
the power key as a wakeup source.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
 drivers/input/misc/axp20x-pek.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/misc/axp20x-pek.c b/drivers/input/misc/axp20x-pek.c
index 38cd4a4aeb65..b910c1798e4e 100644
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

