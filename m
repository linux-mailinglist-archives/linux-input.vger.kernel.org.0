Return-Path: <linux-input+bounces-9599-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BD8A21662
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 02:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91375164B8E
	for <lists+linux-input@lfdr.de>; Wed, 29 Jan 2025 01:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12117188A0C;
	Wed, 29 Jan 2025 01:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWImoMZU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC21E42A8B;
	Wed, 29 Jan 2025 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738115599; cv=none; b=iBSRJ6RrhJhGlvey2eM6pdC8CR4DiceuEXybb2IftkBkrjkkaB6yAYGJN5JLf46vbHRsZL9rdEhF356iA1TEr//RyXqm6sL2rd+AuoPxbWePLNiUkhR+bB+S8pFkqzPml8m4C7SaTy2T7KrZZG8jA/nH/zH9JOVWXHh6htpqGkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738115599; c=relaxed/simple;
	bh=0T839DzywJ26Cfrs9GWEAdkq8cMjMgdWjHzUsu7iSfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vEQARenbAn51biKON/8Ka0Et/x74TdjvxkMANwXTn80lhhIjlTAPMp1w4+0TRNJ/KuUvClsh3XllDqsVXAiHgEaGbQ5nOKvmxe7ah9UwJAw73sxAgxojclZoxJKvoKiUmjZ6TOqzo3dKA94rAYAEHXXca9zSkER5wiC9ev29/SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWImoMZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A65C4CED3;
	Wed, 29 Jan 2025 01:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738115598;
	bh=0T839DzywJ26Cfrs9GWEAdkq8cMjMgdWjHzUsu7iSfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SWImoMZUOCOrWwPau//NTYK2b4SjcVc/SJ39NnSdERoDZBs8+SbfHSmR2+AfWqyab
	 aiOe0LC9oDa+jOg5svaMJfhW7WgH+/sINSKxkyJMZYO5SQ5mQcqh/1WRAJkWDVR3Ri
	 pfGboLR/6hqjQ6JBG2kKzeFGnP2hdO3v/Uikyy6vNK7WRkAucDQahd2xQNJpc2k3Hy
	 J7+SzmhVIQIvCweTC1HRWnSMjb0CmX2kmX8Rr/LE4Q/vNJ160AJhZ4jrpKoRcZWODW
	 HIIAjs7u6+YreIwkk6+MOC8do01DHBcKmAvQIn70oNgx7pIcgDYghm8aYJE0m5KVxk
	 m9wfbMVmPywPA==
Date: Tue, 28 Jan 2025 17:53:14 -0800
From: Kees Cook <kees@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org,
	syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
Message-ID: <202501281747.9690B3B@keescook>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
 <202406041019.BCD0A93C@keescook>
 <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
 <807cfa6f-5863-4fe4-8294-76d5cdbc3aac@fintech.ru>
 <649f5c1c-f3a7-420d-b727-f904d58f491f@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <649f5c1c-f3a7-420d-b727-f904d58f491f@rowland.harvard.edu>

On Tue, Jan 28, 2025 at 12:00:41PM -0500, Alan Stern wrote:
> On Tue, Jan 28, 2025 at 05:45:21AM -0800, Nikita Zhandarovich wrote:
> > Hello,
> > 
> > On 6/4/24 10:45, Alan Stern wrote:
> > > On Tue, Jun 04, 2024 at 10:21:15AM -0700, Kees Cook wrote:
> > >> On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
> > >>> Hi,
> > >>>
> > >>> On 6/4/24 07:15, Jiri Kosina wrote:
> > >>>> On Tue, 4 Jun 2024, Kees Cook wrote:
> > >>>>
> > >>>>> This isn't the right solution. The problem is that hid_class_descriptor 
> > >>>>> is a flexible array but was sized as a single element fake flexible 
> > >>>>> array:
> > >>>>>
> > >>>>> struct hid_descriptor {
> > >>>>> 	   __u8  bLength;
> > >>>>> 	   __u8  bDescriptorType;
> > >>>>> 	   __le16 bcdHID;
> > >>>>> 	   __u8  bCountryCode;
> > >>>>> 	   __u8  bNumDescriptors;
> > >>>>>
> > >>>>> 	   struct hid_class_descriptor desc[1];
> > >>>>> } __attribute__ ((packed));
> > >>>>>
> > >>>>> This likely needs to be: 
> > >>>>>
> > >>>>> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
> > >>>>>
> > >>>>> And then check for any sizeof() uses of the struct that might have changed.
> > 
> > Alan, I finally got around to preparing a revised version of the
> > required patch and encountered a few issues. I could use some advice in
> > this matter...
> > 
> > If we change 'struct hid_descriptor' as you suggested,
> 
> I didn't make that suggestion.  Kees Cook did.
> 
> >  which does make
> > sense, most occurrences of that type are easy enough to fix.
> > 
> > 1) usbhid_parse() starts working properly if there are more than 1
> > descriptors, sizeof(struct hid_descriptor) may be turned into something
> > crude but straightforward like sizeof(struct hid_descriptor) +
> > sizeof(struct hid_class_descriptor).
> > 
> > 2) 'hid_descriptor' in drivers/hid/hid-hyperv.c remains innocuous as
> > well as only 1 descriptor expected there. My impression is only some
> > small changes are needed there.
> > 
> > However, the issue that stumps me is the following: static struct
> > hid_descriptor hidg_desc in drivers/usb/gadget/function/f_hid.c relies
> > on a static nature of that one descriptor. hidg_desc ends up being used
> > elsewhere, in other static structures. Basically, using __counted_by
> > requires a lot of changes, as I see it, out of scope of merely closing
> > an UBSAN error.
> 
> The hidg_desc structure needs to contain room for a single 
> hid_descriptor containing a single hid_class_descriptor.  I think you 
> can define it that way by doing something like this:
> 
> static struct hid_descriptor hidg_desc = {
> 	.bLength			= sizeof hidg_desc,
> 	.bDescriptorType		= HID_DT_HID,
> 	.bcdHID				= cpu_to_le16(0x0101),
> 	.bCountryCode			= 0x00,
> 	.bNumDescriptors		= 0x1,
> 	.desc				= {
> 		{
> 			.bDescriptorType	= 0, /* DYNAMIC */
> 			.wDescriptorLength	= 0, /* DYNAMIC */
> 		}
> 	}
> };
> 
> Or maybe it needs to be:
> 
> 	.desc				= { {0, 0} } /* DYNAMIC */
> 
> I'm not sure what is the correct syntax; you'll have to figure that out.  

Either should work.

> 
> You'll have to be more careful about the definition of hidg_desc_copy in 
> hidg_setup(), however.  You might want to define hidg_desc_copy as an 
> alias to the start of a byte array of the right size.

For an on-stack fixed-size flex array structure, you can use:

	DEFINE_FLEX(struct hid_descriptor, hidg_desc_copy,
		    desc, bNumDescriptors, 1);
	*hidg_desc_copy = hidg_desc;

and then adjust the "hidg_desc_copy." instances to "hidg_desc_copy->"

> 
> > Is this approach still worthy pursuing or should I look into some neater
> > solution?
> 
> I think you should persist with this approach.
> 
> Alan Stern

-- 
Kees Cook

