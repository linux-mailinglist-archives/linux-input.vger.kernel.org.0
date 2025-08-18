Return-Path: <linux-input+bounces-14120-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DBB2B466
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF5962560E
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E199B27FD5D;
	Mon, 18 Aug 2025 23:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pb6gLOym"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F7527F010
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558645; cv=none; b=ZE5fahtBW87inSU/QQuZchIR+HSxQFaK60CFR2SbKZ861JCv6rYORWyeRQc8EeGAZVus1B77dfxBAuz34LCQgUKbVXgrW9kZci5R5suAvEPEdYxOQ0EMBjXv2o3MOjbFSsoyoV6y3sP58eN3EJS2bSZqydQzRGdptRG1rW58vT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558645; c=relaxed/simple;
	bh=fOUQ9iN+/TFHSMLuk8u/9z0NqvmTbx1gpw+j00H42/I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oNDHbNOdJSDzhbdtaomnNVajbURH8ObEGThSoixqfrBuBl+2GlOmFo35qP0Fv9D8zxDPfh6T6u06ezXRzWJpxS8pBi1ty9OPoKLx3uJfWJBDHdLSGoen6ROQGttyM9C+HNMQQV14JTUnqxJ+wmKP3uq/eWOeeOD6G4FmtPaY8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pb6gLOym; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432cb7627so476269139f.0
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558643; x=1756163443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xze907Psa5S/IYsuccVxAJQ0ljBH6WFw3XWFWUMA8Qk=;
        b=Pb6gLOymF78pcFKu/yTkaCyui64GqS000a7v2BPGC3fhIQaux2tdTv9ksI2vY48enA
         yRYJvtOorJN4aT7i5Y20mM8mNC33qiSaSRo6+yoyvquoWzPeFfqKS3Sni+YCGhaBaKuk
         C2ndCa5NZ5mJojRu5Rung9HUMHDa295rWax81DHaD+lJ0iICaOL8VBdiYhvaiuUdltqK
         74+vykMcryqxBVfLzk6Mb7RQyWKoyQfIIIRQ5mWPR8sk1xEG4mK4nkO1/CycV7D5aGKn
         LIvVEFvN6XHMkBQ+0al4MBT+/Pmt6Z5UXvTGYpUn1X9BBb5AcpUeEdPG/+8O5/Gyz+kb
         OIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558643; x=1756163443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xze907Psa5S/IYsuccVxAJQ0ljBH6WFw3XWFWUMA8Qk=;
        b=Sn2W+zee/SuKky9rFjIKCiYWnRoa7aM/OBgzI5wgd/0/TD9as3u37sjWmyGw5g6lsj
         o+nlYAIXontnc8HHAFg/bypDe793ar3WHpt/OlynxNE3tPrvJOrIYRcX6UbCUjzo37oy
         IJjDaLaLwleYM+kAkHqf6WnW+TEiXEqIMug3QSTFnbuCnvNwg9WK3vP49QX01iXxiRFd
         saIhiegfUbfPnnEQRC6XO+GIFRvC/lnvdVew9QRU3qxJ1myhpys01M/4M5FBgjAcJgzI
         5FH5da2FIvk2nwF6YVET35EgfO92VV6w9CTgwf71uyylgnebwbAfOkeO9Y8dF2xe6ivh
         SNtQ==
X-Gm-Message-State: AOJu0Yy3d/xB7akwPk1gED5YG+iMlg4zd4MhUvrATO5Dspk1aa7tDWo0
	VFAXvD/HYb4y8IxyqY58s1w7xg96tx5MV+kW2bryfKMOmlDvEsPwLSz3apR2rLj/TGCjnAlmKgV
	NqtgV+eTndQ==
X-Google-Smtp-Source: AGHT+IEae1a+RGpmevjA4aZuqHwjm+8LM/JeSvDhnxxKn/QsDajDWX8k6ANbWJ5eqhAEwHBj0zXnOe75dCaS
X-Received: from iobjk23.prod.google.com ([2002:a05:6602:7217:b0:881:8ed2:a750])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:2d8b:b0:87c:1d65:3aeb
 with SMTP id ca18e2360f4ac-88467e8caa0mr98419439f.2.1755558643163; Mon, 18
 Aug 2025 16:10:43 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:50 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-9-e4f9ab0add84@google.com>
Subject: [PATCH v3 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

Add a flag to generate ABS_PRESSURE as sum of ABS_MT_PRESSURE across
all slots.
This flag should be set if one knows a device reports true force and would
like to report total force to the userspace.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/input/input-mt.c | 14 ++++++++++----
 include/linux/input/mt.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
index 337006dd9dcf72ef2eeb8580e4dd83babf8100be..09f518897d4a71a4a7625367dc2c652ee6035d98 100644
--- a/drivers/input/input-mt.c
+++ b/drivers/input/input-mt.c
@@ -198,6 +198,7 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 	struct input_mt *mt = dev->mt;
 	struct input_mt_slot *oldest;
 	int oldid, count, i;
+	int p, reported_p = 0;
 
 	if (!mt)
 		return;
@@ -216,6 +217,13 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 			oldest = ps;
 			oldid = id;
 		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
+			p = input_mt_get_value(ps, ABS_MT_PRESSURE);
+			if (mt->flags & INPUT_MT_TOTAL_FORCE)
+				reported_p += p;
+			else if (oldid == id)
+				reported_p = p;
+		}
 		count++;
 	}
 
@@ -245,10 +253,8 @@ void input_mt_report_pointer_emulation(struct input_dev *dev, bool use_count)
 		input_event(dev, EV_ABS, ABS_X, x);
 		input_event(dev, EV_ABS, ABS_Y, y);
 
-		if (test_bit(ABS_MT_PRESSURE, dev->absbit)) {
-			int p = input_mt_get_value(oldest, ABS_MT_PRESSURE);
-			input_event(dev, EV_ABS, ABS_PRESSURE, p);
-		}
+		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
+			input_event(dev, EV_ABS, ABS_PRESSURE, reported_p);
 	} else {
 		if (test_bit(ABS_MT_PRESSURE, dev->absbit))
 			input_event(dev, EV_ABS, ABS_PRESSURE, 0);
diff --git a/include/linux/input/mt.h b/include/linux/input/mt.h
index 2cf89a538b18bbc7c99c8705c2d22bdc95065238..d30286298a00a356bc9db954ae362f034cdd359b 100644
--- a/include/linux/input/mt.h
+++ b/include/linux/input/mt.h
@@ -17,6 +17,7 @@
 #define INPUT_MT_DROP_UNUSED	0x0004	/* drop contacts not seen in frame */
 #define INPUT_MT_TRACK		0x0008	/* use in-kernel tracking */
 #define INPUT_MT_SEMI_MT	0x0010	/* semi-mt device, finger count handled manually */
+#define INPUT_MT_TOTAL_FORCE	0x0020	/* calculate total force from slots pressure */
 
 /**
  * struct input_mt_slot - represents the state of an input MT slot

-- 
2.51.0.rc1.193.gad69d77794-goog


