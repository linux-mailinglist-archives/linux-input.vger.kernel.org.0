Return-Path: <linux-input+bounces-13387-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D9AF9EC5
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 09:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E56563AF6F8
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 07:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26A6919DF4A;
	Sat,  5 Jul 2025 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="zfNQ1xla"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA625175A5;
	Sat,  5 Jul 2025 07:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751700698; cv=none; b=qnwLVdJmJYJMJdagDwKZfYPVxLGf4mWLYKsaRWy7CSnl7b8mMNG7NSSuXBjXesW1i8RmEL5i+DPC3VuOHVf3ncLUrHfZKjBL1T8vTzBj03a4YohfPEyiYYxg/Vwbwin/ZWBpA4OeYTIZAa8LqZDIWWICTLNdeYexTQByb3mKcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751700698; c=relaxed/simple;
	bh=9ZoUw5Hl/3qhmjyhcjKqY9i+D8ng2zzbXo8jy3DQEhQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xo4ZhOiwpcFIQ8hoXehkAYySRKaa9MGp8YTRqbBdxRCIfC9GNFYRkiD4qYEhrZeeXDRGcI3xiIoccyq2zDiay6H22W+WtIXiFeDjtBq83r9n/pGI15QY2bw9ftT1m7HgpOhqQqYYrAJ9EL+uYPx9od9UIJCCGmYvzA4O/76LAno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=zfNQ1xla; arc=none smtp.client-ip=79.135.106.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751700686; x=1751959886;
	bh=J3XdgSpKZ1wBoY+0lETsQNnQofaKx79OW1d3zjVSCLg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zfNQ1xlaNx7V8yLaz4lP7xIsaqQS0wZ/47g+El+5IFtYPIDixJbEbLaOYrs4CcfIN
	 dxViWsblCSzmIriZS7/Np/Yc5OkT7oZfjzmJaLtXPL9+ZKLmdi3YN/0wibt4/exvDk
	 FxPtHQNvkCuAXOrMOYlzuRSRziADWUrfOWAopMG1WPc+B5XrC5+ZIsCAgrEPJuBnuQ
	 QaiGul/jxAwtpGmyb49Y/VAFcRPNbXQYIE9QQfCGDDKBWXb8XhxGTM2WRvimmdW1qS
	 Z+PQz1MFJEBHIY8d3THmBPsxzCFQFyl7QlLk13TD/rExsnoOO2vjGZ9GreUHSlIgJd
	 PoWwtnUywdqww==
Date: Sat, 05 Jul 2025 07:31:21 +0000
To: Danilo Krummrich <dakr@kernel.org>
From: Rahul Rameshbabu <sergeantsagara@protonmail.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Brooks <db48x@db48x.net>
Subject: Re: [PATCH v1 2/3] rust: core abstractions for HID drivers
Message-ID: <87frfbksam.fsf@protonmail.com>
In-Reply-To: <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com> <20250629045031.92358-4-sergeantsagara@protonmail.com> <aGD9OIZ_xE6h3199@pollux> <8os57581-8q0n-p226-836s-52610166qq02@xreary.bet> <p2tuq2a77dpl3ku7a6dbwqgsk5yybemqcfyoozjl5k3auijxqk@7myvbre2aam4> <0b7c2a9b-9cdc-41e9-bdaa-ddd8b0807449@kernel.org>
Feedback-ID: 26003777:user:proton
X-Pm-Message-ID: 90fe8011a0209a46b8686dc6cc7f4d0288e76faf
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul, 2025 10:20:19 +0200 "Danilo Krummrich" <dakr@kernel.org> wr=
ote:
> On 7/3/25 10:01 AM, Benjamin Tissoires wrote:
>> On Jul 03 2025, Jiri Kosina wrote:
>>> On Sun, 29 Jun 2025, Danilo Krummrich wrote:
>>>
>>>> (Cc: +Jiri)
>>>
>>> Thanks.
>>>
>>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>>> index c3f7fbd0d67a..487750d9fd1e 100644
>>>>> --- a/MAINTAINERS
>>>>> +++ b/MAINTAINERS
>>>>> @@ -10686,6 +10686,13 @@ F:=09include/uapi/linux/hid*
>>>>>   F:=09samples/hid/
>>>>>   F:=09tools/testing/selftests/hid/
>>>>>
>>>>> +HID CORE LAYER [RUST]
>>>>> +M:=09Rahul Rameshbabu <sergeantsagara@protonmail.com>
>>>>> +L:=09linux-input@vger.kernel.org
>>>>> +S:=09Maintained
>>>>> +T:=09git git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
>>>>> +F:=09rust/kernel/hid.rs
>>>>
>>>> I assume this is agreed with the HID CORE LAYER maintainers?
>>>>
>>>> There are multiple possible options, for instance:
>>>>
>>>>    1) Maintain the Rust abstractions as part of the existing MAINTAINE=
RS entry.
>>>>       Optionally, the author can be added as another maintainer or rev=
iewer.
>>>>
>>>>    2) Add a separate MAINTAINERS entry; patches still go through the s=
ame
>>>>       subsystem tree.
>>>>
>>>>    3) Add a separate MAINTAINERS entry; patches don't go through the s=
ubsystem
>>>>       tree (e.g. because the subsystem maintainers don't want to deal =
with it).
>>>
>>> I can't speak for Benjamin, but as far as I am concerned, I'd personall=
y
>>> prefer option (3).
>>
>> I understand Jiri's concerns, but I'm slighlty worried (3) will end up
>> also having the leaf drivers in a separate tree, which means that 2
>> trees will fight for the same resource.
>>
>> First patch of this series is a first example where some changes are
>> needed in the HID bus for making rust life's easier.
>>
>> Personally, I'd like to have a say and an eye on the rust abstractions
>> and most of it, on the leaf drivers. I can't say I'll proactively
>> review/merge things (these past few months have shown that I merely
>> manage to follow things happening ATM), but at least I can keep an eye
>> and shout if something is wrong.
>>
>> OTOH, the HID tree (the core part) is a low change tree now, so maybe a
>> separate tree can be handled correctly without too much troubles.
>>
>> Danilo, if a separate tree is chosen, is the common practice to directly
>> send the PR to Linus or does it need to got through the subsystem tree
>> first (like bpf with net for example).
>
> We usually fall back to the global Rust tree, which is ultimately maintai=
ned by
> Miguel, so it's his call in the end.
>
> However, IMHO this is more like a "last resort" in case any other approac=
hes
> within the same subsystem are not desired.
>
>  From what I can read above, it feels to me as if having a separate tree
> (maintained by Rahul) with him sending pull requests to you guys seems li=
ke a
> good option. What do you think about that?

First wanted to say thanks to everyone who responded to this series.
I am personally open to any of the above.

From what I can tell, Jiri and Benjamin would prefer pull
requests/discussion of the Rust for Linux bindings not contaminate the
hid git tree or linux-input mailing list. Patches will instead be
submitted through the rust-for-linux mailing list and pull requests
would be sent through the Rust for Linux tree. I can make Benjamin a
reviewer for this effort, so he will be explicitly CCed to take a look
at how the bindings are taking shape. I can make Jiri a reviewer if he
would like to participate (I was assuming maybe not based on the desire
for option 3 listed above). Maybe with this model, I have a
rust-for-linux-hid tree where I send pull requests to the rust-for-linux
tree?

On the other hand, Danilo would prefer something similar to the above
with the caveat of pull requests going through the hid tree and patches
through linux-input mailing list.

I am open to either personally.

I will be sending a v2 hopefully soon based on Danilo's and Peter's
feedback.

In parallel, I am thinking about how to design a Drop trait for handling
HID device unplug instead of needing a C style remove callback. This
will be crucial for implementing sophisticated leaf drivers. The driver
implemented here purely does report fixup. In my ideal world, all pure
report fixup work would be done in HID-BPF space and only sophisticated
drivers would be implemented as a Rust leaf driver. I have some separate
scratch work playing around HID-BPF that I have not had time to clean
up. Right now, it's just samples for doing things like key remapping on
a keyboard. I am envisioning an Alsa UCM like model for HID-BPF for
dealing with report fixups.

--=20
Thanks,

Rahul Rameshbabu


