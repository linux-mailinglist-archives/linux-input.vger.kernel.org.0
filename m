Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 970F01B6CB0
	for <lists+linux-input@lfdr.de>; Fri, 24 Apr 2020 06:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgDXEak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Apr 2020 00:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgDXEak (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Apr 2020 00:30:40 -0400
Received: from vulcan.kevinlocke.name (vulcan.kevinlocke.name [IPv6:2001:19f0:5:727:1e84:17da:7c52:5ab4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530CFC09B045
        for <linux-input@vger.kernel.org>; Thu, 23 Apr 2020 21:30:40 -0700 (PDT)
Received: from kevinolos (unknown [IPv6:2001:470:b:5c3:2575:4a53:a0dd:1397])
        (Authenticated sender: kevin@kevinlocke.name)
        by vulcan.kevinlocke.name (Postfix) with ESMTPSA id 637DF185F845;
        Fri, 24 Apr 2020 04:30:39 +0000 (UTC)
Received: by kevinolos (Postfix, from userid 1000)
        id A88201300671; Thu, 23 Apr 2020 22:30:36 -0600 (MDT)
From:   Kevin Locke <kevin@kevinlocke.name>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH] Input: i8042 - add ThinkPad S230u to i8042 reset list
Date:   Thu, 23 Apr 2020 22:30:36 -0600
Message-Id: <94f384b0f75f90f71425d7dce7ac82c59ddb87a8.1587702636.git.kevin@kevinlocke.name>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200424042500.GA107217@kevinolos.locke.internal>
References: <20200424042500.GA107217@kevinolos.locke.internal>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On the Lenovo ThinkPad Twist S230u (3347-4HU) with BIOS version
"GDETC1WW (1.81 ) 06/27/2019", the keyboard, Synaptics TouchPad, and
TrackPoint either do not function or stop functioning a few minutes
after boot.  This problem has been noted before, perhaps only occurring
with BIOS 1.57 and later.[1][2][3][4][5]

Odds of a BIOS fix appear to be low: 1.57 was released over 6 years ago
and although the [BIOS changelog] notes "Fixed an issue of UEFI
touchpad/trackpoint/keyboard/touchscreen" in 1.58, it appears to be
insufficient.

Setting i8042.reset=1 or adding 33474HU to the reset list avoids the
issue on my system from either warm or cold boot.

[1]: https://bugs.launchpad.net/bugs/1210748
[2]: https://bbs.archlinux.org/viewtopic.php?pid=1360425
[3]: https://forums.linuxmint.com/viewtopic.php?f=46&t=41200
[4]: https://forums.linuxmint.com/viewtopic.php?f=49&t=157115
[5]: https://forums.lenovo.com/topic/findpost/27/1337119
[BIOS changelog]: https://download.lenovo.com/pccbbs/mobiles/gduj33uc.txt

Signed-off-by: Kevin Locke <kevin@kevinlocke.name>
Cc: stable@vger.kernel.org
---
 drivers/input/serio/i8042-x86ia64io.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 08e919dbeb5d..7e048b557462 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -662,6 +662,13 @@ static const struct dmi_system_id __initconst i8042_dmi_reset_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "P65xRP"),
 		},
 	},
+	{
+		/* Lenovo ThinkPad Twist S230u */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "33474HU"),
+		},
+	},
 	{ }
 };
 
-- 
2.26.2

