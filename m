Return-Path: <linux-input+bounces-14098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 461B7B2AB4F
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:45:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50FFB583D61
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D504322DA6;
	Mon, 18 Aug 2025 14:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NOgf5rJ6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593DD322A2E
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527351; cv=none; b=SgOtXMrz6cUj22Xiya9slu1faHF/OJRCCnP+bKqhG3DU1Y2Ou4n+ofoUFJgwefjm0bgldc0W/S744jC4ZrRiA875QHba9holem90zQP02uvvACeITZq0UaR3Q0H0gtY8wLWFwxP5JS3LWIAECRKAzbBFzinYSds6LI89LBOJ8j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527351; c=relaxed/simple;
	bh=rCE3y8aoab+T16WIWRRfap0CwUtLbudmqpC74B556QQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iH7r4Z1sfsN5qVigg0jkCyCIbQMrRkcqgW8zs2aIZcJcZtJAij+LP5DlartZm8G7OzrbLkHXL4DzIxPvRGcZS7/B0VUajUvzGc+/EF6oGT+aywTpBR73eKD+04F2tYPNKkQbImURAqlvLYkAe2yffKkw6bxwaLtdlf44/l76Pqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NOgf5rJ6; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-74381ff6dcbso1093001a34.2
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527348; x=1756132148; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CmbjY97js7MZoomYoQByPkN7C3yikiFKHaLpjjYDFzo=;
        b=NOgf5rJ6kNQr7wPOvDAHivjUmduO1W/FQjVLwGfBFeB1JxRdqneYRWVi4ci+BNnk1A
         yehO2b4ug89E8i8nw9erJp/+JE3yr1Z3tMZ083Z9QQQmBTzs17cghq7gKi6FAbcdt0rT
         F1C6UEiGC4/tHZMiTvdS577WoChfEntkXCZ5IMNE9eDT3TSFDPmivaUEA0w5Q/FH4Tjt
         BUB2PSiLBqDxq2PaWUJCdOEjtwNiUqb/MjkfHyZVKMmH72qcFQSNuvOY5ZPPViUz93ht
         KVAsCKE7ZSkZp07x/1nlMbZtHsL6VRpOaxEvKnNa4AFygP8+yi8pBLzqvpRiNOfFn3Zc
         Ysbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527348; x=1756132148;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CmbjY97js7MZoomYoQByPkN7C3yikiFKHaLpjjYDFzo=;
        b=D/TM7WbRcM/pgtPrDbJRFEYQeDvc5HZonzwrjl5SdLhseVljPO0KLKYybEWW2zSAed
         4htkPsAa6VcUywFBS6z8XgBJPQ3g2rzanWzgP8afca/okwEFk8KGVtSPBlxrgREBAqfF
         lsbjS8qWstU+NWbckO2H79/NCkBo1un5W2NNJM8Kh0UyRG7rdzoefN7B95CjlmHW5GKM
         zPQ6YmOB+5AXQ/zJL9X2IxyNaFalI+6tsdnU11WgYVdwo7t0h0Aw9B9FOf1mu9j1P9EK
         4oAMoAi8HAvoLWTGXJc9+fAROQdHAXpVIyQlpERk6cNZRBgTNlb/xOHIzLHZL3PMwP5P
         eU7w==
X-Gm-Message-State: AOJu0Yz+qpM5D5BXxzWhvKnmKYfmr3lpiqzOw1/i1HpohEuXl/SynJ2M
	8MgZqN1WFb8CXmEkxHreiRRA5Z9gSCjwOq6PhXTgsLoAS/tAK03/buIQGFr3Ua82PUuswjU2XAF
	Dmmpmsqt2lw==
X-Google-Smtp-Source: AGHT+IED3u74ay8tcQaNJ38d6RJ25uk7CVOONcsE53tm1TMDzLqx0DtwfKRaMxJZbEPBl6IzeTe9X/CyNZfQ
X-Received: from ottl45.prod.google.com ([2002:a05:6830:336d:b0:742:f8fd:5cbb])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:f94:b0:73e:9293:554b
 with SMTP id 46e09a7af769-7439ba037a6mr5886059a34.12.1755527348469; Mon, 18
 Aug 2025 07:29:08 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:09 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-9-ca2546e319d5@google.com>
Subject: [PATCH v2 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
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
2.51.0.rc1.163.g2494970778-goog


