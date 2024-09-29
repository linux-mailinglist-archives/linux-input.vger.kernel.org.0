Return-Path: <linux-input+bounces-6865-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBF989401
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 872E7B24384
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022BF15C14E;
	Sun, 29 Sep 2024 09:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="ej6urqb/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="f0YxBfau"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A413E05F;
	Sun, 29 Sep 2024 09:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600930; cv=none; b=ENLgZmXyUkjQo1w0AwS6XVL8HXhAwMtw8AB2kfa++3dMNMQZcG8V4fzhDmO/+2BZz59M5tJIxp8Vsb6SsTemuJd0J+CCNaxykEnf2rQ1EbK1K7OFHAVgakjBgSxRAee1jn2Y69aUwTBLLmyP5TE+rs+GgSap1ZgOGXyBP+xKOZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600930; c=relaxed/simple;
	bh=TzNiGzVk5hHoeUPGixFIDoWLIGvlPo16hvmDInalBZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJqlHw2HZlZ5sSsK5CZ2jZDvGDp+iI5//nOf2KzTQzW/cSEiUIWqpLOH6VBz+u3KTV10tyjk38ivS9MUmeYcHYA8Jx2kQ9O9ZoIL8RzAa8KpgzmfExvZxU0/XLCLc7+cooqYFDNE+8oAfIYP9V1c5hUxyIVcuBu/6m9lxjInhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=ej6urqb/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=f0YxBfau; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 83F46138064E;
	Sun, 29 Sep 2024 05:08:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 05:08:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600928; x=
	1727687328; bh=AMuxT5Rsexi/58FYK5HjHnQTWfhRpu62BDp5KCnPK/c=; b=e
	j6urqb/knFL9euY59KZUW2kStMMIikyh7PzV2tOUXFhXUTj1tnyeTrqe8hmDhBhC
	bwrkFFwzewkm3wi7IMGjjz4LRNaYZMU5BL5WHkhnfDuZ3pFgZI1Lcu0AgoEzRo9D
	RudwQbh0HdLVc5FIXNMB9N5qXIyq500BowCkwAPnQ0B0QziWFYyqN2ZIZU6pQEGX
	8VhSVisYktvnYokOY/SPrzMncHlD/5S01pfmyiftqS+mJhzG2m9eDAIUVLdYLnFS
	Q5XJ/dYRhCse7TPiozH0u4hqYIZvOCIwE90tg2cPAZ1/SLql5fVmw13wqVdSyIaC
	KH5ZDgK6cEBsoGsfVcCdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600928; x=
	1727687328; bh=AMuxT5Rsexi/58FYK5HjHnQTWfhRpu62BDp5KCnPK/c=; b=f
	0YxBfaus948Y/hpTtWEE0+7cqkGTbwsHIIZi1Z+zh9/eO1k3Tb1ouzD5pxBMIbMB
	pmZbakbNz/uiwuqI2eOYgx2xwW0gnFsx7SHkDBUK/KwrTaqjgrgiu6LaXGh9ck27
	gqFmkTHgNfGUEUpneG8TFqDCAkGzkLT94vY+E6ewlNT6msNDcxX3fjoqFr4Cwirr
	aHSZxaP7uFWbKr7lvMB2fTsMP3GEPoqMJN0S/uuvGgClC1UBeN1Vk0wsnOr1fNOt
	DyqLaXGQUg9l+zIn4ByDWMSHDgdUC8VDr4MIUWG06bR80KlgQsJVxvSDpqanweK0
	iT8Iq3Mnssi+d+vyzYUVA==
X-ME-Sender: <xms:IBn5ZjaM8RbCbZw4KTP0gR0OfzpVV6IrT6vyVDE5fV1xmc8nuxvyqg>
    <xme:IBn5ZiZTjyY9a2BRp3XoWShvcFb_zaBkaZkDz1Sb12W1hr7U327-6EBzm4jZYjLep
    _IiTOcrRLttv81_YRo>
X-ME-Received: <xmr:IBn5Zl_jIsIDcwEIuv8K_rMVPjdBi-QSLL0Xv8-rp2s88x_uu8UQdMXza1PR0Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:IBn5ZpqVmUMNeYt6grv35LTjztwZnhtaaOYbXSzmrNjMMoIPrn7fzg>
    <xmx:IBn5ZurSCHfuCJ6OGFbk9lC5eju-a7tKthSSTSs-KvLtPy6U1_p6xw>
    <xmx:IBn5ZvSl3niqwdbcdmuJCX9DW8d0wGDA9Nvzgr8gJJmTdKIuIbjhGg>
    <xmx:IBn5Zmpyc4dWfRYTV0fKTK3QcwbiZGeqvbuEfTF9mdYXC9h5m0BC_Q>
    <xmx:IBn5Zt1QBwTIM2YVsOZK6wVFINn40M1vh5F4Hb0JQrlArpLUXCACd9jp>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:44 -0400 (EDT)
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
Subject: [PATCH v5 6/9] platform/x86: asus-armoury: add dgpu tgp control
Date: Sun, 29 Sep 2024 22:08:10 +1300
Message-ID: <20240929090813.7888-7-luke@ljones.dev>
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
index aadeb2a41ca6..2a9f4b626f12 100644
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
@@ -673,6 +689,11 @@ static void init_rog_tunables(struct rog_tunables *rog)
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


