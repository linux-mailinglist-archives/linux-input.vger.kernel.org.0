Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C5B492B32
	for <lists+linux-input@lfdr.de>; Tue, 18 Jan 2022 17:29:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236597AbiARQ2w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jan 2022 11:28:52 -0500
Received: from smtp-out2.suse.de ([195.135.220.29]:54628 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233718AbiARQ2w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jan 2022 11:28:52 -0500
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id EE0DD1F3BB;
        Tue, 18 Jan 2022 16:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1642523330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=Lx/Z9SeDGM3W+/cBe8eTNsJa2aLajFhkjxex7cRbyoA=;
        b=wLGqBDcZpGDIqPiyZqVvCMMt8dHxBugDblIG5AQYaassoxMFjyOoAfT6e5AyBeLviJwP8b
        skW033DiGWW9ORopZAlLPpTNp2J1Vj+pBUzJ9mlgoDjl7gfnNIN7uR4ncThvGk/wlNJwPS
        16Gb6qepybnJZfdtUaImG3gnHSuIawc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1642523330;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type;
        bh=Lx/Z9SeDGM3W+/cBe8eTNsJa2aLajFhkjxex7cRbyoA=;
        b=ydDF72+hXRhDC8jhefdahQYwD/KlFZmdF5diaMauG+ORwMyj64l5bZHFAnLoN4e75bIypf
        Ip7sbYIOD6FdwGBQ==
Received: from alsa1.suse.de (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id E7B50A3B83;
        Tue, 18 Jan 2022 16:28:50 +0000 (UTC)
Date:   Tue, 18 Jan 2022 17:28:50 +0100
Message-ID: <s5h35llxb25.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: synaptics: retry query upon error
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI/1.14.6 (Maruoka)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 Emacs/25.3
 (x86_64-suse-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI 1.14.6 - "Maruoka")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some recent laptops such as Lenovo ThinkPad T14 AMD Gen 1 show the
errors at querying synaptics attributes.  This results in the driver
falling back to the legacy mode without multi-finger support.  It
happens only intermittently at some boots, and it seems that the same
query command seems working fine after retrying.

This patch implements a retry of synaptics_query_hardware() call after
some delay when it fails as a workaround.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1194086
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---

It's rather an RFC, as I'm not sure whether it's the best way to fix
the problem.  At least, the retry of query seems working reliably, as
well as re-binding via sysfs.  And, I have no idea in which condition
this happens; it might be a flaky BIOS issue, of course :)

Above all, the device should have been connected via SMBUS.  But the
binding with SMBUS fails, so some other pieces are missing.  Maybe the
support with psmouse is suboptimal in anyway, but it's currently the
only way to make it working.

Any suggestions are appreciated.


thanks,

Takashi


 drivers/input/mouse/synaptics.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index ffad142801b3..0f23fba4c36e 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -416,7 +416,7 @@ static int synaptics_resolution(struct psmouse *psmouse,
 	return 0;
 }
 
-static int synaptics_query_hardware(struct psmouse *psmouse,
+static int __synaptics_query_hardware(struct psmouse *psmouse,
 				    struct synaptics_device_info *info)
 {
 	int error;
@@ -450,6 +450,21 @@ static int synaptics_query_hardware(struct psmouse *psmouse,
 	return 0;
 }
 
+static int synaptics_query_hardware(struct psmouse *psmouse,
+				    struct synaptics_device_info *info)
+{
+	int err;
+
+	err = __synaptics_query_hardware(psmouse, info);
+	if (err) {
+		psmouse_info(psmouse, "Query error (%d), retrying...\n", err);
+		msleep(100);
+		err = __synaptics_query_hardware(psmouse, info);
+	}
+
+	return err;
+}
+
 #endif /* CONFIG_MOUSE_PS2_SYNAPTICS || CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS */
 
 #ifdef CONFIG_MOUSE_PS2_SYNAPTICS
-- 
2.31.1

