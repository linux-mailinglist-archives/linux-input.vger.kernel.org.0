Return-Path: <linux-input+bounces-11847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1D8A9454B
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 21:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86BAD3B6164
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 19:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96AA31E32A0;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkSAEXlZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AAA186337;
	Sat, 19 Apr 2025 19:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745091988; cv=none; b=U4qM5lxPYEMi7xro0Yy0ZWF5egm9uqQIK5DqJJPPr5lJ34mfCFaGJihx1P1RI9rbr1/ojBU3npYahoZlF+Q9EMv3VDBeDULjpLFvbhY8vz+Up/IMTVyIHsnL/ezVqUFdGrpm32GXS5Dv2vRmhNm50/OWMQ1lPhQPH2I13gIkPD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745091988; c=relaxed/simple;
	bh=GBsLmBLPqNfr3xsTFXsl4ap5IQP9wLywcQpn3tzVvyE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VqLT2qS1OHUFcxGcBuRhp1Wl/4BM7mw6S2q17tXSfRzR0Cd6BAqRB1ecL6g+IIAx7jJAls5u4QzXzpT5AmHjYpg0Nax7T/+I7T16JnPibP7NGGSaTmIN24uiMfHskPpHQG0m7LnjJ8N4mJ97y/EBHEyYriHevdOsGDomuia0miQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkSAEXlZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE2FFC4CEEC;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745091987;
	bh=GBsLmBLPqNfr3xsTFXsl4ap5IQP9wLywcQpn3tzVvyE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LkSAEXlZys7wSVrzq4063YvsQ4Zm/gD5oeJUEL1UdeVqmGofYajnhcgkRTUALB1vK
	 TEgoEUZ9Yzh1amFyJOmokiAfwULpqk0fqMgkvHShuhaqgk75T2nnlqr61H81JjmxsO
	 B/M8ep5ywOZ8ZdYFoTOjyuhLOFq+0o8s78qWKNqiJntmUq8iQP23+Mgc6jLDAm7O3o
	 r0+DwC3PHSf0wWllT9JsN+U3EPe7v3zBl7y9APjMYB+T9cTSpMuVhEZlTSs3CVY1Em
	 21k9LYD7/HxmtuYRFf+9Xej3I5hjQpD8C44r1pbaYKTcA6TWl8UMgwhY61K+ThLtTC
	 bnuR+FPmrkQSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF5AC369D2;
	Sat, 19 Apr 2025 19:46:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 19 Apr 2025 21:46:24 +0200
Subject: [PATCH v5 1/2] Input: add ABS_SND_PROFILE
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-op6-tri-state-v5-1-443127078517@ixit.cz>
References: <20250419-op6-tri-state-v5-0-443127078517@ixit.cz>
In-Reply-To: <20250419-op6-tri-state-v5-0-443127078517@ixit.cz>
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
 bh=i5QacdZ/EVh5SDiiH8BXaqoyY6PRnf1bq8efvVTS4uk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBoA/2SLFWFP6SwaDTbbhtXi/nY8CtVGPNDNxepf
 +rx00VGsByJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaAP9kgAKCRBgAj/E00kg
 cvU0EACxLXN1Bs8kSN4lpWS/FMjVCiqiOc0elNecLFBakDSaHbUMSAw4z7UFJSg+MfNzbXhnr7S
 AzEsYRhcUfvCmhvMUSOfhi0DGYpG1zdFztM6FmGRTqFNBMo5PunougTmXSZJG5satKEYipfXG1O
 g1pJK4pibcnZN3ijF9X+QUb6rBjeHHOGvOdnIx/WvjruBPJ6iSVF/SVIDP0Bmud49lpGa1GR2aE
 NSObUWdPWVxib0DgR4I8q9Z1D8AK3oSjl63J9OX6pESXO2fCjtOfokp2yU8jrKG/qLB4mdo5hio
 mFJxevAyafkFfWKCDJhrbFyJAzNinOG0u3D9T1XGVpdf9rZKR5/E49hgRe7age9xOVBYDzCDcuo
 Kpo3pe2yv/s4JTwXylRte1F6xfD7OSnuEqNitAYlhCSa0XwqTpZF85sHE/qBRSrhio3zCYyGBG+
 KccPiPxhhrKll8DZgnbvS3/JVF3doqaKDC9zYA2fIcRoLLjc2jQell+nB4tt/ZjnK5csDCRyRP6
 +YD25FOGcLutxzGEpssIVLY5Tex52S8ks4L+3lNt33TfBZkXvSHQALJd+OmCGimtz67/ufuiocI
 aBNgqKHzwNn1nTP/oQY219HhGiLIm1gyjSxvCXXay8l0y2VhljF1U7k4PKQMmM5Hzz5ELmAz9B8
 zELlvHrQ3LoulIg==
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
index 8433306148d57887f855578b8386bd0473cad612..2ccbae40c47cbca73df90b69e236830ff0fe4f3e 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -3511,6 +3511,7 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
 	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
+	[ABS_SND_PROFILE] = "SoundProfile",
 	[ABS_MISC] = "Misc",
 	[ABS_MT_SLOT] = "MTSlot",
 	[ABS_MT_TOUCH_MAJOR] = "MTMajor",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b667d1e7cc02ff5cb674e7c2ac069a66..7b10c97d13fb8d346a836f6c90c5964895856776 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -870,6 +870,7 @@
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
+#define ABS_SND_PROFILE		0x22
 
 #define ABS_MISC		0x28
 
@@ -979,4 +980,12 @@
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
2.49.0



