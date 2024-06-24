Return-Path: <linux-input+bounces-4575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EF1913F7A
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 02:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D65B281963
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 00:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A177F139D;
	Mon, 24 Jun 2024 00:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="Nfm/3a+4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ihs0ApKp"
X-Original-To: linux-input@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E0E621;
	Mon, 24 Jun 2024 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719188102; cv=none; b=WZk4pBYtNRAYR+8ITQ908yL16QnrhSacO4lwKgREnDzXpu9dNCh+tB5tVKxgcjOWjL1Yhov/yvQYpGh5hEx2nfhDOGb6lf1vV6L/pjldQrv1V5r9y0JoAhmhKLuZxESpg4XL0xlfeNhmzgWn8js4ojDMisgyHB4QQzhggJlQjmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719188102; c=relaxed/simple;
	bh=I+7KIdR+hKd+1NieQ00+NxffCca5NU5MvzyLEbPkWGY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SbmcPVbpaBnslsdgh3gaCVKGdIK0sVU5OywTiRt39VhOi02D7Bj+mhMHPyfUjCiZ0JwKxamlf21ScJp5n7CfHi/MOZmnIVJx0o0EkVbUsfqCbAOOZzWi+4O3TFZeBfWZ/yzpH80waURkea5W/Brt/SEvCkwN+BG5crrjOvkUd7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=Nfm/3a+4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ihs0ApKp; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id B1AF11140253;
	Sun, 23 Jun 2024 20:14:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 23 Jun 2024 20:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1719188099; x=1719274499; bh=Mv7TSFCTe8XCedmOUU7of
	7g9Zk4gSaFYV2gd7QKBzjU=; b=Nfm/3a+4g2Xr24Dja+CYaAkID5dags8tUSutJ
	eBdwR5NK/scX/Tvo0rDTxLdYMl9FrIIqWtMAgbbDcQFMD8QdvViQoU1mVHQZtL7A
	7H40gdhkKimzZkW6PDJ10x2qgtWYIDo2ucGZ7/WTgN6F0OiRpNyQDKVZkk+nledG
	qTsbMslG4u/vWzltV7ARaCSnCK+ky9Hc/rPmnAl5l8Z8idR1rUPjE3WN/SIjB6lr
	3QbrBwrDZ6z2tpcUFcPrYcg6HMm5ZiN8TN69b9/ZvZnhK8QEoBC0o8R4zg/d5Wfn
	ckThcH/Z30faDkTMhpmJ/Yd2ideHVeczPgAC5EhMzOxRwXJjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719188099; x=1719274499; bh=Mv7TSFCTe8XCedmOUU7of7g9Zk4g
	SaFYV2gd7QKBzjU=; b=Ihs0ApKpJaBDDXIn2ub8w+RdB6FKXYEJAGx/iCxdbI1Y
	rGlRu8htjBfaXWJeRskFnDQ1QaLd/4PAf77oMCTtDtA+90qOdihds27XDUH9G48x
	c2oxK6Njtsgi8yUoAATurytTQwEAeQ6mnJZIuQCWl8mH1UILXFZ76xL9ehBX09DQ
	ceHJ4HlXWcYe6wEJkajLnUgs2ySa9I+cMilI/qT5XtMXcsKVFljpZdW5kgTMW0el
	KNxFRihPmUeHpWpXT90IG33fAwhsUK5P6UmNSOVNr/PmSUL4jjM/Q8PWTVJwuOjl
	0ZgFxW4vZ6iAqfZmyHD6IZ3ujBtKqDH88RVrjm4/ew==
X-ME-Sender: <xms:g7p4Zmrv3goOpl3Us7Da-dWzVz7FJorKRwu0J7ZPYy26yw3yiFs-4A>
    <xme:g7p4ZkpIs9WFFRsi1m8BPWVGV1809TGDgWxGIhyGq9ql39TTCaHDHkbJJl17RE8Bt
    2LlbqrC4ajenQz-5_M>
X-ME-Received: <xmr:g7p4ZrOb4NdO22N1UcRmtgmATTlbWqZsp6xE9qy2v_6ODqnNuG4BIx3xLRcZ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegtddgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehljhho
    nhgvshdruggvvheqnecuggftrfgrthhtvghrnhepgfdujedthfduudekffefkeeiffdttd
    dvhfegudduueffuefhfefggeefteevvdegnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:g7p4Zl6JbL4rRzdKzf4Y61Yu5JbZKY6j7NibtIvVA_sfbSJt2b4TJw>
    <xmx:g7p4Zl61jPoQlTofLZ91DoS1zx9ZYyHrI15qt0d1RsFWtcX6Nv-6lA>
    <xmx:g7p4ZlhJalBgw2j24UcnbQcqeplPZfJDf2tBXNKcwooTDFkYkiOClA>
    <xmx:g7p4Zv7b4xodC9HnbUsmLjl8gKx68AvKemUibsACLQCbMbB_c77XKg>
    <xmx:g7p4Zo2sqd8auSBGgi_jcA95omI8v5YSrZDOU7Z57RvZC9ScI0SXIn8x>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Jun 2024 20:14:57 -0400 (EDT)
From: "Luke D. Jones" <luke@ljones.dev>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jikos@kernel.org,
	bentiss@kernel.org,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH] Fixes: bda38f9a41 ("HID: asus: use hid for brightness control on keyboard")
Date: Mon, 24 Jun 2024 12:14:50 +1200
Message-ID: <20240624001450.969059-1-luke@ljones.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Fix missing braces around initializer
- Remove unused function declaration from asus-wmi.h

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 include/linux/platform_data/x86/asus-wmi.h | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 96c780efa0d7..74b32e1d6735 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -162,15 +162,6 @@ static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 #endif
 
 /* To be used by both hid-asus and asus-wmi to determine which controls kbd_brightness */
-#if IS_ENABLED(CONFIG_ASUS_WMI)
-bool asus_use_hid_led(void);
-#else
-static inline bool asus_use_hid_led(void)
-{
-	return true;
-}
-#endif
-
 static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
 	{
 		.matches = {
@@ -202,7 +193,7 @@ static const struct dmi_system_id asus_use_hid_led_dmi_ids[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "RC71L"),
 		},
 	},
-	NULL,
+	{ },
 };
 
 #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
-- 
2.45.2


