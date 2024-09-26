Return-Path: <linux-input+bounces-6742-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC7987034
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B6CB2681A
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786FD1AD40D;
	Thu, 26 Sep 2024 09:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="BAvpBJ8j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OU+7rxxk"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD3F1AC8A7;
	Thu, 26 Sep 2024 09:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343023; cv=none; b=SH2zxku3TNRp6GeYLglFf63I5dgR46Ymx2Y3EZjwcPQJOzm4EzraMo68gYzZjxOtBzCZ1M7DsvlsQWqWRHsUp5cB46VTFkt84j6oIv2ZAcqbNwQ3OMzrdNKeQtJvJ0B32jaH16TSpMaMfQqIXsd2Vy0yuOWu6dXKB2K4/TGk8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343023; c=relaxed/simple;
	bh=yoTFO0FozM4+uByHYrpdnUVLEMckofUuomAAnblgtDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKZphTfbp5TBTmRtso03yollwj0/iz5LRzvnBrRFidVMr2m9ZhMiwJrqToaQ4bCB6Y90k1FxWnBcSV0f9jnnnBO5kIJejiOF7FiF8eH2niWxJ8AU3xro82Pxbz6GIbzAg5esBRao+LIn2gAe6/K0CyKz8WoK+stHm+bUHcIWjyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=BAvpBJ8j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OU+7rxxk; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B8EBD1140289;
	Thu, 26 Sep 2024 05:30:20 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 26 Sep 2024 05:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343020; x=
	1727429420; bh=aHFJ7oapOv24VJBRGsmbRS93O8yyP06cxrLYAGD1vUE=; b=B
	AvpBJ8jCp7ktkOnV5nU+QbzFFX1PFJrcdF+TuFSe3oPx/6TTUNh/IW/em38hhv3+
	BIvBItkJu30ZIaNZc53X2ZcNESTkt4mAzgt5ch/5ChFR5raZ8cJfwnaiYcizUo7Q
	g0pAXqA/tdHVkvSRjPmzMXMxMKK/2bgDZPsD9ODSG1bbT2yD3nHIwC0w1OwxrmYY
	LypNVgkoLrVOEPIngcovChiFv+6OXCtkFfnpYiyXDcsFRKBNSEmi0WSg41MbCxHz
	FnrVKucNf2PpkUAdUihNSm5hYJG0jsnqPZfguIJG4yW8IAupCm3o8SImqDD5TKW1
	1ZRWhI+/Olu1JUDO0kXiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343020; x=
	1727429420; bh=aHFJ7oapOv24VJBRGsmbRS93O8yyP06cxrLYAGD1vUE=; b=O
	U+7rxxkq3QTXCK0ZWjwilgHSItgnAiV6i7MT9/spB3eCzN+EQJNyvRx2L1eshZ/I
	840drglQiG0z/mWS+FyKYdAuI6vKV6nC03OD3SrgKCPoD4Y0v4QsX9E4/SZ7zHil
	pYg+xD7nGdn6bXNfa5BbPRErdICvL4gf/Qf53w0kREb5RNmzRZpyYlFK6fiHKIjO
	RJvcQLZDV8zqzrhxnN79cb6cb86LO/06K70j+hAhskfY0SfZWgqpM5zkB8gRwLiC
	bU1sAs3QsUjVaa1O3AlpQ2xz0UO7k1vLpVKfwvMYjFkTRv9NUqeDwnPoAUojI+4H
	UINBsPbN2OUVjMHi+mEKg==
X-ME-Sender: <xms:rCn1ZojvXrCfxbo0XO4lt3kiWX3pkWN-gy894KbMN5URIBh6AWLWkw>
    <xme:rCn1ZhBJ9mwptcH0ixj6Ws3RZHqvkN2qn4fpt3zM4TFAtoZTvHfXUNpSgMEA-2OQB
    SUkk6mCkgzkwokqww8>
X-ME-Received: <xmr:rCn1ZgHUodwg0HCKI3KRV4k-xBhJDdbMwMKXaZlOUHCgSsClLgQOoOAOO98cTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgv
    shdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfe
    dugfetudeuheetjefhuefggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
    gvshdruggvvhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhinhhpuhhtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepsggvnhhtihhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhhikh
    hosheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgv
    rhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehilhhpohdrjh
    grrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohephhguvghg
    ohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopegtohhrvghnthhinhdrtghhrg
    hrhiesghhmrghilhdrtghomhdprhgtphhtthhopehsuhhpvghrmhdusehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:rCn1ZpSWL-m9vaDACjdzA_WzKtXfBFET_ysslQFFphOqEtMHYjp3OQ>
    <xmx:rCn1ZlzZP29or8PxQC_MEIrJKVbmPTdpTCLOo4kZvVyzpE8HzQa8eA>
    <xmx:rCn1Zn7QLmXyNkNbG4PabOazhqrpLjuNn51WMPGA8VSiYNwK3KpENg>
    <xmx:rCn1ZiyLBQ-jcrqBWqASAcoyF1aqeDj3VUozETA74Qn-vvwyBos40Q>
    <xmx:rCn1ZleEZ2zdtWpYFFShdi8ud2VicbgoUAMfdWUhO9h9UifGjUyZTv_i>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:16 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	bentiss@kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v4 4/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Thu, 26 Sep 2024 21:29:47 +1200
Message-ID: <20240926092952.1284435-5-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240926092952.1284435-1-luke@ljones.dev>
References: <20240926092952.1284435-1-luke@ljones.dev>
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
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 39e422b16b8e..15eab4d45b81 100644
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
@@ -429,6 +430,8 @@ ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
 		   "Set MCU powersaving mode");
 ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
 		   "Set the panel refresh overdrive");
+ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
+		   "Set the panel HD mode to UHD<0> or FHD<1>");
 ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 		   "Show the eGPU connection status");
 
@@ -442,6 +445,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
 	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
+	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
 };
 
 static int asus_fw_attr_add(void)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 6ea4dedfb85e..7caf2c7ed8c9 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -73,6 +73,7 @@
 #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO 0x00110019
 
 /* Misc */
+#define ASUS_WMI_DEVID_PANEL_HD		0x0005001C
 #define ASUS_WMI_DEVID_PANEL_OD		0x00050019
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
 #define ASUS_WMI_DEVID_LID_FLIP		0x00060062
-- 
2.46.1


