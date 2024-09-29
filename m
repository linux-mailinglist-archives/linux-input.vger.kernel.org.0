Return-Path: <linux-input+bounces-6860-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AF99893F0
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 11:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22EED2856B7
	for <lists+linux-input@lfdr.de>; Sun, 29 Sep 2024 09:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CBC1422BD;
	Sun, 29 Sep 2024 09:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="fyt8A1cC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XSpJnCGT"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055113E02C;
	Sun, 29 Sep 2024 09:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727600909; cv=none; b=HjSiHk588Ns6bSwr+vpaFGDcobN+dvOaq4ZohYn4XpvG7TSIAcaX7zsfOzfADz9yJ2l/4uYexzMip/YSdg7idu0qQAi4+pgesAwhexBPINLUEWMzkUmXEWdrrQIy2I7za7ZABF6+G8S8fxlxhzUWjuw6U+RwQDOukd+jAwz+FW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727600909; c=relaxed/simple;
	bh=DLQDS9gcy6U1XM5MIluSlORbovD5evV7jFxCDR0aVR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o4xVyTAHe4OM6y6sVSNA+IZnAMmHIAc7OxosjX0SxX9gP5b3IMI4H+51912yDD0kG5kssNIBPayaW5TiJERKSNbHCACneJSQLj/1XyApxtifOCxo5/DpCTJbugtnV8/nT5oDlVuQjur4JPCEi4dOyUxMrmMiUR/SvX917W4yZFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=fyt8A1cC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XSpJnCGT; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 0C13F138064E;
	Sun, 29 Sep 2024 05:08:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sun, 29 Sep 2024 05:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727600907; x=
	1727687307; bh=VxlV172xyHrTQ/zpqQqtA1Dtnt/AvJVJ15KyMVETlaY=; b=f
	yt8A1cCYzErotmKTV57S/rii9ovmeotcp1lPR07GV/ahCZxxUCTJwY8rzKYSxKTE
	eB6Y0GOg3vgmt4TnLfS2H1L6j4uQOXccIUYrqrYFbp9rgRe+aCHDFnwPfmnW+6H4
	jVqAvj4dfEXWv8tA569G1FqvwnW9xCxzzlH2+N6/QZMjROMAN0/FQngTLmFBKHfi
	rXumBnyBRpDjvJ6PBD88Y5TeuAmMhnnbHCoXoQxwYDTAtaEZHK4Dan1+BayqwhvP
	XTpqaz7jjhOpFOShbDal6kSw33B47Nvf9ThQs2//MJGW5Il3tkW060oyJ6y9Elon
	2ZeQ3Qe55MybRxM8oZetg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727600907; x=
	1727687307; bh=VxlV172xyHrTQ/zpqQqtA1Dtnt/AvJVJ15KyMVETlaY=; b=X
	SpJnCGTDg+gQnONBAKb6r2KSsGVGNFMkxbMQbzeLhZBogKXel82cBJXNLFNB8jyP
	HMwIoeLnjTlixmCexEiOv0M2V13at+/LYJy0hLya0j1K9nfRGorF/MD0w+sRwrl+
	4Fz76hPa9zMwQ4Hjkww9xms8Z3aQGNsrPposKu5ERStd+OOjcxNY9p281j1VmYq3
	poRcMja+vrZxp4pIJcHfi4cgxXeQDxA5er5k0M82c056EvcZL/1oJbuFPUAlDXni
	G6IXiheFcntncGg3cf7T4SQuMV6BWYU4CIIURRkLq06gq9WRWEzpLl2FDcyIe96v
	/8QxWXbfzgcaZDPyjBJTA==
X-ME-Sender: <xms:Chn5ZsdFZfvaBkK1V4QXwTCpaM2s7R0w-EehKbL7ut05eWaYjyWCmQ>
    <xme:Chn5ZuObOTQQLqYHdohszO0AQO_Cct7OoDPGAGtuaNO_ZyV5iFsqGFe6HCPNksJ9i
    W8O7yXGVXdIYYmfnag>
X-ME-Received: <xmr:Chn5ZtipOYW7eD_LDxTw032EfWb7ntUiv3pEhZJXrk829VNss5KGK3e5zjUB4Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedgudefucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:Chn5Zh_NKLAWrvU505htQSVOGGEnswqWh3TeifIUGYdiQwmQA1zJaA>
    <xmx:Chn5Zov0gOB4fJ04NGPlFkJNcUEe6-uKkftN4ZWSInYdLdg19-QfOw>
    <xmx:Chn5ZoGdp-2GdJAHM6iCgjk6jL67C3dO-Fr0Qaosld6XOf0UO0hLCw>
    <xmx:Chn5ZnOHaUtrqPgK3NMoWafNMzIlo96fk4gtuo85vwUMdPFL-oSmDw>
    <xmx:Cxn5ZqJzF7tFXsvfy8xVmD7vjPFBgJHHFyyb1cAaWzeAT67INDUMX0O0>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 05:08:23 -0400 (EDT)
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
Subject: [PATCH v5 1/9] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Sun, 29 Sep 2024 22:08:05 +1300
Message-ID: <20240929090813.7888-2-luke@ljones.dev>
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

Export some rather helpful read/write WMI symbols using a namespace.
These are DEVS and DSTS only, or require the arg0 input.

Also does a slight refactor of internals of these functions.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
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


