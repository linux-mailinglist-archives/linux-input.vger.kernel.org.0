Return-Path: <linux-input+bounces-13525-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7829DB042F1
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 17:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92F6E18918EF
	for <lists+linux-input@lfdr.de>; Mon, 14 Jul 2025 15:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADB7262D14;
	Mon, 14 Jul 2025 15:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LvN767ax"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775825A323
	for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 15:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752505790; cv=none; b=E6+5t+BHNjRn7yrvvUJlj0Mm4cbrIJ3qmcM4hXZeQgE25OI3cM+gedkKxAOUxCLIS+9PpskiNZtqwOjhW7v8nzHkeykBHzpqeT5tNiv/ycJYLlLA68i9g1frItaX5uXTtrIJXG002EYZYNq26PXJio8uLir0WAuf6aagaQBnnqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752505790; c=relaxed/simple;
	bh=UrnSB+AYwWQCe3zBRSCE/AsL/WcQasDyOs6FFVGl3U0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lkr9AzKj+e7v7mCCn/jiMhJbX4YlsKnCi4RbUnZsIBGNxrlTulIMmgwzGuo6tdSYQYHbSNKY/icLd+VbQfKi58vyPan5ac3Q4w0hXcHzGNj7hkXbyBKxJgLyGk5YEqDHC6Kztoks7vNQsLj820+3olm0hMjTbCcCb874QHuI8kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LvN767ax; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-869e9667f58so1026053339f.3
        for <linux-input@vger.kernel.org>; Mon, 14 Jul 2025 08:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752505787; x=1753110587; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1XeQ2f7hdl7fMjWobSYvSh68hOpph/lgZTAzcMslzSQ=;
        b=LvN767axR9tglj3JkzFEbioR2+xhMvi9TVP1EnqrfNTrKBy/QVzdqWVMN3idF5VaF4
         GlwV+3bjA1Omh+Cmw7deIVEPGrNMb8L94V+BpmnNumCwzMlyf8nU+aaNasgm7sJ0k1Oi
         PZ67lZ7Peq5CyqBnzfJC5oe19lA83UgMiMiS4FiCGDJWOHmhlCa62NlaqDW73vfqTYY9
         A4lbzN5tPMkNYmtpl3KT0008m8hArvwjietVVLHCTdUbYkKPTfWzbsmUp5KJHa0q0mIn
         MF0J24UGlR5k9vcoZKiALb7qQAkzw1r3Hy5KjDm7vL2G7KyRres2RokkHcbMIk7oXSuK
         1RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752505787; x=1753110587;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XeQ2f7hdl7fMjWobSYvSh68hOpph/lgZTAzcMslzSQ=;
        b=BEXuKU/2+Y3vPV8RdUEyGZ/C/NFSeF2OpwDUUK7dfpyuoTteE7YnpaKnTqyg06a71o
         Ry0w5lkKYKKs4YSE/G2JM1XTWwkonwYQfCmvVzrTB3QtwqyZ08qM3AxTwR8sRk6HzbOJ
         PeMoy/6x5S9TBbscGiqPO/0OGAJGUjAvW8uepVxBTotqvpinIy/pA7o8OhkY78mYa3Lm
         VbPAqbQz6b24s3ZAGni+AFkYEXfXc619ZdD3xdkocGZiOr7zAxyo/BZI8D9VaNy8ale7
         MViD59+kv3ys+aNuBCMPGBdBEUu6UVSyf9cubPGAMHZYQNS1W4tGsXMmWVRP8FmalZ4W
         EqtA==
X-Gm-Message-State: AOJu0Yy9KCRhJri4fa8ffJpZVZxRVzIgUr8xmKuCNoNUT5uRsitWLxHP
	GlV7elG1/5QYqSzNlg92HMfyTOp6RHRewtc70qG00EWX9EQCCSJOt3R/mxxDG0W4aBItwGvNgBi
	QnpdOf84BZw==
X-Google-Smtp-Source: AGHT+IHBbM/0ggsfRNUfgicPHaMmWiNqsB8R07KqRu569QcPVbUgLFwgBVvWjp+gQAKMnIvWOYpBtbh0Vj4h
X-Received: from iovt22.prod.google.com ([2002:a05:6602:1416:b0:86c:fede:130b])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:36cf:b0:86a:93c:f5fb
 with SMTP id ca18e2360f4ac-879787a0c07mr1320634039f.1.1752505787532; Mon, 14
 Jul 2025 08:09:47 -0700 (PDT)
Date: Mon, 14 Jul 2025 15:09:42 +0000
In-Reply-To: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714-support-forcepads-v1-0-71c7c05748c9@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250714-support-forcepads-v1-9-71c7c05748c9@google.com>
Subject: [PATCH 09/11] Input: MT - add INPUT_MT_TOTAL_FORCE flags
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
2.50.0.727.gbf7dc18ff4-goog


