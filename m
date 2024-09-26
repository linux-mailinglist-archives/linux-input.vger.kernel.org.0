Return-Path: <linux-input+bounces-6739-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71498702A
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F92FB261B6
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 09:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66BFF1AC8B4;
	Thu, 26 Sep 2024 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="qgBemQmy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kJ4T6Ri2"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42BC1ABED5;
	Thu, 26 Sep 2024 09:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727343009; cv=none; b=DZrmMFKUKc5YkoeSKHzBdDBDQamcE1ExR8DvNCIwOr+vHyq3w2NoRBd3PHS3FgwMo273MMt91IhfVhS8CybllV9IsgDXy2YO2MzQNGjR1P/JStqCHWwoIG+MGosNnjNSBe4noiANh2Drnd4OYfT8D56eeZh3t7BR2c7sOxPsp54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727343009; c=relaxed/simple;
	bh=zsbRkyzNSonszgB1fav/nb4FYQkIMx5xZ1ZvQr0ayyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs9aREBDatuLQqIxzNCyr6+bNSsMzjyzbwCrSHtVL3ugqqosNrK/P5avxG6yGWKV4wtSH8FysEPuwJvzyPkgYeS4qHG5j6+HHRk+cl86xMvDTHYPS1ZLLQ7tqMGpLLtlXdevD97dpLT/BA4masEEvc0LTvwsUYibHT4GiW1WbV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=qgBemQmy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kJ4T6Ri2; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id D604213805B3;
	Thu, 26 Sep 2024 05:30:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 05:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727343006; x=
	1727429406; bh=Inw53UNpAFlpnBuwryo5a7zcqnZJAu4EMlcVbyNts/k=; b=q
	gBemQmy4uDoilNdz5W+0vp6Y3BWsIUx0WjyK+/OjfNVL0ph3Lw6Q3M+wUFIqU3s1
	wNzR6T+1h24Js2eTujtf6EqwlYmxuLgbM5lIVzIsWdFKo5pLRfWfTIApk+TQ64lN
	bYVEPHAMEmeYd1u5JcHBAMd+aMOihyA9YgP38Vtdw9S9j5FFGYAIIPuBGg7jRSQ3
	AxSHv8RuKW//XmmaRMDR72F0dTwOCVFOKcUNCzskXgj5GprL3eVotN4/r96WcUe/
	ZOxMWIKNCmlALzBKehf4Xo/2dS/IyckMNekkHCVL3o6t4t0kMGNXT6FqfoMSSYpu
	mrgQjud7VIYw3knu6xJQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727343006; x=
	1727429406; bh=Inw53UNpAFlpnBuwryo5a7zcqnZJAu4EMlcVbyNts/k=; b=k
	J4T6Ri252BaWpSJ2KYRFWsaX+OzOAnn85Xoa//SiHYdKeYc9p9VRf4h0YMN3/2XL
	LkmDqFxiGQkkvVmDKxmoUQ05z0QyFrF9JN5sAqFI6VPrwTGRbi5uyM2Yb1lGGPKq
	FwRJWi25SKFmT14iqB+OVKqLNMbWYsthfmlQcFcuhR8u/gFvemlpmX/7WIQw6wyi
	K/6ytal5YxogYZ4WsasRi1h45+UZb9QB6CiMGPbJfsPLmMK4p+Y29GRuZA15LnPk
	lOfRaBnBgdTGzPYr+tM/DULMxuFbT+33s9crUFozY+Ln/4QeYxWoSed3ErtK/XP1
	iPwCdmLZ1NBQ0LIoRMykQ==
X-ME-Sender: <xms:nin1ZoHIGwpRgMhTOKHsSYXYa6PBh5VI9OtrkLuJZH46ms5i2gwCDg>
    <xme:nin1ZhVh2kBT_TqBg-H3xBwknp504OQIUeAQGmjZW_-ntv7efdpM_si6_3rA7ITC5
    l2WUXBIsnvsyx8yhxw>
X-ME-Received: <xmr:nin1ZiKM8HxW83W3y_VBU7qeLqgOkGMMWCegNwgU-mw2iNa2kaUiXqrPz1yKEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgudejucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:nin1ZqGijUBTMc5v_Nr7BpI1RasEhKwYlvlyl-nfpAiOaIVkSjj_vg>
    <xmx:nin1ZuWoGoPkTY4TQWI0riCMu7uXwhfNzraggkecNSDGnqDhkq8c2g>
    <xmx:nin1ZtNDGpCqyCg8V_dV8MTs7G9kD8sRudiZsFqLql1ExErZpq6VSg>
    <xmx:nin1Zl0EQOcks_-wLdtalM8rQFUELcyYSIqjM7xjv4ovelFqsbomFw>
    <xmx:nin1ZqStRK2ATrcIw-75frTPw8r1-P1EexYrUn9IQTcjZL2fN-4Lj7jF>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Sep 2024 05:30:02 -0400 (EDT)
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
Subject: [PATCH v4 1/9] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Thu, 26 Sep 2024 21:29:44 +1200
Message-ID: <20240926092952.1284435-2-luke@ljones.dev>
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

Export some rather helpful read/write WMI symbols using a namespace.
These are DEVS and DSTS only, or require the arg0 input.

Also does a slight refactor of internals of these functions.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c            | 51 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h | 10 +++++
 2 files changed, 58 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 6725a27df62f..0a5221d65130 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -385,7 +385,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 {
 	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
 }
-EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
+EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, ASUS_WMI);
 
 static int asus_wmi_evaluate_method5(u32 method_id,
 		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
@@ -549,12 +549,57 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
 	return 0;
 }
 
-static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
-				 u32 *retval)
+/**
+ * asus_wmi_get_devstate_dsts() - Get the WMI function state.
+ * @dev_id: The WMI function to call.
+ * @retval: A pointer to where to store the value returned from WMI.
+ *
+ * The returned WMI function state can also be used to determine if the WMI
+ * function is supported by checking if the asus_wmi_get_devstate_dsts()
+ * returns an error.
+ *
+ * On success the return value is 0, and the retval is a valid value returned
+ * by the successful WMI function call. An error value is returned only if the
+ * WMI function failed, or if it returns "unsupported" which is typically a 0
+ * (no return, and no 'supported' bit set), or a 0xFFFFFFFE (~1) which if not
+ * caught here can result in unexpected behaviour later.
+ */
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
+	if (err)
+		return err;
+
+	*retval &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
+	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, ASUS_WMI);
+
+/**
+ * asus_wmi_set_devstate() - Set the WMI function state.
+ * @dev_id: The WMI function to call.
+ * @ctrl_param: The argument to be used for this WMI function.
+ * @retval: A pointer to where to store the value returned from WMI.
+ *
+ * The returned WMI function state if not checked here for error as
+ * asus_wmi_set_devstate() is not called unless first paired with a call to
+ * asus_wmi_get_devstate_dsts() to check that the WMI function is supported.
+ *
+ * On success the return value is 0, and the retval is a valid value returned
+ * by the successful WMI function call. An error value is returned only if the
+ * WMI function failed.
+ */
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
 					ctrl_param, retval);
 }
+EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, ASUS_WMI);
 
 /* Helper for special devices with magic return codes */
 static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 365e119bebaa..6ea4dedfb85e 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -158,8 +158,18 @@
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
+static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	return -ENODEV;
+}
+static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.46.1


