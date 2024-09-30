Return-Path: <linux-input+bounces-6883-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 734BF98989D
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3679C1F22174
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28457185B59;
	Mon, 30 Sep 2024 00:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="wvM/GBTO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SfxS/aXe"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DA918593C;
	Mon, 30 Sep 2024 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654493; cv=none; b=cdoORjN+/dtMl5ADp/BGu+7LSlMhQfkU5bwHeXqMIZnaXmwtYKt6IK2b0mpURU/Ir2N13Rua50xZqeMMRNJS0mB5J2c4BCPYGuv5LDcNS05MfzlOCi4yX+CFTkhg5qzf7L0zk7+CkGnqpoEb3GLfyQAHQzgiHv6GSzYSVs8OiVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654493; c=relaxed/simple;
	bh=xXI3PDfVdDtPZL5HC34qUkD1L93LnrcNZ+y5OrszdzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P+xNA2+XRh/IXxf01/OoVelbVPxfmlzxioqRD/5lmEn16fC+S9agNZ3C/zlGizlx+zS/HleldXR41LcH+7UeYUhx1UxpIsOo02k32tMpCVx/EZ1hf4dNIJIza9VEMtRN+j6OF8n3uatIdUUdFncVuvxFlxtud1LiDQcCvL6B+h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=wvM/GBTO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SfxS/aXe; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 639F2114011F;
	Sun, 29 Sep 2024 20:01:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 29 Sep 2024 20:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654490; x=
	1727740890; bh=JnLrLTqmj62lRbMnp/ziZZkcRPEozZ3C3ht9DTjWvfI=; b=w
	vM/GBTOKc16jDnj8bA+BvbjY5o70FWATKibJ5h6wMvKEQQhzT45c5oAJSltuT/lo
	4DUNtQ2JkA98LfUHzuF3L/OsECVPYSs6yrgJYj/6rUZ4piTctdgRa0Y3t3GbioAT
	gJclqtFIuELm3eFMZrxL1Uw0C3hfqe8jpChcr1NXP8Yx5VI8ZxDdp6tOuXRyZj9i
	YkKYXsuwhff80HmH8n/+tP8wGPl6X8qK+5k7zsSzxF/BiVnAJ9WZ9MSleYNnqY/L
	QFoOyeP6EPH+ubeQ6ws0S9CvKFh011cIbT9INJ3RnZ0kbJt/PMbTXPYHCmc2Hq5O
	1FUJJC71pkNRKHMs2kOhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654490; x=
	1727740890; bh=JnLrLTqmj62lRbMnp/ziZZkcRPEozZ3C3ht9DTjWvfI=; b=S
	fxS/aXeLcB8XhPV1ydJ2B4MaFQ1oWJGoTfuhoPiNw13tK3DTrbzCuD2dXTtj4/jx
	ZuBWXP5tpuE9J29NKMKPhFdcgeI0g+cRb/hTKr3omB7xEDmzbpUbadKDntKKtT/o
	v6VRZIL5Mgwd1J6/i53smmN5nMLfFzw1Q/twvsYtBy/6ISCd9qV2AMMDc8GXl/AX
	IAuM/yV/XW7DxGWsY9a/Bl1FiPwphDA3Eo1CZSXjD1x6Ol7dp9EZmRKb5xWAlQYV
	UBjpHw641/KwwR3o7U/YaXLngRX+aUCvlayi8modMsLsCkR3zHN/Ach7GlZgcO17
	D2jh+wElrNpyY9GIdtI1Q==
X-ME-Sender: <xms:Wer5ZpMeBWlhMIPG9PBvLNKCbhStWP9_N-3FnGdp7KSoMITZtrB4xQ>
    <xme:Wer5Zr8yIEKal4gCILi272Vu7WC_hEcogT0QEFfi7-oO8h1VwnA5f4K-bEwr3_nnV
    EuTVMWyiF6u1yJDfa0>
X-ME-Received: <xmr:Wer5ZoSNwXbT6R1kVn118AAToiojrj4zpNMaNwh8G2wzdpOGW9iDww0LjstkGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:Wer5ZltFIajGXshtoj2bS7isUwXjZ6Lad7xJ8LxzBleJF_9koJM2cg>
    <xmx:Wur5ZhcOopAz4JDDfGtl4IZuR6ORNNrc2hFroZOH7Owr2EKCpy9TFw>
    <xmx:Wur5Zh1Gw53ez6c4SpzZhxrdn4sEbkAdSDdmpneQ8kkYl8H3S1o9Hg>
    <xmx:Wur5Zt95fNh4oP5aJuDilnMjyvfZiSj44I6SEqFuoS9wZY6mvNel9Q>
    <xmx:Wur5Zt5yTp0j3dlNkK-P0NGlloee3fEkN1kbdz9Oric601xGNl2hfKis>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:01:26 -0400 (EDT)
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
Subject: [PATCH v6 8/9] platform/x86: asus-armoury: add core count control
Date: Mon, 30 Sep 2024 13:00:45 +1300
Message-ID: <20240930000046.51388-9-luke@ljones.dev>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240930000046.51388-1-luke@ljones.dev>
References: <20240930000046.51388-1-luke@ljones.dev>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-armoury.c        | 227 +++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h        |  28 +++
 include/linux/platform_data/x86/asus-wmi.h |   4 +
 3 files changed, 259 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 09e0cbf24f25..caaa55219946 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -40,6 +40,24 @@
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
+#define CPU_PERF_CORE_COUNT_MIN 4
+#define CPU_POWR_CORE_COUNT_MIN 0
+
 /* Default limits for tunables available on ASUS ROG laptops */
 #define NVIDIA_BOOST_MIN 5
 #define NVIDIA_BOOST_MAX 25
@@ -85,6 +103,13 @@ struct rog_tunables {
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
@@ -143,6 +168,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "cores_performance") ||
+	       !strcmp(attr->attr.name, "cores_efficiency") ||
 	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
@@ -579,6 +606,200 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
 }
 ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
 
+static int init_max_cpu_cores(void)
+{
+	u32 cores;
+	int err;
+
+	if (!asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX))
+		return 0;
+
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
+	if (err) {
+		pr_err("Could not get CPU core count: error %d", err);
+		return err;
+	}
+
+	asus_armoury.rog_tunables->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+	asus_armoury.rog_tunables->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+
+	asus_armoury.rog_tunables->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
+	asus_armoury.rog_tunables->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
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
@@ -635,6 +856,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
 	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
+	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
+	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -752,6 +975,7 @@ static void init_rog_tunables(struct rog_tunables *rog)
 	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
 	 * The bulk of these defaults are gained from users reporting what
 	 * ASUS Armoury Crate in Windows provides them.
+	 * This should be turned in to a tabe eventually.
 	 */
 	product = dmi_get_system_info(DMI_PRODUCT_NAME);
 
@@ -836,6 +1060,9 @@ static int __init asus_fw_init(void)
 		return -ENOMEM;
 
 	init_rog_tunables(asus_armoury.rog_tunables);
+	err = init_max_cpu_cores();
+	if (err)
+		return err;
 
 	err = asus_fw_attr_add();
 	if (err)
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index e08459cad942..04b88f7d2421 100644
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
index 88bf250dc8ca..cc21e4272460 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,10 @@
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


