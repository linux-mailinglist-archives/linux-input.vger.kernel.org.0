Return-Path: <linux-input+bounces-6745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFD198703D
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C26DA1F28022
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781851AE84B;
	Thu, 26 Sep 2024 09:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dn3ZvnBr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ibwddXyJ"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11901ABED2;
	Thu, 26 Sep 2024 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343036; cv=none; b=grrN5/QEkVHJCaYtxT3IMxs0HyWGM6yV1/mHi6R0mBWzvodAmB1jjL/3OWjAbqTwJmoJ684r28yB2ib202YX0kruVK3sfuwQwmO/cPuiH8e/xRFOnkiD0xFxOxZoS1+eanzqOjITDiiEb8n9RHlDau64nnFygLA6VEqLLnk5mIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343036; c=relaxed/simple;
	bh=+gFA20Jjodf/50gImB1K1O371NA/W3xmozmw5hCYp9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c/cwCEs6xZOZKforjdujdScdyG9EUKM3EwYoXeQQFgAh80msZ7UbhpXjFHOs1UpOENijeIu5ud+2Mf7K0l9r8mP3qQvjDEHexGCknVDmXhqn1oUpxuaW5iZSkjkpe8xYVdjvBrwiT1XlQ3/10b/IiAk09YJEWxUOTTct2x6xrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dn3ZvnBr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ibwddXyJ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C30851140249;
	Thu, 26 Sep 2024 05:30:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 26 Sep 2024 05:30:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343033; x=
	1727429433; bh=Itv7FUYoQNPxE9PxiVCpbLqTgpEAdVtFHiloU7eHeEU=; b=d
	n3ZvnBrBgJJWwckhrBwzlEpFTTriiaho3/6cDRGodQk7nd/14Decdxo6P9rvkmA5
	YGh6PVpEDftA0zKGNVqZkWnx7jv95+Cjx75aoqO81XPxM7fy4D4D7NweGuhWQyhM
	vdc/VgFluzQVsQpmxuX7JkLQucmhrbfSiRZO+rJ3OMgWY8tWc80gUwTxIJm4lZUn
	5pndK/2aaXwaADrPTMEwMBqtd67Cqs387s++VPvnBr6b3fQ+SVHXGbJEWW7BOI2O
	0sbZkCo7OSL5SZ992c2h0bojLnylKwwNuyFOCFH/7exQ3+j/9j8IDv9TGXbWFzFe
	QUu9t+uyRHhSHVSQSJoTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343033; x=
	1727429433; bh=Itv7FUYoQNPxE9PxiVCpbLqTgpEAdVtFHiloU7eHeEU=; b=i
	bwddXyJ/Q7eXtund3OFL0yGBl3iRYT4JbT6AgB7/y4a4xJ6evc7SDgn0sJGJLf7v
	kOW8w9hpqdn37AxgnEFqUW/4X2+5+zR7t3pikfOnAMY7ca94/uGOHTDvbMuA6PVm
	4uILRN43RfsQKDNJ0UmW1q8uhsfCTOw3VZm25F38THJkFmDeayV4jCTyiTkyVaho
	gJwWuudJhpKpn2WQ/w3hmjevMLALikEfnMkViyq1UtI3c0mhQKxyNhwnZPS0pYsj
	sMRMIrQb+BoY9Jq+FwEn5rDwdMzrDKFOPCfrnvOsvKBiRrv/NcIb0F39z/skzt/u
	tWwVTCwEQ0tAs+HVjVecg==
X-ME-Sender: <xms:uSn1ZhaFPbDWgdWRMllYnZ92GpfEB8ivk_TWyz8onLFca4O4mwgZnQ>
    <xme:uSn1ZoaKAVwln7mQbweAjvyKgkRVWs-bPSdHoI02VuL2r7hAqSW9nLw9hdUvrfG3y
    LT2qEd8sQpha4PqDaA>
X-ME-Received: <xmr:uSn1Zj-3BG4mhq5m-oQptF-GBFlWDTEWiQwFxq0fV2JWuOWccl7LCqUGb2hxYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgv
    shdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfe
    dugfetudeuheetjefhuefggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhs
    thgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
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
X-ME-Proxy: <xmx:uSn1ZvoLnOkaVivOpIprINIh08ZGcumd9gq8MlzxVqJQ7JVy5kGWDg>
    <xmx:uSn1Zsp577yEtTZGZQbY2-iX51SJXhXW_N_o8dnLp5ZXT6qLocI9pA>
    <xmx:uSn1ZlTzgIyJBBNAkOREAk7iVfsG4NREFnLbgfbbBAsoZwLKn0TLsQ>
    <xmx:uSn1ZkqkkkmkaHkqRI67JtrzAqp52oFUnE989ts667sPYyQWV-6iLw>
    <xmx:uSn1Zj0fFNNSqr_1jMItFefBq89g1PpEjVnXurSoK0WtQ5Ic6fqfwOG4>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:30 -0400 (EDT)
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
Subject: [PATCH v4 7/9] platform/x86: asus-armoury: add apu-mem control support
Date: Thu, 26 Sep 2024 21:29:50 +1200
Message-ID: <20240926092952.1284435-8-luke@ljones.dev>
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

Implement the APU memory size control under the asus-armoury module using
the fw_attributes class.

This allows the APU allocated memory size to be adjusted depending on
the users priority. A reboot is required after change.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 114 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 115 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 0f67b5deb629..a0022dcee3a4 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -456,6 +456,119 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
 ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
+/* Device memory available to APU */
+
+static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	int err;
+	u32 mem;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
+	if (err)
+		return err;
+
+	switch (mem) {
+	case 0x100:
+		mem = 0;
+		break;
+	case 0x102:
+		mem = 1;
+		break;
+	case 0x103:
+		mem = 2;
+		break;
+	case 0x104:
+		mem = 3;
+		break;
+	case 0x105:
+		mem = 4;
+		break;
+	case 0x106:
+		/* This is out of order and looks wrong but is correct */
+		mem = 8;
+		break;
+	case 0x107:
+		mem = 5;
+		break;
+	case 0x108:
+		mem = 6;
+		break;
+	case 0x109:
+		mem = 7;
+		break;
+	default:
+		mem = 4;
+		break;
+	}
+
+	return sysfs_emit(buf, "%u\n", mem);
+}
+
+static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int result, err;
+	u32 requested, mem;
+
+	result = kstrtou32(buf, 10, &requested);
+	if (result)
+		return result;
+
+	switch (requested) {
+	case 0:
+		mem = 0x000;
+		break;
+	case 1:
+		mem = 0x102;
+		break;
+	case 2:
+		mem = 0x103;
+		break;
+	case 3:
+		mem = 0x104;
+		break;
+	case 4:
+		mem = 0x105;
+		break;
+	case 5:
+		mem = 0x107;
+		break;
+	case 6:
+		mem = 0x108;
+		break;
+	case 7:
+		mem = 0x109;
+		break;
+	case 8:
+		/* This is out of order and looks wrong but is correct */
+		mem = 0x106;
+		break;
+	default:
+		return -EIO;
+	}
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
+	if (err) {
+		pr_warn("Failed to set apu_mem: %d\n", err);
+		return err;
+	}
+
+	pr_info("APU memory changed to %uGB, reboot required\n", requested);
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
+					    char *buf)
+{
+	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
+}
+ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
+
 /* Simple attribute creation */
 ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
 		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
@@ -511,6 +624,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
 	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
 	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
+	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 86629e621c61..e1aeafdf05d5 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -136,6 +136,7 @@
 
 #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
 #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
+#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
-- 
2.46.1


