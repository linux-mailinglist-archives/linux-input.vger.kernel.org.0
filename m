Return-Path: <linux-input+bounces-13748-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0892B177EB
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 23:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2CB4582718
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 21:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4F8264615;
	Thu, 31 Jul 2025 21:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsyezfGr"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133621A433;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753996623; cv=none; b=DzYx5JSEVg0i/xsvDog2Kjt47QOJnX7rfPpPLuGddLp2nZyR2/P3MOPYJzgJY4B75CNMEpyEkpzTyMJSk/6ls7ITfbmFZvDAeAvZQZeVG2KbYOg0WHJ3kf4Vd6nz1//KYzPdfmqbqAL9ikFtCnLDvlo1Zfwv546Y/c+/IAT27do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753996623; c=relaxed/simple;
	bh=wk89EBN1Ds5i2122SjoVhN6tOFx4aYnZHN8Utb5yZ28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M3/AZfFRXSJDGMrnhp1LBSHpnVsF7TIsNB3zaB2WVkRgsvbjkE+rQcdjF/F45iRIocLr0stlMvkpMUdSSCziblCVjPMv0rJ3+CSeRSa0HZNeHKVNyDMyiWDSTHwcjB9Oz10U5lLNwJVzM1Oy5xUHwq9mXn9GodetyeI5myFGAyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsyezfGr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49ADFC4CEF7;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753996623;
	bh=wk89EBN1Ds5i2122SjoVhN6tOFx4aYnZHN8Utb5yZ28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KsyezfGrlgN5yBCkdZ8WoXucU5T9nYl1sXYlXJdHXkKzXRomLqDzsVOGwIZFndC0/
	 W710G7bR4pKTc34jo84O+J6bkhwAvJVjn8eKCvfORuXhTs8Sse4pKFvbwORx9rLShq
	 cpRGV0cWcXKdoKMoTsl83Y5+pfDTf05EAbJ1N/M5MAzfPcQYxFz7y2NNZWxj2mtXjY
	 GOCZhdmw455QBu0UfbXdFumiqLu7gKannjiQ8tVsZVaG9N54hKbWDRX8Eoa7LOqfZZ
	 CxuhFamO+HrYDq7FD4l4SUo3f48Jn0YY8ISQDt5G7CGTGz109wAiwEF4hpswkHmRl5
	 25XnsfJAMVHTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D67AC87FD3;
	Thu, 31 Jul 2025 21:17:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 31 Jul 2025 23:17:01 +0200
Subject: [PATCH v6 1/2] Input: add ABS_SND_PROFILE
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-op6-tri-state-v6-1-569c25cbc8c2@ixit.cz>
References: <20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz>
In-Reply-To: <20250731-op6-tri-state-v6-0-569c25cbc8c2@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Gergo Koteles <soyer@irl.hu>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2583; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=mqKhMCON4ESTbCRdEw8RVTqsYW4WqX/QCr9kEq/TUv0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoi91NIext4b6VEbyCmO/FVK/H64FFc4sY50g8X
 KhNosoj9J+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIvdTQAKCRBgAj/E00kg
 cmf4D/4/6zEjojuc913sf+yQiwbWL6b0VoQkXD4cIaVlmkI9zPNq0D0FGQinLcMkoCDL5Bp0JzG
 LZTFP76WHuujYNOJG4/bm6hnTcYStdr+stWzrwjyGfVQJZ87Kpp7ym0KOwvLKseuDFmAAb6P26U
 UBPzvHCLwQbZi2qubakfQl41/GhYggaCdOg83cILXbkpC7o5JJXoV2mVr2QyLtILuGS1Nr1yM+w
 6mxnSZF0jmArhbQ12aCbjoxbt55K46gRixVgIUSFB5ZftUAjbPqH7NB8BlWCTh+2h5SJPGpBM5o
 hYF3vP5Ftb+rI6XDlU5dXPHsN65/38W0G0SERHYhlt6JwWeo7P983JsWF6gGCQi0yG8oGlAz7yo
 G2GT7Fm3o60RSRTs27gLvcg/g2E4DnBnCkAoLN0wB7Il3p/p9neL/JHOI8PKD2gO1oY/7tKF6wd
 lzWnbAdRP2kkNwgxiMpSgV+hF5np1Zc51h2cJ4qSHHM5ASPWKc4ycb3OFUXrHsfIqo5cmdL/yv2
 GJvsPvWSWeQtSNNEugsubE6fi1RqffRa1/7alTdYi6Cw6dNHjJZZVG6M6tWVbRRvBWHaAXpXM4w
 +3glrf6SleZoMa68+9TansJoH2nZ1CnxYf0TFbXC3KZZ/ua/XPMaO8TZk1cY1/yJxsU03J5ruH7
 MVxWyF1mmHfLK6g==
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
index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..d43336e64d6aa4fe8a41b7e9947f4f214df6e1ab 100644
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
index 7107071c7c516af48c0c5fc1206c1e01bae3889f..c58500d8b94b581e41ae098d6ce99db7783986b7 100644
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
index 08cb157ab59364a41ac425fc9a4ea8eb2fae0e86..f443f61f9bb8e3c212da522d9b99a386a13c4475 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -875,6 +875,7 @@
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
+#define ABS_SND_PROFILE		0x22
 
 #define ABS_MISC		0x28
 
@@ -984,4 +985,12 @@
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
2.50.1



