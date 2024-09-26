Return-Path: <linux-input+bounces-6746-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4B2987041
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:32:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92241B211AB
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEEE1AED24;
	Thu, 26 Sep 2024 09:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="p1fhvsRF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZnO2ymRe"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410491AE86E;
	Thu, 26 Sep 2024 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343041; cv=none; b=pUqYr6f/wYkFqbKiBtis5tw0xXndYgJYU9kQ8kow7bm2lis7n6aAcxkcGS9k6NlZswq1+LuNetXNRA/fR4hfndAQTb7Y1BqnruNTExTItVss2/0f46J8+OTVdVL1mWlLonGUqhDmu4r25QObGwe0raYk3oi/IlWnIJkXP+3oh50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343041; c=relaxed/simple;
	bh=xyRx9kpHQthpEYhOP6toKlcGQw2eN1zhJOl8rOwwqZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hfz1a/WyH5lZqDhAekBA1pVI9dZsiYQQPKB32kNB7ubKfAjMNnz8/ukAVzYbvWZOC6NFCcvntndoKx0ZviMGkLTDjbOB8Q5NjONdPhvzdG73A3JuuBoENiFQWWfZc9sf9LyXifT7bYfdYY9EKgqwkwBmiQjYuk88mvFtGzWaIP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=p1fhvsRF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZnO2ymRe; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 55E7E1140259;
	Thu, 26 Sep 2024 05:30:38 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 26 Sep 2024 05:30:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343038; x=
	1727429438; bh=sW2JxZl+HS2Y5C6zJE88P2QF9btGp5VQ0JsBc8wEy6w=; b=p
	1fhvsRFxCu+2eQQW+XeynZbPbG2f5hbtyjz6T3Zs5mWl9AVQfmodkIJwVPj3T27Z
	qEJ5fqXaFirW0XFg8vzu7WvgskdvtbxACys+kWjv5vCNUab4+IFziPiG8CZL+iAu
	Z99h/HBNbuIvsMZ7Uy+ISGGpfJw5kyuGEKZYuUl6iwXMaqrPrQdpsJrjYLRcAImQ
	DLYHPeZ1764qh4S9bMtWAIYWVlAqNkPCmBuSw2Bm2zwHEeSPHhdr0HLEj8o/8ddn
	cLOMTz/W+tuYewftzj0i/DMAo5H1QMMr2mZ8c3g2anlxuSaG12XvdJP0QgV2Sg+u
	0JtmdkiVT2WSDKmea2vuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343038; x=
	1727429438; bh=sW2JxZl+HS2Y5C6zJE88P2QF9btGp5VQ0JsBc8wEy6w=; b=Z
	nO2ymReyYiOC09dUKrafCnLKONaZtZfdNPGprgRGK9a/fIH7RNhug4eQUuCfR//3
	/H9GKdbKju/sn2c+r+HrIMrx5XhY7nevoSFbYpqyv8O6ACeQbZpecNq1DvHqKfOp
	TUzbmC6fEZO7u4UxceYzU68knN8wQSofOuVDr5Qgi6E+JMbdSrg0HM7JR8Hhx4/N
	kmExI2xhjngyrPIy8CY+hb0ySx7aPrvwYUmwGmlckvklXUg9glhDLK7/xHZahZre
	I+hDfx9K2S7Gj1TSRcseI0xqrtsopudrV+UiKpmtIzK15ecivVqXB4XKIsJDTKmC
	kCk1szvvQd03wfSI1GkBQ==
X-ME-Sender: <xms:vin1ZtM6bPnO2pdCejeqagvV4n9hVAbVcUz5mzLjtCWfQqW-f_drgA>
    <xme:vin1Zv-5aOxAH6GUiLTEdibFVBlOW2MaEpuvqLjOd_MwvgtcOkguSffjFc-ugW6dS
    NLVrfOvctd-GH-MjhA>
X-ME-Received: <xmr:vin1ZsSjJlAqpQJPJS0cNx9l101EH3RdVroaaEcy9ApfJRQiA8IQIMyDX951NA>
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
X-ME-Proxy: <xmx:vin1Zps-KQ0Wk-kiTQ7htGl1VLrgLyY-QVU8bnt5Xn3Oy6wHnRO0hQ>
    <xmx:vin1Zleu9gVzKrMH3WFHgVMwTgHgbHp1MHZd7qjxNuojKBGM55EF2A>
    <xmx:vin1Zl0BxdV5K7WO9tRdzY2YJg5wYW0xBOpfsYmPdARbDc4mabaDCQ>
    <xmx:vin1Zh-0dF4WaxTKmeh7GwzciYJ5LSrKwrYHe0Z6rhPuQRMx0vsScA>
    <xmx:vin1Zh48R0UUbAxeJw9sY0rWlnQaiQmIJAPn8vIV3H0P9PrKYCjmrMNW>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:34 -0400 (EDT)
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
Subject: [PATCH v4 8/9] platform/x86: asus-armoury: add core count control
Date: Thu, 26 Sep 2024 21:29:51 +1200
Message-ID: <20240926092952.1284435-9-luke@ljones.dev>
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

Implement Intel core enablement under the asus-armoury module using the
fw_attributes class.

This allows users to enable or disable preformance or efficiency cores
depending on their requirements. After change a reboot is required.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 219 +++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h        |  28 +++
 include/linux/platform_data/x86/asus-wmi.h |   4 +
 3 files changed, 251 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index a0022dcee3a4..ce1facb40bd5 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -40,6 +40,21 @@
 #define ASUS_MINI_LED_2024_STRONG 0x01
 #define ASUS_MINI_LED_2024_OFF 0x02
 
+#define ASUS_POWER_CORE_MASK GENMASK(15, 8)
+#define ASUS_PERF_CORE_MASK GENMASK(7, 0)
+
+enum cpu_core_type {
+	CPU_CORE_PERF = 0,
+	CPU_CORE_POWER,
+};
+
+enum cpu_core_value {
+	CPU_CORE_DEFAULT = 0,
+	CPU_CORE_MIN,
+	CPU_CORE_MAX,
+	CPU_CORE_CURRENT,
+};
+
 /* Default limits for tunables available on ASUS ROG laptops */
 #define PPT_CPU_LIMIT_MIN 5
 #define PPT_CPU_LIMIT_MAX 150
@@ -85,6 +100,13 @@ struct rog_tunables {
 	u32 dgpu_tgp_min;
 	u32 dgpu_tgp_max;
 	u32 dgpu_tgp;
+
+	u32 cur_perf_cores;
+	u32 min_perf_cores;
+	u32 max_perf_cores;
+	u32 cur_power_cores;
+	u32 min_power_cores;
+	u32 max_power_cores;
 };
 
 static const struct class *fw_attr_class;
@@ -143,6 +165,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "cores_performance") ||
+	       !strcmp(attr->attr.name, "cores_efficiency") ||
 	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
@@ -569,6 +593,198 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
 }
 ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
 
+static int init_max_cpu_cores(void)
+{
+	u32 cores;
+	int err;
+
+	asus_armoury.rog_tunables->min_perf_cores = 4;
+	asus_armoury.rog_tunables->max_perf_cores = 4;
+	asus_armoury.rog_tunables->cur_perf_cores = 4;
+	asus_armoury.rog_tunables->min_power_cores = 0;
+	asus_armoury.rog_tunables->max_power_cores = 8;
+	asus_armoury.rog_tunables->cur_power_cores = 8;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
+	if (err)
+		return err;
+
+	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
+	asus_armoury.rog_tunables->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+	asus_armoury.rog_tunables->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+
+	cores = 0;
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
+	if (err)
+		return err;
+
+	asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+	asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+
+	return 0;
+}
+
+static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
+				enum cpu_core_type core_type, enum cpu_core_value core_value)
+{
+	u32 cores;
+
+	switch (core_value) {
+	case CPU_CORE_DEFAULT:
+	case CPU_CORE_MAX:
+		if (core_type == CPU_CORE_PERF)
+			return sysfs_emit(buf, "%d\n",
+					  asus_armoury.rog_tunables->max_perf_cores);
+		else
+			return sysfs_emit(buf, "%d\n",
+					  asus_armoury.rog_tunables->max_power_cores);
+	case CPU_CORE_MIN:
+		if (core_type == CPU_CORE_PERF)
+			return sysfs_emit(buf, "%d\n",
+					  asus_armoury.rog_tunables->min_perf_cores);
+		else
+			return sysfs_emit(buf, "%d\n",
+					  asus_armoury.rog_tunables->min_power_cores);
+	default:
+		break;
+	}
+
+	if (core_type == CPU_CORE_PERF)
+		cores = asus_armoury.rog_tunables->cur_perf_cores;
+	else
+		cores = asus_armoury.rog_tunables->cur_power_cores;
+
+	return sysfs_emit(buf, "%d\n", cores);
+}
+
+static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					 const char *buf, enum cpu_core_type core_type)
+{
+	int result, err;
+	u32 new_cores, perf_cores, powr_cores, out_val, min, max;
+
+	result = kstrtou32(buf, 10, &new_cores);
+	if (result)
+		return result;
+
+	if (core_type == CPU_CORE_PERF) {
+		perf_cores = new_cores;
+		powr_cores = out_val = asus_armoury.rog_tunables->cur_power_cores;
+		min = asus_armoury.rog_tunables->min_perf_cores;
+		max = asus_armoury.rog_tunables->max_perf_cores;
+	} else {
+		perf_cores = asus_armoury.rog_tunables->cur_perf_cores;
+		powr_cores = out_val = new_cores;
+		min = asus_armoury.rog_tunables->min_power_cores;
+		max = asus_armoury.rog_tunables->max_power_cores;
+	}
+
+	if (new_cores < min || new_cores > max)
+		return -EINVAL;
+
+	out_val = 0;
+	out_val |= FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores);
+	out_val |= FIELD_PREP(ASUS_POWER_CORE_MASK, powr_cores);
+
+	mutex_lock(&asus_armoury.mutex);
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
+	mutex_unlock(&asus_armoury.mutex);
+
+	if (err) {
+		pr_warn("Failed to set CPU core count: %d\n", err);
+		return err;
+	}
+
+	if (result > 1) {
+		pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
+		return -EIO;
+	}
+
+	pr_info("CPU core count changed, reboot required\n");
+	sysfs_notify(kobj, NULL, attr->attr.name);
+	asus_set_reboot_and_signal_event();
+
+	return 0;
+}
+
+static ssize_t cores_performance_min_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
+}
+
+static ssize_t cores_performance_max_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
+}
+
+static ssize_t cores_performance_default_value_show(struct kobject *kobj,
+						    struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
+}
+
+static ssize_t cores_performance_current_value_show(struct kobject *kobj,
+						    struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
+}
+
+static ssize_t cores_performance_current_value_store(struct kobject *kobj,
+						     struct kobj_attribute *attr,
+						     const char *buf, size_t count)
+{
+	int err;
+
+	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
+	if (err)
+		return err;
+
+	return count;
+}
+ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
+		    "Set the max available performance cores");
+
+static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
+}
+
+static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
+}
+
+static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
+						   struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
+}
+
+static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
+						   struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
+}
+
+static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
+						    struct kobj_attribute *attr, const char *buf,
+						    size_t count)
+{
+	int err;
+
+	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
+	if (err)
+		return err;
+
+	return count;
+}
+ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
+		    "Set the max available efficiency cores");
+
 /* Simple attribute creation */
 ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
 		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
@@ -625,6 +841,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
 	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
+	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
+	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -802,6 +1020,7 @@ static int __init asus_fw_init(void)
 		return -ENOMEM;
 
 	init_rog_tunables(asus_armoury.rog_tunables);
+	init_max_cpu_cores();
 
 	err = asus_fw_attr_add();
 	if (err)
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index a5f95e806b4b..f400e3af24be 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -167,6 +167,34 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 		.name = _fsname, .attrs = _attrname##_attrs               \
 	}
 
+/* CPU core attributes need a little different in setup */
+#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)              \
+	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
+	static struct kobj_attribute attr_##_attrname##_current_value = \
+		__ASUS_ATTR_RW(_attrname, current_value);               \
+	static struct kobj_attribute attr_##_attrname##_default_value = \
+		__ASUS_ATTR_RO(_attrname, default_value);               \
+	static struct kobj_attribute attr_##_attrname##_min_value =     \
+		__ASUS_ATTR_RO(_attrname, min_value);                   \
+	static struct kobj_attribute attr_##_attrname##_max_value =     \
+		__ASUS_ATTR_RO(_attrname, max_value);                   \
+	static struct kobj_attribute attr_##_attrname##_type =          \
+		__ASUS_ATTR_RO_AS(type, int_type_show);                 \
+	static struct attribute *_attrname##_attrs[] = {                \
+		&attr_##_attrname##_current_value.attr,                 \
+		&attr_##_attrname##_default_value.attr,                 \
+		&attr_##_attrname##_min_value.attr,                     \
+		&attr_##_attrname##_max_value.attr,                     \
+		&attr_##_attrname##_scalar_increment.attr,              \
+		&attr_##_attrname##_display_name.attr,                  \
+		&attr_##_attrname##_type.attr,                          \
+		NULL                                                    \
+	};                                                              \
+	static const struct attribute_group _attrname##_attr_group = {  \
+		.name = _fsname, .attrs = _attrname##_attrs             \
+	}
+
 /*
  * ROG PPT attributes need a little different in setup as they
  * require rog_tunables members.
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index e1aeafdf05d5..8964e601543a 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -134,6 +134,10 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
+#define ASUS_WMI_DEVID_CORES		0x001200D2
+ /* Maximum Intel E-core and P-core availability */
+#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
 #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
 #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
-- 
2.46.1


