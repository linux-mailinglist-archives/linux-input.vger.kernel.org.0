Return-Path: <linux-input+bounces-16093-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D2697C58AA3
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 17:19:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5FCF8360B0F
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 16:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDBC2FB624;
	Thu, 13 Nov 2025 16:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGUev0eT"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F32FA0DF;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763049785; cv=none; b=UFhswsd/5xIwNUz8fSV4BPIEhIzHOE+xt7c4qD0qwq3FIO1Y8UuU3cjTXAyKKkABX3H5o40HO7UmXfl2NzuCw5fkH3TfYiZIDH5Xu8w8Jannvb5RiYFr1KmcWqZZodL9dYbFNEAIUWNoCNbwWkbKgQpnZRsX9BhxrYUn23PKDZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763049785; c=relaxed/simple;
	bh=9/O5jK3XiXEvHqxBS4E7bVRiAS5ys9y+3D+j6tYNxi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Op1rUwpjMVIUTRzaFqgczu9p5dvw0NGsABYs5PbTIlSIXXS2QEIZEW6EJJpvIMU19sFtW7/lXw1YQ2CUOE8NxpJ2sGQ0u7H01fyYXpnnsDssvgazOd76r+TRRyIAdU6ap+jCNCatHNgqJ31SyRa9CM/OVzMJXZNG7YcyVVNsI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGUev0eT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DCE3C19423;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763049785;
	bh=9/O5jK3XiXEvHqxBS4E7bVRiAS5ys9y+3D+j6tYNxi8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tGUev0eTCoPDWspZcsJnyKlDKEDAiU2FHnwkkT6upVNJWI6wpa9/RKis2jADhYfai
	 lYUEKjLPvGFUNT8RGXSiMBbbXepgCzL5pynzHoHrqjhARExd7qoAeQk5fBgCtlot7h
	 PG5EvdMFpU/ttgyouZ3afF4EUeAJ6+fuWyTGl+o1ViNH32MNHUUybIt0tc4OwFKitF
	 JmujaSVk4xS1jPHUNcCEokk8ID27DyXqQiUDn3lh52uwLDdA2a64BY6dKVI7PFnjoi
	 n5TiF9uytclfI8f23KM6CQGRRybdhxzzdSGCUdamaC3Jqqn0rNT7T34PKqDXIW6XoT
	 mvBYsVs1N+wew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C1FCD8C8F;
	Thu, 13 Nov 2025 16:03:05 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 17:02:58 +0100
Subject: [PATCH v8 1/2] Input: add ABS_SND_PROFILE
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251113-op6-tri-state-v8-1-54073f3874bc@ixit.cz>
References: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
In-Reply-To: <20251113-op6-tri-state-v8-0-54073f3874bc@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2605; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=ynFBUiLMOY+lvOYrgSSkX4sfQ4tUkV4SJwWhaS9jV5Q=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFgE3bK97MXzp5YL7HOjXhvDRHgW7RTRYeuGwG
 o/3UwuRaDmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYBNwAKCRBgAj/E00kg
 cq0qEACegQhFSI9ob0OcxcYpXcowq9RO4oEavqEqwqVKnyXG1Kui8jsQJEkaKOCSHSnbQXMnpmd
 WZIreor04yTYWFz62HZWLM4lSf951WVz3SLNFCGvVt5rlTpnBn38af6VILT4wPIYW0bXX7SakV7
 xuBRk41RiKksEWV31b4ViCEfvQhY0P+7WW3iUnQoig9roPWr4iKkyxUD2WwbSzO1iqYtW9XsjuM
 2GMoDQEleTil5k596mRYkYjJse1Ka0OmsMMKACKxXsmIADarvPeBCAVAUIgKSQo+KvcSGj9xhOE
 uQK7L9l6rE6M1nT12NzEmNe43P5RlqKul23TnYYKLdjuy/c9Q/L5GcgzAgyK/6rs804zZ21bWqR
 S0qH+i7ZBIiJ7uJ8sdvfEpTi0mTprgdBvUlT0ambRX1IunGPm0SuoJFONIYmuqMf6haMi+rCGlg
 g0Y+BmP5HuVJ5PEmK1ZOHSMmWbDse08OmwdZuwe65S8xLQCkw0W1NCqJZzMPr9T+O1+sXZtue/E
 hfVH+bzPo5jrUORrSXw71/itRDO7x58cuUChzHULQn0TIN4O/UIa3CmkOro36O8C4uYCsU5390m
 xHQT7kvqNPVkq1wd6A5AC/o5rSpyHwVdTodsfF2qo7xdqJwulxbnLhadKH/Uw1i4xQn9v6/e/f3
 8ioe52z7sgrMANQ==
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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Tested-by: Guido Günther <agx@sigxcpu.org> # oneplus,fajita & oneplus,enchilada
Reviewed-by: Guido Günther <agx@sigxcpu.org>
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
index 337d2dc81b4ca..c5865b0d2aaaf 100644
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
index 9cd89bcc1d9c0..430552f036616 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -891,6 +891,7 @@
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
+#define ABS_SND_PROFILE		0x22
 
 #define ABS_MISC		0x28
 
@@ -1000,4 +1001,12 @@
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



