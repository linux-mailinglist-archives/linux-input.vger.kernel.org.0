Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03C9744590C
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 18:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbhKDR4h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 13:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbhKDR4g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 13:56:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47F4C061714;
        Thu,  4 Nov 2021 10:53:58 -0700 (PDT)
Received: from Monstersaurus.ksquared.org.uk.beta.tailscale.net (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A11F91C18;
        Thu,  4 Nov 2021 18:53:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636048435;
        bh=qGSuuTnM3mb4rnj/RSz/PrRrWVygP1aCNwH3RPQW22E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=epZS5N3bJxC9UzAyp64zLc0C1SJD8BQA06Sg6cSngLDnFsloHxIq8pw7ZkbPdHx1/
         2/s2n9i42K/6NX7TYeyDj3UQyNHWloGHH0N7TQiSCN+0jRT4a3x9IdZEIBvn2hnvsI
         FOOHfYE48SXTEA5MUbgldcLLBc7dm8fLTBctqW9c=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] Input: add 'safe' user switch codes
Date:   Thu,  4 Nov 2021 17:53:39 +0000
Message-Id: <20211104175339.3906851-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com>
References: <20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com>
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
I'd like to hear feedback from linux-input on this of course, and if
accepted I'll submit updates to the evtest utility too.


 include/uapi/linux/input-event-codes.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

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

