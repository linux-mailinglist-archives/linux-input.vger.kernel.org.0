Return-Path: <linux-input+bounces-5339-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C01947CA9
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 16:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCD441C21C06
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 14:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F882A1CA;
	Mon,  5 Aug 2024 14:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W4+dBmIy"
X-Original-To: linux-input@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD8A3EA64
	for <linux-input@vger.kernel.org>; Mon,  5 Aug 2024 14:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722867385; cv=none; b=LBl/uYyCocA3tr7nPrH3xCV1+O2GCMNNPVhAEuuQbF693GBNw/L+DKLyh9IBARH9oiIy+BvTB4g8JVIIut2GrmrUoRzLqPiPZD7yT2jexrhhdIGikY2NOO/jxGPRO4a/njM8WX/qvpbZPtXk7SdGQPc7Xs4QnpJ0h2mQarvT1Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722867385; c=relaxed/simple;
	bh=Hi5bZ7jNvnUw68XjWltfXBmXM6NTN/Uoz8oY2eKMcOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SARBtbT5+Nq2O6bRYDriFMv5l/Iwhy4FRqS/X9taHPF9dXYfkKFPuixIAytExNfD+YRpLYYaE8OybM3SgWGXWWKiNOgeMFoiDpfPoBvHDJVSwe4Lwy/G8ZPQxw6g8EZL40OnlTjIDfhYmmNx65ig/EWyLI4xbbt/49Wmo69YJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W4+dBmIy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722867381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CJuJclYNxq+LWkRmg7pURhmXZ86WVpPw4vKWUR4XBeg=;
	b=W4+dBmIyWASRLwhBs2E8pKxfWbAqXxYcrdwscWwplzbQt3XsJTAgVn34j2+1xNpxOnY3cy
	Q7B+EnZff3DgGXIOhySsNb1P2vsd7WO2nf59kkj9SwIOL0WP6JO1Pu6w3+2/RhH5fhIbG5
	2T7s6gc/MutGOrzMjdYfEOAWNXBitow=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-2s3KgXRLOAu1a4KSjSsBoA-1; Mon,
 05 Aug 2024 10:16:18 -0400
X-MC-Unique: 2s3KgXRLOAu1a4KSjSsBoA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AF7B1955D45;
	Mon,  5 Aug 2024 14:16:16 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D0CC730001A7;
	Mon,  5 Aug 2024 14:16:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ike Panhc <ike.pan@canonical.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	linux-input@vger.kernel.org,
	Jonathan Denose <jdenose@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Maxim Mikityanskiy <maxtram95@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Stop calling i8042_command()
Date: Mon,  5 Aug 2024 16:16:08 +0200
Message-ID: <20240805141608.170844-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Commit 07a4a4fc83dd ("ideapad: add Lenovo IdeaPad Z570 support (part 2)")
added an i8042_command(..., I8042_CMD_AUX_[EN|DIS]ABLE) call to
the ideapad-laptop driver to suppress the touchpad events at the PS/2
AUX controller level.

Commit c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux
port on/off on select models") limited this to only do this by default
on the IdeaPad Z570 to replace a growing list of models on which
the i8042_command() call was disabled by quirks because it was causing
issues.

A recent report shows that this is causing issues even on the Z570 for
which it was originally added because it can happen on resume before
the i8042 controller's own resume() method has run:

[   50.241235] ideapad_acpi VPC2004:00: PM: calling acpi_subsys_resume+0x0/0x5d @ 4492, parent: PNP0C09:00
[   50.242055] snd_hda_intel 0000:00:0e.0: PM: pci_pm_resume+0x0/0xed returned 0 after 13511 usecs
[   50.242120] snd_hda_codec_realtek hdaudioC0D0: PM: calling hda_codec_pm_resume+0x0/0x19 [snd_hda_codec] @ 4518, parent: 0000:00:0e.0
[   50.247406] i8042: [49434] a8 -> i8042 (command)
[   50.247468] ideapad_acpi VPC2004:00: PM: acpi_subsys_resume+0x0/0x5d returned 0 after 6220 usecs
...
[   50.247883] i8042 kbd 00:01: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
[   50.247894] i8042 kbd 00:01: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
[   50.247906] i8042 aux 00:02: PM: calling pnp_bus_resume+0x0/0x9d @ 4492, parent: pnp0
[   50.247916] i8042 aux 00:02: PM: pnp_bus_resume+0x0/0x9d returned 0 after 0 usecs
...
[   50.248301] i8042 i8042: PM: calling platform_pm_resume+0x0/0x41 @ 4492, parent: platform
[   50.248377] i8042: [49434] 55 <- i8042 (flush, kbd)
[   50.248407] i8042: [49435] aa -> i8042 (command)
[   50.248601] i8042: [49435] 00 <- i8042 (return)
[   50.248604] i8042: [49435] i8042 controller selftest: 0x0 != 0x55

Dmitry (input subsys maintainer) pointed out that just sending
KEY_TOUCHPAD_OFF/KEY_TOUCHPAD_ON which the ideapad-laptop driver
already does should be sufficient and that it then is up to userspace
to filter out touchpad events after having received a KEY_TOUCHPAD_OFF.

Given all the problems the i8042_command() call has been causing just
removing it indeed seems best, so this removes it completely. Note that
this only impacts the Ideapad Z570 since it was already disabled by
default on all other models.

Fixes: c69e7d843d2c ("platform/x86: ideapad-laptop: Only toggle ps2 aux port on/off on select models")
Reported-by: Jonathan Denose <jdenose@chromium.org>
Closes: https://lore.kernel.org/linux-input/20231102075243.1.Idb37ff8043a29f607beab6440c32b9ae52525825@changeid/
Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/ideapad-laptop.c | 37 ---------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 1ace711f7442..255fb56ec9ee 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -18,7 +18,6 @@
 #include <linux/device.h>
 #include <linux/dmi.h>
 #include <linux/fb.h>
-#include <linux/i8042.h>
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -144,7 +143,6 @@ struct ideapad_private {
 		bool hw_rfkill_switch     : 1;
 		bool kbd_bl               : 1;
 		bool touchpad_ctrl_via_ec : 1;
-		bool ctrl_ps2_aux_port    : 1;
 		bool usb_charging         : 1;
 	} features;
 	struct {
@@ -182,12 +180,6 @@ MODULE_PARM_DESC(set_fn_lock_led,
 	"Enable driver based updates of the fn-lock LED on fn-lock changes. "
 	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
 
-static bool ctrl_ps2_aux_port;
-module_param(ctrl_ps2_aux_port, bool, 0444);
-MODULE_PARM_DESC(ctrl_ps2_aux_port,
-	"Enable driver based PS/2 aux port en-/dis-abling on touchpad on/off toggle. "
-	"If you need this please report this to: platform-driver-x86@vger.kernel.org");
-
 static bool touchpad_ctrl_via_ec;
 module_param(touchpad_ctrl_via_ec, bool, 0444);
 MODULE_PARM_DESC(touchpad_ctrl_via_ec,
@@ -1560,7 +1552,6 @@ static void ideapad_fn_lock_led_exit(struct ideapad_private *priv)
 static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_events)
 {
 	unsigned long value;
-	unsigned char param;
 	int ret;
 
 	/* Without reading from EC touchpad LED doesn't switch state */
@@ -1568,15 +1559,6 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv, bool send_
 	if (ret)
 		return;
 
-	/*
-	 * Some IdeaPads don't really turn off touchpad - they only
-	 * switch the LED state. We (de)activate KBC AUX port to turn
-	 * touchpad off and on. We send KEY_TOUCHPAD_OFF and
-	 * KEY_TOUCHPAD_ON to not to get out of sync with LED
-	 */
-	if (priv->features.ctrl_ps2_aux_port)
-		i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_DISABLE);
-
 	/*
 	 * On older models the EC controls the touchpad and toggles it on/off
 	 * itself, in this case we report KEY_TOUCHPAD_ON/_OFF. Some models do
@@ -1699,23 +1681,6 @@ static const struct dmi_system_id hw_rfkill_list[] = {
 	{}
 };
 
-/*
- * On some models the EC toggles the touchpad muted LED on touchpad toggle
- * hotkey presses, but the EC does not actually disable the touchpad itself.
- * On these models the driver needs to explicitly enable/disable the i8042
- * (PS/2) aux port.
- */
-static const struct dmi_system_id ctrl_ps2_aux_port_list[] = {
-	{
-	/* Lenovo Ideapad Z570 */
-	.matches = {
-		DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		DMI_MATCH(DMI_PRODUCT_VERSION, "Ideapad Z570"),
-		},
-	},
-	{}
-};
-
 static void ideapad_check_features(struct ideapad_private *priv)
 {
 	acpi_handle handle = priv->adev->handle;
@@ -1725,8 +1690,6 @@ static void ideapad_check_features(struct ideapad_private *priv)
 		set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
 	priv->features.hw_rfkill_switch =
 		hw_rfkill_switch || dmi_check_system(hw_rfkill_list);
-	priv->features.ctrl_ps2_aux_port =
-		ctrl_ps2_aux_port || dmi_check_system(ctrl_ps2_aux_port_list);
 	priv->features.touchpad_ctrl_via_ec = touchpad_ctrl_via_ec;
 
 	if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
-- 
2.45.2


