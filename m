Return-Path: <linux-input+bounces-7067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E39990059
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C0641C2354C
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 09:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FF61465B1;
	Fri,  4 Oct 2024 09:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="bECv5qtq"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648F146A93
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 09:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035720; cv=none; b=UHBwWdjDA04Bwa/hqfpxqSWRmyCoDAYr5do5/541mC88oDk6aqkNvp+57iq0bQvTQxWMFj7OuVp7W4da5fdrG40zRtllcFcY60uSPllTlxTp8GeayYNf+D0kkpQz6u5jMTm/ziTb7vrqNz6U1SQC5UbEKzqTaMsIz44GwTnI494=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035720; c=relaxed/simple;
	bh=Em+2UqIobNQpdXGqDCyjfm12PYXhuyxQLpVjwzs4g4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/Gb4DDHOVkYwQ1glxHmG02G61Hj49JRT/InIw1v+y91d5Mngg64jM7g45j7QchfG4QC6Der6t2WRQjjn4PcGxGLcJnQWzpQW+zGu2w1JJG4es9kioJhNyiB4PAozB+4/uXPEZt4GLTw1LnvYB2x0pQTbRDJKe8f/pHBQVKr7Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=bECv5qtq; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=e5YZp914u669I8zi+v9NDzF8tSjf9adg2Hi4ba7vlv8=; b=bECv5qtq7SyWPCqkH7NWfXqLPN
	XgNyqv07Sl40gr/Ax72pHk2LhyKSPCnDeoN78EsiLk6FTZw9Rx6HFs36kp46ZDOqCmqteHKWponcI
	ffHHXFIJbPAdODadIF/fbWohg6l0Ij6WF6B2/twp/xFiRKV5wkPj6lQuNVZ2t2L5V+ytLRWDG7OvZ
	wr6ZWFM9+/ljJUos/Ewn/e8fdAXHGbG7VY7zCj21L+z5ZMt9xj4O9RS2BFekcZd45c4cuOzjkT+nr
	rTtgHo7mrSBjGG+OeePpwZUpEUgLzXcZmk3kll21vUiiWjhEVh6EQWcEsi92cNOi3IyBBExtpARi5
	PTSeKfvw==;
Date: Fri, 4 Oct 2024 11:55:11 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tony Lindgren
 <tony@atomide.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 20/51] Input: omap4-keypad: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <20241004115511.78f021d8@akair>
In-Reply-To: <20241004094123.113691-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
	<20241004094123.113691-1-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri,  4 Oct 2024 12:41:23 +0300
schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:

> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c
> b/drivers/input/keyboard/omap4-keypad.c index
> 040b340995d8..cc8d77601fc7 100644 ---
> a/drivers/input/keyboard/omap4-keypad.c +++
> b/drivers/input/keyboard/omap4-keypad.c @@ -196,7 +196,7 @@ static
> irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
> kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS)); 
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	__pm_runtime_put_autosuspend(dev);
>  
>  	return IRQ_HANDLED;
>  }
> @@ -234,7 +234,7 @@ static int omap4_keypad_open(struct input_dev
> *input) 
>  out:
>  	pm_runtime_mark_last_busy(dev);
> -	pm_runtime_put_autosuspend(dev);
> +	__pm_runtime_put_autosuspend(dev);
>  
hmm, if pm_runtime_put_autosuspend() will include the call to
pm_runtime_mark_last_busy(), then why is this change needed?
After the change, the mark_last_busy could be removed.

Regards,
Andreas

