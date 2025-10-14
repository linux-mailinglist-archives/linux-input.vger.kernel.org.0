Return-Path: <linux-input+bounces-15455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A4ABD8667
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 11:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4767C4F96BC
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 09:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A362E7650;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJyMMxCm"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBFC2D47EB;
	Tue, 14 Oct 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760433641; cv=none; b=CK8vJZXADen4hf95dXVeHokEenUTdzgEsaop8N5CU22sTyotpSBvhRCGRR17Q6OQmwVopvd8fmcfM69ymh09++Bt67aOpVkedBGJX/i8hYdwMgAjQ9WOUIkVXIRrogDutjP8gZC2/u1hesXy/BDgOb77Sos1tWfsUaW18JHVK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760433641; c=relaxed/simple;
	bh=OkNbi7+EOwqiKhDni4OGmNNiz273dimpM4aCsh4Ux2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fIgDjKfKANWFqxfVpVZU8Ie06uxrW9DHwyw08ZmPE4GWZ+MV4UGzjtWJOtGlnCGCyD4ZEetwjxb/DHVfIDsOXH2Mod0SiqGRMIPztuPxy+my5OlqJFIHt0EjUvfPwQe14e+HDQzVCxHxctRL27l5VTV3Aj1Lu5aYj8xfvVF3WyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJyMMxCm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBCBCC113D0;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760433640;
	bh=OkNbi7+EOwqiKhDni4OGmNNiz273dimpM4aCsh4Ux2I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AJyMMxCmREVE178+9GpJA8E2KH4B4HkIXSpVJOe5kGpfC3Oh2FyVSSKuU8unkYzkG
	 U8QLt8ONIZXHjLyxhIS+/PChxZkHX95Ew/TkiLe9xsu3adQIoF8DpkvCcr5JZNHPb3
	 /Dj9lnKxs0g2uSBe1gR6VIby+wDFgtjABuQIPAaWysNjk6pJZfIAfALDmIp3Lo39nN
	 0k5JC6YrtZA8xNK2HRWJYwV6yQq2FEdeQCJw+dT3Wc9Jz5gqo/ATxVrNlh8Tzgkw91
	 HgRfJAXhmWvGEEb8L3pzviobA/G++qlbrES5Y3SixZn4iC1hgEgMz+P2MuwzUUo/ZU
	 29vKQk6Z7HNUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6EDACCD187;
	Tue, 14 Oct 2025 09:20:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 14 Oct 2025 11:20:33 +0200
Subject: [PATCH v7 1/3] Input: add ABS_SND_PROFILE
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-op6-tri-state-v7-1-938a6367197b@ixit.cz>
References: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
In-Reply-To: <20251014-op6-tri-state-v7-0-938a6367197b@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
 Gergo Koteles <soyer@irl.hu>, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2421; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=BDRWBuPdrOuSdHeAc4uT/hECys00ijU843iM//rnkxs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo7hXnIi8hN98WaeHw6KCzaCbSsWB3Cw0iHoA/9
 YItni+w8sWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaO4V5wAKCRBgAj/E00kg
 crmpEADQ3KznPGQqk9wDHTxi7L9/ziJ0dpBg8XszJaupW69kyi36JabbgzLIzWxOT8GRAGWzJnN
 /LiU+o5CpZdp8mn/6Qg57y67KMnFgksaL0/sjZgOwFwMXWpJXGHff2Tygo96UEJLWowK3drTnyV
 9eryz3tgXHCEgCnAamhppHjS1lyCx8myLGF9Noq14JIZYnIuVMPa3VCG5KF0Grv2a8qFBbhLBCH
 aZEl1zzmPyJ45fK9hIYWScyF/LEff0DUn3aImh40qH8jLlglDns8TuG4K5E8ISR98CcSrmaTZn5
 aofn+sqP8akdUOuQT8mgz/9ditVmWc4Ek3soEhEi/UNayzO/viWb4D4KbP0VbWX5Dxd1H4i7fwE
 FfGJwHOu20Intl1UqbdVvw7N5//n2E87ZG6GevxLA8nL9i8y0Fao2ZGWaogCqav0Yy8yqsgrNhy
 EHpxeSX4DGjvDTPxGOXhmWXBYa1DYhWv9xCQHFYgOQdCghgNVgb6G8ao7NKXuJFir3BF1I5OKz3
 HcLlbZAs9fyKZdxdBIkGMJ5R4aY2Pq7YnC1dfwU7N1rSp3UgjiHjRVjpKNGKxvp8vVRpfh3bHmd
 H++9Ov+Rgy9Fyy1a2fxDwKYKIMOE/koPRkY5pdJziSbiy8CvYK1SdUtoad7f4L4TPO18Rsgmho0
 vVeZ84bM5x8mQUg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Gergo Koteles <soyer@irl.hu>

ABS_SND_PROFILE used to describe the state of a multi-value sound profile
switch. This will be used for the alert-slider on OnePlus phones or other
phones.

Profile values added as SND_PROFLE_(SILENT|VIBRATE|RING) identifiers
to input-event-codes.h so they can be used from DTS.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/input/event-codes.rst    | 6 ++++++
 drivers/hid/hid-debug.c                | 1 +
 include/uapi/linux/input-event-codes.h | 9 +++++++++
 3 files changed, 16 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index 1ead9bb8d9c64..e4f065dd5a1da 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -241,6 +241,12 @@ A few EV_ABS codes have special meanings:
     emitted only when the selected profile changes, indicating the newly
     selected profile value.
 
+* ABS_SND_PROFILE:
+
+  - Used to describe the state of a multi-value sound profile switch.
+    An event is emitted only when the selected profile changes,
+    indicating the newly selected profile value.
+
 * ABS_MT_<name>:
 
   - Used to describe multitouch input events. Please see
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 7107071c7c516..c58500d8b94b5 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3513,6 +3513,7 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
 	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
+	[ABS_SND_PROFILE] = "SoundProfile",
 	[ABS_MISC] = "Misc",
 	[ABS_MT_SLOT] = "MTSlot",
 	[ABS_MT_TOUCH_MAJOR] = "MTMajor",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 4a9fbf42aa9fa..962168c661ccd 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -879,6 +879,7 @@
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
+#define ABS_SND_PROFILE		0x22
 
 #define ABS_MISC		0x28
 
@@ -988,4 +989,12 @@
 #define SND_MAX			0x07
 #define SND_CNT			(SND_MAX+1)
 
+/*
+ * ABS_SND_PROFILE values
+ */
+
+#define SND_PROFILE_SILENT	0x00
+#define SND_PROFILE_VIBRATE	0x01
+#define SND_PROFILE_RING	0x02
+
 #endif

-- 
2.51.0



