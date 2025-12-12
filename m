Return-Path: <linux-input+bounces-16548-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E87CB807F
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 07:29:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BFCDB30463AD
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 06:29:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A21276046;
	Fri, 12 Dec 2025 06:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="xdCj1bkH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0AA14B953;
	Fri, 12 Dec 2025 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520987; cv=none; b=UyjqovvMM4w6gfsudq+Y1Zhr0x4fSpYNiD8glbNEQXwxWoA+gWgh5Vxn2mxLIhDhk5PPjdirEPPqO2uZztiQs6OQNefYHu3KaWiJe+z3YTBiEgARymW7X6mRV0yCv12NA2J2vfX0HfRPcWP7/N42VWljHRxU2sy7qbB1U0NRMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520987; c=relaxed/simple;
	bh=HOsxPSpY9rW1giucmzrAXn1gOsStWPjYz+hphi/fRj0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=aufjpk++aqmNqOIOwfznujBlUT0a6zZmv7djdwM5sA3auj2S2y2DLjCdO4VkZkjTEwTg0p6Uh99Y8Wwi9eQ4TuGewEMzuKgZ4aTG1qGvU318IzveNO+zf0DzzzCXWinpdRfRAAa7C5e0Zt6OF9hChM5Xgiboz6bb8kL3MB3RrCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=xdCj1bkH; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id D660940CA6;
	Fri, 12 Dec 2025 06:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1765520547;
	bh=HOsxPSpY9rW1giucmzrAXn1gOsStWPjYz+hphi/fRj0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=xdCj1bkHo8IaPg33AxmRIT5KBsTiSXmS0k0EVTCLPK7u4+sZcjmm6ZONKzTHtXPzc
	 yM3x7K4/8NslguSq2ApwdtXmUTo1Of5PiSXPur0lUBmXF2hn0jOf0U2h3pyVIl3tBG
	 8DlgzYhA8G04Ih8ytL2sM9OnOk32omQ7xYoXDEWND5BBbaKZ2KXgshO1yH2ZmNRB07
	 d+FZnaBmZ1XHD/6px6ifS+a14f8YJ8us0eoVVMJdKruewpJC9I/AiWplzXt1/jQTEj
	 RXjJkESFGUbsmoEDEs5uljHUqOq2YADENCo/xn6sG9daHBLfZ7MECWBc6b/fdPJYHv
	 C0xKawd7EnK9Q==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 12 Dec 2025 07:22:27 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
In-Reply-To: <iq4fdv5yak7xqiitlsmglsulsdzqaklsqdcv2rxswsduwqxfpy@lknyfow3yxwg>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
 <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
 <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
 <b3131f6c322ac4c62c4b00142b55fde7@davidebeatrici.dev>
 <8aefde3322ab7676034cae9d291fc5b6@davidebeatrici.dev>
 <iq4fdv5yak7xqiitlsmglsulsdzqaklsqdcv2rxswsduwqxfpy@lknyfow3yxwg>
Message-ID: <e2db2ad2b8bb21916a22695191e7763c@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> IMO, the simplest is the HID-BPF route, as it's a matter of going to 
> the
> udev-hid-bpf project [1], add your program in the testing dir, and
> submit a merge request. This way your device will be fixed and I'll
> eventually take care of putting the HID-BPF program in
> drivers/hid/bpf/progs so it gets installed in all distributions.

I apologize for the delay, I had to figure out why OpenMandriva's kernel 
was
not exposing the hid_bpf_ops structure.

Turns out CONFIG_HID_BPF had to be enabled and CONFIG_FUNCTION_TRACER 
too.

Here's the merge request for udev-hid-bpf:
https://gitlab.freedesktop.org/libevdev/udev-hid-bpf/-/merge_requests/212

> have a new kernel driver for this device which maps to .raw_event()
> and rejects reports of size 1.

I actually just realized my previous mouse, a Kysona M600, has a 
specific
driver (hid-kysona) that seemingly handles battery status reports.

That may be the cause for it randomly stopping registering clicks and 
scrolls
until it is moved (i.e. registers a movement).

But that's a story for another thread!

I wonder if we can put together a single universal driver for these 
devices...

