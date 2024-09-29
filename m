Return-Path: <linux-input+bounces-6863-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF96B9893F9
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:09:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A1672856A3
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365FC14D44F;
	Sun, 29 Sep 2024 09:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="OvP/8C/H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ACBEELey"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4013D601;
	Sun, 29 Sep 2024 09:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600922; cv=none; b=B12Unfej85qeE1kELcOcAj9MsJFiosWG8pWjOVbHTOtShhTvZRo9tReEhTqoyqSzgDVIsTyclIW8i7YgyQacaR7JuWHmnD3htgq5rGdyvENLsn7fly8v2yEmAVjEm/u0/pWrg5KSAVmj0+FCZdfl2dvOauaj2ASzXScCykhl6Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600922; c=relaxed/simple;
	bh=NynKfwLhFLqu0NtP6pg19isx8sF9+fpQ/Kg7bfpT63c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f9egHKDMOjJDUVMg6bGSOXTXUahVROQdwHOhCuxpnk6sXBH8gKUum00bhyRUvrW9HOsaD52ZKSvKmQkaJTEVpQ/6XdGTsnkm2RsTF7r139ANiqtye5h2PvjOPHc3g478ljw1Fs2AqXuhGo0/0VOPWghNQMstlWj9L8LDzi4jLts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=OvP/8C/H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ACBEELey; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E32E911402BC;
	Sun, 29 Sep 2024 05:08:39 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 05:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600919; x=
	1727687319; bh=Zz0CPtQ3kgzdCXrnblYHVRBqNyh8HmeSFE9MRxqggdY=; b=O
	vP/8C/HMa60Ih8PFarbibHmR9p3szxfuVUEI1rhY77Rze8EhUTwyTK+0zdBWlcLu
	C0IdzjhoObX8yTT7on5w/40RPuIYKncCPiJbTsDpKtTUTs1JdUsKfyKSRWQaaui7
	DuOeOU/096zsIXwEQbtY4DCGpCzJMViripU64XAl8HULcAbzW+4+WocNDF4DtnMh
	mKUAJbTbFCUQ1jEfR/gi9ofL6smYRMpG4PMvceyeXmRgO0elYxPIUQppkiqayYVb
	vayHMHc1fwJgzVhcG7Ph8NDN6M8guhvY+1XW14RD4yGJQ9rc23BAoEHKWTVipCr5
	yz04z94kJD55g/IAcqo8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600919; x=
	1727687319; bh=Zz0CPtQ3kgzdCXrnblYHVRBqNyh8HmeSFE9MRxqggdY=; b=A
	CBEELeyQjRfNsKuAugPHPED9MxazBWFkHU+n1ayzvLUgFcCo32DB0+3kdtQueuU2
	tO7Mdv3gDuL0zBxDjYi8i/x5BSkhoM+w5EZfZKBQ/2W9ufYx1wF3FSLuIYG1p35m
	TucqoqvMW7nYmFOO7zn9goudnQb39fjte7mSZ8n1+9BrkGMQIBX2Z1oDhfEudphc
	pTFsfKbj7bXHPz/hPqFiLKrt7Rl3jCHP0fEf+dUr1arsSTFD3Pf0bzKydTQve0bX
	c+alpW6sJVLdmekIfWZsY9LNuFuWeknWularck8H0Fa4gv3ITZY552JzJD3JOqpT
	ZMn7GR3F7kPG9vbcDn0CA==
X-ME-Sender: <xms:Fxn5ZpuW9rxv3OoeMX5K4n3f94TXab_xQkxBCT0_ZSmfjsKQsMX6nw>
    <xme:Fxn5Zid-J4mpe1SlyLyEVW6-b1aGpOzUK7_Z5r5DYT5kRmthyzwPkAbrE7t-YKcxj
    PCmUfDEFAOYfbW5h_c>
X-ME-Received: <xmr:Fxn5ZswYfPbG6lmcbNOXM8smo4-N5p51JRlmKT9jl2wJw0a_0xCUp_779N1lwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthho
    pedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnh
    eslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgv
    ughhrghtrdgtohhmpdhrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:Fxn5ZgNDEXqQnMmWuGJMfbUaaMui4kfy_XRrc90LywSpRAkrUhRa3g>
    <xmx:Fxn5Zp_-lRgbFO40a_YHbBal1My64uNxS7Qbvme039ea3Apo8QkMlA>
    <xmx:Fxn5ZgXgGli8NYIngqmqRDRmFFdlX8izrxxezgaYWLRCgmgQEoJAhA>
    <xmx:Fxn5Zqdx7_UQQGMIdEKoh69ztZNxYjBhq3pQzu2B4KJtFmmt2anAsA>
    <xmx:Fxn5ZoYqWbs78raXPBK1wkzx4CNxa2Oo2mJw8SryRRLQHoX9rDlen9Gl>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:35 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 4/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Sun, 29 Sep 2024 22:08:08 +1300
Message-ID: <20240929090813.7888-5-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240929090813.7888-1-luke@ljones.dev>
References: <20240929090813.7888-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index bde28f3cf57f..c885b433c39d 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -106,7 +106,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
-	return !strcmp(attr->attr.name, "gpu_mux_mode");
+	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
 /**
@@ -439,6 +440,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -452,6 +455,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 21313e1eb6c9..a6064995c2cc 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -76,6 +76,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.46.1


