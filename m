Return-Path: <linux-input+bounces-14334-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CAEB37B8C
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 09:23:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E99311BA06FB
	for <lists+linux-input@lfdr.de>; Wed, 27 Aug 2025 07:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E68B3176E3;
	Wed, 27 Aug 2025 07:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="dRsTG4yF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA08C30E855;
	Wed, 27 Aug 2025 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279362; cv=none; b=Bvgw6MHaj+UtbLt9kr6oNL3F3bG5eWkAawdgu4T9CmShzaaOmODaVac55bPvCl/LywooNDCtN0bdogWOj4fRjM4HYvZMma3nfjXuX75vzurTOItuIJlF6TE34or2dUisv1RQVwCeHPp64GBzzbaQtmLH36FIHflvIXqeuYG+egM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279362; c=relaxed/simple;
	bh=gsy7rb1BgKYdeDapDWQkjOohA+PxtRBUKwiWWg2QuBU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lpq4wFu2C3oSKkV4/csGPQmOfRpPY6UBSMcgy0EN+Ox/fmJq62AvgJVOUS0bpN0r2INTm3STcP6biBZ+7Am+fbeOAD+qllm48hn1AtyVB98d1rDPd29+Z28vTGnUBv/2RM/1OaEJUdcaTsGpLq/6SAyoDwrWNdZY4ljxeNGVjOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=dRsTG4yF; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1756279334;
	bh=QAwqXG/5l76WlXrmOZBnLIZQlYgzRIqunxEVeeSVobQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=dRsTG4yF/EODhYDFKHiNmKoPC02RLvCL9tPCcl7SszT2WL3M/vb3+2dv/8+ignuHC
	 QlTzVWaDWBzBlPD1HBF4ZHDBYi2Hj5AsuIpZe2DPL1TbZFEDTI/MHebPOaSgxnrVQH
	 Y3M2kC2l8KKoLpygOdbdADaZ2Iqcex+Fiu6auR50=
X-QQ-mid: zesmtpip2t1756279290td5a6f010
X-QQ-Originating-IP: mNS8fz18BL2l2TqhlbLWGRlCu6pT2jsU0rehnizBifY=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 Aug 2025 15:21:29 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 7149901826594537822
EX-QQ-RecipientCnt: 7
From: Morduan Zang <zhangdandan@uniontech.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	liziyao@uniontech.com,
	WangYuli <wangyuli@uniontech.com>,
	Winston Wen <wentao@uniontech.com>,
	Morduan Zang <zhangdandan@uniontech.com>
Subject: [PATCH 1/2 v2] input: Add tracepoint support
Date: Wed, 27 Aug 2025 15:21:22 +0800
Message-ID: <9D74755ABE8BD88F+20250827072125.139887-1-zhangdandan@uniontech.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MvzKwybZ9Zl0D7Csg8+cHvugEsV5Q9Hkwj1N1ey7vLm0zAmyMYTslWyX
	pOZMSAaJ3PBKu6HkMX0mluEN0iMFvusYK/0tx8kbwxESZjfQZefx9rJkQqG0ipm/X9O/Nfk
	4hO4izFOf3QhvAjNksvHxWGE0Pfy+5zka2k83lzPUNdry7g4APJemdDbFDiOF+ksGAUjyRl
	nbof46/j/B9M23tVgEnojs/0BOq66t95n9gnh/beoixff1Dh93jAcCrYTG9QgItzdtMkfIg
	vEBmx9zSLmpaXP7q5PDU1jMfkQwct0hNznJfvolILLMPZTUyVIs5dP6ZB6JgchhHuqnHzNr
	0srkfvCbzZbRXkHes2NTG34W4DBr0HVnkA2wQJpLzyXNvlBkJ2UCnarZL21gV5MaeiiOSAc
	OraPiOZW6mkAFNQqnAOu1rbj6TbO/Pl/dkOer1cPXht5aqFtMIxjjW4y9b5th1r/LerDALM
	x7otF0d/VpdC23FLaf8ZFjc13Qi9dP+3jlpA3o5md7FZvN8+pDfmVRHPALjh9wcYHClaAV4
	mYlg1jvvciKXSBns/64Je3sos7Lq8PrQgXV/0SreE6t6GbGXA2ARuZxaYo1W5jkLnsNECWg
	0CGgrt3Fde+VlVfDTrP7pgoFEFvmur/HM1FkHVk+IZVQSwp5djlf3MasLyALSqetKro0fmq
	WLlv6A+LNNp7f2QrzqE6XZqFZE5w/181COGwIukk2iWiTYtc1ye4v2YX5fNoKhm9gtiqm6e
	vY5jAwrJpeICewps8Q2uLk9LxdMfBRlsYCZHDEOWOiVmhHVvb8JiwxuUKrvz3P8HVHWcJDO
	w9q8wMrYnwDj8yHDYA0YfbrM6PdJ1rxA+LoqfySqqd6Bijx8kXLOpUzsL3CddjRBIZEWpIf
	9/L/e1uTBZdpGVMtvJ/ztUHsPv8HJbPsC5zJ6FZnNwYiezESyk1vEF6uwkvF5t/EVvyHdmJ
	Dc6PrkJW4kBpDv9qkG/wfetL2AvbRpU5q+amNKGubwJ34PMUZ1sSK22e3SGCo1MU1XKp0px
	4owx1pPNA7/eIM1R0l8y8fIq3yr/wibbjqpKb1Cr/1RceqK8gAw09heYXx1qmWiRwQk8Mj4
	0Tibptz3s5Ohstss05i6wrLTDzzffXyuV4q2pVgTMjw1k3SbRiHS1pi6XSoSPfFZQ==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

From: WangYuli <wangyuli@uniontech.com>

Introduce a set of tracepoints for the input subsystem to enable
better debugging, monitoring, and performance analysis of input
device operations.

This tracing event while be default to close.
When you open events of tracing, the input trcaing event with be
opened by "echo 1 > /sys/kernel/tracing/events/enabled", However,
the tracking status of each sub-event is independent of each other.

Suggested-by: Winston Wen <wentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
---
 MAINTAINERS                  |   1 +
 drivers/input/input.c        |  18 ++-
 include/trace/events/input.h | 263 +++++++++++++++++++++++++++++++++++
 3 files changed, 281 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/input.h

diff --git a/MAINTAINERS b/MAINTAINERS
index daf520a13bdf..4dfa2d60faa0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12092,6 +12092,7 @@ F:	include/linux/i8042.h
 F:	include/linux/input.h
 F:	include/linux/input/
 F:	include/linux/libps2.h
+F:	include/trace/events/input.h
 F:	include/linux/serio.h
 F:	include/uapi/linux/gameport.h
 F:	include/uapi/linux/input-event-codes.h
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 1da41324362b..1c5c7056f040 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -29,6 +29,9 @@
 #include "input-core-private.h"
 #include "input-poller.h"
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/input.h>
+
 MODULE_AUTHOR("Vojtech Pavlik <vojtech@suse.cz>");
 MODULE_DESCRIPTION("Input core");
 MODULE_LICENSE("GPL");
@@ -363,6 +366,7 @@ void input_handle_event(struct input_dev *dev,
 
 	disposition = input_get_disposition(dev, type, code, &value);
 	if (disposition != INPUT_IGNORE_EVENT) {
+		trace_input_event(dev, type, code, value);
 		if (type != EV_SYN)
 			add_input_randomness(type, code, value);
 
@@ -525,6 +529,7 @@ int input_grab_device(struct input_handle *handle)
 			return -EBUSY;
 
 		rcu_assign_pointer(dev->grab, handle);
+		trace_input_grab_device(dev, handle);
 	}
 
 	return 0;
@@ -539,6 +544,7 @@ static void __input_release_device(struct input_handle *handle)
 	grabber = rcu_dereference_protected(dev->grab,
 					    lockdep_is_held(&dev->mutex));
 	if (grabber == handle) {
+		trace_input_release_device(dev, handle);
 		rcu_assign_pointer(dev->grab, NULL);
 		/* Make sure input_pass_values() notices that grab is gone */
 		synchronize_rcu();
@@ -612,6 +618,7 @@ int input_open_device(struct input_handle *handle)
 
 		if (dev->poller)
 			input_dev_poller_start(dev->poller);
+		trace_input_open_device(dev);
 	}
 
 	return 0;
@@ -652,6 +659,7 @@ void input_close_device(struct input_handle *handle)
 				input_dev_poller_stop(dev->poller);
 			if (dev->close)
 				dev->close(dev);
+			trace_input_close_device(dev);
 		}
 	}
 
@@ -991,9 +999,13 @@ static int input_attach_handler(struct input_dev *dev, struct input_handler *han
 		return -ENODEV;
 
 	error = handler->connect(handler, dev, id);
-	if (error && error != -ENODEV)
+	if (error && error != -ENODEV) {
 		pr_err("failed to attach handler %s to device %s, error: %d\n",
 		       handler->name, kobject_name(&dev->dev.kobj), error);
+	} else if (!error) {
+		/* Connection successful, trace it */
+		trace_input_handler_connect(handler, dev, handler->minor);
+	}
 
 	return error;
 }
@@ -1791,6 +1803,7 @@ static int input_inhibit_device(struct input_dev *dev)
 	}
 
 	dev->inhibited = true;
+	trace_input_inhibit_device(dev);
 
 	return 0;
 }
@@ -1818,6 +1831,7 @@ static int input_uninhibit_device(struct input_dev *dev)
 
 	scoped_guard(spinlock_irq, &dev->event_lock)
 		input_dev_toggle(dev, true);
+	trace_input_uninhibit_device(dev);
 
 	return 0;
 }
@@ -2216,6 +2230,7 @@ static void __input_unregister_device(struct input_dev *dev)
 {
 	struct input_handle *handle, *next;
 
+	trace_input_device_unregister(dev);
 	input_disconnect_device(dev);
 
 	scoped_guard(mutex, &input_mutex) {
@@ -2414,6 +2429,7 @@ int input_register_device(struct input_dev *dev)
 		input_wakeup_procfs_readers();
 	}
 
+	trace_input_device_register(dev);
 	if (dev->devres_managed) {
 		dev_dbg(dev->dev.parent, "%s: registering %s with devres.\n",
 			__func__, dev_name(&dev->dev));
diff --git a/include/trace/events/input.h b/include/trace/events/input.h
new file mode 100644
index 000000000000..e01c8b5c61f7
--- /dev/null
+++ b/include/trace/events/input.h
@@ -0,0 +1,263 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* input tracepoints
+ *
+ * Copyright (C) 2025 WangYuli <wangyuli@uniontech.com>
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM input
+
+#if !defined(_TRACE_INPUT_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_INPUT_H
+
+#include <linux/tracepoint.h>
+#include <linux/input.h>
+
+/**
+ * input_event - called when an input event is processed
+ * @dev: input device that generated the event
+ * @type: event type (EV_KEY, EV_REL, EV_ABS, etc.)
+ * @code: event code within the type
+ * @value: event value
+ *
+ * This tracepoint fires for every input event processed by the input core.
+ * It can be used to monitor input device activity and debug input issues.
+ */
+TRACE_EVENT(
+	input_event,
+
+	TP_PROTO(struct input_dev *dev, unsigned int type, unsigned int code,
+		 int value),
+
+	TP_ARGS(dev, type, code, value),
+
+	TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
+		__field(unsigned int, type)
+		__field(unsigned int, code)
+		__field(int, value)
+		__field(u16, bustype)
+		__field(u16, vendor)
+		__field(u16, product)),
+
+	TP_fast_assign(__assign_str(name); __entry->type = type;
+		__entry->code = code; __entry->value = value;
+		__entry->bustype = dev->id.bustype;
+		__entry->vendor = dev->id.vendor;
+		__entry->product = dev->id.product;),
+
+	TP_printk(
+		"dev=%s type=%u code=%u value=%d bus=%04x vendor=%04x product=%04x",
+		__get_str(name), __entry->type, __entry->code, __entry->value,
+		__entry->bustype, __entry->vendor, __entry->product));
+
+/**
+ * input_device_register - called when an input device is registered
+ * @dev: input device being registered
+ *
+ * This tracepoint fires when a new input device is registered with the
+ * input subsystem. Useful for monitoring device hotplug events.
+ */
+TRACE_EVENT(
+	input_device_register,
+
+	TP_PROTO(struct input_dev *dev),
+
+	TP_ARGS(dev),
+
+	TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
+		__string(phys, dev->phys ?: "")
+		__field(u16, bustype)
+		__field(u16, vendor)
+		__field(u16, product)
+		__field(u16, version)),
+
+	TP_fast_assign(__assign_str(name); __assign_str(phys);
+		__entry->bustype = dev->id.bustype;
+		__entry->vendor = dev->id.vendor;
+		__entry->product = dev->id.product;
+		__entry->version = dev->id.version;),
+
+	TP_printk(
+		"dev=%s phys=%s bus=%04x vendor=%04x product=%04x version=%04x",
+		__get_str(name), __get_str(phys), __entry->bustype,
+		__entry->vendor, __entry->product, __entry->version));
+
+/**
+ * input_device_unregister - called when an input device is unregistered
+ * @dev: input device being unregistered
+ *
+ * This tracepoint fires when an input device is unregistered from the
+ * input subsystem. Useful for monitoring device hotplug events.
+ */
+TRACE_EVENT(input_device_unregister,
+
+	    TP_PROTO(struct input_dev *dev),
+
+	    TP_ARGS(dev),
+
+	    TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
+		    __string(phys, dev->phys ?: "")
+		    __field(u16, bustype)
+		    __field(u16, vendor)
+		    __field(u16, product)),
+
+	    TP_fast_assign(__assign_str(name);
+		    __assign_str(phys);
+		    __entry->bustype = dev->id.bustype;
+		    __entry->vendor = dev->id.vendor;
+		    __entry->product = dev->id.product;),
+
+	    TP_printk("dev=%s phys=%s bus=%04x vendor=%04x product=%04",
+		    __get_str(name), __get_str(phys), __entry->bustype,
+		    __entry->vendor, __entry->product));
+
+/**
+ * input_handler_connect - called when an input handler connects to a device
+ * @handler: input handler
+ * @dev: input device
+ * @minor: assigned minor number (if applicable)
+ *
+ * This tracepoint fires when an input handler (like evdev, mousedev) connects
+ * to an input device, creating a new input handle.
+ */
+TRACE_EVENT(input_handler_connect,
+
+	    TP_PROTO(struct input_handler *handler, struct input_dev *dev,
+		     int minor),
+
+	    TP_ARGS(handler, dev, minor),
+
+	    TP_STRUCT__entry(__string(handler_name, handler->name)
+		    __string(dev_name, dev->name ?: "unknown")
+		    __field(int, minor)),
+
+	    TP_fast_assign(__assign_str(handler_name);
+		    __assign_str(dev_name);
+		    __entry->minor = minor;),
+
+	    TP_printk("handler=%s dev=%s minor=%d",
+		    __get_str(handler_name),
+		    __get_str(dev_name),
+		    __entry->minor));
+
+/**
+ * input_grab_device - called when a device is grabbed by a handler
+ * @dev: input device being grabbed
+ * @handle: input handle doing the grab
+ *
+ * This tracepoint fires when an input device is grabbed exclusively
+ * by an input handler, typically for security or special processing.
+ */
+TRACE_EVENT(input_grab_device,
+
+	    TP_PROTO(struct input_dev *dev, struct input_handle *handle),
+
+	    TP_ARGS(dev, handle),
+
+	    TP_STRUCT__entry(__string(dev_name, dev->name ?: "unknown")
+		    __string(handler_name, handle->handler->name)),
+
+	    TP_fast_assign(__assign_str(dev_name);
+		    __assign_str(handler_name);),
+
+	    TP_printk("dev=%s grabbed_by=%s",
+		    __get_str(dev_name),
+		    __get_str(handler_name)));
+
+/**
+ * input_release_device - called when a grabbed device is released
+ * @dev: input device being released
+ * @handle: input handle releasing the grab
+ *
+ * This tracepoint fires when an input device grab is released.
+ */
+TRACE_EVENT(input_release_device,
+
+	    TP_PROTO(struct input_dev *dev, struct input_handle *handle),
+
+	    TP_ARGS(dev, handle),
+
+	    TP_STRUCT__entry(__string(dev_name, dev->name ?: "unknown")
+		    __string(handler_name, handle->handler->name)),
+
+	    TP_fast_assign(__assign_str(dev_name);
+		    __assign_str(handler_name);),
+
+	    TP_printk("dev=%s released_by=%s",
+		    __get_str(dev_name),
+		    __get_str(handler_name)));
+
+DECLARE_EVENT_CLASS(input_device_state,
+		
+		TP_PROTO(struct input_dev *dev),
+		
+		TP_ARGS(dev),
+		
+		TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
+			__field(unsigned int, users)
+			__field(bool, inhibited)),
+		
+		TP_fast_assign(__assign_str(name);
+			__entry->users = dev->users;
+			__entry->inhibited = dev->inhibited;),
+		
+		TP_printk("dev=%s users=%u inhibited=%s",
+			__get_str(name),
+			__entry->users,
+			__entry->inhibited ? "true" : "false"));
+
+/**
+ * input_open_device - called when an input device is opened
+ * @dev: input device being opened
+ *
+ * This tracepoint fires when the user count for an input device increases,
+ * typically when a userspace application opens the device.
+ */
+DEFINE_EVENT(input_device_state, input_open_device,
+
+	     TP_PROTO(struct input_dev *dev),
+
+	     TP_ARGS(dev));
+
+/**
+ * input_close_device - called when an input device is closed
+ * @dev: input device being closed
+ *
+ * This tracepoint fires when the user count for an input device decreases,
+ * typically when a userspace application closes the device.
+ */
+DEFINE_EVENT(input_device_state, input_close_device,
+
+	     TP_PROTO(struct input_dev *dev),
+
+	     TP_ARGS(dev));
+
+/**
+ * input_inhibit_device - called when an input device is inhibited
+ * @dev: input device being inhibited
+ *
+ * This tracepoint fires when an input device is inhibited (disabled),
+ * usually for power management or security reasons.
+ */
+DEFINE_EVENT(input_device_state, input_inhibit_device,
+
+	     TP_PROTO(struct input_dev *dev),
+
+	     TP_ARGS(dev));
+
+/**
+ * input_uninhibit_device - called when an input device is uninhibited
+ * @dev: input device being uninhibited
+ *
+ * This tracepoint fires when an input device is uninhibited (re-enabled)
+ * after being previously inhibited.
+ */
+DEFINE_EVENT(input_device_state, input_uninhibit_device,
+
+	     TP_PROTO(struct input_dev *dev),
+
+	     TP_ARGS(dev));
+
+#endif /* _TRACE_INPUT_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
-- 
2.50.1


