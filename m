Return-Path: <linux-input+bounces-13357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FFFAF6C58
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 10:02:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E5A1894541
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 08:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6822BE7BE;
	Thu,  3 Jul 2025 08:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVntPm7m"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A3E2BEFEF;
	Thu,  3 Jul 2025 08:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529689; cv=none; b=QIihv6wD5VjEW0zFPdNfSNOeJAWiGR1yUPZcIL1pNddUn9SxBcjXo0FFdiwl2NLVEHrsFgbbP79oMYJZVoQKHXmZI1QcXd/7G9kyWhPu6Si6hPRBqbvdcAN2KsXvzrE238phO95XRkY3QE4+5rh/BgDwj5Ntq6WWNIpUx9q34/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529689; c=relaxed/simple;
	bh=0R/79b7/zHxBbUcz7SkH4uoUwC8oBEx4uD3sypTtBgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8KzJchc2dDHsSN4gRN+FMRqBR6eozU4uDlg+ROLgSWdRJEfjbG5WpPEUJMM7aLNeFHoEfW7dD8Pukt5rtE9omLGQfXhy40WhRTuwO0zSRChfgZKlQXuT32FNGvd39wW3OUIbWoBSV8U8YV1aHtae5R7eV+BWkyenUaXZncUouo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVntPm7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1469BC4CEE3;
	Thu,  3 Jul 2025 08:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751529688;
	bh=0R/79b7/zHxBbUcz7SkH4uoUwC8oBEx4uD3sypTtBgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dVntPm7mwZSiztjYj5cAEt2Hpem62/62xRmyYp4/A1ybTwWn0GxdmNmLEHvrQtaRb
	 YskEiFD3rhZJD+6IiW6pnoQYoKjRiEKAhyfSqGqpu/y5wCUEZW5IMSdZJH3d/Pxt6x
	 D1bEJ/Zji26lIj6uNj4X4AIRNRS4SXGuWDnBCVGXSJ4V1hck77gRCi7X4H9RpIAPEW
	 LzeW6GB3M1AkOnrocAWXZbTbX5A6mbRGST0P6ksDPxAENDC2gTK5K2ZqRjJ63Kj9dr
	 Z8JMmQUPbxtV9MEykrYk4/PjoNiLLhPF9ZCUmcPk1TMtnLeoLxOS9JRaO4puvyfhTA
	 S8C6iulY774zQ==
Date: Thu, 3 Jul 2025 10:01:23 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	Rahul Rameshbabu <sergeantsagara@protonmail.com>, linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
Message-ID: <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-4-sergeantsagara@protonmail.com>
 <aGD9OIZ_xE6h3199@pollux>
 <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet>

On Jul 03 2025, Jiri Kosina wrote:
> On Sun, 29 Jun 2025, Danilo Krummrich wrote:
> 
> > (Cc: +Jiri)
> 
> Thanks.
> 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index c3f7fbd0d67a..487750d9fd1e 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -10686,6 +10686,13 @@ F:	include/uapi/linux/hid*
> > >  F:	samples/hid/
> > >  F:	tools/testing/selftests/hid/
> > >  
> > > +HID CORE LAYER [RUST]
> > > +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
> > > +L:	linux-input@vger.kernel.org
> > > +S:	Maintained
> > > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
> > > +F:	rust/kernel/hid.rs
> > 
> > I assume this is agreed with the HID CORE LAYER maintainers?
> > 
> > There are multiple possible options, for instance:
> > 
> >   1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
> >      Optionally, the author can be added as another maintainer or reviewer.
> > 
> >   2) Add a separate MAINTAINERS entry; patches still go through the same
> >      subsystem tree.
> > 
> >   3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
> >      tree (e.g. because the subsystem maintainers don't want to deal with it).
> 
> I can't speak for Benjamin, but as far as I am concerned, I'd personally 
> prefer option (3).

I understand Jiri's concerns, but I'm slighlty worried (3) will end up
also having the leaf drivers in a separate tree, which means that 2
trees will fight for the same resource.

First patch of this series is a first example where some changes are
needed in the HID bus for making rust life's easier.

Personally, I'd like to have a say and an eye on the rust abstractions
and most of it, on the leaf drivers. I can't say I'll proactively
review/merge things (these past few months have shown that I merely
manage to follow things happening ATM), but at least I can keep an eye
and shout if something is wrong.

OTOH, the HID tree (the core part) is a low change tree now, so maybe a
separate tree can be handled correctly without too much troubles.

Danilo, if a separate tree is chosen, is the common practice to directly
send the PR to Linus or does it need to got through the subsystem tree
first (like bpf with net for example).

Cheers,
Benjamin

