Return-Path: <linux-input+bounces-6744-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3D798703A
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 867C81F27FA6
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83701AD9FE;
	Thu, 26 Sep 2024 09:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="HU3vW6Fp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FyORODn+"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0423F1AD9F1;
	Thu, 26 Sep 2024 09:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343034; cv=none; b=Ewwqn8rBRKfgwb9Lg7olXNC8osizJ1v2LEnsB5RzbW/uECQzmkzP3KGOVxiXNenQqWo5sg97S3Zxasjh4K9QIAcjzejyDAPqGgQ5FbOIWY5WXG1EV2aj3g1PmKD0K90/flN8hz6SfBVV3sf9/58YpNEpgjNGT6kYaRxntLPSb/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343034; c=relaxed/simple;
	bh=fBR3IjBaMer8xU4P9uUL0/5ApBMBDETfWLX0hhDgmPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R3mw4CU9aGh9ozmR1e5ZoObspwYjm+3xJTKPCoYnv2uROrOMP+j7+h7Tz4t8Pt3h6uNmMs0/4AtmvlyakiwxYEWyd5s9681ICDMVoLBxb+RQRbjTefsCJsrUEc6lz+nvtMWS/f8JMya2S806cbS7kpH6L7H87ikg2Cqcpi0RDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=HU3vW6Fp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FyORODn+; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EBE361140259;
	Thu, 26 Sep 2024 05:30:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 26 Sep 2024 05:30:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343029; x=
	1727429429; bh=PA8VPBQmMcLvz+ogkyzlFkZevLYHtKEn1GtOnd4m7I0=; b=H
	U3vW6FpSOTCRjX9/jKV/oYDOEPZDVaCDVyU0BreByhIPaV+OPq+zWZlQA15S2H3Y
	+IGEJOGKq0ZciQmHQ2KO/ER7wjatQzNxodCj8IrlV1F97mZm4vAf/U0MTXRSXtLs
	1tcxuD8uI2o/n2FKFQJO3N2jKuLvMgLXsuPLVxcXCzSd2Xs6YlxuxthsrqU1MfIG
	NDVFQvSevWD/hjceh5MkEYwDYsjfeWdPj6dQQ3iJusvXZmbCUa6zb8tv3SYMLcyF
	vfujBmetgpyVSG+zy13hWGHTaLWLZQVuMLsJmYCzszz5EI2rO5akce4E929b/yxL
	pEjIfkExVtQQNQsjVILxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343029; x=
	1727429429; bh=PA8VPBQmMcLvz+ogkyzlFkZevLYHtKEn1GtOnd4m7I0=; b=F
	yORODn+cltTlP2Rc1s9kjlsPs49DxRRq9x4iSsyoSGdSRQNMUSJUaPS2cYZBWsGo
	2R0YGStm7TNul+6xCOfQsvEyV5XdA3jSsflNYbVw5f77TmJ/TZBRJr9ZeEkLcp/M
	P2k4iUh4oq0YFFisTMh79DmqBspI1w9ZBqZVWlodfaMQZR4p/mwu4WC/Y44/u/JS
	TPV1X8USG5SVholvsO9rOytHkaRlr+D+T5FCwd3iWCrVAY7B7XiBZ+JzbQzoaewl
	p4YdLEwb+hEi/A2RvFzYYMo2+fsLOKgJXoAs5/41A0iliJAdUnBN7rWzL9fWGl0L
	ILL9jr8vJtkp7s7wCqXEQ==
X-ME-Sender: <xms:tSn1ZtOAtcj-tX4aIPd7HP_nT6FTq651vVLJ82u8pYkUhAksPdT-zA>
    <xme:tSn1Zv-Hf4upkCHODsyRZOT_bScw_e7aGuioULZ7D_oyzrAD3BHCEN_VOQOU8CCQd
    n-tje6RksKhJc1mpEY>
X-ME-Received: <xmr:tSn1ZsRZ8HG_OVwULQVlVkkTqAUTk_8D_yOoC7ioXSEaNjyXZCXwkD9ulw20Mg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghvpdhnsggprhgtphhtthho
    peduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqihhnphhu
    thesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsvghnthhishhssehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehjihhkohhssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepihhlphhordhjrghrvhhinhgvnheslhhinhhugidrihhn
    thgvlhdrtghomhdprhgtphhtthhopehhuggvghhovgguvgesrhgvughhrghtrdgtohhmpd
    hrtghpthhtoheptghorhgvnhhtihhnrdgthhgrrhihsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepshhuphgvrhhmudeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:tSn1Zpu8j3FR2pXLHB7pdgSTmvzfO9pKsZc6Me9DKksMoPK4aRL4eQ>
    <xmx:tSn1ZldUzgKZvGPBljqhtMYjpTaqOmngP4_qvEhV6DwcvugV0uCOfg>
    <xmx:tSn1Zl2vukTlit0rHFsDI95hMWi9L67Gl_wC4Gvgaf6cbAsCvV1zLA>
    <xmx:tSn1Zh_KY7-n-8Z7FtGl1cIM1MqB3UhV_InM-_l6ypFvw_lqXK3TbA>
    <xmx:tSn1ZmWq3rrAZdZp63Ack00LcJTC_Ao7rotR7gyXawryJy9I5DFAUuf3>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:25 -0400 (EDT)
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
	"Luke D. Jones" <luke@ljones.dev>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v4 6/9] platform/x86: asus-armoury: add dgpu tgp control
Date: Thu, 26 Sep 2024 21:29:49 +1200
Message-ID: <20240926092952.1284435-7-luke@ljones.dev>
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

Implement the dgpu TGP control under the asus-armoury module using the
fw_attributes class.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 21 +++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h        | 18 ++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  3 +++
 3 files changed, 42 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 766f944d0233..0f67b5deb629 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -51,6 +51,9 @@
 #define NVIDIA_BOOST_MAX 25
 #define NVIDIA_TEMP_MIN 75
 #define NVIDIA_TEMP_MAX 87
+#define NVIDIA_POWER_MIN 0
+#define NVIDIA_POWER_MAX 70
+#define NVIDIA_POWER_DEFAULT 70
 
 /* Tunables provided by ASUS for gaming laptops */
 struct rog_tunables {
@@ -77,6 +80,11 @@ struct rog_tunables {
 	u32 nv_temp_min;
 	u32 nv_temp_max;
 	u32 nv_temp_target;
+
+	u32 dgpu_tgp_default;
+	u32 dgpu_tgp_min;
+	u32 dgpu_tgp_max;
+	u32 dgpu_tgp;
 };
 
 static const struct class *fw_attr_class;
@@ -467,6 +475,12 @@ ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, "nv_dynamic_boost", ASUS_WMI_DEVID_NV_D
 ATTR_GROUP_ROG_TUNABLE(nv_temp_target, "nv_temp_target", ASUS_WMI_DEVID_NV_THERM_TARGET,
 		       nv_temp_default, nv_boost_min, nv_temp_max, 1,
 		       "Set the Nvidia max thermal limit");
+ATTR_GROUP_ROG_TUNABLE(dgpu_tgp, "dgpu_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP, dgpu_tgp_default,
+		       dgpu_tgp_min, dgpu_tgp_max, 1,
+		       "Set the additional TGP on top of the base TGP");
+
+ATTR_GROUP_INT_VALUE_ONLY_RO(dgpu_base_tgp, "dgpu_base_tgp", ASUS_WMI_DEVID_DGPU_BASE_TGP,
+			     "Read the base TGP value");
 
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
@@ -495,6 +509,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &ppt_fppt_attr_group, ASUS_WMI_DEVID_PPT_FPPT },
 	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
 	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
+	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
+	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -654,6 +670,11 @@ static void init_rog_tunables(struct rog_tunables *rog)
 	rog->nv_temp_max = NVIDIA_TEMP_MIN;
 	rog->nv_temp_max = NVIDIA_TEMP_MAX;
 	rog->nv_temp_target = NVIDIA_TEMP_MIN;
+
+	rog->dgpu_tgp_default = NVIDIA_POWER_DEFAULT;
+	rog->dgpu_tgp_min = NVIDIA_POWER_MIN;
+	rog->dgpu_tgp_max = NVIDIA_POWER_MAX;
+	rog->dgpu_tgp = NVIDIA_POWER_MAX;
 }
 
 static int __init asus_fw_init(void)
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 9e63ea0d9d44..a5f95e806b4b 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -89,6 +89,20 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 	static struct kobj_attribute attr_##_attrname##_##_prop =             \
 		__ASUS_ATTR_RO(_attrname, _prop)
 
+/* Requires current_value_show */
+#define __ATTR_GROUP_INT_VALUE_ONLY(_attrname, _fsname, _dispname)     \
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);   \
+	static struct kobj_attribute attr_##_attrname##_type =         \
+		__ASUS_ATTR_RO_AS(type, int_type_show);                \
+	static struct attribute *_attrname##_attrs[] = {               \
+		&attr_##_attrname##_current_value.attr,                \
+		&attr_##_attrname##_display_name.attr,                 \
+		&attr_##_attrname##_type.attr, NULL                    \
+	};                                                             \
+	static const struct attribute_group _attrname##_attr_group = { \
+		.name = _fsname, .attrs = _attrname##_attrs            \
+	}
+
 /* Boolean style enumeration, base macro. Requires adding show/store */
 #define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)     \
 	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
@@ -106,6 +120,10 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 		.name = _fsname, .attrs = _attrname##_attrs             \
 	}
 
+#define ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname) \
+	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                           \
+	__ATTR_GROUP_INT_VALUE_ONLY(_attrname, _fsname, _dispname)
+
 #define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
 	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
 	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 7caf2c7ed8c9..86629e621c61 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -134,6 +134,9 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+#define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
+#define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
+
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
-- 
2.46.1


