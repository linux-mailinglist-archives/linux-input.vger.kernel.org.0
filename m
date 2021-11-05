Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A4C44623E
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 11:35:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233134AbhKEKhz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 06:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhKEKhx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 06:37:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5C6C061714;
        Fri,  5 Nov 2021 03:35:14 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1199E7;
        Fri,  5 Nov 2021 11:35:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636108512;
        bh=IEjUClWapyjX1HEa1/kYmeWrMydAUUc4XIq1iNdGE88=;
        h=From:To:Cc:Subject:Date:From;
        b=FOZWUF1F+Jr9saHNaIMljatR0si9VEcfq5kvi022un6PVrqJiH7LuL2Wo9Qwu6kGm
         tjjNJDUoom5+joeCHloE51yA9nN6/7Zt1bSm2er2EnjT0dVNfHLEnx6vZ6fdXmI64h
         /1H65C+iAIS3XtIJnqt8tkDsBF2DT6TqN/Njfa7Q=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] Input: add 'safe' user switch codes
Date:   Fri,  5 Nov 2021 10:35:07 +0000
Message-Id: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

All existing SW input codes define an action which can be interpreted by
a user environment to adapt to the condition of the switch.

For example, switches to define the audio mute, will prevent audio
playback, and switches to indicate lid and covers being closed may
disable displays.

Many evaluation platforms provide switches which can be connected to the
input system but associating these to an action incorrectly could
provide inconsistent end user experiences due to unmarked switch
positions.

Define two custom user defined switches allowing hardware descriptions
to be created whereby the position of the switch is not interpreted as
any standard condition that will affect a user experience.

This allows wiring up custom generic switches in a way that will allow
them to be read and processed, without incurring undesired or otherwise
undocumented (by the hardware) 'default' behaviours.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---

Sigh, a compile test might have at least saved the buildbots the trouble
of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
even so - I'm really looking for a discussion on the best ways to
describe a non-defined switch in device tree.

Here's a compiling v2 ;-) But the real questions are :

 - Should an existing feature switch be used for generic switches?
 - Should we even have a 'user' defined switch?
 - If we add user switches, how many?


 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index ae2e75d15b21..dfa1e4f41cd8 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -326,7 +326,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x12
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 225ec87d4f22..84a7b3debcb3 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -894,7 +894,9 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_1			0x11  /* set = user defined */
+#define SW_2			0x12  /* set = user defined */
+#define SW_MAX			0x12
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.30.2

