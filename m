Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B76D61D556D
	for <lists+linux-input@lfdr.de>; Fri, 15 May 2020 18:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726349AbgEOQBX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 May 2020 12:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726188AbgEOQBX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 May 2020 12:01:23 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E200C061A0C;
        Fri, 15 May 2020 09:01:23 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
        (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 49NtSJ0n4HzKmbx;
        Fri, 15 May 2020 18:01:20 +0200 (CEST)
Authentication-Results: hefe.heinlein-support.de (amavisd-new);
        dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
        header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1589558477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=w+PiomkJZ7jFlkkfl58ZR6NQt9BMVrpVorVvSHDPZaw=;
        b=sRTS6j6jk30aT41zShAFepRc/3rbvP/wYZahNFeKTxVJ6cklLf9FMD+BBtWNGEhJFfrzsO
        leps9WG5KF5OEjNZqi3dwSDADYZB0MXhcCTfp8lz9cMckj2sY7NMnCvpu5onuc8vdCmz8X
        gwx3F37OdcewiaULU8PxrOTj6pMjMU2gemue4K0VXVVbQcxXnihXRk47qrHjTiVpCYuT9i
        u5ajJraZ62lvJC1USWkKhaMSOcYnAads3ML1Orv5jHW9gOWylXIGdS6JM4HXXHbnKWbsih
        ofFZ7eDDnOns7v5zmM4cTlagy91IgCTRgsQoLHWp/M0wLA+OcmxSluSDascb6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :references:in-reply-to:message-id:date:date:subject:subject
        :from:from:received; s=mail20150812; t=1589558473; bh=HJg1YQnjJH
        2FjMqqiNGWACpqo0E0oCOo3cQeEbiw2ec=; b=o2itdzwiOSFh8Rnmlpsdpgfbfv
        Lhq9YyJ9VPIJ15xisCIJzijEfLbWCzUJzcTooy0D0A7JrSW7F9hqmyZWnmipOk6s
        LWeK2TDm/5Peftg1asRnq6AZMuEFXWs0EfEMr3rJ5DzeBLxZR3Y8H3rJGR2TxvEx
        zvzHKRQ5B2K0JsIGe5iJOatmqfcPQ2RFqHFXNaB/BSu4HbzsQAEuNIwHG9n+x7OD
        lx3jxIL1rR1bt27TiEhA95FG/Qy0UGflexboLTRCcYYmofGBXindkLlcbVIF41r5
        o2328UvWmvnVTsP4FOUugK9R7VFaH9SeuVxkbHC1+4WCkOa2Dc9VU4C4DHSQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172]) (amavisd-new, port 10030)
        with ESMTP id kSmbJmCzHMgm; Fri, 15 May 2020 18:01:13 +0200 (CEST)
From:   =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Darren Hart <dvhart@infradead.org>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bernhard=20=C3=9Cbelacker?= <bernhardu@mailbox.org>,
        Otmar Meier <otmarjun.meier@nexgo.de>
Subject: [PATCH v2] platform/x86: touchscreen_dmi: Add info for the Trekstor Yourbook C11B
Date:   Fri, 15 May 2020 17:59:12 +0200
Message-Id: <20200515155912.48032-1-bernhardu@mailbox.org>
In-Reply-To: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
References: <CAHp75VfAeyMnwoJi8P0d4Gs5dziUQYhPGzS2fmev00UiRZ6vaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D45021768
X-Rspamd-Score: -5.40 / 15.00 / 15.00
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 87591cea127a..f9d9045cdf40 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1197,6 +1197,14 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
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
 		/* Vinga Twizzle J116 */
 		.driver_data = (void *)&vinga_twizzle_j116_data,
-- 
2.26.2

