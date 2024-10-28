Return-Path: <linux-input+bounces-7721-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062BB9B2437
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 06:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 587C8B2178A
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 05:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4211318E748;
	Mon, 28 Oct 2024 05:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXNaEBYw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9638818CC05;
	Mon, 28 Oct 2024 05:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730093443; cv=none; b=rxAAjZZ3RIzueNIOTo2uGVCKiasppxrLwduWBVgJkmMXNsZYwSjnpRrUCVgr46D257SaBlfL5Md3vIN7mDJCzHQbymyuYV771y5pSqGzJYnF2ejrX6Kg5YnKi4jnnJ7nluoIPvooHTx1E0UGU998LpyiZfbmzF6vzTTPD1rosxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730093443; c=relaxed/simple;
	bh=KMuC/PM7GZ5U7HQpS8WEbL/aHcDUCQW7cGwcES+XeiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qX3MLPN8lW34a20cpextSZC9LhNXIDxmCCNSa7B+8aXyEino1t1UighlRoDqNwoZ1ayd/QpQ4QbSc2W36Afkub2/DF+wA8O5k6jInVfoXnd1nF+XVp37e8JFcQYwmbP/heiTrh8ZQRkgS8PkL02SYHrytr0FYGgIj6wAMlW6TIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXNaEBYw; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20ce65c8e13so32985945ad.1;
        Sun, 27 Oct 2024 22:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093440; x=1730698240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nB0i+YKzuQxeeV9gVTy/O89BBtG/8v8kIWRpdQ/XRsY=;
        b=gXNaEBYwVRZTJe9QZfRseZbVp7iaT3WfLzzZm+KQJwibW7Vn0QssyUdmtcllo9KyDF
         h7ANbDe0wVDajWVnszhzh1utGyB7CyT/DEgDPD17qpRA7ofUXFRYMG3U8ubbO04Mpujl
         djYFJyo9k/hQunJKe1v+DqqCGQ74vw/wm7Djhtk6rMUS2+vMdqxwpKz4tF9nxGxRStWB
         zz4z7juaIYcnzMlW1Tl4zWrRn5Z6+EQrY2Y/kyehpnJRuXJmrr6eyHHrPjbEy8kDYxSv
         uNCdxLn3CbI4xnDSlreHdM/s7rHlH1a5zvzZnDjpyimHjCfrmNXvK+8ZcOB1X1KzAoaY
         aSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093440; x=1730698240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB0i+YKzuQxeeV9gVTy/O89BBtG/8v8kIWRpdQ/XRsY=;
        b=AJsnpawClsXIiejBc09hzsu/LVe0weYDdx0bintvF7I5GEf9F4s0crLVgO/EEl/pDL
         W3lXGCVJCurVF9LsRIDL1GLDZHp9onZ5c9KR4IhZ9C+co+Bf2YQIDa6sQTGFOKQpcFJy
         k+nkEWnXr9PxuBt3/AjmoUNgFoYWTnxfLRaOqrPam9oVF8KFsm+R3RppMjGnmMcV03Wj
         kRtcHo8jRmmYBxk+1XUnzJKURn4/1bkY5rSI1lvlrcdJ5pup+tNl4zPic4xr3XResXmO
         Je34IXjFEnoAE3DZ84j+AKav8XkhbOWeMZlqYRqN8NED9PkfHSP0IiV+fNyAx1Y/ZZly
         hXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0oL9mMCS6VBP4I4l9rq46SNaIw9QUF/MpLuFRX2ONooRb+Ep4iZwxh8IqVRvfObByQwq27/YXE6YXqqwJ@vger.kernel.org, AJvYcCVg6J76fk49rj9lw4EjSf6wI//YlZUqwiAOKkAKG/GRLDfH+qTBJLLbsTmZmM6GH7krEvz0oxkaQdBKWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIUy9HhIiGmnRLtBBa9thqzFpm4TUz9jMaZBbEGNQPPd0FWl2M
	+wPJJlTxD3BvMvWt0V4GZCpVr7AXEMGHhbsRCJh75xxtI6wdVw3a
X-Google-Smtp-Source: AGHT+IGBW3BFYByMPk10lCkVSBOmAUmXJI+7N948hP/vO4DBn4eojPrKLVYAPst2jxpjSGxhH6aWrQ==
X-Received: by 2002:a17:903:2302:b0:207:1675:6709 with SMTP id d9443c01a7336-210c6731076mr99531365ad.0.1730093439641;
        Sun, 27 Oct 2024 22:30:39 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e9cd:720b:a97f:8af8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02eb81sm43120815ad.207.2024.10.27.22.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:30:39 -0700 (PDT)
Date: Sun, 27 Oct 2024 22:30:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Ned T. Crigler" <crigler@gmail.com>
Cc: Peter Seiderer <ps.report@gmx.net>,
	Christian Heusel <christian@heusel.eu>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Jeff LaBundy <jeff@labundy.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [REGRESSION] disabling and re-enabling magic sysrq fails after
 kernel 6.11
Message-ID: <Zx8hfE2_3zXSTi05@google.com>
References: <Zx2iQp6csn42PJA7@xavtug>
 <69b6119c-3c3a-406f-9375-3e55fba9b732@heusel.eu>
 <20241027163744.2d396c61@gmx.net>
 <Zx5yIEZwT5SxzCTx@xavtug>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zx5yIEZwT5SxzCTx@xavtug>

Hi everyone,

On Sun, Oct 27, 2024 at 10:02:24AM -0700, Ned T. Crigler wrote:
> Hi Peter, Christian,
> 
> On Sun, Oct 27, 2024 at 04:37:44PM +0100, Peter Seiderer wrote:
> > Hello Ned, Christian, *,
> > 
> > On Sun, 27 Oct 2024 15:06:09 +0100, Christian Heusel <christian@heusel.eu> wrote:
> > 
> > > On 24/10/26 07:15PM, Ned T. Crigler wrote:
> > > > Hi,
> > >
> > > Hey Ned,
> > >
> > > > It looks like starting with kernel 6.11, disabling and re-enabling
> > > > magic
> > > > sysrq fails with these errors in dmesg:
> > > >
> > > > kernel: input: input_handler_check_methods: only one event processing
> > > > method can be defined (sysrq)
> > > > kernel: sysrq: Failed to register input handler, error -22
> > > >
> > > > after doing:
> > > >
> > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > # echo 438 > /proc/sys/kernel/sysrq
> > > > # echo 0 > /proc/sys/kernel/sysrq
> > > > # echo 438 > /proc/sys/kernel/sysrq
> > >
> > > I have found that this issue is also present in the latest mainline
> > > release and bisected it to the following commit:
> > >
> > >     d469647bafd9 ("Input: simplify event handling logic")
> > >
> > 
> > After the mentioned commit a call sysrq_register_handler() -->
> > input_register_handler(&sysrq_handler) with sysrq_handler.filter set
> > will result in sysrq_handler.events set to input_handler_events_filter,
> > see drivers/input/input.c (line 2607 to 2608):
> > 
> > 2596 int input_register_handler(struct input_handler *handler)
> > 2597 {
> > 2598         struct input_dev *dev;
> > 2599         int error;
> > 2600
> > 2601         error = input_handler_check_methods(handler);
> > 2602         if (error)
> > 2603                 return error;
> > 2604
> > 2605         INIT_LIST_HEAD(&handler->h_list);
> > 2606
> > 2607         if (handler->filter)
> > 2608                 handler->events = input_handler_events_filter;
> > 2609         else if (handler->event)
> > 2610                 handler->events = input_handler_events_default;
> > 2611         else if (!handler->events)
> > 2612                 handler->events = input_handler_events_null;
> > 
> > So the second call will fail at the check 'input_handler_check_methods(handler)'
> > which only allows one method to be set, see drivers/input/input.c:
> > 
> > 2517 static int input_handler_check_methods(const struct input_handler *handler)
> > 2518 {
> > 2519         int count = 0;
> > 2520
> > 2521         if (handler->filter)
> > 2522                 count++;
> > 2523         if (handler->events)
> > 2524                 count++;
> > 2525         if (handler->event)
> > 2526                 count++;
> > 2527
> > 2528         if (count > 1) {
> > 2529                 pr_err("%s: only one event processing method can be defined      (%s)\n",
> > 2530                        __func__, handler->name);
> > 2531                 return -EINVAL;
> > 2532         }
> > 2533
> > 2534         return 0;
> > 2535 }

Yes, I did not consider that we might want to re-register the same input
handler, thank you for alerting me about the regression.

> > 
> > 
> > A quick fix/hack for the sysrq case:
> > 
> > --- a/drivers/tty/sysrq.c
> > +++ b/drivers/tty/sysrq.c
> > @@ -1045,7 +1045,7 @@ static inline void sysrq_register_handler(void)
> >         int error;
> > 
> >         sysrq_of_get_keyreset_config();
> > -
> > +       sysrq_handler.events = NULL;
> >         error = input_register_handler(&sysrq_handler);
> >         if (error)
> >                 pr_err("Failed to register input handler, error %d", error);
> > lines 1-13/13 (END)
> > 
> > Regards,
> > Peter
> > 
> 
> Thanks for tracking this down. It seems messy that the mentioned commit
> changes input_register_handler to overwrite ->events for an internal purpose,
> and callers may expect it to be unchanged, as sysrq does here by reusing
> sysrq_handler.

Yes, indeed. I wonder if we can solve this by moving the derived event
handler method into input_handle structure, like the patch below. 

Thanks.

-- 
Dmitry


diff --git a/drivers/input/input.c b/drivers/input/input.c
index 3c321671793f..3d2cc13e1f32 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -119,12 +119,12 @@ static void input_pass_values(struct input_dev *dev,
 
 	handle = rcu_dereference(dev->grab);
 	if (handle) {
-		count = handle->handler->events(handle, vals, count);
+		count = handle->handle_events(handle, vals, count);
 	} else {
 		list_for_each_entry_rcu(handle, &dev->h_list, d_node)
 			if (handle->open) {
-				count = handle->handler->events(handle, vals,
-								count);
+				count = handle->handle_events(handle, vals,
+							      count);
 				if (!count)
 					break;
 			}
@@ -2537,57 +2537,6 @@ static int input_handler_check_methods(const struct input_handler *handler)
 	return 0;
 }
 
-/*
- * An implementation of input_handler's events() method that simply
- * invokes handler->event() method for each event one by one.
- */
-static unsigned int input_handler_events_default(struct input_handle *handle,
-						 struct input_value *vals,
-						 unsigned int count)
-{
-	struct input_handler *handler = handle->handler;
-	struct input_value *v;
-
-	for (v = vals; v != vals + count; v++)
-		handler->event(handle, v->type, v->code, v->value);
-
-	return count;
-}
-
-/*
- * An implementation of input_handler's events() method that invokes
- * handler->filter() method for each event one by one and removes events
- * that were filtered out from the "vals" array.
- */
-static unsigned int input_handler_events_filter(struct input_handle *handle,
-						struct input_value *vals,
-						unsigned int count)
-{
-	struct input_handler *handler = handle->handler;
-	struct input_value *end = vals;
-	struct input_value *v;
-
-	for (v = vals; v != vals + count; v++) {
-		if (handler->filter(handle, v->type, v->code, v->value))
-			continue;
-		if (end != v)
-			*end = *v;
-		end++;
-	}
-
-	return end - vals;
-}
-
-/*
- * An implementation of input_handler's events() method that does nothing.
- */
-static unsigned int input_handler_events_null(struct input_handle *handle,
-					      struct input_value *vals,
-					      unsigned int count)
-{
-	return count;
-}
-
 /**
  * input_register_handler - register a new input handler
  * @handler: handler to be registered
@@ -2607,13 +2556,6 @@ int input_register_handler(struct input_handler *handler)
 
 	INIT_LIST_HEAD(&handler->h_list);
 
-	if (handler->filter)
-		handler->events = input_handler_events_filter;
-	else if (handler->event)
-		handler->events = input_handler_events_default;
-	else if (!handler->events)
-		handler->events = input_handler_events_null;
-
 	error = mutex_lock_interruptible(&input_mutex);
 	if (error)
 		return error;
@@ -2687,6 +2629,75 @@ int input_handler_for_each_handle(struct input_handler *handler, void *data,
 }
 EXPORT_SYMBOL(input_handler_for_each_handle);
 
+/*
+ * An implementation of input_handle's handle_events() method that simply
+ * invokes handler->event() method for each event one by one.
+ */
+static unsigned int input_handle_events_default(struct input_handle *handle,
+						struct input_value *vals,
+						unsigned int count)
+{
+	struct input_handler *handler = handle->handler;
+	struct input_value *v;
+
+	for (v = vals; v != vals + count; v++)
+		handler->event(handle, v->type, v->code, v->value);
+
+	return count;
+}
+
+/*
+ * An implementation of input_handle's handle_events() method that invokes
+ * handler->filter() method for each event one by one and removes events
+ * that were filtered out from the "vals" array.
+ */
+static unsigned int input_handle_events_filter(struct input_handle *handle,
+					       struct input_value *vals,
+					       unsigned int count)
+{
+	struct input_handler *handler = handle->handler;
+	struct input_value *end = vals;
+	struct input_value *v;
+
+	for (v = vals; v != vals + count; v++) {
+		if (handler->filter(handle, v->type, v->code, v->value))
+			continue;
+		if (end != v)
+			*end = *v;
+		end++;
+	}
+
+	return end - vals;
+}
+
+/*
+ * An implementation of input_handle's handle_events() method that does nothing.
+ */
+static unsigned int input_handle_events_null(struct input_handle *handle,
+					     struct input_value *vals,
+					     unsigned int count)
+{
+	return count;
+}
+
+/*
+ * Sets up appropriate handle->event_handler based on the input_handler
+ * associated with the handle.
+ */
+static void input_handle_setup_event_handler(struct input_handle *handle)
+{
+	struct input_handler *handler = handle->handler;
+
+	if (handler->filter)
+		handle->handle_events = input_handle_events_filter;
+	else if (handler->event)
+		handle->handle_events = input_handle_events_default;
+	else if (handler->events)
+		handle->handle_events = handler->events;
+	else
+		handle->handle_events = input_handle_events_null;
+}
+
 /**
  * input_register_handle - register a new input handle
  * @handle: handle to register
@@ -2704,6 +2715,7 @@ int input_register_handle(struct input_handle *handle)
 	struct input_dev *dev = handle->dev;
 	int error;
 
+	input_handle_setup_event_handler(handle);
 	/*
 	 * We take dev->mutex here to prevent race with
 	 * input_release_device().
diff --git a/include/linux/input.h b/include/linux/input.h
index 89a0be6ee0e2..cd866b020a01 100644
--- a/include/linux/input.h
+++ b/include/linux/input.h
@@ -339,12 +339,16 @@ struct input_handler {
  * @name: name given to the handle by handler that created it
  * @dev: input device the handle is attached to
  * @handler: handler that works with the device through this handle
+ * @handle_events: event sequence handler. It is set up by the input core
+ *	according to event handling method specified in the @handler. See
+ *	input_handle_setup_event_handler().
+ *	This method is being called by the input core with interrupts disabled
+ *	and dev->event_lock spinlock held and so it may not sleep.
  * @d_node: used to put the handle on device's list of attached handles
  * @h_node: used to put the handle on handler's list of handles from which
  *	it gets events
  */
 struct input_handle {
-
 	void *private;
 
 	int open;
@@ -353,6 +357,10 @@ struct input_handle {
 	struct input_dev *dev;
 	struct input_handler *handler;
 
+	unsigned int (*handle_events)(struct input_handle *handle,
+				      struct input_value *vals,
+				      unsigned int count);
+
 	struct list_head	d_node;
 	struct list_head	h_node;
 };

