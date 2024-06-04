Return-Path: <linux-input+bounces-4088-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1B8FBADD
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 19:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E891F22468
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4C814B94D;
	Tue,  4 Jun 2024 17:45:20 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2950214B944
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 17:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717523120; cv=none; b=MjmVlhCF4pqlFNPM3HCeI+sSkWrobN9Cp2n04Eq7h+86C1BEg6XMWu85skWAWp61lQgAL0hkc/zH1Kh6XliaKr6os8cbXdOJJ/0Ww5J3irjQ+dTV2ufMuzs4XnnoTzCv4C0XZaeQ1oHEFaH4ILMOyikNxG0KCRdodTisgHIiGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717523120; c=relaxed/simple;
	bh=Ddf0qc15ARD9S0pv1k9Mm0ZFp3pL46h9tOnJ56TQick=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwySSLEwaaY4bKK0sW/WrLlD9wdCyCirLrL2gzB5HweSQsicxolQdUM8O4x0/W68eY1T8CrWG6XJ4fdmQ/MLN7gmZYE21T8bYasvEzht05RihShl3Fd036tzMkWjuRn9il7rUqM2jWXHnykcRTR7Uj7fiPUn/6GrBv7CBcFlZn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 165513 invoked by uid 1000); 4 Jun 2024 13:45:18 -0400
Date: Tue, 4 Jun 2024 13:45:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kees Cook <kees@kernel.org>
Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
  Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
  linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
  syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
  syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
  linux-hardening@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
Message-ID: <d1ad84e3-7da9-4dc8-a095-b9fbe191eb56@rowland.harvard.edu>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
 <202406041019.BCD0A93C@keescook>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202406041019.BCD0A93C@keescook>

On Tue, Jun 04, 2024 at 10:21:15AM -0700, Kees Cook wrote:
> On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
> > Hi,
> > 
> > On 6/4/24 07:15, Jiri Kosina wrote:
> > > On Tue, 4 Jun 2024, Kees Cook wrote:
> > > 
> > >> This isn't the right solution. The problem is that hid_class_descriptor 
> > >> is a flexible array but was sized as a single element fake flexible 
> > >> array:
> > >>
> > >> struct hid_descriptor {
> > >> 	   __u8  bLength;
> > >> 	   __u8  bDescriptorType;
> > >> 	   __le16 bcdHID;
> > >> 	   __u8  bCountryCode;
> > >> 	   __u8  bNumDescriptors;
> > >>
> > >> 	   struct hid_class_descriptor desc[1];
> > >> } __attribute__ ((packed));
> > >>
> > >> This likely needs to be: 
> > >>
> > >> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
> > >>
> > >> And then check for any sizeof() uses of the struct that might have changed.
> > > 
> > > Ah, you are of course right, not sure what I was thinking. Thanks a lot 
> > > for catching my brainfart.
> > > 
> > > I am dropping the patch for now; Nikita, will you please send a refreshed 
> > > one?
> > > 
> > 
> > Thanks for catching my mistake.
> > 
> > I'll gladly send a revised version, hoping to do it very soon.
> 
> I spent a little more time looking at this, and I'm not sure I
> understand where the actual space for the descriptors comes from?
> There's interface->extra that is being parsed, and effectively
> hid_descriptor is being mapped into it, but it uses "sizeof(struct
> hid_descriptor)" for the limit.

That's a lower limit, not an upper limit.  The hid_descriptor must 
include at least one hid_class_descriptor, but it can include more.
That's what the min_t() calculation of num_descriptors is meant to 
figure out.

>  Is more than 1 descriptor expected to
> work correctly?

More than one hid_class_descriptor -- yes.

>  Or is the limit being ignored? I'm a bit confused by
> this code...

Does this explain it?

Alan Stern

