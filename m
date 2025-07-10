Return-Path: <linux-input+bounces-13452-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A421AFFAF5
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 501837B4840
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 07:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B816926F476;
	Thu, 10 Jul 2025 07:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="nVdYi1gd"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89AB289833;
	Thu, 10 Jul 2025 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752132820; cv=none; b=Vf8R25vggqkKmPQJh6rAgw01K3trmh4GPJp7b04mBV93drcPRjz8iwIH0Za+pyPaDDBjW6ww3za3+36Y9qDPe8UCt4SBowL203xsgZE2ggC6Q0DU1w3BxEHqAUlRb7hr8GUSjJbmJLkepqEw4jmCHTQ5CQqOnQ1MTihmgh5PyGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752132820; c=relaxed/simple;
	bh=Q/Jf3+XVh+iUCR0VCgJfYWeHyXKbJ5iuYDqX1WNlqo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nN79JdZDsjx9uYbDHQeaqAC1VpqDluF8Jik5RjPu2W8ITX9YEqhARp2HZvBuHhGJYeZdD8cQRoPMDCl/65xqA4ANzstX2LsR234ZUj7YfSN2ztctEJWrvMpXcXFIV/ZziJA4YOOagLlu96WtM/nKGp/6WxoMcsahTHmEdWfUke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=nVdYi1gd; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752132780;
	bh=eZIfjwyXRyZV9+QTOxx3kw1AO9i/MtOVaN7ILkdVRn8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nVdYi1gdWXAmH/5KX2I7pO69faMGJasGBapByyzIv+QQSfu+/B+oFBtn124X1miU8
	 v85Lg6iM5df4nycepEz/9hCJeG50Jfh/lKSTrvgvH4PCiJ6eCnFGZCEnkT//eWkcRK
	 eX0UWYllkvVJh9PhQCz4HolpTCqUGl8iSDaSP2hc=
X-QQ-mid: zesmtpip2t1752132717ta1e33716
X-QQ-Originating-IP: 1m3E08q8ehv1ztCLul4rhiU7h9IeBrnWTDg9XyfvCU8=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Jul 2025 15:31:55 +0800 (CST)
X-QQ-SSF: 0002000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8695579808043688623
EX-QQ-RecipientCnt: 13
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: dmitry.torokhov@gmail.com,
	guanwentao@uniontech.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	niecheng1@uniontech.com,
	rostedt@goodmis.org,
	wangyuli@deepin.org,
	zhanjun@uniontech.com,
	Winston Wen <wentao@uniontech.com>
Subject: [PATCH 1/2] input: Add tracepoint support
Date: Thu, 10 Jul 2025 15:31:38 +0800
Message-ID: <C1C54D7FA3DF3958+20250710073148.3994900-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
References: <19571F312EE197A5+20250710072634.3992019-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OKM/rTToQv8JH7MCJl0TB6FWM0fnxhNmAyCKUzMUAVOE/q4Zo9vOwB5h
	McAchouJ0pwMRm0ggBe2ZuPUba1tkrE+2/5vwoA9Lk7N6SAwHr0ww1TksDcsnZL8cuZTVrC
	rTCdiDNRVMwhCAD+SKofG+Qappl6GHRcF0kRX6QN3HII5xTAwoTxHXoi91UeNK6JpyFweln
	q4Y2sc2qPP43Fw+aLF2u43/ihVnc8VVj0xzJM/TLWceJi5jWogQvPq1YDSb9ce6Yv910vDE
	sgY3QZtXlvSfkKxlwZ02xVqbpnzBpErN6W7SK8abqiWt73LsFz+e3F1JbQ7fH5z2qhPpgBB
	M8nI6BuJqqxY8ka/kWsfoP1Dqgn5A6u3P480qR5rwYdj3A4eLaZWf8jDSWQoIyLi3Jh0I2p
	JYgbi2nZWXf/anuilnrOqZ3g4XM6jqFDUd3D7BNOBbcF+mGhnVqD6pQ3SEgN7OGiWlr31pd
	jEqTGdnx7V0ww2VTBpTEsQyjIfpgLHENQJtaLJ1JElWBm3llDIfXs2/ssD1sK90DU6cVzhA
	VOvN1xZBqhx0XvbfwRYQ6ySAWcJhhekbXHfySt0I3eyMXsWPsZHNxuXvyZPSI/wz3DvMWit
	lzpvlMIDBc8mUH08YJsc4BuLwr/aSFRHxWZAy9Xpapg4ObtW8mOlT7YiiqwAKfot2kOOG1z
	x7b019pbCzZ9XD5TyP02ETOfmZz/m/fy5B+Hi8uyzFpPWz0QuEtLfo1RTzgD8CBJ6pImbup
	5f13cf5BYoyQvKBEoNAqeVMbukKG+c1A3Cma03L2ilkFRuN5T/u4MO1JGi28JUbTj4q2Hbf
	cO+eq7aFBjTqM4gp218Q+FfITfKXuEw7NP2l7j1mp8KC7sFAYRb6whC2pymliFBpVhHoZP9
	8g69Yyw6VH78ifVI484FBGAeVcbC+zQLA5DrrBhAN283ZvuUif3BkS4s1AkelmJzaJuN7I/
	q5G2TVy1ldG7slDF/LdJpy0otJB5JwZLCD4maHSBP6rOTsJkCaBDK4hqgCLCf53Yl+465jE
	wuk200w+nP7YIJBw2hghExaeUo9o+RP2SJNa7nmRV+2z6PsICnOVVLT717TXa23uYUqeYDD
	MMa2Ow4mwjftezpyE8fgDPlsPtenezityVLJcC8tucPZCCNQJ118lvGtagd7y9+2A==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

Introduce a set of tracepoints for the input subsystem to enable
better debugging, monitoring, and performance analysis of input
device operations.

Suggested-by: Winston Wen <wentao@uniontech.com>
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 MAINTAINERS                  |   1 +
 drivers/input/input.c        |  18 ++-
 include/trace/events/input.h | 251 +++++++++++++++++++++++++++++++++++
 3 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 include/trace/events/input.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 00d7dcee88cb..c1b03679a5a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11933,6 +11933,7 @@ F:	include/linux/i8042.h
 F:	include/linux/input.h
 F:	include/linux/input/
 F:	include/linux/libps2.h
+F:	include/trace/events/input.h
 F:	include/linux/serio.h
 F:	include/uapi/linux/gameport.h
 F:	include/uapi/linux/input-event-codes.h
diff --git a/drivers/input/input.c b/drivers/input/input.c
index 44887e51e049..925c76a50742 100644
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
index 000000000000..3c5ffcfb7c8d
--- /dev/null
+++ b/include/trace/events/input.h
@@ -0,0 +1,251 @@
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
+	TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __field(
+		unsigned int, type) __field(unsigned int, code)
+				 __field(int, value) __field(u16, bustype)
+					 __field(u16, vendor)
+						 __field(u16, product)),
+
+	TP_fast_assign(__assign_str(name); __entry->type = type;
+		       __entry->code = code; __entry->value = value;
+		       __entry->bustype = dev->id.bustype;
+		       __entry->vendor = dev->id.vendor;
+		       __entry->product = dev->id.product;),
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
+	TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __string(
+		phys, dev->phys ?: "") __field(u16, bustype)
+				 __field(u16, vendor) __field(u16, product)
+					 __field(u16, version)),
+
+	TP_fast_assign(__assign_str(name); __assign_str(phys);
+		       __entry->bustype = dev->id.bustype;
+		       __entry->vendor = dev->id.vendor;
+		       __entry->product = dev->id.product;
+		       __entry->version = dev->id.version;),
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
+	    TP_STRUCT__entry(__string(name, dev->name ?: "unknown") __string(
+		    phys, dev->phys ?: "") __field(u16, bustype)
+				     __field(u16, vendor)
+					     __field(u16, product)),
+
+	    TP_fast_assign(__assign_str(name); __assign_str(phys);
+			   __entry->bustype = dev->id.bustype;
+			   __entry->vendor = dev->id.vendor;
+			   __entry->product = dev->id.product;),
+
+	    TP_printk("dev=%s phys=%s bus=%04x vendor=%04x product=%04x",
+		      __get_str(name), __get_str(phys), __entry->bustype,
+		      __entry->vendor, __entry->product));
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
+				     __string(dev_name, dev->name ?: "unknown")
+					     __field(int, minor)),
+
+	    TP_fast_assign(__assign_str(handler_name); __assign_str(dev_name);
+			   __entry->minor = minor;),
+
+	    TP_printk("handler=%s dev=%s minor=%d", __get_str(handler_name),
+		      __get_str(dev_name), __entry->minor));
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
+				     __string(handler_name,
+					      handle->handler->name)),
+
+	    TP_fast_assign(__assign_str(dev_name); __assign_str(handler_name);),
+
+	    TP_printk("dev=%s grabbed_by=%s", __get_str(dev_name),
+		      __get_str(handler_name)));
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
+				     __string(handler_name,
+					      handle->handler->name)),
+
+	    TP_fast_assign(__assign_str(dev_name); __assign_str(handler_name);),
+
+	    TP_printk("dev=%s released_by=%s", __get_str(dev_name),
+		      __get_str(handler_name)));
+
+DECLARE_EVENT_CLASS(input_device_state,
+
+		    TP_PROTO(struct input_dev *dev),
+
+		    TP_ARGS(dev),
+
+		    TP_STRUCT__entry(__string(name, dev->name ?: "unknown")
+					     __field(unsigned int, users)
+						     __field(bool, inhibited)),
+
+		    TP_fast_assign(__assign_str(name);
+				   __entry->users = dev->users;
+				   __entry->inhibited = dev->inhibited;),
+
+		    TP_printk("dev=%s users=%u inhibited=%s", __get_str(name),
+			      __entry->users,
+			      __entry->inhibited ? "true" : "false"));
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
2.50.0


