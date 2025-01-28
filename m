Return-Path: <linux-input+bounces-9596-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1042AA20F55
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 18:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D557188A980
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 17:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E56A1B21AA;
	Tue, 28 Jan 2025 17:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nlFWbreo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2DC2A1BA
	for <linux-input@vger.kernel.org>; Tue, 28 Jan 2025 17:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738083647; cv=none; b=gdh8RzEv05kdfL5UVkBN8DYwj4Preu86gT/rcQb/FOy7fE9VnuuOKSb3Og8Tx/msnxU+tTSIV/aniIpOKE+Cb9xFBdxLuKJn6vig/4JM+npn5yzdmuakv4aBQomhnhTfKaZCFtw1a26HiEhTycOGjiP2lKpGnUoSEDeJzFhbVIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738083647; c=relaxed/simple;
	bh=iIybshDrGhTpu5fdQslefhHPNdOHP0cFoqox0S5u16s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgOsdDNrJXdIqbEmGvP2necWro7cmY1OdAfZ/gZKgInkfKEzPAEG6Uct3H/BcQao1TV2SnMvwu/5dTrRE2BD5PWc1y0PLReEf4pfH4WaBqG5Az6giQBof3UmnQHzEJGTF15fFuKPFVOSEHPlTAJIzlvcYUqGkhKAkYfPAd7IlqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nlFWbreo; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-46fcbb96ba9so5896271cf.0
        for <linux-input@vger.kernel.org>; Tue, 28 Jan 2025 09:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738083644; x=1738688444; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYQbyDpHC1ac+WOYHWsMxWbSZSl6a353d6NzBjJrrrg=;
        b=nlFWbreobHnKp+6q6YGyOrscYnZvnkWMEBziBelYxjduted3YxY2cwYb5GUg+nZwAd
         c2dD2dBJdjWh9NPDToSlEi1g5Djr0q5SsZiQVHL26qD8PQM5LFMXPdzeqWyhn4XNaKU1
         sB0c6byqdoTl4kdlGoYvz3svZpcPwFcpDTF5rBZatz8/D9rN+85AKd+4ryUrCVCI2itR
         GRT4DaiP1y/ut4oYTUdSG3BHYVkgo7e0mjeVp8XudAbX4DnLflZAf/c5cA1+jSk22xi3
         JHXpac3WezJdlf5nCMh4WZqkzLsSiWNPsXbkKQfva9J3x4C9my3HufPZWcS5iJaXZHi7
         hy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738083644; x=1738688444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rYQbyDpHC1ac+WOYHWsMxWbSZSl6a353d6NzBjJrrrg=;
        b=HLR8iDWIGC0jWSXa7/POiy3+suxNcjcRkBh1rW6380do8fQui7rWFN2UoPfYgj24qs
         tH5Ohh6zdFzErK5H8UuZW+osC5G8cbSjfqGfNKi8pHtbOJVTLr4ClHwUuBhKTWXKH6Wx
         5Iu3Yhbo3dC+hkxpZe5TMcp5KlKcTzO9fCYyGzWfQWZ5TiwsBgmfQlJ5GgRIlxAXsE4K
         21YQo4lMJ1c3NFs5eumHV39yfhwZ3104IgS5x35oJXimJoochPx2uC+9V3tFRwrWJl7z
         k3UxBQF/0KJVvnJ9MHvgm/zvA+Ntj5u6nXVIV47aawTc/kGi6yhidVrf1Z33KCmKc/EC
         T7Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVS35dTfOi62Vif+xPM6HNSrFT9dr4pX69BfkrcXqe3Dc30rSb+x1nsbeXVIfKtH5TZDKC5IZzcNfeqgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSQtDYHROzctIPI1PTjjI+fz7kvkCGfGccx6X89vkkOdV4Ijg
	2lHUwwDvoYtDjN077tEdg8e1iz/q1zk++9xb0nlrZxT9BZ6xYUBfJFCfEfQIWQ==
X-Gm-Gg: ASbGncufHjo0tpBfWO79oCrmnJzwPrdt7zVvClTx9oFmrwQLhU4vV4hTiIMWsJSsQbO
	VPc5oWrUC/aPXvtytmr5pI2vdAZhHMmSr1B0dyclRawajhM/ylj41Wx2VPLdI2ga6DNxTYDlynR
	+pWidKjyDtEPVrLXQI51ibx2o2IGpGNfw3AuGSaHkQgjLs4q/5FGC9bsM2QCMSGw6PmWh21PPZC
	LdwsmAE9+8WfDTwHztxtJrEvHtIWo/6SuIVMH7lqgj74rnF6fnT0i34Dk9l1XRPpoJD1XGAgwEk
	bilgG7yvad8j2OXN2N+fuyK+kWdN15Yk7vq/rN3Fbp0pYIxr1Ggl2NDcK1YfrJSsOrN7RlXO+tB
	5EUcD0Tux
X-Google-Smtp-Source: AGHT+IFXtWLgYvf5afKDBq9IFcUR79Cv4+hTgX2p8X0VQsEnSg9GzqwrSx/uGsGZRVXzUnYEXoIRFw==
X-Received: by 2002:a05:622a:190b:b0:467:4b8d:2eea with SMTP id d75a77b69052e-46e12b90d4emr687489221cf.34.1738083644545;
        Tue, 28 Jan 2025 09:00:44 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66b88e49sm52565771cf.68.2025.01.28.09.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 09:00:44 -0800 (PST)
Date: Tue, 28 Jan 2025 12:00:41 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Kees Cook <kees@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org,
	syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
Message-ID: <649f5c1c-f3a7-420d-b727-f904d58f491f@rowland.harvard.edu>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
 <202406041019.BCD0A93C@keescook>
 <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
 <807cfa6f-5863-4fe4-8294-76d5cdbc3aac@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <807cfa6f-5863-4fe4-8294-76d5cdbc3aac@fintech.ru>

On Tue, Jan 28, 2025 at 05:45:21AM -0800, Nikita Zhandarovich wrote:
> Hello,
> 
> On 6/4/24 10:45, Alan Stern wrote:
> > On Tue, Jun 04, 2024 at 10:21:15AM -0700, Kees Cook wrote:
> >> On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
> >>> Hi,
> >>>
> >>> On 6/4/24 07:15, Jiri Kosina wrote:
> >>>> On Tue, 4 Jun 2024, Kees Cook wrote:
> >>>>
> >>>>> This isn't the right solution. The problem is that hid_class_descriptor 
> >>>>> is a flexible array but was sized as a single element fake flexible 
> >>>>> array:
> >>>>>
> >>>>> struct hid_descriptor {
> >>>>> 	   __u8  bLength;
> >>>>> 	   __u8  bDescriptorType;
> >>>>> 	   __le16 bcdHID;
> >>>>> 	   __u8  bCountryCode;
> >>>>> 	   __u8  bNumDescriptors;
> >>>>>
> >>>>> 	   struct hid_class_descriptor desc[1];
> >>>>> } __attribute__ ((packed));
> >>>>>
> >>>>> This likely needs to be: 
> >>>>>
> >>>>> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
> >>>>>
> >>>>> And then check for any sizeof() uses of the struct that might have changed.
> 
> Alan, I finally got around to preparing a revised version of the
> required patch and encountered a few issues. I could use some advice in
> this matter...
> 
> If we change 'struct hid_descriptor' as you suggested,

I didn't make that suggestion.  Kees Cook did.

>  which does make
> sense, most occurrences of that type are easy enough to fix.
> 
> 1) usbhid_parse() starts working properly if there are more than 1
> descriptors, sizeof(struct hid_descriptor) may be turned into something
> crude but straightforward like sizeof(struct hid_descriptor) +
> sizeof(struct hid_class_descriptor).
> 
> 2) 'hid_descriptor' in drivers/hid/hid-hyperv.c remains innocuous as
> well as only 1 descriptor expected there. My impression is only some
> small changes are needed there.
> 
> However, the issue that stumps me is the following: static struct
> hid_descriptor hidg_desc in drivers/usb/gadget/function/f_hid.c relies
> on a static nature of that one descriptor. hidg_desc ends up being used
> elsewhere, in other static structures. Basically, using __counted_by
> requires a lot of changes, as I see it, out of scope of merely closing
> an UBSAN error.

The hidg_desc structure needs to contain room for a single 
hid_descriptor containing a single hid_class_descriptor.  I think you 
can define it that way by doing something like this:

static struct hid_descriptor hidg_desc = {
	.bLength			= sizeof hidg_desc,
	.bDescriptorType		= HID_DT_HID,
	.bcdHID				= cpu_to_le16(0x0101),
	.bCountryCode			= 0x00,
	.bNumDescriptors		= 0x1,
	.desc				= {
		{
			.bDescriptorType	= 0, /* DYNAMIC */
			.wDescriptorLength	= 0, /* DYNAMIC */
		}
	}
};

Or maybe it needs to be:

	.desc				= { {0, 0} } /* DYNAMIC */

I'm not sure what is the correct syntax; you'll have to figure that out.  

You'll have to be more careful about the definition of hidg_desc_copy in 
hidg_setup(), however.  You might want to define hidg_desc_copy as an 
alias to the start of a byte array of the right size.

> Is this approach still worthy pursuing or should I look into some neater
> solution?

I think you should persist with this approach.

Alan Stern

