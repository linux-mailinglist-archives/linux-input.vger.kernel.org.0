Return-Path: <linux-input+bounces-15016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAE5B96D4C
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 18:30:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DBFD16E890
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 16:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 004FC327A0A;
	Tue, 23 Sep 2025 16:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWdG3qKa"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86F2211A05;
	Tue, 23 Sep 2025 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758645037; cv=none; b=qXXkUyu23MKuiE3dy0dyWQ2j2ha8ZCNYyIxD3mpoyu5WqKbswouVi60diVdXUdMOyXqZMsA9H3mEJYeQgaXEGzZaAkuAHoErshZnc5gpGezS2TrNjHNHePR6Jvy8lOpZjg4UJ8XWJsxpkn9fo8jdBiDL3XpRK54rUn8b3PHk4hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758645037; c=relaxed/simple;
	bh=5tiBPtvgesyhnR47lrccS9gc7BUlsPB/UX6Ph/bryO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gi9cM3OWxigJKFz8Nqj6w4YS10+x9b/EEzcY+Vt8rxK+YjXYd3A/DMop3t8D8mASgFlS8VArzHVcUz9s+2o5+LbZnHhc/e24I3L1SDVlRJrQnYOOhd+O4Qr2Z12tb+uNeKyf3HomZNldR7K2exBfoWI5Ez+ANpvpi+xZqVITLi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWdG3qKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63554C4CEF7;
	Tue, 23 Sep 2025 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758645037;
	bh=5tiBPtvgesyhnR47lrccS9gc7BUlsPB/UX6Ph/bryO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aWdG3qKaD3dQpRSfft7dkP56jbtFkmlXyV/sGPLG/+35MnCJrm8IygZxeHMsuktex
	 F6E8JHHHPCurlXMz1H/2VA+t0WBfIJEdO5iM0MBnIbnlbS9YL/pXL/4JOGcXjV3g7s
	 x57oHnCYP631KXx4iXl/mn+eH9KFDn+3cQ+8uAeS9NNBWlfDz/ijCg5mSCigeaLRte
	 X8gijx+Rn72fCZizw1oN6juT4EEbCQzYRxkMjnzYC9eJoMq/0XhGJu2GboqinhFXn/
	 TYY1rJxQfUB1wOoK8DzSxLOUQaUbNWEC2eyqnzLRT1VZ1oeD/oT7Vu9pCyy5msKpDn
	 uiXkSRS8WHsWA==
Date: Tue, 23 Sep 2025 18:30:33 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Yinon Burgansky <yinonburgansky@gmail.com>
Cc: jikos@kernel.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: Touchpad multitouch leaves ghost fingers
Message-ID: <iav7hzeaarxifwxk7zlfnt6vipqkp4h4ldt634exlvcswz62gj@a7ongaeduylz>
References: <CAEU-x4=Zs22b5LX_rsBVMu4BxvDfO+CZkkuWuVNaxv8mqvh9Gw@mail.gmail.com>
 <bjtev7sgmcafoysd53xrxih4nawn2dbq4odylwdglbub6td2a3@nhoxenprhjvy>
 <CAEU-x4kL45DAddmNahjR2C97+43jchpmXep++LbeP8cXLEWN-w@mail.gmail.com>
 <CAEU-x4nv3XnXchevtwN5mkVcxqnpgBobhavxZc7BjS7EgYG8Ng@mail.gmail.com>
 <c3plpgl2zsx4do2odwdeowodkkdnfqpexlwqg5a5mckyibxlge@qai35f5yeswy>
 <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEU-x4mJiBM_zKg1DaeJkKB3W3Ay08bUTc-D3QjFjDxNiZGd0g@mail.gmail.com>

On Sep 22 2025, Yinon Burgansky wrote:
> On Mon, Sep 22, 2025 at 7:51 PM Benjamin Tissoires <bentiss@kernel.org> wrote:
> > Well, I was meaning that I would provide a HID-BPF MR ready to install
> > for you.
> That would be awesome! Thank you very much!

Got something out with https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/204
that seems to solve your case on the hid-recorder you provided.

> 
> > But if you want to play with it, feel free to do so :)
> > For a jump start on HID-BPF:
> > https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html
> Thank you for the reference. I’m feeling quite fatigued from the
> debugging process, as it took me a considerable amount of time to
> identify the issue.
> It was surprisingly difficult to determine what exactly was wrong with
> the touchpad and to uncover the root cause; perhaps I didn’t search
> for the right terms.
> However, I’m glad I finally took the time to debug it, submit the bug
> report, and find out what was wrong. Thank you!
> 
> > The advantage of HID-BPF is that we can drop the file in the filesystem
> > and then forget about it.
> > My plan is to have the HID-BPF detect whether the quirk has been applied
> > or not and would gracefully remove itself once the kernel is fixed.
> That's cool, nice design.

Unfortunately I spoke too fast. The NSMU quirk is internal to the
hid-multitouch driver, and not exported in the struct hid_device. Thus
we don't have a direct access to the quirk. It should also be present in
the driver data of the hid_device or in the input_device, but in both
cases BPF prevents us to simply follow the pointers.

In the end, it shouldn't be an issue if you have both the fixed kernel
and the BPF because both fixes are not mutually exclusive.

> 
> > PS: please try to refrain from top-posting your reply. The usage is to
> > inline your reply or reply below,
> Sorry about that, hopefully I did it right this time.

Yep, much better this time. I didn't meant to be rude, but if you want
to interact with the LKML, some people gets angry about top posting and
would just send you a link without even reading your email. So better
having better habits :)

Cheers,
Benjamin

