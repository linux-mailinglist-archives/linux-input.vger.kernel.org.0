Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3631CFFE6
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 22:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgELUyz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 16:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725938AbgELUyz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 16:54:55 -0400
X-Greylist: delayed 822 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 May 2020 13:54:55 PDT
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07F7FC061A0C;
        Tue, 12 May 2020 13:54:55 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 49M8pb1h0QzQlJh;
        Tue, 12 May 2020 22:41:11 +0200 (CEST)
Authentication-Results: spamfilter02.heinlein-hosting.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1589316069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=MHE5HDYUp4ziY4D8HlKdrvvV3+WoPULvfdhF5zVXVow=;
        b=x+9/A1OdczhM/9J4mozc0t4zDAnMYC7w7Wy7n/vgpr9Ko3TnZGe26KcVhCDqVgynRnL48m
        QlMlcr06l09187DMD8yfeT0ihABTolD9w9MajIeQhmOjKpTK/LpcXDC5r+j0Rpx3/IRg9v
        55RxYBwjIszNsoF6qkcUlEc4xcu96dIIEt2uyH/lO4aa4z4b6jep+j87dfXZxQQbVTw+EL
        9nf/Jf/5ooR3wrk/zzU/TBw+3gjl3ILdBD1BfdL7dr78aap4LqwAKfYX4WMsWJIbgZythV
        azLqSF3mCaqrpTpIQ3RuuP0tEKaMqBK8hPmGKgS+VEbD6g6oiQxe1rFF38Il5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :message-id:date:date:subject:subject:from:from:received; s=
        mail20150812; t=1589316068; bh=18gqh2bI5mRZ87cfRXk7+SQH6lRaU/Zej
        e9HRPdkQ9E=; b=kepMPCCFDjoGSM0iJT622cLcScB2XDeCJqOLjllrJmV+P1pXQ
        5BexN9QyP9WLbVOiQLDiuTr53VPQZHip0pgrCj7XD0zls4HnKaqq8y4rIPZz/Az+
        DNdT/kF7Yd4+tclo4Yu4IQsi/EYB6FgZSgO/w7x24BoEUbj2ZehbnSdGdvDaUZVS
        Jhcfr0nP2z7A2OFe0ofEJH5jYYmKEc0D+nr4RLYljZDjbC2aremYmsPC2VC2Qqki
        VMAbumMJOOl8bolElT6ZcAwD0L8WmqLJkiWTQBfY1538qk3tGHg+EyPSYYOvOw8N
        05iYCoxuD6pcPaoZRcs9bNOJOFAt4wikcYPGg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter02.heinlein-hosting.de (spamfilter02.heinlein-hosting.de [80.241.56.116]) (amavisd-new, port 10030)
        with ESMTP id g1Avzd_OYPJZ; Tue, 12 May 2020 22:41:08 +0200 (CEST)
From:   =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>
To:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>,
        Otmar Meier <otmarjun.meier@nexgo.de>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B
Date:   Tue, 12 May 2020 22:40:09 +0200
Message-Id: <20200512204009.4751-1-bernhardu@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 28EC51807
X-Rspamd-Score: -4.38 / 15.00 / 15.00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add touchscreen info for the Trekstor Yourbook C11B. It seems to
use the same touchscreen as the Primebook C11, so we only add a new DMI
match.

Cc: Otmar Meier <otmarjun.meier@nexgo.de>
Reported-and-tested-by: Otmar Meier <otmarjun.meier@nexgo.de>
Signed-off-by: Bernhard Übelacker <bernhardu@mailbox.org>
---
 drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 6ec8923dec1a..d87315892458 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1106,6 +1106,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_VERSION, "TREK.G.WI71C.JGBMRBA05"),
 		},
 	},
+	{
+		/* Trekstor Yourbook C11B (same touchscreen as the Primebook C11) */
+		.driver_data = (void *)&trekstor_primebook_c11_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "TREKSTOR"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "YOURBOOK C11B"),
+		},
+	},
 	{
 		/* Yours Y8W81, same case and touchscreen as Chuwi Vi8 */
 		.driver_data = (void *)&chuwi_vi8_data,
-- 
2.20.1

