Return-Path: <linux-input+bounces-13426-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09196AFD54B
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 19:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 220E5486974
	for <lists+linux-input@lfdr.de>; Tue,  8 Jul 2025 17:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C22C2367CE;
	Tue,  8 Jul 2025 17:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="J+GbFMso"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510242E6D38
	for <linux-input@vger.kernel.org>; Tue,  8 Jul 2025 17:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995523; cv=none; b=iwJXmkDJ58jEouvpE4xOQDWnyGJb2PYmMP++mDXEVKwQdY7osdBCnZ7g8xXQ/w1QF1OAkUp16Vb2F73fQ0qYf1UY1fiFSEFAbDY8NCcjJOj9gb+B1FAsnVh6fBfjcSr5xBRbHbE3mKhBvfxMJLn3iZbU8ge34Z8VXVoyy2Uhado=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995523; c=relaxed/simple;
	bh=lYcinFsC3EAgBwLK9aXi8M5trFJ985aUKU/gocwLX/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwHTlZvY4Ncb6I/6iNghUunRw8SQUZ8CtxffLS2iUDeBd8CkuXV5rjA0qKQccDesZeNePsWi75WFOlnKCQhG18OcbCI1Nryalpn546qXOq/ce04fUePIIQY4ySewHkH6eM9zTYx+hltmKrkCPgW/uUVZ19cxHD7qfcaVPeI2dJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=J+GbFMso; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-875f28fde67so441732139f.1
        for <linux-input@vger.kernel.org>; Tue, 08 Jul 2025 10:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751995520; x=1752600320; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cst6VKXal21kcvQoj/qTt4BoEK49CJUqqKIE5tWnBGg=;
        b=J+GbFMsoPYQhWLqTjlzGwpxC4fIh+1FxFZ6CvZP3q+7uOj8mrHLH03qhG8ZFbYs27c
         2XtuGjd9EkLB0YocqhkpWCBmKuEbIJsn1WBxZNYjHO0iV86GV/oTYBK5y+PsspIm+dHW
         IlXKWzqJgJwRHuQqHe5QNmX96eXrtPdS1fZMOv+cISZBJzchrKQHYCfhBbzDzp5VHT+H
         gtL6lR9GmrKZgoPnrLuPsZQLCbtWPDLptRTWu55uvRiGeGEXQfRSa1CqV2MYEX+E8BEf
         eZ1ctPvDEgWTuOkHyC7hZo054s8EBT5ruMwYQBWlsbVrQ8cn5oIwvasF2t3PjeXOSg2I
         hGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995520; x=1752600320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cst6VKXal21kcvQoj/qTt4BoEK49CJUqqKIE5tWnBGg=;
        b=ix9hIJb2yxpX+u019CSJdCJB46sQdPezpasedDe17eqB0ijbgoL5AEtL+IczsLJX5X
         UpI/MLrLxTQZ2cYi7gZJzJ2c2K0+UsM0zc4jasGikHNwnTMttmVZMrnc7c0xY/jt3PTl
         yj3pkGapjqf6biwL9HCZVpGtrqa+USjKnDT/ULI4Ccx//7o+m6Sfq83E+2a6CEeDvbyn
         A5cpUAgat0nXyNM1/5HZWDpO9YfFCOgoyK7hah+F7+xrCalZkD5xngAH5UG3v0cwfl3P
         C33jvjJ1LbGsytE8G6JP36Ak+iYt5irSs3Cq+WkkxsX8dlrNq/wsLzfTOzElO5nJBTwi
         IuoA==
X-Forwarded-Encrypted: i=1; AJvYcCXeh7y5zJB1xPUTP0MDcql+d5s8V2DGchwB2qPMIk/bCuBYFuCvIuGzsm0bU/HxEcqBPPTrZLYS05w/9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvHv89JXIIL28HLVdAB4WNGxvH117eO+JbB3moWY3imF7eUJwG
	2lceKj0LtbkTfLbDQ/CWcKLhAfnc+ef5I3sY02y6OElDnOPyUz67sJ4g6manY4TGPg==
X-Gm-Gg: ASbGnctiFzl6aRVm2RQ7nT0foN5cvPaoIQIPWGMMvzPkU/RzXSoiGvm1dy8Nnq0cDap
	XI5RXj95kZ5oO6etcBXMOoepwQtgH6D/xNaMG04iXSj5e9Iq0FErzdX/I0H+xf4/dt++RGj8/Y6
	cn2NFcV6+qtmDGrzmU+cHcfAIo24q7WMdSyuc92CgLSeEcDnG9FAY6vsnAgZxQuBAlLHKDREF9i
	t/W0Ayx+Dp9VlFD7cAAY518qJYJCkJ39V+qoGOg36TAlbMMZUGFfjpe0zLQjeSZZNJwP+hePXLJ
	b2qNCRt9aL/BkhBt002dUnQkonOZVbYHo3lveirMOw3oPeoqFc07EdRxf6MkhcTO4iBNoJZ2aIA
	Izxjtj6/AjX1zOqY4rhRe3JTjzl690ApXlg4Yc5cLwDjo8P6TREQdVSs=
X-Google-Smtp-Source: AGHT+IGuN7RVSjqRXZ0Ho5hQMC8xexikALmsvJJ5UBECJiC9PzVW4b58qr8VA3o+IcRiaa182GItEg==
X-Received: by 2002:a05:6e02:3702:b0:3df:3d1a:2e76 with SMTP id e9e14a558f8ab-3e154dbd6d6mr48369075ab.1.1751995520179;
        Tue, 08 Jul 2025 10:25:20 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-52.harvard-secure.wrls.harvard.edu. [65.112.8.52])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e1004ceb0bsm33298025ab.66.2025.07.08.10.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:25:19 -0700 (PDT)
Date: Tue, 8 Jul 2025 13:25:16 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Serious bug in HID core
Message-ID: <e3a58c95-9501-4ec8-902e-2a73402d1fe3@rowland.harvard.edu>
References: <c75433e0-9b47-4072-bbe8-b1d14ea97b13@rowland.harvard.edu>
 <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <drcvdlw2kpuvsbact2gy4hvqp2i3au3shv5ozp3qms7qdfvi7t@7jofrodxeimb>

On Tue, Jul 08, 2025 at 05:51:08PM +0200, Benjamin Tissoires wrote:
> Hi Alan,
> 
> On Jul 08 2025, Alan Stern wrote:
> > Jiri and Benjamin:
> > 
> > Investigating a recent bug report from syzbot 
> > (https://lore.kernel.org/linux-usb/686be237.a70a0220.29fe6c.0b0c.GAE@google.com/)
> > led me to a rather serious error in the HID core.  It could affect a 
> > lot of drivers, and I don't know enough about them or the HID subsystem 
> > to fix it right away.
> > 
> > In short, does the value returned by hid_report_len() count the byte 
> > reserved for the report ID number?
> 
> It depends :)
> 
> See your analysis below...
> 
> > 
> > Some drivers seem to assume that it does and some seem to assume that it 
> > doesn't.  Here's what the actual code from include/linux/hid.h does:
> > 
> > /**
> >  * hid_report_len - calculate the report length
> >  *
> >  * @report: the report we want to know the length
> >  */
> > static inline u32 hid_report_len(struct hid_report *report)
> > {
> > 	return DIV_ROUND_UP(report->size, 8) + (report->id > 0);
> > }
> > 
> > It's somewhere in between -- it includes the ID byte in the count if and 
> > only if the ID is nonzero!  And of course, this behavior isn't mentioned 
> > in the (ungrammatical) kerneldoc.
> 
> Yeah, the docs are bad. But your analysis is correct: for a given
> report, its size might include or not the report ID.
> 
> This is because the report ID is optional in the HID spec, and some
> devices don't make use of it. Those devices are only exporting one
> report type, and can not have another report type in the same HID
> device. If a device needs to have more than one, it then needs to export
> the report ID in all of its reports, and then report_len count that
> extra byte.
> 
> To give you an example, old mice (or inexpensive ones), would export a
> report with:
> - X, Y, Wheel, B0, B1, B2
> 
> When a more advanced one might export:
> - REPORT ID 0, X, Y, Wheel, B0, B1, B2, ... B9
> - REPORT ID 1, SOME_VERY_COMPLEX_CONFIGURATION, ANOTHER ONE, ETC...
> 
> However, a HID device making use of the non report ID version can never
> make use of a report ID (or it's custom proprietary protocol).

So you're saying that while the kerneldoc for hid_report_len() could be 
improved, the code itself is correct.  Fine.  But this merely means that 
the real problem lies elsewhere (and _not_ in syzbot's test scenario!).  
See below.

Also, are you sure that all the other HID drivers realize that 
hid_report_len() behaves this way?  It's an easy thing to get wrong.

> > The particular scenario causing the bug found by syzbot was this: 
> > report->size was 0, report->id was 0, and the lower-level driver (usbhid 
> > in this case) assumed that the length argument (which was 0) did include 
> > the ID byte.  Since the ID was 0, the driver skipped over the first byte 
> > of the buffer and decremented the length, causing the length to 
> > underflow and leading to an invalid memory access.  In a more realistic 
> > setting, this would merely result in data loss and leakage.
> 
> That scenario is bogus (like most of syzbots in the HID space). There
> should be no way the HID subsystem allows a report->size of 0 to be used
> in a set_report or a get_report. So that's where the bug lies: HID
> trusts too much the device, and can lead to that kind of issues.
> 
> > 
> > How should this be fixed?
> 
> We have 2 problems here:
> - and __hid_request or __hid_raw_request should reject a null size
> 	report, and in the __hid_request case, a report of size 1 if there is
> 	a report ID.
> - Why is hidinput_change_resolution_multipliers() even considfering this
> 	report of size 0 when it should at least ensure that there is one
> 	field within the report
> 
> The first one should be easy to fix: add a bunch of checks.

I would normally expect this to checked when the report descriptors are 
read and parsed during probing.  A report of length zero could be 
rejected then (perhaps with an error message in the kernel log).

However, that wouldn't fully fix the problem.  And besides, length-0 
reports are (or should be) harmless.

> __hid_hw_raw_request() seems to not expose the problem actually.
> 
> The second one would need a little bit more understanding of the fake
> report descriptor provided by syzbot.

I suppose we can get the information from syzbot if it's really 
necessary.  But it seems to be a minor point.

> > Related issue: When the lower-level driver's raw_request() routine is 
> > called, can it assume that the first byte of the output buffer always 
> > contains the report ID number, set by the HID core?  If not, should it 
> > assume that the first byte is always reserved for the ID, or that the 
> > first byte is reserved only when the ID is nonzero?
> 
> The first byte should always be reserved to the report ID, and is
> populated by 0 by hid-core when the report ID is not in use.

Then why does hid_output_report() do this:

	if (report->id > 0)
		*data++ = report->id;

?  The first byte is not reserved for the ID when the ID is 0.  
According to what you said, the assignment should be unconditional.  
Isn't that a genuine bug?

And shouldn't the length computed by hid_alloc_report_buf() be one 
larger than it is when the ID is 0?

> So the usbhid driver is doing the right thing. In case there is no
> report ID, it ignores the first byte when making a request to the
> device, because in my example above, the device would not expect the
> first byte to be 0.

When usbhid skips the first byte, it also decrements the length.  Since 
__hid_request() calls it with a length given by hid_report_len(), the 
length has _already_ been decremented (or rather, not incremented -- it 
doesn't account for the ID byte), and consequently the USB transfer will 
leave out the final byte of the report.  This is the data loss I 
mentioned earlier.  It's another bug.

So which is doing the wrong thing: usbhid or __hid_request()?

> > Do __hid_request() and __hid_hw_raw_request() behave the same way in 
> > this regard?
> 
> __hid_hw_raw_request() ensures that there is a minimum length of one, so
> we should be fine. __hid_request apparently is the only one giving too
> much trust in the report.

In principle there's nothing wrong with a zero-length report.  It would 
be pretty useless, but nevertheless we should be able to handle one 
without crashing the kernel.

Alan Stern

