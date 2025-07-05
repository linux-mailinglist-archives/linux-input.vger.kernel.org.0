Return-Path: <linux-input+bounces-13389-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78903AF9FC0
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 12:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE951C4698A
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 10:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D78A1B0F1E;
	Sat,  5 Jul 2025 10:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HF8RzZ4U"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D7E2E371C;
	Sat,  5 Jul 2025 10:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751712889; cv=none; b=Tf7ftEZhH9+cMhtBwGzHleab6sNE4pOGwWkj06Z0D0d/Q5MEkoxuZE7+vXEB+DHGIOWFSUheeJbMZJMzkvzWNfZTdL3sCvdmRDvOsO6CKOYbu7iQI1N7nFVuXdhDLlGZMrNo3rT18AYz8n96bVO+30w3iOTb8opmdr4H2QjYDI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751712889; c=relaxed/simple;
	bh=fm293cnHVd262ggoebSzQlIMy5g0sp5/WmDYhXVQYso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hFgBPTmB4VrQ6ZyL1n3LG7KAnqCf7GnWO1RfoGlPm8o7Hs+k2gZ2WCTWVac3fc4upMiBdfIRotCbji41EOqjWRHHG8zoZyZgh7Pndx1Nj9OPgLiQkm23Z9r8awim9hvVNuXYwxz8lNbqF3t/EsKqiWYhUrtrCgoVSFm+QCyjCTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HF8RzZ4U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71998C4CEE7;
	Sat,  5 Jul 2025 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751712888;
	bh=fm293cnHVd262ggoebSzQlIMy5g0sp5/WmDYhXVQYso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HF8RzZ4U5+/6NKIY5e1vBo8whJ/MVRlzrcyDYV5r0kwFMvEMKZwoBc48+59g0JaGa
	 hUv14bbwBr+CRvk97pTY09NxEZAPR2DC1CqcJvKzrJLcDgrXzuLuCBbf6IEPeTRIvv
	 fy3timtcVmlDRNmFqLmDeM9VCqcG/JHVkxGvbv8ArT5x7NDV1Q9eQ0JL/nqMtIp6VB
	 mjIk/G7TEVoEK9WqfQ0F5n8jZxdqLr7y2++6gUT5mt8Kx9TG4SWfGhRNP2E8ZJusD1
	 WFHg05WeF5cVdQU3YOMPp/TXWnZ70bbEd5FBLOq+JdlJ0KtveWhDIUwV9xpl4BKd57
	 jZe+yhQTlbznA==
Date: Sat, 5 Jul 2025 12:54:42 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
Message-ID: <aGkEcrKJsvFelWju@pollux>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-4-sergeantsagara@protonmail.com>
 <aGD9OIZ_xE6h3199@pollux>
 <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet>
 <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4>
 <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org>
 <87frfbksam.fsf@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frfbksam.fsf@protonmail.com>

On Sat, Jul 05, 2025 at 07:31:21AM +0000, Rahul Rameshbabu wrote:
> In parallel, I am thinking about how to design a Drop trait for handling
> HID device unplug instead of needing a C style remove callback. This
> will be crucial for implementing sophisticated leaf drivers.

Please have a look at how other bus abstractions are implemented, e.g. platform,
pci, auxiliary.

They all have a probe() function in the Driver trait, which returns a
Pin<KBox<Self>>, i.e. the drivers private data.

This ForeignOwnable is then stored in the private data pointer of the C struct
device, which I'm adding generic accessors for in [1].

On driver remove() this ForeignOwnable is extracted back into a Pin<KBox<Self>>
and dropped.

This means there's already Driver::drop() which is called on device unplug.

However, this is not sufficient, because Driver::drop() only gives you a &mut
self, i.e. a reference to Pin<KBox<Self>>, but not a Core context reference to
the Device, i.e. &Device<Core>. Hence you need a separate Driver::unbind()
callback. Please see [2] for that.

[1] https://lore.kernel.org/all/20250621195118.124245-3-dakr@kernel.org/
[2] https://lore.kernel.org/all/20250621195118.124245-7-dakr@kernel.org/

