Return-Path: <linux-input+bounces-7069-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E60ED99012F
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 212581C215D7
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7005915533F;
	Fri,  4 Oct 2024 10:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kt56Hq+K"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7279E156678
	for <linux-input@vger.kernel.org>; Fri,  4 Oct 2024 10:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728037609; cv=none; b=q/TzuOea+clqKiUysL9U3HW3kAzAQ6jbdOgKyf+ImeQ3+89IHjPoaCu/6ixQTpYssoZTIyXs/A12VNjKDeKi+PLUK6d3UdrFQsDcvu1zQOD6m9aG6YtTGNdgebqRM1tSMiJakpprXEx18Z8y/Y/kSb2GQEU1ke/9ZdmI+5yTda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728037609; c=relaxed/simple;
	bh=Dd5f6VRIbPbuNguE+0P8yMmZpyyip3E67aJyVs9mZW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHUnPAWwmiQDNVjSsbhgK82CZgWSKDaXKxy4w3m/eqUeQ86L6ZqIEHJfEamIB5U1qUdb6/X60OHAFdvj3bW/Jlztwl3wfJhQpX3iKLhlH5ydBrkL3YoYeBSrvXO6lDCT7VSHzFJfUVwq+PJcrqDPXmAuqwM9CMfmRllW1gdXziQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kt56Hq+K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728037607; x=1759573607;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dd5f6VRIbPbuNguE+0P8yMmZpyyip3E67aJyVs9mZW8=;
  b=Kt56Hq+KpfY6kPy1q3RFdewJQCq81UnfCTxr43gy+exVNVvlT7693gst
   uAKjC6teF62Ea+mmD+K85AovSJrQRAltsjQ7LpKztEBPvtAxeh87z5uLy
   xeDlJ0tOs1qJdDpZn39R7crLM3u/wnb4kSkNZqnrn83b1mTyxamHhJHVa
   9NhGjNM0XUB1B+GWOPiBqb3U7JXk4tw0WQB/vWdVekqoUUxd46l0w98Nj
   XBzis/IbIu5QpJLxSU3nym6q3VyGQn4WQhUb4vsfADdt7bwR+rgTcAu5p
   yQDLc83uZuTWBRhbg3MijwCG7JbatqvWwIkl8YlXSeASxwHDdHjY6oB5D
   A==;
X-CSE-ConnectionGUID: pj78M3/JTT+UqJIJ8U9klg==
X-CSE-MsgGUID: 9V5nDjSnRTqn9NnwpxvKcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31139412"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="31139412"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:26:46 -0700
X-CSE-ConnectionGUID: kHQokC1kTBmrA7/syOt9Sg==
X-CSE-MsgGUID: G79c7VTnTgiJUhubvMqoIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74772102"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 03:26:45 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C603F11F727;
	Fri,  4 Oct 2024 13:26:42 +0300 (EEST)
Date: Fri, 4 Oct 2024 10:26:42 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 20/51] Input: omap4-keypad: Switch to
 __pm_runtime_put_autosuspend()
Message-ID: <Zv_C4vcdgw6lT-Gx@kekkonen.localdomain>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
 <20241004094123.113691-1-sakari.ailus@linux.intel.com>
 <20241004115511.78f021d8@akair>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004115511.78f021d8@akair>

Hi Andreas,

On Fri, Oct 04, 2024 at 11:55:11AM +0200, Andreas Kemnade wrote:
> Am Fri,  4 Oct 2024 12:41:23 +0300
> schrieb Sakari Ailus <sakari.ailus@linux.intel.com>:
> 
> > pm_runtime_put_autosuspend() will soon be changed to include a call to
> > pm_runtime_mark_last_busy(). This patch switches the current users to
> > __pm_runtime_put_autosuspend() which will continue to have the
> > functionality of old pm_runtime_put_autosuspend().
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/input/keyboard/omap4-keypad.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/input/keyboard/omap4-keypad.c
> > b/drivers/input/keyboard/omap4-keypad.c index
> > 040b340995d8..cc8d77601fc7 100644 ---
> > a/drivers/input/keyboard/omap4-keypad.c +++
> > b/drivers/input/keyboard/omap4-keypad.c @@ -196,7 +196,7 @@ static
> > irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
> > kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS)); 
> >  	pm_runtime_mark_last_busy(dev);
> > -	pm_runtime_put_autosuspend(dev);
> > +	__pm_runtime_put_autosuspend(dev);
> >  
> >  	return IRQ_HANDLED;
> >  }
> > @@ -234,7 +234,7 @@ static int omap4_keypad_open(struct input_dev
> > *input) 
> >  out:
> >  	pm_runtime_mark_last_busy(dev);
> > -	pm_runtime_put_autosuspend(dev);
> > +	__pm_runtime_put_autosuspend(dev);
> >  
> hmm, if pm_runtime_put_autosuspend() will include the call to
> pm_runtime_mark_last_busy(), then why is this change needed?
> After the change, the mark_last_busy could be removed.

It could, in which case we'd be living with pm_runtime_mark_last_busy()
called twice, for some time, and for some code, possibly even in a release
kernel, depending on how well the patches "stick". It likely wouldn't be
harmful. Still, to avoid making functional changes to more than 350 files I
know little about, I've instead posted this set to prepare for
pm_runtime_put_autosuspend() functionality change while keeping the
functionality of the code exactly the same.

Also added Ilpo who had a similar question.

-- 
Kidn regards,

Sakari Ailus

