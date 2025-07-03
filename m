Return-Path: <linux-input+bounces-13358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2C6AF6CAB
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 10:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 979D44E81C2
	for <lists+linux-input@lfdr.de>; Thu,  3 Jul 2025 08:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 148202C326C;
	Thu,  3 Jul 2025 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1lDWpr6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF01D9694;
	Thu,  3 Jul 2025 08:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751530825; cv=none; b=b8YP2osrudFKLYGOct1SmEeE/Sgg8pglMBp53WLBblMJ5Gjy6kJpfd1JNwtJZpD84LPM1VDK+nN3e3dfhWLIb7mfZg9aDAkdlexNxUvd751Matuwp53Io9uvhgMW5zxsE2Zned8UyWOavjUYuqjTLz/6vqbPfeby+JwDX21TxXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751530825; c=relaxed/simple;
	bh=onW2/V8pm6PJLCQrfUQi+7kAgJh7tQlPpsCTdk7wVBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rkb20H0MjVGB/irE1TcNSjWAfjDuPR6I0HZKm25T5h10H+WQxcAm59dIWlm3+eP7sodIpoL+qD4ghFDsc6PRAUFtwUmblW6ATFLmDI+VFxuiWHThKnlHt81kG1w5vCt3rGcUAaxuaJvwwVsM8ruTyGsks8psZx5UdbPg/xTeNtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1lDWpr6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B464C4CEF1;
	Thu,  3 Jul 2025 08:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751530824;
	bh=onW2/V8pm6PJLCQrfUQi+7kAgJh7tQlPpsCTdk7wVBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T1lDWpr6mAAQJauZdmwolwQ/4vur+P13xI1yBTXOYMq9X7Iw6/NgvbiNaQnm7dtMn
	 sA3brOe5wJb+vxQZk2gN4G+a1BVUQ47KuRBgiyELCz4FTYSOvN/6UjZV7tYe2tjIgY
	 JCigfibpQap5jzdlhmecFcZhAxl6V9K16MSa7a0841WUmpjF58xaeyQNzSd1kiIAF9
	 tBIMZmQsJAJy5GEHCjfKx9Z7wf4VjSVMvHKRcbxlysnkCbY1jsiyvCUbAroY8Nn1BM
	 fcjWggfb84AEJU1AvxVNosc+ns1kH220BZwXB6fZMCVNULBFpBkumEmVHdvrdvgTPG
	 nYFfa4v2ryugA==
Message-ID: <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org>
Date: Thu, 3 Jul 2025 10:20:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
 Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Daniel Brooks <db48x@db48x.net>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
 <20250629045031.92358-4-sergeantsagara@protonmail.com>
 <aGD9OIZ_xE6h3199@pollux> <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet>
 <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 10:01 AM, Benjamin Tissoires wrote:
> On Jul 03 2025, Jiri Kosina wrote:
>> On Sun, 29 Jun 2025, Danilo Krummrich wrote:
>>
>>> (Cc: +Jiri)
>>
>> Thanks.
>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index c3f7fbd0d67a..487750d9fd1e 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -10686,6 +10686,13 @@ F:	include/uapi/linux/hid*
>>>>   F:	samples/hid/
>>>>   F:	tools/testing/selftests/hid/
>>>>   
>>>> +HID CORE LAYER [RUST]
>>>> +M:	Rahul Rameshbabu <sergeantsagara@protonmail.com>
>>>> +L:	linux-input@vger.kernel.org
>>>> +S:	Maintained
>>>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>>>> +F:	rust/kernel/hid.rs
>>>
>>> I assume this is agreed with the HID CORE LAYER maintainers?
>>>
>>> There are multiple possible options, for instance:
>>>
>>>    1) Maintain the Rust abstractions as part of the existing MAINTAINERS entry.
>>>       Optionally, the author can be added as another maintainer or reviewer.
>>>
>>>    2) Add a separate MAINTAINERS entry; patches still go through the same
>>>       subsystem tree.
>>>
>>>    3) Add a separate MAINTAINERS entry; patches don't go through the subsystem
>>>       tree (e.g. because the subsystem maintainers don't want to deal with it).
>>
>> I can't speak for Benjamin, but as far as I am concerned, I'd personally
>> prefer option (3).
> 
> I understand Jiri's concerns, but I'm slighlty worried (3) will end up
> also having the leaf drivers in a separate tree, which means that 2
> trees will fight for the same resource.
> 
> First patch of this series is a first example where some changes are
> needed in the HID bus for making rust life's easier.
> 
> Personally, I'd like to have a say and an eye on the rust abstractions
> and most of it, on the leaf drivers. I can't say I'll proactively
> review/merge things (these past few months have shown that I merely
> manage to follow things happening ATM), but at least I can keep an eye
> and shout if something is wrong.
> 
> OTOH, the HID tree (the core part) is a low change tree now, so maybe a
> separate tree can be handled correctly without too much troubles.
> 
> Danilo, if a separate tree is chosen, is the common practice to directly
> send the PR to Linus or does it need to got through the subsystem tree
> first (like bpf with net for example).

We usually fall back to the global Rust tree, which is ultimately maintained by
Miguel, so it's his call in the end.

However, IMHO this is more like a "last resort" in case any other approaches 
within the same subsystem are not desired.

 From what I can read above, it feels to me as if having a separate tree
(maintained by Rahul) with him sending pull requests to you guys seems like a
good option. What do you think about that?

