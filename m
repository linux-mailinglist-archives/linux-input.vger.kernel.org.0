Return-Path: <linux-input+bounces-16449-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A78C9CD3C
	for <lists+linux-input@lfdr.de>; Tue, 02 Dec 2025 20:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3D4834B476
	for <lists+linux-input@lfdr.de>; Tue,  2 Dec 2025 19:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B892E0415;
	Tue,  2 Dec 2025 19:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="r45NfjcX"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47AAD2DFA40;
	Tue,  2 Dec 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704489; cv=none; b=qtnIMLe5SyACbbosSAIW8bKWvi1FxDJhIs9qCmBQnJFjmCwLsnqtUpYTfB+vRkpkfdv+U7efyxIcLJfEzWk9K+V/KDP5nVToMsB6ReD5ytRQ1r3kTeKSnCAYFVMgjdOzOzb8cwL4Qwqg1flsBDlRMdRPnA5z3hL3F+eZECxet20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704489; c=relaxed/simple;
	bh=VU6xe9yKAveOJ1OWyCpjn6aeuttRTUZKNIxd+LRdRcQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=oPCnZ1lzqt4xzqz1tDP/tT5KmpIHSd4h/nTRH9px+wRgsF8IjDjf5r3WlhICjlP1Kvj4ypYekwlBgDDO8LIqn/IK/2ckgrvH8+5sas2SIsHAM++x2ne4F/TohQAuxA7no8nqOxS1ybztDSqhMr6SzN8Z7tRWdKLYd3n2pmFliT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=r45NfjcX; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id 45EEC402F1;
	Tue,  2 Dec 2025 19:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1764704484;
	bh=VU6xe9yKAveOJ1OWyCpjn6aeuttRTUZKNIxd+LRdRcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=r45NfjcX1GbhAXTi+HN9ce00HYWvE9m4W6u+Wp4QZfMUgBvtpiGnqqXWjpa9qWqpb
	 dJLUPy7tc1ijkIFzHNqIl2tJJBFvwPwXCVN45uZLLEulWMGmlAb3STsckhdPX9gSGK
	 KcOp9UXmckLxEZeMQ6SnqOQLshLGgrCZD1QLxjlTijfy9ZD6Lmj6ynwuVhFfXLDJrU
	 iIkMkXL9N0iJqeMS6PK/MOaGuKCzVMczu0GGOBNqCv5hX1EpWVEvBervo+KQzq7m/i
	 Kbp3EEfsCI550ETNJtfcnMg/3JIGp8DFG+fBnc8484PlbeF9xMkpUBml7iJ7+mdjyk
	 GO91ycb6jkXfQ==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 02 Dec 2025 20:41:24 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
In-Reply-To: <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
Message-ID: <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Thank you very much for your feedback!

I can send you a new identical device for testing if you would like.

> Can you show us what packets are emitted?
> 
> If it's a firmware bug, we better have a specific driver for it could
> be a HID-BPF program that just filters out the unwanted reports.
> 
> Also, how does Windows behave with this mouse? Does it need a special
> driver?

Sorry, I should've mentioned the malformed packet also shows up on 
Windows,
but is seemingly ignored because there appear to be no side effects 
whatsoever.

No special driver needed, it's detected as a standard HID mouse.

WireShark capture:
https://dl.houseof.software/misc/atk_x1_se_malformed_packet.pcapng

Packet screenshot:
https://dl.houseof.software/misc/atk_x1_se_malformed_packet.png

> Looks like there is something wrong either in the report descriptor of
> this mouse, either in the emitted reports.

Definitely. I have already informed the manufacturer, who confirmed the 
mouse
has only been tested on Windows.

My inquiry was forwarded to their R&D team, hopefully a firmware update 
will
be released soon.

> Yep, this is on purpose because Miscrosoft's own driver works that way
> and many HID devices do not bother to mark the non constant bits as
> data. So if you enforce the spec here, you'll break a numerous of
> devices unfortunatelly.

> Ouch. If I read you correctly, you are rejecting the entire report if a
> constant field is not 0. It is common for constant fields to be just
> garbage (whatever is in the memory, because writing firmware is hard),
> so even if we were to accept this patch, this would break even more
> devices :(

> I am pretty sure the HID selftests will fail with this patch applied,
> because there are probably a couple of devices there with the "non
> constant" behaviour.

Oh, in that case let's just drop that part from the patch, since it's
actually not altering the behavior with this specific device.

The malformed packet is detected and rejected by two checks:

Malformed report: raw_len=1 payload_len=1 expected=8 (ID 0)
Malformed report: const slice OOB (bit_off 8, len 8)

