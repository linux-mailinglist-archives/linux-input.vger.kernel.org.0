Return-Path: <linux-input+bounces-4087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B7A8FBA2D
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 19:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 104CD282875
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 17:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A6C9149018;
	Tue,  4 Jun 2024 17:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLSOWmyG"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC1913D607;
	Tue,  4 Jun 2024 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717521676; cv=none; b=rcPWEGx9+N3bKgTjS+yroNGst8Tsv0UBik52MB/BWjLWzl19M8XxOerlzXQ3mm/YE+6fSn18Pt4Ss21ecICFX1wpSTMwpidHoyBDfaKf5OC+CuEaI+z4dheiOv3SrQEAULucBTHePof3ZI19b7+75ET3mV1AbwxKmjPeO65zqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717521676; c=relaxed/simple;
	bh=ENkuYl6K6Pazk888AjcWNqo87PwckZvP2v3d5Fy2kV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swLLfFP+1vFAYJ/mwhwCJRRc8CGKRpHNtT/+top0oaxqD0LKe5LlF8j/TV/gXrpy3hDsjkX5En2O+zZtwIZ+QzrlG3GTcw+svXdL/LacD7ZSEKF74xxV3kmr2yciONzaY+SdhiHxGDNBP0szi00OhuqgRnQ8h5OjtqGiJ9UjsfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLSOWmyG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A50C2BBFC;
	Tue,  4 Jun 2024 17:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717521675;
	bh=ENkuYl6K6Pazk888AjcWNqo87PwckZvP2v3d5Fy2kV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bLSOWmyGF0Bc+5ULOgVYYseAHIlEtY+J8TE2hNhNzmZMRzsrFpC+aJ8ydjJByzWz2
	 N19WWKxZl9peofpn8DT6bQrt5eYy+d4Pf9lAhGo1vc0As9A9ssJSCc67EOUrzZ85Qq
	 CtreVZ3/m8sAkDLN7qPb2P17m+pnJgjSMUXAK0ZlF6pbfbT0LnybAXp9zO9COeoBsi
	 5DIlloZzB0uM6HluZpo098Ounu9ilx0vumXx+c3wpaXigP6raWTQiCXQQL5Ilyi6jD
	 1LfpdsP89BNfPoJqgM1Sr8+FnFEqCr74Zj7b8v94175X7+U7jXYihMf4J6vGqHaekw
	 8aN1yTHwp9JIw==
Date: Tue, 4 Jun 2024 10:21:15 -0700
From: Kees Cook <kees@kernel.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] HID: usbhid: fix recurrent out-of-bounds bug in
 usbhid_parse()
Message-ID: <202406041019.BCD0A93C@keescook>
References: <20240524120112.28076-1-n.zhandarovich@fintech.ru>
 <nycvar.YFH.7.76.2406041015210.16865@cbobk.fhfr.pm>
 <E62FA5CB-D7AE-4A11-9D2E-7D78D7C10ADA@kernel.org>
 <nycvar.YFH.7.76.2406041614210.24940@cbobk.fhfr.pm>
 <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a38e355-af5c-4b3d-81be-0cc97376c1f5@fintech.ru>

On Tue, Jun 04, 2024 at 10:09:43AM -0700, Nikita Zhandarovich wrote:
> Hi,
> 
> On 6/4/24 07:15, Jiri Kosina wrote:
> > On Tue, 4 Jun 2024, Kees Cook wrote:
> > 
> >> This isn't the right solution. The problem is that hid_class_descriptor 
> >> is a flexible array but was sized as a single element fake flexible 
> >> array:
> >>
> >> struct hid_descriptor {
> >> 	   __u8  bLength;
> >> 	   __u8  bDescriptorType;
> >> 	   __le16 bcdHID;
> >> 	   __u8  bCountryCode;
> >> 	   __u8  bNumDescriptors;
> >>
> >> 	   struct hid_class_descriptor desc[1];
> >> } __attribute__ ((packed));
> >>
> >> This likely needs to be: 
> >>
> >> struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
> >>
> >> And then check for any sizeof() uses of the struct that might have changed.
> > 
> > Ah, you are of course right, not sure what I was thinking. Thanks a lot 
> > for catching my brainfart.
> > 
> > I am dropping the patch for now; Nikita, will you please send a refreshed 
> > one?
> > 
> 
> Thanks for catching my mistake.
> 
> I'll gladly send a revised version, hoping to do it very soon.

I spent a little more time looking at this, and I'm not sure I
understand where the actual space for the descriptors comes from?
There's interface->extra that is being parsed, and effectively
hid_descriptor is being mapped into it, but it uses "sizeof(struct
hid_descriptor)" for the limit. Is more than 1 descriptor expected to
work correctly? Or is the limit being ignored? I'm a bit confused by
this code...

-- 
Kees Cook

