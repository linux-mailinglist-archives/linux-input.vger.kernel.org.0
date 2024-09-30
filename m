Return-Path: <linux-input+bounces-6879-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0A5989891
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43FA61F217EB
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 118116F2E6;
	Mon, 30 Sep 2024 00:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="D8LzJtIt";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q0nfgqTK"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DEA44384;
	Mon, 30 Sep 2024 00:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654475; cv=none; b=bZZ58FszQhrqY7WfTItS2JYO4PQolugvUf5MwD71TvM2DMBnZz65i4tEtKBDiCxMHxmkD16j7uaIudl9r0YU9F20WSRS9rH6rdzc7mDwg7uL1UraGOmVv9LyyTS/JX2fnkdCaLUJsFSQcdMH/cu5TQbI2p0AjOQ4C5HeMyNSCmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654475; c=relaxed/simple;
	bh=82Wqe26Vsx9+J8kEOWKWHyvigGJmH5htw8V3v+3qsmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqKzSl9ZEJiLY+oJQLM60MkzOQyt74ETiSsw9puQHc78AlhLyNIZczDVfIoRmrAEGUB8y7D6TEERvWFaEoAhtWXjsz2/0UyVuhP8ndZc4fU9+PcI+6ekaLuMQyb702lWzBLg1BY8HKOm7uZ5Xf5teHv659isQ7zgMsXcvjlBGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=D8LzJtIt; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q0nfgqTK; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8F5DE1140146;
	Sun, 29 Sep 2024 20:01:12 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 29 Sep 2024 20:01:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654472; x=
	1727740872; bh=2GYuXj9/jvSk1R9t1rgNi+1KuQU5o8cqDPb0TSdoYw0=; b=D
	8LzJtItkIPYVR4mmknIT1FxFzKvOWBaSv5iV9RiWA84nPXxafdYK5zo0gczkcObs
	QF+eBtlJYv4wA9/60cf0q8CYWEbqjextahQ8o+shn0RrLY2H4TmF3JWXlHXvgjpO
	VQDRxE09uHD3weOw7fsu0b2E4VP0nJrS8icPUnn4ALKZRtVNIV1C4ga/I9ibUVu1
	ntma/Fk+IULTsBMKZogAHm1gCoQQxpT4QHLNSQI/f8i6AS+TvRoVme9/Am6ol3ab
	/k8qTs8Gl1kaKzHoCOUk94PT/QQWvJ5dF+S1q7zhhPbWWxPCb824NpnqO/KrVJgS
	P7Aewr+Qa4eW8q75ceSsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654472; x=
	1727740872; bh=2GYuXj9/jvSk1R9t1rgNi+1KuQU5o8cqDPb0TSdoYw0=; b=Q
	0nfgqTK6XhIxUhAgY/9GbDQNTQ3ty4to0+nD6b2P2fWZqWOTa5cZ21ev1qcAC6Oi
	Qc1QOkKd4R/hyi2JscBQg3bQ9jHBi5vhpuqGib8wMVC/Vonh1NTKVwis6a0GEbCx
	8qjo7lUaXaT3ZIXaEBqntwoiHTCUwA7DzWn7LjSVQqWcYGTuWI7fUPhsDF/+HfcK
	AOGfo45cL1/Cjjtn1jKVVL9I4QjbK6YznMHaFC4gT8OXytI0qdM3QRDHK1A51Ivb
	ypuAJZKSMRGsiC4ZNezMBpO0TdxEVunPWtu/NKBjJWsTu0Tvla2bwA+ZHGJSKSM7
	nCDgcJt+Xojkqdra3i9Pw==
X-ME-Sender: <xms:SOr5Zh-J4zFSK4jqC9cqwuhaRZyUoEw60mEhiFng5DWoSql81-LRaQ>
    <xme:SOr5ZltYnT0Gm247LHtGSF3wf08YjLN4nskTL6rAKEPRzxrncqZklweY78eHgXZ7R
    yGFOtVpKu7T4EbK04I>
X-ME-Received: <xmr:SOr5ZvC4pO7Rh5kwzT3t29NVirRiV2TJ7IGeCpoYUTw22xjqRYXKblI98EH2Bw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugedgvdelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:SOr5ZlfKbXxfAyPg0SLDWKN2JddmdU6_Cxo0cv1rvOXw6Aqs6vnI8A>
    <xmx:SOr5ZmMVAdVLcAJoo3WJ_g0kzH5fktfErXJXAEgyptQ9AF10sd3z-g>
    <xmx:SOr5Znmp17zEQp02EfL8nqjSfwAWgu34YTyB7xbLlI4DfecNfAvurw>
    <xmx:SOr5ZgtwP8bRMrvZ2chXO4SYZ2uk7Lkc0_3ncp0EjH6KlH70NueGAA>
    <xmx:SOr5Ztou9t9s0hcc8zC1mfmcpOmdX7GhUf-SlUwIckzq-Wuoyu58XhCo>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:01:08 -0400 (EDT)
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
Subject: [PATCH v6 4/9] platform/x86: asus-armoury: add panel_hd_mode attribute
Date: Mon, 30 Sep 2024 13:00:41 +1300
Message-ID: <20240930000046.51388-5-luke@ljones.dev>
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

Add panel_hd_mode to toggle the panel mode between single and high
definition modes.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-armoury.c        | 6 +++++-
 include/linux/platform_data/x86/asus-wmi.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 0085f1b112ab..a4a615dc919b 100644
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


