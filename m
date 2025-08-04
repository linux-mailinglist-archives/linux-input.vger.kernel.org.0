Return-Path: <linux-input+bounces-13801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C514B1A42A
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 16:11:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 215141893A5D
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 14:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C049B271441;
	Mon,  4 Aug 2025 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sPfhHnOp"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07B226F471
	for <linux-input@vger.kernel.org>; Mon,  4 Aug 2025 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754316684; cv=none; b=UeFUFjGqy9pbVG99AwMYJMVmAbIdlT5SpByPeI8DMp/6SzaZdz5zmVPBp754iTJEFyhwyVkxWRRr1ZK32aJIR+vol9FPIBig/qEjjDMre8L8X+vinyOckBgGoxnwLEWXsriU5SRdlt8KvLMkPIWoQWFgBgY5kH05aZwqqueDUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754316684; c=relaxed/simple;
	bh=F+PXi5nM5lhXJgRf7ORFGFHyO6OD7uAo4HwtKB8OfpY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lzKitA7RICC/Hi0nHXNoOhOW+I+3vJS4RjN94bIWaXmMZdukAnkdLJHsA4Bl9o2TAUHB3FiVEKT9PDJmS9W5xs0m9LxizLXUfw5ABbSuMyFPacG6W/AcrowhD8hyiwLo/uUiqc7EW5A+MNsVMGviYgbhhQlcROoxWRLmv2EUZyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sPfhHnOp; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3e3c78b5192so83322885ab.1
        for <linux-input@vger.kernel.org>; Mon, 04 Aug 2025 07:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754316681; x=1754921481; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ubZ4Umicq2gw4MKto41GXn4WlYxaCA6Z7+4qXt7C5zs=;
        b=sPfhHnOpgceGdnwJCChO6j0GkCtX1eBB2RU1sj8BV/dI7QwjH4mG/xYc3tcrCHUEAU
         Q/W4X6CDzHmA1gpbqOV/3RHDVN48JgG9fe0I5pWNrz85hv+vZofhiKfVwz9uvdbifsLc
         wa63z+ZobkDCuoW4ocdwAiLFtJTaVIwY0itlofbrCfCWmPLlEFHi7EwGVeJoWqzf+97w
         VNeuShfB5QTCeOV5MPo85OtFERB/63z981/b2TXhfotIXcGAXKidQKmUhtMoVBxhkrTA
         fZKsKD5gS54N5o9rBK+kLf1b4/lpEePStTfztkhIyYT8t2L2kfA0HlzHFvZW2VtkdKla
         rgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316681; x=1754921481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ubZ4Umicq2gw4MKto41GXn4WlYxaCA6Z7+4qXt7C5zs=;
        b=XgtFbAKzEZzX4ItY8SpSbQIqZuWLH3N7MXSrHkn+tMhuM1g0pGTZVEOCPGWFW+17ol
         K3sFRfizMTOKWwVuO4Wb9pEjOQ6LfCTf8GodMXeLIUb+ojY2prv0zDaRO1S+jU/XKUS9
         LF9LowfIv0pdJcEFsszkXzUKJGXBPX8SRhktxGh+T7gUp8kBRRrqRGLB9jpPZ/jfWGNa
         bKvst8LVqxNEr8TtjdJulWV59yg84UAzHjCL5qpgJcQvAKztt8leyzisRarI7GClXkn5
         Xk6bFb3Yr26xYYZu8MCIrzpkeR8sJk3Ep9flPFv/HUp5bMC+FytTvkJGUsddxHa5P9UX
         f2ZA==
X-Gm-Message-State: AOJu0YyGa2pap9V0pB1CLb2lZlRsk2CE0EipdlHQ74AJOZFZ34MuSZLr
	pNICNKsok8ffnfVXcM5yuIU3uuY/e/TcSFUOmnNiSCnW4jl/K98tUvL7IK3Kk3d1koWODXY5/e3
	ijL10zGXqRA==
X-Google-Smtp-Source: AGHT+IF2q3PwFU6Q37KO4T7Vtt47/cfdjWmrjamRPYqbNsjjM1NxjObawUg+Xrc/aeyAnjn1qvapjP+kXXxu
X-Received: from ilbec19.prod.google.com ([2002:a05:6e02:4713:b0:3e4:90c:613a])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:160b:b0:3e3:d50c:d657
 with SMTP id e9e14a558f8ab-3e41610a4ccmr163038395ab.3.1754316680974; Mon, 04
 Aug 2025 07:11:20 -0700 (PDT)
Date: Mon, 04 Aug 2025 14:11:17 +0000
In-Reply-To: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250804-support-forcepads-v2-0-138ca980261d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250804-support-forcepads-v2-2-138ca980261d@google.com>
Subject: [PATCH v2 02/11] Input: add FF_HID effect type
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

FF_HID effect type can be used to trigger haptic feedback with HID simple
haptic usages.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 include/uapi/linux/input.h | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
index 2557eb7b056178b2b8be98d9cea855eba1bd5aaf..3ea7c826c6fb2034e46f95cb95b84ef6f5b866df 100644
--- a/include/uapi/linux/input.h
+++ b/include/uapi/linux/input.h
@@ -428,6 +428,24 @@ struct ff_rumble_effect {
 	__u16 weak_magnitude;
 };
 
+/**
+ * struct ff_hid_effect
+ * @hid_usage: hid_usage according to Haptics page (WAVEFORM_CLICK, etc.)
+ * @vendor_id: the waveform vendor ID if hid_usage is in the vendor-defined range
+ * @vendor_waveform_page: the vendor waveform page if hid_usage is in the vendor-defined range
+ * @intensity: strength of the effect as percentage
+ * @repeat_count: number of times to retrigger effect
+ * @retrigger_period: time before effect is retriggered (in ms)
+ */
+struct ff_hid_effect {
+	__u16 hid_usage;
+	__u16 vendor_id;
+	__u8  vendor_waveform_page;
+	__u16 intensity;
+	__u16 repeat_count;
+	__u16 retrigger_period;
+};
+
 /**
  * struct ff_effect - defines force feedback effect
  * @type: type of the effect (FF_CONSTANT, FF_PERIODIC, FF_RAMP, FF_SPRING,
@@ -464,6 +482,7 @@ struct ff_effect {
 		struct ff_periodic_effect periodic;
 		struct ff_condition_effect condition[2]; /* One for each axis */
 		struct ff_rumble_effect rumble;
+		struct ff_hid_effect hid;
 	} u;
 };
 
@@ -471,6 +490,7 @@ struct ff_effect {
  * Force feedback effect types
  */
 
+#define FF_HID		0x4f
 #define FF_RUMBLE	0x50
 #define FF_PERIODIC	0x51
 #define FF_CONSTANT	0x52
@@ -480,7 +500,7 @@ struct ff_effect {
 #define FF_INERTIA	0x56
 #define FF_RAMP		0x57
 
-#define FF_EFFECT_MIN	FF_RUMBLE
+#define FF_EFFECT_MIN	FF_HID
 #define FF_EFFECT_MAX	FF_RAMP
 
 /*

-- 
2.50.1.565.gc32cd1483b-goog


