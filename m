Return-Path: <linux-input+bounces-15804-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A35AC208B7
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 15:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC0D84EED9B
	for <lists+linux-input@lfdr.de>; Thu, 30 Oct 2025 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C87B258CE1;
	Thu, 30 Oct 2025 14:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JB67kJya"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DA024DD17
	for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 14:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761833445; cv=none; b=R4YiyOdOs7W5W9Ri4KKhVSJTWm4U4STsLlcp5kGZAfRtEiPMOFHVn/U8qCCUy3ADfm0B4nLHORK30QTUnPUw6qYJuK7quQC5N6dZhc7bxm2odb5E5bDli1Mnq6O8DTiDNKStrLNmL0qbnOZSj3936SIQPfyyjg5bwCBVkwAEuP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761833445; c=relaxed/simple;
	bh=1Rv+cNZUnHqjrlP4AuPv1UvjdUJGPgsu2fReIcVoAss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dvQL7WBbv1Wx/cw9FGcLl709XgFXER2b/nsFEwodQ2twy2stNWvSE8Wyjrh1IsFOncEUm7LLTn6lrjnXoo8dkWEcRHihUFs+0ulLEb34yE8283fC8dUcal1t2UulAxtHvygTI+DVWp1KYX7o/mWlb7p7xglEBHbo13nSYhCMJ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JB67kJya; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-9447edc234fso305901539f.2
        for <linux-input@vger.kernel.org>; Thu, 30 Oct 2025 07:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761833442; x=1762438242; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uzx+TIGAHeWAdlRbvKzxCvCV+3aa2fiQ4ymntya7+7o=;
        b=JB67kJyaAPmlahBeN0yC/NaYZyjgzoCJo5z6MKZdBgiMKJIsU6KGWIdK6zpb/qxkbj
         F4mOtsNZTCtu8ZV9seE7+kpClrMSb4Y3OX+QL3RLvsw3gG/HPpNs1kggur4dXyMlv5G5
         6NySnIVj+LC35ANVHc4uaO0Ii23KJNscZ/5Lw0sVjv3DsQ8j+Wbdxhb4oFbGXoHL7jfv
         mZGjgwH5nsbtnCzYt31QCNXm59DDyOZXe2Ywf6g/tLuOZrQAov13X3fd46LLmCg/x0l7
         BvFgsM6dUHFUJNEOFMlhRxuaUpwqoXVz7zs49/3a8wFbtBFZbRDfVkRfwhZCnzepURC7
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761833442; x=1762438242;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uzx+TIGAHeWAdlRbvKzxCvCV+3aa2fiQ4ymntya7+7o=;
        b=BnXN2kwiNnfwJdFGUoqp+gQdDKP20UNiSLyzDhoH/z+6bu9K3RddqqVsW9RTwn80G4
         y54HcC77U682qRCeXw3NGBkbbG9lW2jjho/9ZR/FyjvhVdl8wLEPV0deXruCp3h8l3Wg
         LK4F1vK+4kjLMhKkj45kvZC6NZqLeOXfjEw17fozo4dI6xYFZNOWO2rLhYfUQdP0emii
         IG0AND3lk7qTsrS6sC9HQDoOlxq5K9BQOmEi3MLiPyRX4W2Rz6MRMU2fcfzhWkHS7b7N
         B1oXLd+JGJZhhQVUmtTQcYRmN8nqEhQZ89LE+zX59vNLWIujTfXWuuL5wURi3z0y0+4V
         yzKA==
X-Gm-Message-State: AOJu0YzfPsqW6GF+KdfBq/FW1sF0qvIPCxBr6GFDMDFB0br4AMtU+390
	RWeF8cYmgf5hVz2Gy/wvlnTU+NbzxcYSg2q7+tp7hmB++YAONB4pdzcnKQgaM/MVaseNbcLDJuq
	NznaVlpR/uw==
X-Google-Smtp-Source: AGHT+IEwb0t0Qlisa1OGs7apQisuIV8c9QvZ3+m4D0xseH90T0W4voKqMOYGDhGhJCAdffYKjr4Z1nUlCfXn
X-Received: from iobbe6.prod.google.com ([2002:a05:6602:3786:b0:943:5a50:ad49])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:1609:b0:42d:b5d0:1930
 with SMTP id e9e14a558f8ab-4330154fb44mr46377195ab.23.1761833442501; Thu, 30
 Oct 2025 07:10:42 -0700 (PDT)
Date: Thu, 30 Oct 2025 14:10:40 +0000
In-Reply-To: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251030-lid-switch-notifier-v1-1-c58dc9b1439d@google.com>
Subject: [PATCH 1/2] Input: Create input notifier chain in input.c
From: Jonathan Denose <jdenose@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

To expose input events to other kernel modules, add a blocking notifier
chain. Publish LID_SWITCH_OPEN/LID_SWITCH_CLOSE events through this
notifier chain when input_handle_event detects events signaling the lid
switch has opened or closed.

Additionally, export a function which allows other kernel modules to
register notifier_block structs against this notifier chain.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/input/input.c | 13 +++++++++++++
 include/linux/input.h |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index a500e1e276c211d1146dbfea421a3402084007f8..b342b1ff138ccc58d4623edcf1152bd85d7054bf 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -26,6 +26,7 @@
 #include <linux/kstrtox.h>
 #include <linux/mutex.h>
 #include <linux/rcupdate.h>
+#include <linux/notifier.h>
 #include "input-compat.h"
 #include "input-core-private.h"
 #include "input-poller.h"
@@ -62,6 +63,8 @@ static const unsigned int input_max_code[EV_CNT] = {
 	[EV_FF] = FF_MAX,
 };
 
+static struct blocking_notifier_head input_notifier_head;
+
 static inline int is_event_supported(unsigned int code,
 				     unsigned long *bm, unsigned int max)
 {
@@ -367,10 +370,20 @@ void input_handle_event(struct input_dev *dev,
 		if (type != EV_SYN)
 			add_input_randomness(type, code, value);
 
+		if (type == EV_SW && code == SW_LID && !value)
+			blocking_notifier_call_chain(&input_notifier_head, value ?
+				LID_SWITCH_CLOSE : LID_SWITCH_OPEN, dev);
+
 		input_event_dispose(dev, disposition, type, code, value);
 	}
 }
 
+int register_input_notifier(struct notifier_block *notifier)
+{
+	return blocking_notifier_chain_register(&input_notifier_head, notifier);
+}
+EXPORT_SYMBOL(register_input_notifier);
+
 /**
  * input_event() - report new input event
  * @dev: device that generated the event
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63e93c4906c49cde430188db2d1ab5..e940aff8843a0afc693c60a252d6b0dbcb3476c4 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -42,6 +42,11 @@ enum input_clock_type {
 	INPUT_CLK_MAX
 };
 
+enum input_notify_event_type {
+	LID_SWITCH_OPEN,
+	LID_SWITCH_CLOSE
+};
+
 /**
  * struct input_dev - represents an input device
  * @name: name of the device
@@ -431,6 +436,8 @@ int input_flush_device(struct input_handle *handle, struct file *file);
 void input_set_timestamp(struct input_dev *dev, ktime_t timestamp);
 ktime_t *input_get_timestamp(struct input_dev *dev);
 
+int register_input_notifier(struct notifier_block *notifier);
+
 void input_event(struct input_dev *dev, unsigned int type, unsigned int code, int value);
 void input_inject_event(struct input_handle *handle, unsigned int type, unsigned int code, int value);
 

-- 
2.51.1.851.g4ebd6896fd-goog


