Return-Path: <linux-input+bounces-6881-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319E989897
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97FF41F21FE1
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA09E1836D9;
	Mon, 30 Sep 2024 00:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="GITi4BGq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VNiHEwpL"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E49183098;
	Mon, 30 Sep 2024 00:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654483; cv=none; b=OKMYffgnbOpd+s6TFy/88T+5kOvAqoyew3DAzo03L4MP3+Q5+vtV0fjBRrpFlEe8Ko9lP0cOAaKGJP2vOeZsEoqEQ8Zi1QLMFV2PYH3Bj6TOlJ309+LfyOxe/Fle5XRBLsRBowlS5R0iGdRFEu9mmV7GKXVFaX/AydeksixS77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654483; c=relaxed/simple;
	bh=bDzydaHh8wGaCM4bLuCOFS1cirJD7kfYBAGOYOrkdJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NpnbbT+6ULC1EAomqXAjSYZ/vf7uwn9PWTdhUY8ZRvC3r1eUTctr1IOC3vKSjUPJHNVf200c3GflVrWiOS4mxcF807d7xRtTR0VDAiWljL04FdHq6gKqCyR0F7ScCKGAohHuomghzv+CZTxEwY/wv+fIzeWYRAQoVHtjowD2rS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=GITi4BGq; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VNiHEwpL; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6E41D1380119;
	Sun, 29 Sep 2024 20:01:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 29 Sep 2024 20:01:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654481; x=
	1727740881; bh=EnJ2FGuAi1StVRkfpdoYX7bnOKdXXE10ll29GgqAKz0=; b=G
	ITi4BGqWhwKp+Jw5nuZVPr2l94/RdrS7dgLUtt+RbTwRvYYYpzwFLokQ3q/xB31O
	mahOVGgrbvPmZns6byRjUpdaBY4TR7aRf/VTsDzw8S4y2tiQHf7Z6Db3Z+j7TcAK
	gGGzdmpp/QWhDEqUSsNhrZl1lL3V9F7ID/qaKVJko6T/9dXKU7F2h/PhEfpcUpb5
	6hSN+IfPmr/AzzSMpf2NjupJgJuhZVBEbVZI0pjD4azUjzyn70Wu7ilGIn/hz820
	bak1legmAkaSMoggqqI8tlmG6dOCNm1qYW/tifgkdJ7ksMbSTsNH7yqex19JNKtf
	cNYUQ1fg/mvRIaC0qxI8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654481; x=
	1727740881; bh=EnJ2FGuAi1StVRkfpdoYX7bnOKdXXE10ll29GgqAKz0=; b=V
	NiHEwpLxbnEZBEG0LhBf0/rljkYPxB0Y24vcLDMIDxfEqvHWWJQGxJ3c32v11M9/
	ZInNXHEasWnNu+ywfUvUpXrt7uELfiYXFPsePmd5BCcethp9bfjV3W+yuvZuBLCB
	rOPEEA7AOVO+6gVfP+myZxJRbYtJ22brI3B2XDhEO2dKHh5bXnVMas2+BFs4HXyp
	p2lO7IZoBzpLCWeyC7onNLwnWTHrOhXyRAhO4upcBg4lVOL4oibb6YhCBb1LGgmo
	c/a9CizFLULSEvxiunffrQdnD541MMhltrBf+y/TsDdkzNbaeUFXy3CzTPfEbi4q
	oI6r33hXXdaNFBt2ONF8Q==
X-ME-Sender: <xms:Uer5ZthZtxsNbCuifyWq4067c3M4iVgD8NW96F_7A6SnybAnKWCmfw>
    <xme:Uer5ZiBt3_Kpj4aFfn9g8BDj-3NKaF5h4RAPyJAt71IkxnV7YZ0sd1MIt3M5gAXcv
    _pbQcB1uUQPIs6bTG4>
X-ME-Received: <xmr:Uer5ZtGODHbNqW_qBfjS5e5RaeHx2_rYEiHHEIyvczdivAMF0rX1POV0Crapvw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmh
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
X-ME-Proxy: <xmx:Uer5ZiQBOLclsiqUWxRrWzLZJMawk2dUhD1N1rNqgMcmpPqWS3PvEQ>
    <xmx:Uer5ZqyYUtVH58qOp_TKdb2cgdyCfI-EIW4SGvgeq0E3Vtkqg_TBtg>
    <xmx:Uer5Zo4lzHD_RqoJiOGxLKKMTzddUzqXVZsJxxuTnDQbPEbLIeEbmQ>
    <xmx:Uer5ZvwiL6b7prYL90LeI_vSxSMVYypoCuZTylI3CtPd_J9FSN7fXw>
    <xmx:Uer5ZueynxZy5_SoOjardSq0FQXTwHaG1_O-Xmwa6MZgtobtbaNImUWl>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:01:17 -0400 (EDT)
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
Subject: [PATCH v6 6/9] platform/x86: asus-armoury: add dgpu tgp control
Date: Mon, 30 Sep 2024 13:00:43 +1300
Message-ID: <20240930000046.51388-7-luke@ljones.dev>
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
index 192c60bb1091..ac87b55a17b3 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -45,6 +45,9 @@
 #define NVIDIA_BOOST_MAX 25
 #define NVIDIA_TEMP_MIN 75
 #define NVIDIA_TEMP_MAX 87
+#define NVIDIA_POWER_MIN 0
+#define NVIDIA_POWER_MAX 70
+#define NVIDIA_POWER_DEFAULT 70
 #define PPT_CPU_LIMIT_MIN 5
 #define PPT_CPU_LIMIT_MAX 150
 #define PPT_CPU_LIMIT_DEFAULT 80
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
@@ -477,6 +485,12 @@ ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, "nv_dynamic_boost", ASUS_WMI_DEVID_NV_D
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
@@ -505,6 +519,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &ppt_fppt_attr_group, ASUS_WMI_DEVID_PPT_FPPT },
 	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
 	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
+	{ &dgpu_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
+	{ &dgpu_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -678,6 +694,11 @@ static void init_rog_tunables(struct rog_tunables *rog)
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
index ca570ed9c8ef..e08459cad942 100644
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
index a6064995c2cc..8c755799eb60 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,9 @@
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


