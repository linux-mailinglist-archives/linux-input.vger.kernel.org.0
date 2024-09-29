Return-Path: <linux-input+bounces-6864-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03FA9893FE
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEBE51C2230B
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D80441531EA;
	Sun, 29 Sep 2024 09:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="UNdogJup";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GkboBRiN"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDCF14EC64;
	Sun, 29 Sep 2024 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600926; cv=none; b=THCquKshKO5RonM/COluvjjyo337GlaP21Lhv29jpBtNfYoQHSDyidBywJ1wvzTs0A20wWLGtRiw44iImdTcDjmsrw3vb1QIamVrZPryOReiIZjiFgj7X9FNsuPbYmF1k8X7RQTNW6uCSRCMxaqifSsmbhFz9MIaF4j9cK6Dcz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600926; c=relaxed/simple;
	bh=xTVglVjY5LFYlqcjBZ3RxApIuIs+BVXWqQUoLeFw8Xw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dE2LlKO8kvlV14IiNDAusLxeUKvr+cXKI9eQvFr2VtLHOTb5O3DpIui+ydEpqsB7NhDMZUMmGz2GeHeh8v/KZQ/ov9/7MP65ozAdh5WSqdfhv3JGbPrGYsdy38h0J8M4TBQk7jy6CC7M7m5icxvWYA6wUtBePxqy8uzNjgsfibI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=UNdogJup; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GkboBRiN; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2E04E11402AE;
	Sun, 29 Sep 2024 05:08:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 05:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600924; x=
	1727687324; bh=5qET60rRS2dT0kgWzExVYMXDdNjWzWLqFKqUMcg3ETs=; b=U
	NdogJupIx4zyLrq8vROHFvXQ6K0+ILbZe5JrRpkJHmaur/CRGp0vK9d5saxqCn/j
	vPe5cbA97/sBP+eW1zhBIB7AuGHTJSRJdP/KmAeT8xHlfGxH2YMLQOo4h8Cb9s5x
	Y/XqF5Na7zRXIlzycrjawMiIn5+G0rpYGevLYdI8tGbuED9fx6u01fQtnjad5PDX
	pKOMYhu7YgJAaA/5rgNU8REAC1EQxC1uU42X+4TUwD1nPDa91xbXml5HR7q3QXR1
	L6k2KIm5rThJXRR9CE9hlHHcz0g2rM1TGmp9ddPDp68sMVB1UVdD9tHfqPUjjspP
	/Quwwb6x9dIs1KzNdDmNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600924; x=
	1727687324; bh=5qET60rRS2dT0kgWzExVYMXDdNjWzWLqFKqUMcg3ETs=; b=G
	kboBRiNcFSQf+9AatdoZyAQrkWRfgFSLcznZuPR2ZP5OsqfiftUVZUQFGoss0faO
	HtN4ZzJIWWfz0tU+qPNWjydYsbkzegk3x6MSZ4nMNaqqgxrKEAgT48pEEH5BHvzJ
	eHdsP6xZH6iC4evtGo0Wc20o+dmz2Sni1PTz2LpPyf1EvtU3SDWHa8IWJ/KObDcf
	TluugLzXGLP/aA8dLeGaIeK4ckbYN0AY2qbBhgm3D6lp8PlWXlMwn1T9efLX60UY
	Kj/yQfXQvaxs1aESjFr9Ofe5YuucmvV1+C7K1/ZzhJMlJnUS3risvL6Hw74VobKo
	5ZpoovXtAA5x02AXcVVLw==
X-ME-Sender: <xms:HBn5Zh9cLM1ZoXbmy2DUsiV-UFgI-p5YuK0nliAQTJRSbJfV-lZrBA>
    <xme:HBn5ZlsvMU1nmKRhTsQv2GwZvilo24n4WwVECAtboVgjhl6FhKS28w3t8qhJO9Xk-
    SWKhX6sQyPhHe0K8MU>
X-ME-Received: <xmr:HBn5ZvBDwZfCIHBpjcf6Dp8RPrbmDMb1v7UBMToq-_GtLPRP4Z4hkh96SysUUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgv
    shdfuceolhhukhgvsehljhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfetfe
    dugfetudeuheetjefhuefggfelleetvdevtefhueeujeefvdegleevhefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonh
    gvshdruggvvhdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqihhnphhuthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehplhgrthhfoh
    hrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhnthgvlhdrtghomhdprhgtph
    htthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghorhgv
    nhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhuphgvrhhmud
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:HBn5Zlf5dkZKF05v-Y4_XzE2X7_Htuc34C48j0mwgERXZSzq38-Zvg>
    <xmx:HBn5ZmMYJG9x4SejS-0mYO6ZNudGj3vkhOp2nPp12kSXhWjAkSBM_Q>
    <xmx:HBn5ZnnwcZbmoVzVYW0HaH36J_LP-GElIQSX0pMACBrVkovSzvoViw>
    <xmx:HBn5ZguruXyZTe316YDeJqxtmm7Pvfk4n8JzyZqF-6t3RHNlYtqUmQ>
    <xmx:HBn5ZngICQtdjKdKmTaSGr_fgRijFTz3RN3VPotuTE-TEcXqk0bv4g_q>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:40 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org,
	jikos@kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	corentin.chary@gmail.com,
	superm1@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v5 5/9] platform/x86: asus-armoury: add the ppt_* and nv_* tuning knobs
Date: Sun, 29 Sep 2024 22:08:09 +1300
Message-ID: <20240929090813.7888-6-luke@ljones.dev>
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

Adds the ppt_* and nv_* tuning knobs that are available via WMI methods
and adds proper min/max levels plus defaults.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c | 134 ++++++++++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h |  65 ++++++++++++++
 2 files changed, 199 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index c885b433c39d..aadeb2a41ca6 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -52,12 +52,40 @@
 #define PPT_PLATFORM_MAX 100
 #define PPT_PLATFORM_DEFAULT 80
 
+/* Tunables provided by ASUS for gaming laptops */
+struct rog_tunables {
+	u32 cpu_default;
+	u32 cpu_min;
+	u32 cpu_max;
+
+	u32 platform_default;
+	u32 platform_min;
+	u32 platform_max;
+
+	u32 ppt_pl1_spl; // cpu
+	u32 ppt_pl2_sppt; // cpu
+	u32 ppt_apu_sppt; // plat
+	u32 ppt_platform_sppt; // plat
+	u32 ppt_fppt; // cpu
+
+	u32 nv_boost_default;
+	u32 nv_boost_min;
+	u32 nv_boost_max;
+	u32 nv_dynamic_boost;
+
+	u32 nv_temp_default;
+	u32 nv_temp_min;
+	u32 nv_temp_max;
+	u32 nv_temp_target;
+};
+
 static const struct class *fw_attr_class;
 
 struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 
+	struct rog_tunables *rog_tunables;
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
 
@@ -431,6 +459,25 @@ WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
 ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
 /* Simple attribute creation */
+ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
+		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_pl2_sppt, "ppt_pl2_sppt", ASUS_WMI_DEVID_PPT_PL2_SPPT, cpu_default,
+		       cpu_min, cpu_max, 1, "Set the CPU fast package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_apu_sppt, "ppt_apu_sppt", ASUS_WMI_DEVID_PPT_APU_SPPT,
+		       platform_default, platform_min, platform_max, 1,
+		       "Set the CPU slow package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_platform_sppt, "ppt_platform_sppt", ASUS_WMI_DEVID_PPT_PLAT_SPPT,
+		       platform_default, platform_min, platform_max, 1,
+		       "Set the CPU slow package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_fppt, "ppt_fppt", ASUS_WMI_DEVID_PPT_FPPT, cpu_default, cpu_min,
+		       cpu_max, 1, "Set the CPU slow package limit");
+ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, "nv_dynamic_boost", ASUS_WMI_DEVID_NV_DYN_BOOST,
+		       nv_boost_default, nv_boost_min, nv_boost_max, 1,
+		       "Set the Nvidia dynamic boost limit");
+ATTR_GROUP_ROG_TUNABLE(nv_temp_target, "nv_temp_target", ASUS_WMI_DEVID_NV_THERM_TARGET,
+		       nv_temp_default, nv_boost_min, nv_temp_max, 1,
+		       "Set the Nvidia max thermal limit");
+
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
 
@@ -451,6 +498,14 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 
+	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
+	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
+	{ &ppt_apu_sppt_attr_group, ASUS_WMI_DEVID_PPT_APU_SPPT },
+	{ &ppt_platform_sppt_attr_group, ASUS_WMI_DEVID_PPT_PLAT_SPPT },
+	{ &ppt_fppt_attr_group, ASUS_WMI_DEVID_PPT_FPPT },
+	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
+	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
+
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
@@ -547,6 +602,79 @@ static int asus_fw_attr_add(void)
 
 /* Init / exit ****************************************************************/
 
+/* Set up the min/max and defaults for ROG tunables */
+static void init_rog_tunables(struct rog_tunables *rog)
+{
+	u32 platform_default = PPT_PLATFORM_DEFAULT;
+	u32 cpu_default = PPT_CPU_LIMIT_DEFAULT;
+	u32 platform_max = PPT_PLATFORM_MAX;
+	u32 max_boost = NVIDIA_BOOST_MAX;
+	u32 cpu_max = PPT_CPU_LIMIT_MAX;
+	const char *product;
+
+	/*
+	 * ASUS product_name contains everything required, e.g,
+	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
+	 * The bulk of these defaults are gained from users reporting what
+	 * ASUS Armoury Crate in Windows provides them.
+	 */
+	product = dmi_get_system_info(DMI_PRODUCT_NAME);
+
+	if (strstr(product, "GA402R")) {
+		cpu_default = 125;
+	} else if (strstr(product, "13QY")) {
+		cpu_max = 250;
+	} else if (strstr(product, "X13")) {
+		cpu_max = 75;
+		cpu_default = 50;
+	} else if (strstr(product, "RC71") || strstr(product, "RC72")) {
+		cpu_max = 50;
+		cpu_default = 30;
+	} else if (strstr(product, "G814") || strstr(product, "G614") ||
+		   strstr(product, "G834") || strstr(product, "G634")) {
+		cpu_max = 175;
+	} else if (strstr(product, "GA402X") || strstr(product, "GA403") ||
+		   strstr(product, "FA507N") || strstr(product, "FA507X") ||
+		   strstr(product, "FA707N") || strstr(product, "FA707X")) {
+		cpu_max = 90;
+	} else {
+		pr_notice("Using default CPU limits. Please report if these are not correct.\n");
+	}
+
+	if (strstr(product, "GZ301ZE"))
+		max_boost = 5;
+	else if (strstr(product, "FX507ZC4"))
+		max_boost = 15;
+	else if (strstr(product, "GU605"))
+		max_boost = 20;
+
+	/* ensure defaults for tunables */
+	rog->cpu_default = cpu_default;
+	rog->cpu_min = PPT_CPU_LIMIT_MIN;
+	rog->cpu_max = cpu_max;
+
+	rog->platform_default = platform_default;
+	rog->platform_max = PPT_PLATFORM_MIN;
+	rog->platform_max = platform_max;
+
+	rog->ppt_pl1_spl = cpu_default;
+	rog->ppt_pl2_sppt = cpu_default;
+	rog->ppt_apu_sppt = cpu_default;
+
+	rog->ppt_platform_sppt = platform_default;
+	rog->ppt_fppt = cpu_default;
+
+	rog->nv_boost_default = NVIDIA_BOOST_MAX;
+	rog->nv_boost_max = NVIDIA_BOOST_MIN;
+	rog->nv_boost_max = max_boost;
+	rog->nv_dynamic_boost = NVIDIA_BOOST_MIN;
+
+	rog->nv_temp_default = NVIDIA_TEMP_MAX;
+	rog->nv_temp_max = NVIDIA_TEMP_MIN;
+	rog->nv_temp_max = NVIDIA_TEMP_MAX;
+	rog->nv_temp_target = NVIDIA_TEMP_MIN;
+}
+
 static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
@@ -563,6 +691,12 @@ static int __init asus_fw_init(void)
 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
 		return -ENODEV;
 
+	asus_armoury.rog_tunables = kzalloc(sizeof(struct rog_tunables), GFP_KERNEL);
+	if (!asus_armoury.rog_tunables)
+		return -ENOMEM;
+
+	init_rog_tunables(asus_armoury.rog_tunables);
+
 	err = asus_fw_attr_add();
 	if (err)
 		return err;
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 4d0dd34c52aa..ca570ed9c8ef 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -17,6 +17,12 @@ static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr,
 			      const char *buf, size_t count, u32 min, u32 max,
 			      u32 *store_value, u32 wmi_dev);
 
+static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
 static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 			      char *buf)
 {
@@ -143,4 +149,63 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/*
+ * ROG PPT attributes need a little different in setup as they
+ * require rog_tunables members.
+ */
+
+#define __ROG_TUNABLE_RW(_attr, _min, _max, _wmi)                             \
+	static ssize_t _attr##_current_value_store(                           \
+		struct kobject *kobj, struct kobj_attribute *attr,            \
+		const char *buf, size_t count)                                \
+	{                                                                     \
+		return attr_int_store(kobj, attr, buf, count,                 \
+				      asus_armoury.rog_tunables->_min,        \
+				      asus_armoury.rog_tunables->_max,        \
+				      &asus_armoury.rog_tunables->_attr,      \
+				      _wmi);                                  \
+	}                                                                     \
+	static ssize_t _attr##_current_value_show(                            \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return sysfs_emit(buf, "%u\n",                                \
+				  asus_armoury.rog_tunables->_attr);          \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attr##_current_value =           \
+		__ASUS_ATTR_RW(_attr, current_value)
+
+#define __ROG_TUNABLE_SHOW(_prop, _attrname, _val)                            \
+	static ssize_t _attrname##_##_prop##_show(                            \
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
+	{                                                                     \
+		return sysfs_emit(buf, "%d\n",                                \
+				  asus_armoury.rog_tunables->_val);           \
+	}                                                                     \
+	static struct kobj_attribute attr_##_attrname##_##_prop =             \
+		__ASUS_ATTR_RO(_attrname, _prop)
+
+#define ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _default, _min, _max, \
+			       _incstep, _dispname)                            \
+	__ROG_TUNABLE_SHOW(default_value, _attrname, _default);                \
+	__ROG_TUNABLE_RW(_attrname, _min, _max, _wmi);                         \
+	__ROG_TUNABLE_SHOW(min_value, _attrname, _min);                        \
+	__ROG_TUNABLE_SHOW(max_value, _attrname, _max);                        \
+	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", _incstep);        \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);           \
+	static struct kobj_attribute attr_##_attrname##_type =                 \
+		__ASUS_ATTR_RO_AS(type, int_type_show);                        \
+	static struct attribute *_attrname##_attrs[] = {                       \
+		&attr_##_attrname##_current_value.attr,                        \
+		&attr_##_attrname##_default_value.attr,                        \
+		&attr_##_attrname##_min_value.attr,                            \
+		&attr_##_attrname##_max_value.attr,                            \
+		&attr_##_attrname##_scalar_increment.attr,                     \
+		&attr_##_attrname##_display_name.attr,                         \
+		&attr_##_attrname##_type.attr,                                 \
+		NULL                                                           \
+	};                                                                     \
+	static const struct attribute_group _attrname##_attr_group = {         \
+		.name = _fsname, .attrs = _attrname##_attrs                    \
+	}
+
 #endif /* _ASUS_BIOSCFG_H_ */
-- 
2.46.1


