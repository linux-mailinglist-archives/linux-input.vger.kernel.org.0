Return-Path: <linux-input+bounces-6866-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E4D989403
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53F16286120
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B30916B3B7;
	Sun, 29 Sep 2024 09:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="RYdRd3e+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Axn6FUV9"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E2014EC64;
	Sun, 29 Sep 2024 09:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600935; cv=none; b=idSBMXW78ik69GKwXHY/v7HSJT46tp/7AeJBtuRB3/eztKIjbPLTHcVSbhje3r21OAIdnJTYLjnYM18jtjQoK5dCwIPDShzdfY83zx9tDdNDoASb29dSCBDtpetaLtvpGyRaM81He9mCtJkq0/R/8ob9WUJXptdkv0m1ceFCj/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600935; c=relaxed/simple;
	bh=3LcCZdceHvyNOBrUxi9w41S+RS8SMzGh+YR2EzLsz90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVNHtlcGY96JR3AZrTKGsmDN/LBjGOir5uMNUNx9Ewak6FluV8CuC7NsoC/ex2UbiR5N+5GuuKGolW+lI+vnii20CP8mwM3W5fKe4sf6G3j1I6DeY1VM8cUcnD4ZD7grxvlwJZ+ut0ZN+XG8G9vPt5EnsoXpBJ1EEzDp98q8d0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=RYdRd3e+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Axn6FUV9; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id AF18F138069C;
	Sun, 29 Sep 2024 05:08:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 05:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600932; x=
	1727687332; bh=mQ4GQzfJVKAr4ETscixOQhgAeHqJ59mhKuB3UGjlAKo=; b=R
	YdRd3e+hdxW3hHxdif+zEyv3yZ/pWUV7GDqjKfNLWZYgZdrkXFGU/pZz+CBmDHaY
	Hzb8/F9DPFPySGqnm3vvU0gs/wst/dHthqrt7bdBLPyXx0GdqQk3E1bP0/EVCvem
	1RC/AZWr1rlos4BFHCReD+UewAlAzlWTRNXefGpMdfgdRmuZwKE9GCsq/32cnS4u
	0K2shVIThlSV9Ji7LAeeBwX3JitvSlhug/zM65o3lsCsDsXwwucrQYUoku6bOjxf
	1JtQoUwGj35ppw1+0+IcoC3WpN/ah5XDP0GgvtGzJ1AuUlJA2wedHhJnqTn5rgPs
	igyNy1qxQX3ugHH+SaEyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600932; x=
	1727687332; bh=mQ4GQzfJVKAr4ETscixOQhgAeHqJ59mhKuB3UGjlAKo=; b=A
	xn6FUV9VAoIQRwmPwv5v9T/MZkXtmNbu/Avxtd7y4mihiT9K0rs0GkEQgwdyFgPx
	hxxAcMsHVsy4cC7FYbN6UdYC9OWLpcc1sVXZcGU9hWSolQoYwzMw406lfBslrs8D
	yV6IAtRjoGZPQBrhuf0v+MyOZ9S4E2XMTwvi1Iq3ObMRLLzY6ejCECsJSYfEWmRB
	GawSDE5JcwGX8nkcTyo9NnDrU0ueEJQDZTt+tRBEt1GKeJ9wsaxOF6cZ4j9RgRYb
	p1k9VM8jquRNNaA9rY6xjjh+bdKwPnBhjqpiyRobPMVPzEadIlMnMzwiNAdJL+1r
	9iynrARMb/8Y0TF/8JKjA==
X-ME-Sender: <xms:JBn5ZlPSk83S_8jxkvXnryYwpTUS28lRqv0TxPXhPHez3VVSnnTdTw>
    <xme:JBn5Zn87YX1qarqDZ1zTAYI6zm-cVW2rQNuMwjY_8YY_2dmYAbD8ia7x4aKvZrAZt
    3jXOt4uCouCBu94HPA>
X-ME-Received: <xmr:JBn5ZkTHTrCkfQ0QNPKSfRqQ1Lb0rlDrRY64KVQ6fT8SVowh1VajmpIWfQBxkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttden
    ucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhjohhnvghsrd
    guvghvqeenucggtffrrghtthgvrhhnpefgteefudfgteduueehteejhfeugffgleeltedv
    veethfeuueejfedvgeelveehgfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmh
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
X-ME-Proxy: <xmx:JBn5ZhtcJcgrnbxhRxzD9Fbk0g8CAeESAVL93zsQUz1fd9_CRvFLwA>
    <xmx:JBn5Ztc90FdEPdNElz6XjUshTeZjlCKTHVXlrqyXd_aFtgSDEUYK-w>
    <xmx:JBn5Zt0aVHDzwIpP47M0V4byWckZNFKxkPG7M-2sA7-kq1xmw4YOcg>
    <xmx:JBn5Zp-PS0DKNFQaC0CTBUfWfDqiOkYXO9GjIK_uk-g9rqsTERtPgA>
    <xmx:JBn5Zp65hRVub-U6Kf6kpgz8GjZnrPOsGcASyAI-EISEqK9ciHbS6PYS>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:48 -0400 (EDT)
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
Subject: [PATCH v5 7/9] platform/x86: asus-armoury: add apu-mem control support
Date: Sun, 29 Sep 2024 22:08:11 +1300
Message-ID: <20240929090813.7888-8-luke@ljones.dev>
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
index 2a9f4b626f12..c4c79a33c56e 100644
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


