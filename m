Return-Path: <linux-input+bounces-8624-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CAC9F492F
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 11:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5BE01892004
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 10:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F84A1E5721;
	Tue, 17 Dec 2024 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I66qyFLM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1F1E260A;
	Tue, 17 Dec 2024 10:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734432463; cv=none; b=Jpr2gTHd+K+4OZw0bJX+6T36CwquvEhGyVTwSjOfn9bNPgzdijCshd7avZVQSQZoLets7FO9naNciu4bh/WzHZstGBR644cbjKvkd8BbjW9BOsIktTb1uJ463fCVR8VQhS5Lt05CaiSdjQv6UP5Jn60zpcmB62CXeI1tTBbrP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734432463; c=relaxed/simple;
	bh=m9YLopjD2BjlIvWN9XhjNV/ZSRqTAGjbTzVj8bOX5fA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=b1W05uaabrqbz8WVCEegk+TmUYVnElv2FkZucrDcAx2/fBx6Ulpk/10NTFC25g8mqDMYws6Fbi4S84LKNaQqHMc09oAWYV7nysOFWq0mcSgitIB4UE9KuDV5Po6B/kp/+Q/cuz7Bs0L6MDbimPXBpT6KsK4VVMxQjEJdQHEcpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I66qyFLM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF5CC4CEDE;
	Tue, 17 Dec 2024 10:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734432462;
	bh=m9YLopjD2BjlIvWN9XhjNV/ZSRqTAGjbTzVj8bOX5fA=;
	h=Date:From:To:cc:Subject:From;
	b=I66qyFLMpHLoH6+P+oWFNwvEEzG3PTyLqPHXwWg66UtBKv9lFmXsWkzWSgMu5/UWs
	 Ejra20fWTbzBUTlHIuwuG4edP84/1N2FwXWFCozFHKrqPuVJbZ4kQLbPgAXsx4LFQA
	 IU61jLX5KrU/gEkM+XUgVgzlij9JhXVEMoYjSlni+QtYCGn7w2AP99Zv11d4iPR/FE
	 ASPocpsMlC+sr0ccA/yINvxnquNew9iI6oB8Hd8fzd9tThvs81uxjoEwX5b35uVQ2/
	 jVFcu8+/eja88wzoPO2mGn5vsXnxSq0FR521LjDfb/EQx1gx6QLcwzK5XRBBzUzfks
	 X4f6wQNjva0NQ==
Date: Tue, 17 Dec 2024 11:47:39 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH] [RFC] Input: remove evbug driver
Message-ID: <8n377s5p-3r9n-ro38-3r2o-p536745552qo@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

From: Jiri Kosina <jkosina@suse.com>

I've never heard of anyone having used this driver for debugging at least 
in over past decade or so. Since we have tools like evtest, this driver 
seems to be rather superficial.

Also, it apparently causes confusion among people who accidentaly enable 
CONFIG_INPUT_EVBUG and are annoyed/confused by their kernel log being 
spammed by a lot of useless data.

Let's just remove it.

Signed-off-by: Jiri Kosina <jkosina@suse.com>
---
 drivers/input/Kconfig  |  14 ------
 drivers/input/Makefile |   1 -
 drivers/input/evbug.c  | 100 -----------------------------------------
 3 files changed, 115 deletions(-)
 delete mode 100644 drivers/input/evbug.c

diff --git a/drivers/input/Kconfig b/drivers/input/Kconfig
index 3bdbd34314b3..88ecdf5218ee 100644
--- a/drivers/input/Kconfig
+++ b/drivers/input/Kconfig
@@ -152,20 +152,6 @@ config INPUT_EVDEV
 	  To compile this driver as a module, choose M here: the
 	  module will be called evdev.
 
-config INPUT_EVBUG
-	tristate "Event debugging"
-	help
-	  Say Y here if you have a problem with the input subsystem and
-	  want all events (keypresses, mouse movements), to be output to
-	  the system log. While this is useful for debugging, it's also
-	  a security threat - your keypresses include your passwords, of
-	  course.
-
-	  If unsure, say N.
-
-	  To compile this driver as a module, choose M here: the
-	  module will be called evbug.
-
 config INPUT_KUNIT_TEST
 	tristate "KUnit tests for Input" if !KUNIT_ALL_TESTS
 	depends on INPUT && KUNIT
diff --git a/drivers/input/Makefile b/drivers/input/Makefile
index c78753274921..930b64d2115e 100644
--- a/drivers/input/Makefile
+++ b/drivers/input/Makefile
@@ -18,7 +18,6 @@ obj-$(CONFIG_INPUT_LEDS)	+= input-leds.o
 obj-$(CONFIG_INPUT_MOUSEDEV)	+= mousedev.o
 obj-$(CONFIG_INPUT_JOYDEV)	+= joydev.o
 obj-$(CONFIG_INPUT_EVDEV)	+= evdev.o
-obj-$(CONFIG_INPUT_EVBUG)	+= evbug.o
 
 obj-$(CONFIG_INPUT_KEYBOARD)	+= keyboard/
 obj-$(CONFIG_INPUT_MOUSE)	+= mouse/
diff --git a/drivers/input/evbug.c b/drivers/input/evbug.c
deleted file mode 100644
index e47bdf92088a..000000000000
--- a/drivers/input/evbug.c
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (c) 1999-2001 Vojtech Pavlik
- */
-
-/*
- *  Input driver event debug module - dumps all events into syslog
- */
-
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/input.h>
-#include <linux/init.h>
-#include <linux/device.h>
-
-MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>");
-MODULE_DESCRIPTION("Input driver event debug module");
-MODULE_LICENSE("GPL");
-
-static void evbug_event(struct input_handle *handle, unsigned int type, unsigned int code, int value)
-{
-	printk(KERN_DEBUG pr_fmt("Event. Dev: %s, Type: %d, Code: %d, Value: %d\n"),
-	       dev_name(&handle->dev->dev), type, code, value);
-}
-
-static int evbug_connect(struct input_handler *handler, struct input_dev *dev,
-			 const struct input_device_id *id)
-{
-	struct input_handle *handle;
-	int error;
-
-	handle = kzalloc(sizeof(struct input_handle), GFP_KERNEL);
-	if (!handle)
-		return -ENOMEM;
-
-	handle->dev = dev;
-	handle->handler = handler;
-	handle->name = "evbug";
-
-	error = input_register_handle(handle);
-	if (error)
-		goto err_free_handle;
-
-	error = input_open_device(handle);
-	if (error)
-		goto err_unregister_handle;
-
-	printk(KERN_DEBUG pr_fmt("Connected device: %s (%s at %s)\n"),
-	       dev_name(&dev->dev),
-	       dev->name ?: "unknown",
-	       dev->phys ?: "unknown");
-
-	return 0;
-
- err_unregister_handle:
-	input_unregister_handle(handle);
- err_free_handle:
-	kfree(handle);
-	return error;
-}
-
-static void evbug_disconnect(struct input_handle *handle)
-{
-	printk(KERN_DEBUG pr_fmt("Disconnected device: %s\n"),
-	       dev_name(&handle->dev->dev));
-
-	input_close_device(handle);
-	input_unregister_handle(handle);
-	kfree(handle);
-}
-
-static const struct input_device_id evbug_ids[] = {
-	{ .driver_info = 1 },	/* Matches all devices */
-	{ },			/* Terminating zero entry */
-};
-
-MODULE_DEVICE_TABLE(input, evbug_ids);
-
-static struct input_handler evbug_handler = {
-	.event =	evbug_event,
-	.connect =	evbug_connect,
-	.disconnect =	evbug_disconnect,
-	.name =		"evbug",
-	.id_table =	evbug_ids,
-};
-
-static int __init evbug_init(void)
-{
-	return input_register_handler(&evbug_handler);
-}
-
-static void __exit evbug_exit(void)
-{
-	input_unregister_handler(&evbug_handler);
-}
-
-module_init(evbug_init);
-module_exit(evbug_exit);
-- 
2.43.0

