Return-Path: <linux-input+bounces-14121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD673B2B468
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 01:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ACE3625B65
	for <lists+linux-input@lfdr.de>; Mon, 18 Aug 2025 23:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D161280033;
	Mon, 18 Aug 2025 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O6Fl9WCa"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB402765C6
	for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 23:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755558646; cv=none; b=Ni36Go2WVOyV29CT5LBZwCG2nl+zM6mn3K+FQKC7EjPy6NOgfNcnqzW3D72xpqoy0CgY+DnD4b60zh4eYhx4zGkuIi7cNLAvbgIOjIlXUcd4RIKcfUUGvF4vwXZ7bxFuoYuRViQE2Cl4efBKAIFpyWxFEASd/xAQfpYhDEkNJPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755558646; c=relaxed/simple;
	bh=jKW22Y1YSZCMJKYVPMb/MDnG5XPEPaPhSJ4Fk8StOYY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rslKHWkB6ZYy76cOETzYFBtEZcFBGyu1GUqV3j5wfCE94iUqRwLDH8l/MtWnFT7OmI5Cr7kzH6LkfKvX0pYuOFspRX0zZWLKhHqaysAz6I84ZLXBLe/ov0JC+xt0fLfFIdu4P7kLwkjoXqSzdQMrlBQWUZAj7SbxlB+uT5azpNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O6Fl9WCa; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-88432da036bso550083939f.1
        for <linux-input@vger.kernel.org>; Mon, 18 Aug 2025 16:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755558643; x=1756163443; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sQOdy+KlWKxwsTUwWnTs614rgt1w5bSixUfa+zzu7Sc=;
        b=O6Fl9WCa2uWL0n6ouYPaq6gu3HAxYLjMedmyqpH3tT/9V/xlYIjRBdTAO2En/+gAic
         c+NGc75y6YFMotMnfMkMsDpyvFkDBLPfBnri/Pq/nJlFhqt6AsFh+nyPPF4/pRohBaB4
         ABwgoO5rVdR323AZYgsqBkefXaqLs+RUcVHP2DRIey+2Ek4tsVhy+rxgb6nUOBgG4y1v
         uAflzBtQ5PrciZAV8H9lYSqIwpsH5VJn7M4la4kfU7f3fRM3nyDEcrhcyYYlDGwmdjX8
         zkt7rZsS4oD6N7Lhb7WJMz7Kwa/QiEJq0CS1H9ZulI3+Q4lmYGn6stBSoXxPcQ25LOlg
         X68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755558643; x=1756163443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sQOdy+KlWKxwsTUwWnTs614rgt1w5bSixUfa+zzu7Sc=;
        b=YarJj+98plJ/Q+QeV+lk8Z5rE5/S22W9dc4+3lNRdJuwbKL7HUfBHukqwGblg/N1SI
         t0TQOFrJldQoKPsUrGdIBcPn4d+KfuZAAXUR5zoQo+udxtXo4K0WN+SAUrBXI6jUmxuj
         Zfjq1+RfU5gE398zPmYk1fAWQPI7XMO2CSSmXW/CGLM2fSHLrHO86x8KYebvm6LMS+YO
         HBIRE+OncLMcNCAz1Swehv4mVRjbmqmn91hByE08BHXcPmHQtVIZm1uxRYj94O+KNhIG
         WxDD2L6Y2N8W41g7zg1rqh2NRKSdxoesBT0Z76vp8E/9E+3p+JtUvvfoDvyrNx1IdM1m
         c6RQ==
X-Gm-Message-State: AOJu0Yx3FCFxJGc8Ds8Y3uqX/8cFohogd9OJsS2ws4wPvSoAo6OuYC0c
	R7rK5bqcYJMiY1tM+IeVhMRYxNzpCssl9h9htx1iHWYhuv0FzHNxwWXIHR4KsIDwJmgWqHYP91Q
	CV4Kxxxynfg==
X-Google-Smtp-Source: AGHT+IENXK2kuyir4ub8DtPGQzHQsMDEtGHtPbYUJO4YqIMU/DCj3/jGIUSc7sqfu0LqU2QJCqI05UDl8KNS
X-Received: from jabkw19.prod.google.com ([2002:a05:6638:9313:b0:501:eef5:7b8e])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:340e:b0:87c:1cc3:c0fa
 with SMTP id ca18e2360f4ac-88467dc9d94mr94914139f.0.1755558636882; Mon, 18
 Aug 2025 16:10:36 -0700 (PDT)
Date: Mon, 18 Aug 2025 23:08:44 +0000
In-Reply-To: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v3-3-e4f9ab0add84@google.com>
Subject: [PATCH v3 03/11] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
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
index b4557462edd7b3fef9e9cd6c2c3cb2d05bb531ab..1ead9bb8d9c6451a81426665baab643f9e50216a 100644
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
+- reports correct force per touch, and correct units for them (newtons or grams)
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
2.51.0.rc1.193.gad69d77794-goog


