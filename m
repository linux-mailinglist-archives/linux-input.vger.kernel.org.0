Return-Path: <linux-input+bounces-14091-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDB0B2AB5B
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 16:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 016C63B52E8
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 14:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9B832252D;
	Mon, 18 Aug 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ESc4LO7I"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0B4321F3A
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527344; cv=none; b=KfapmGVHVZMcLXnb3Zghd8HF+8tPJnTZRFqd9EgNKvliyFwsWtE/VC618OwTF8TD5wNCnSLSBiRfBYsapehKx2qbaRn1ZFfHUO0HzxkrEpwJttgkxBPQXeynXtzu3rQzJFWvVIBX+BqjxuV/PtA2u1edSfwkCHiWBxKXoZFzciU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527344; c=relaxed/simple;
	bh=eyRsoGGC88VxfOwOqnlreduF9Is8JdSJNsfmGu/sGbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NG+yJJuyq0evz0JrWPl/TIJB3r0GdlMhsRR5l5SC+m+C5W+BPAqmSCZ0+oEwrhYTsNVwuQbQjfAWrLyZrGxThxBFULtMbzNlZQv2HWxjjbi0D51Y9A3h/xLrXCyVIgPDVUTVVjck38lGFPxg8pVddvLHugrnnlDNpOTJv+J2MUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ESc4LO7I; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432d9d5c1so419194539f.1
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 07:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527342; x=1756132142; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RipN+nv3SXYZFWbwNBz8QltNazthleRYvjWSHCZV55w=;
        b=ESc4LO7IOwKojRNjLXogioSQpWnm3pMoVjs98y7DOtHNqzNMgrQBaS0WbLbXafYO5F
         1C9+pC6jIeommnuGagZIYJ+tcOr1B8FVSPLU20av8Lute3zfu8orHaRtxvBReJ4Yk1Vo
         fufUAvIO0qf8pE85C4nVLhmQjMZOxbYgAFFxgnn6sRY+wvVZw+jy4E6PSR2oOMNygkzk
         kpUBzpo1YyGjTYFNvaHwgWLCx+hhzMIHIypGDJ+uy8c/lrlbKWJkf6aZR1HXZQAq9z6O
         eYpwXockQUGpGb8+N2LLiwVGwpNyNUEAC7lAGllqLpYdwSOQhQj/l8rA958x5ELy4J3W
         gomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527342; x=1756132142;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RipN+nv3SXYZFWbwNBz8QltNazthleRYvjWSHCZV55w=;
        b=mWTauBSwd1Nna9eK9Ddlddw15ABwNldOl3YLqWddsWk+BX9333/J7WT7xYhk+y2xOt
         PIjI6ZHch4MZiMH6ygA/bCwrzZWUw/EWdck/tE6ln7sgyB4002efi0nBe8Me9grWSqJg
         W5yMRkMkaSUGhfP3TYF7bNOGMXU7H0U+A5wgww3UWaypxn3hH0qibsYkjC2t3clouhLB
         4fLkk8wDG9P0aZ+W9+pHNw5qfzeIe+Nnioz3JjeSkIqq0HOhkvwDtBQqOZqt5uq4e2ug
         2w/b2yvXJheHVGuyJQforROFTQR4gm3sYgh1RqTw25mR/Zd5nsH3/McI6cL5LOKQVxcW
         0wOA==
X-Gm-Message-State: AOJu0YypqCiUmiY2S4TjlxFK1Z0Bvo+NUqRub5HT8csA0AAD47dAAY1p
	cWQfHUSduOGL1orIPIjRmkpycTnt58OnrejVr9tXfhX/obI/Slr92mkGsbE9R7qkLmcM2fMi+zf
	+BqrYJK7PrQ==
X-Google-Smtp-Source: AGHT+IGsMJ1dugoDXs5YZjVy2GFxqSG36FxsyLGBMgRfZ8WXl7iarDTVmB6g6sDJ/ZydNTMQVIHJ8yhRdk17
X-Received: from iov15.prod.google.com ([2002:a05:6602:750f:b0:884:4d31:3618])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:48:b0:884:552:d2be
 with SMTP id ca18e2360f4ac-884471cf28cmr1453961439f.12.1755527341772; Mon, 18
 Aug 2025 07:29:01 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:03 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-3-ca2546e319d5@google.com>
Subject: [PATCH v2 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
haptic capabilities.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 Documentation/input/event-codes.rst    | 14 ++++++++++++++
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..6f7aa9e8207c4aa825d9694ad891f4d105fe8196 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -400,6 +400,20 @@ can report through the rotational axes (absolute and/or relative rx, ry, rz).
 All other axes retain their meaning. A device must not mix
 regular directional axes and accelerometer axes on the same event node.
 
+INPUT_PROP_HAPTIC_TOUCHPAD
+--------------------------
+
+The INPUT_PROP_HAPTIC_TOUCHPAD property indicates that device:
+- supports simple haptic auto and manual triggering
+- can differentiate between at least 5 fingers
+- uses correct resolution for the X/Y (units and value)
+- report correct force per touch, and correct units for them (newtons or grams)
+- follows the MT protocol type B
+
+Summing up, such devices follow the MS spec for input devices in
+Win8 and Win8.1, and in addition support the Simple haptic controller HID table,
+and report correct units for the pressure.
+
 Guidelines
 ==========
 
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 3b2524e4b667d1e7cc02ff5cb674e7c2ac069a66..efe8c36d4ee9a938ffb1b0dd0ddd0ec6a3fcb8fe 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -27,6 +27,7 @@
 #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
 #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
 #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
+#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
 
 #define INPUT_PROP_MAX			0x1f
 #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)

-- 
2.51.0.rc1.163.g2494970778-goog


