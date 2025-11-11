Return-Path: <linux-input+bounces-16008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D3C4FDD0
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 22:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABE6A3B455B
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 21:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F91A33C534;
	Tue, 11 Nov 2025 21:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iQo/Z0Bd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f73.google.com (mail-io1-f73.google.com [209.85.166.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B262957B6
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 21:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762896857; cv=none; b=Lo4at0SmdaSmuxamQPP/uJH4kn2ha2oZHLg8Ia4bfRXGowCtP618NcBnHq4uayK8Vfpz5WAtfjmeB9sVQBzmwMh8ZCLMH77Atw+TSWbTVJZm7q4n7FoLPbSaOABR2107BiMc1bLHIbexSg/GzcwHnq7N8YhUxr2nQBauBslRsIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762896857; c=relaxed/simple;
	bh=AnByqz1bsGNOs4HLx4XQOtBMS6f5gX7qFPGQCvk1TLA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CIV0AxXZoFMvmaahqqAsz/K5yVh4rQGQLNngNunu6dkKACcfacEprnWUsEmCYXgZ+fKYESeJZg9bm51vhtd5MZkDEZoRomG4YygbzYHhROF/cW6E9Gb9+6HwIsASJ4BkOrDRvL8MeWvzkVJN3sCI+oO71X1o6FN+733e0clQ2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iQo/Z0Bd; arc=none smtp.client-ip=209.85.166.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-io1-f73.google.com with SMTP id ca18e2360f4ac-93bc56ebb0aso43903339f.0
        for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 13:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762896854; x=1763501654; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Na3+uPKcwDcTaL/Dq2WsexmKJ67v5tFMZ2PH94guhSY=;
        b=iQo/Z0Bdk+9qF1i+uEPLYprQJmOJ8LtchKO+bW8h2F9MsbuUZRb9DNjEaIzTj82J27
         xzK4f3mFNLcvcoc9YkeuLxC5K5g5dLqCDeKwGujckFQAOgkuXkAWWIRTx6/VFWDyzcSl
         knEhsLbPXQ0KiN7/AiU5X5Hg/3MYq9uzwspLIf3/G6RlO/5Is74wmDJYbuZUeWcHhsjU
         pNFFN8+Mw4z0A+7UGmzTwNrRyi4XcrtGUSdhRJwkc/+/vbMaWnyikOyRX/TsKlK6tSbi
         VIresbxIl5/CyO2YKV8EaRGZVo5NgDR4p1mLa+fp2Chmz7pwhdli1cs8xSQHTcfaizOF
         PtSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762896854; x=1763501654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Na3+uPKcwDcTaL/Dq2WsexmKJ67v5tFMZ2PH94guhSY=;
        b=TJ3cPUsdHYebZH5a33S4LuJBqyn29xO7BkshOu159VZNr0gPBhDOkcxBPppuJNl0D5
         XRGmrtAo90YMXtnC1tp+jbk/TjAst83TmBFPFlvR8w1FzGGdi08hmC9AN8eZfMsdrfEG
         lwFy1I2uS2nyu+JDLFHgUzkZdEP6/UWRmTAk3ZG4CHLIsPRluZGFbFinyVC9khLJej6X
         B1YvlXOGXiPsUnS47ZXmBDX75ukQ9r/feqHWu4irnEfRsnGVTf5DqvEqGpJw8IlBZyE2
         plZLupuI9r0clc2D+GZiA+MQd7mBNppEylisexgw1U4PgszsZc4+ogAEi2n/w8tLZGrq
         HzbQ==
X-Gm-Message-State: AOJu0YxXv8ZmqzSdpqmPMxmYLDBnXF1ErPfjNsFuEbW8QJE9CFfroVnD
	c7vxUmw5WrkrEQ82GilReN44GggDjhYNmO3kZutmUbB9+X3J6NP14hOQjd2MO8yjkigi0VX93F6
	aW1Hy48GqSQ==
X-Google-Smtp-Source: AGHT+IG5Y1zQcwRPyoiX7OW8d2M0A0XY9OUzEt5RJmXGBYW7vPztaaHhQmLph8kZZjliKinJZ3XSFbfZVabL
X-Received: from jabbs11.prod.google.com ([2002:a05:6638:450b:b0:5b7:5e9c:2b4e])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:1411:b0:948:26e8:c3c6
 with SMTP id ca18e2360f4ac-948c4711b8fmr99553139f.17.1762896854532; Tue, 11
 Nov 2025 13:34:14 -0800 (PST)
Date: Tue, 11 Nov 2025 21:34:06 +0000
In-Reply-To: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251111-lid-switch-notifier-v2-1-789723d78d89@google.com>
Subject: [PATCH v2 1/2] Input: Add lid switch notifier
From: Jonathan Denose <jdenose@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

This change creates a new input handler which can be included in the
build via a new Kconfig option CONFIG_INPUT_LID_NOTIFIER. This input
handler listens for lid switch events and publishes them through an
atomic notification chain. Other modules may register for events
through this notification chain with register_lid_notifier.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/input/Kconfig        | 11 +++++
 drivers/input/Makefile       |  1 +
 drivers/input/lid-notifier.c | 98 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/input.h        |  2 +
 4 files changed, 112 insertions(+)

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 88ecdf5218ee9ba35e1efec6341f8605b621bd49..16f6d24fd04ac8cb5af9d36cc47155ea9be0e177 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -38,6 +38,17 @@ config INPUT_LEDS
 	  To compile this driver as a module, choose M here: the
 	  module will be called input-leds.
 
+config INPUT_LID_NOTIFIER
+	tristate "Include notifier for lid switch events"
+	help
+	  Say Y here if you would like to create a notifier to publish lid switch
+		events.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called lid-notifier.
+
 config INPUT_FF_MEMLESS
 	tristate "Support for memoryless force-feedback devices"
 	help
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index 2cd6e1c9a77844fe09cd3d99533e5d3efb038c7d..1efdba04f79a97e2a122b9198341b18a1855b4b9 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INPUT_MATRIXKMAP)	+= matrix-keymap.o
 obj-$(CONFIG_INPUT_VIVALDIFMAP)	+= vivaldi-fmap.o
 
 obj-$(CONFIG_INPUT_LEDS)	+= input-leds.o
+obj-$(CONFIG_INPUT_LID_NOTIFIER)	+= lid-notifier.o
 obj-$(CONFIG_INPUT_MOUSEDEV)	+= mousedev.o
 obj-$(CONFIG_INPUT_JOYDEV)	+= joydev.o
 obj-$(CONFIG_INPUT_EVDEV)	+= evdev.o
diff --git a/drivers/input/lid-notifier.c b/drivers/input/lid-notifier.c
new file mode 100644
index 0000000000000000000000000000000000000000..954b9855532dbd0514860e309d0b76982e947673
--- /dev/null
+++ b/drivers/input/lid-notifier.c
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Lid event notifier
+ *
+ *  Copyright (c) 2025 Jonathan Denose <jdenose@google.com>
+ */
+
+#include <linux/device.h>
+#include <linux/input.h>
+#include <linux/notifier.h>
+
+static struct input_handler lid_handler;
+static struct atomic_notifier_head input_notifier_head;
+
+int register_lid_notifier(struct notifier_block *notifier)
+{
+	return atomic_notifier_chain_register(&input_notifier_head, notifier);
+}
+EXPORT_SYMBOL(register_lid_notifier);
+
+static int lid_handler_connect(struct input_handler *handler,
+		struct input_dev *input_dev, const struct input_device_id *id)
+{
+	struct input_handle *handle;
+	int error;
+
+	handle = devm_kzalloc(&input_dev->dev, sizeof(struct input_handle), GFP_KERNEL);
+	if (!handle)
+		return -ENOMEM;
+
+	handle->dev = input_dev;
+	handle->handler = handler;
+	handle->name = "lid";
+
+	error = input_register_handle(handle);
+	if (error)
+		goto err_free_handle;
+
+	error = input_open_device(handle);
+	if (error)
+		goto err_unregister_handle;
+
+	return 0;
+
+ err_unregister_handle:
+	input_unregister_handle(handle);
+ err_free_handle:
+	kfree(handle);
+	return error;
+}
+
+static void lid_handler_disconnect(struct input_handle *handle)
+{
+	input_close_device(handle);
+	input_unregister_handle(handle);
+}
+
+static void lid_handler_event(struct input_handle *handle, unsigned int type,
+		unsigned int code, int value)
+{
+	if (type == EV_SW && code == SW_LID)
+		atomic_notifier_call_chain(&input_notifier_head, value, handle->dev);
+}
+
+static const struct input_device_id lid_handler_ids[] = {
+	{
+		.flags = INPUT_DEVICE_ID_MATCH_EVBIT | INPUT_DEVICE_ID_MATCH_SWBIT
+						| INPUT_DEVICE_ID_MATCH_BUS,
+		.evbit = { BIT_MASK(EV_SW) },
+		.swbit = { [BIT_WORD(SW_LID)] = BIT_MASK(SW_LID) },
+		.bustype = 0x19
+	},
+	{ },
+};
+
+static struct input_handler lid_handler = {
+	.connect = lid_handler_connect,
+	.disconnect = lid_handler_disconnect,
+	.event = lid_handler_event,
+	.name = "lid",
+	.id_table = lid_handler_ids
+};
+
+static int __init lid_notifier_init(void)
+{
+	return input_register_handler(&lid_handler);
+}
+module_init(lid_notifier_init);
+
+static void __exit lid_notifier_exit(void)
+{
+	input_unregister_handler(&lid_handler);
+}
+module_exit(lid_notifier_exit);
+
+MODULE_AUTHOR("Jonathan Denose <jdenose@google.com>");
+MODULE_DESCRIPTION("Lid event notifier");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/input.h b/include/linux/input.h
index 7d7cb0593a63e93c4906c49cde430188db2d1ab5..023eb92c77d9e8721d482b9787632a671671de08 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -592,3 +592,5 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
 		int (*play_effect)(struct input_dev *, void *, struct ff_effect *));
 
 #endif
+
+int register_lid_notifier(struct notifier_block *notifier);

-- 
2.51.2.1041.gc1ab5b90ca-goog


