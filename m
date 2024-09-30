Return-Path: <linux-input+bounces-6882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32498989B
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFF291C21B31
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C98184535;
	Mon, 30 Sep 2024 00:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="LQR4lqgV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XZkFAsx0"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907015CD49;
	Mon, 30 Sep 2024 00:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654488; cv=none; b=dGqsGZm1QpiDZNmTjZRqRGoo5F5D4bBnToP9rqMnfrER8r22Jf5jGZl/GZp2oT/XS6RvHoIMwU1idTJGKcQ4ubGy8PfMAE90XrWIC1NcLDY8Bq6PMNHpRoZRywt1DnbViOJ95ts3rmiEYFN/T6zKus348MUNveS6V33HOX/vx+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654488; c=relaxed/simple;
	bh=FKfOLZUelv7OFJ8Jec472jmuOEQZr3iWagIjCP05wB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t5A1mp1CYeJAYt++GbFQZhdImS3VQ715q3BVW5KircazLdeIwCSA4vYGY+Zq4/1FnWvtzF6aDm/XyyxrM696bxgxf7hkZhRh7jXGRoTcB+V1zLDootDLKA3N4PWzr+aR4qCuQutV29ktiRFeecD672LQ4/t23TilTfRXaunhqF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=LQR4lqgV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XZkFAsx0; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C65D511400B5;
	Sun, 29 Sep 2024 20:01:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sun, 29 Sep 2024 20:01:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654485; x=
	1727740885; bh=v96vpS5acrzMZ/XcBZTjpTQAEk0QenkXH0x5I5boXok=; b=L
	QR4lqgVKnqkjwVzoSVseqYCeJ5NuRDZXCnM46FBMgk7g9SAUaYF+JJQWj4455Hf1
	c4qAB7nPxgu0I19J6f3t2uC5iy6mrFvdWO74PGcVxPBG9mU3xuZ51MYLRhf7/Ni+
	opLPZxtTPkJSlrbISuaWYO979nD3wPV1iVIZGIzgDtc18covj2luDKNk4wfsqjwX
	N8JTZTG8kklb0gu0ikOZKGqCMJ/nrTIs9S92Ktzd778XBk1xHSXg6a2EOvUhZJ4b
	YqqdX/mJRyJs0XbGZmWi06P4JJwet/2qBovO6i0iq1CXxfHz15BJc2U90g2FgdTK
	gu0PGLSDazC/fWh37lE4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654485; x=
	1727740885; bh=v96vpS5acrzMZ/XcBZTjpTQAEk0QenkXH0x5I5boXok=; b=X
	ZkFAsx0yIt6wVaXHh+oMTpVaimvRtytDbuw8ffluPuRBE/9YkBN7+MQrhY6i39E9
	9g0y1GnL1oTWhkb04X1VdZdf9OlYH9QPBMauu9rKg/RiuNtsqV7Jb9OihkjYhDNc
	AbD7CPNJ2K9qiPrvjd//ICv4lTkyuqIdxLMxEIu2pzJ5W3XS7CDDmGmjzUutEPDK
	7UX4caRSjJn89GJl4JN09JSmSKeGhAdQEKv3zUGvYVXeRagy4tBgzCovsSSavdU4
	goKlrhcwBIFOPJK1noG/VFCAo/h9/24XM/4oIDNuYb2BipSQuKGKPyd2h4F92fCC
	tnjqS3SY5IDqMtceMsn+g==
X-ME-Sender: <xms:Ver5ZlBcCf6IosYeQMd8W0k-m07UL4tNRyehgXQ2IP2DlqOQh5Oyog>
    <xme:Ver5ZjhKolTuHufaSJWYF3v9IEgQeiMHyCdwb1dTg7AQVVGzG0BDGw8vVvQfE70-C
    8SXWJiUhrwChl8iv6c>
X-ME-Received: <xmr:Ver5ZglCyMp5ESiZIzS15QlX1dQ-M39xAin4cvAeUkf1s-Iluwf22JzL5GF7GQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgfeduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Ver5ZvyfxzVnhVQJYeDqQN2R9Sr1vUBKd4gr6vkfEmyAFt6KguKlFA>
    <xmx:Ver5ZqRKT4DB6VcL6jaKy_HKIGpMevpzuUoFBc_kDs9l1uTyYPnzNQ>
    <xmx:Ver5Zia86GZ9r4FHJ2wD6uMfW18mC3USgWYz-AFhhFVq2vM8_S8blw>
    <xmx:Ver5ZrTRx8OuMDap37Fs5tg1GKCXZa0fmFkLJx4vJXRpm98C3pavwg>
    <xmx:Ver5Zr-3NFL21CqFaslTVwiYUoItFbpwE1SNCX363Htsz8UG8ci7W_sA>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:01:21 -0400 (EDT)
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
Subject: [PATCH v6 7/9] platform/x86: asus-armoury: add apu-mem control support
Date: Mon, 30 Sep 2024 13:00:44 +1300
Message-ID: <20240930000046.51388-8-luke@ljones.dev>
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

Implement the APU memory size control under the asus-armoury module using
the fw_attributes class.

This allows the APU allocated memory size to be adjusted depending on
the users priority. A reboot is required after change.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-armoury.c        | 114 +++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |   1 +
 2 files changed, 115 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index ac87b55a17b3..09e0cbf24f25 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -466,6 +466,119 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
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
@@ -521,6 +634,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
 	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
 	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
+	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8c755799eb60..88bf250dc8ca 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -139,6 +139,7 @@
 
 #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
 #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
+#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
-- 
2.46.1


