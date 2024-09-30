Return-Path: <linux-input+bounces-6876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C7E989889
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 02:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE3BA1F2197B
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2024 00:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7CF142E86;
	Mon, 30 Sep 2024 00:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="dSEytDzr";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bzHBHH66"
X-Original-To: linux-input@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699783BB24;
	Mon, 30 Sep 2024 00:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727654462; cv=none; b=TzAJmC+SLYkw35mZiFH3WK0YlCuQeo4WfMsesaDD2lAf0+OXgd3MXLHeczjTezNxNHs3Xh5rhW0ABPgS9Tznp0ZWzFps3gGJJxp8ITwmjCIkgAJhkfisHOzH4KjozoI5nHXSRYFfajc4YzkyXk9hrv1OmOL5qjvQhQDXH7LJMe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727654462; c=relaxed/simple;
	bh=DLQDS9gcy6U1XM5MIluSlORbovD5evV7jFxCDR0aVR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQCBxEovGRuwpV5wYEmaKG3Qpmi3u6thqHNvlXc6Lf6PcXjw1wGvAQPXbfao0YCU+WRx65I2oP2LtsZJsHPr/hHWpulCo8dG8d/PhMYx+YW4rirC0z9eZSKXk4aWVD+GJBicQOzmOLczgYKmrYFBjSr5bXnpWQIuXvd1IMdqHog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=dSEytDzr; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bzHBHH66; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 75F3C1380211;
	Sun, 29 Sep 2024 20:00:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 29 Sep 2024 20:00:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1727654459; x=
	1727740859; bh=VxlV172xyHrTQ/zpqQqtA1Dtnt/AvJVJ15KyMVETlaY=; b=d
	SEytDzrm5B+51Cb44sxX6uyKyxF0joydoG5s9jZ6nGkGP+8Us+00o6FvX6emsgAt
	ue8sqNdBhoe81YTLztIwVT7f3P5z4Vqn3SYA9z0NItE7Rg2kfqajkNRAUGyqDyI+
	vLng7LkV3qBiHIId7J11YKAVn6GfMdsOHqPSDE/hZTtZNk/CpZcuIUtJigvEi6MX
	yuE6x8iEYR9fEBFNPDWziszsPvi7cvXaJerCE9PrS6IR1HP08uj7rT9X5+GalA4b
	PSstdUrNA9dW6eDFtbjdeMyCd0n5oDBolpy6MAAsPVYo6z5+0JRaf80kYQv7kVnj
	Og4/Lk5OPouAwq8/vIfwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727654459; x=
	1727740859; bh=VxlV172xyHrTQ/zpqQqtA1Dtnt/AvJVJ15KyMVETlaY=; b=b
	zHBHH66aSVhEtitd3T73Js7xBC/cFp17UG1I62j5jVUiPmMLrTTeOuKOY4xhrBGx
	cgPsBfE7s486KfF0O5fxxaN11sHpGbLcjeA1WmCQFM4RGnFLMx/Y3w4YXtzSSEhB
	hTvh/O1x4oETabMYMKejmcT9eqjVqNDDVIsSaAXHwRpxvw7Vq8WOqgZ39183pPWu
	cNWfzEvKT6PZQsHOHExRXvK4TwPWGt5RgjDG5Wa9BKDG7oVPUvWdRLRX2mTi6U7+
	yxE8Sv3cKnhjLtrqOrbSjtE9WllIRzjGsPfV3x5vHALSTVzQeMTLbpvvXj9IslxT
	u7ubDpZDPqTAGFoQkYOLA==
X-ME-Sender: <xms:O-r5ZmJwDOfBZv86vI-e9mRxoj5hLn0X2RfjNiBeOOyPAZ-vFnJOmg>
    <xme:O-r5ZuIBkmvT3lEtPbr4gtk3S8eQnN_nva0uwVulZGCmdWAlOu_QBIZzycd0TyYHC
    JgPAadf9XdJM1DuhkU>
X-ME-Received: <xmr:O-r5ZmsxlKoCZYu8t3V8hwf-0ZzAbQ1sNDkdH35I2HhQijsXgayTua4bMvLGtA>
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
X-ME-Proxy: <xmx:O-r5ZraYBmMDTZTmoF8DB_pR1-SS_jxOtv6pkoOj-_D64jc1XTDjsA>
    <xmx:O-r5ZtZNDu9SsYvQqx3G0A7XXI0c5iT9UUIw5UEw3WZsgndFQAT2Aw>
    <xmx:O-r5ZnAENHlS4cucrrgfSmHCeXQEkm_0o6BQNHxgKFi-QKRwlNhM_A>
    <xmx:O-r5ZjYVAAHKJEI-PlUytu-ILwN3L_UTjlKcrQFUxPBGLW-L_qeiwQ>
    <xmx:O-r5ZvlSa8FlU25vZdDU4jSQmC58ryXeTZJTp5RPph8UjZhDdMz_TGBM>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Sep 2024 20:00:55 -0400 (EDT)
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
Subject: [PATCH v6 1/9] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Mon, 30 Sep 2024 13:00:38 +1300
Message-ID: <20240930000046.51388-2-luke@ljones.dev>
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


