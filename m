Return-Path: <linux-input+bounces-16467-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C3ACA52BE
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 20:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94D01306FDFB
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 19:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E14022F12CF;
	Thu,  4 Dec 2025 19:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b="HvjPPka+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.softether.network (mail.softether.network [103.41.62.250])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912114A91;
	Thu,  4 Dec 2025 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.41.62.250
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764877743; cv=none; b=foOKK8oRuvyA/KcIq4p+cnPEGVvQcvCFhdVUBSgRZMQlDEajYYDtarbckxQYwFCHMHF6IVbtLg/0SBj8aUwVetx8CR5zpt7DBtnidtpPv7lSbB7rjokKSgS5Fh9jHwNOHsCD3uq8l77nEsvF+sCgaFcrzaewbQfXDU8bEE6y5tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764877743; c=relaxed/simple;
	bh=BdCWVqNl4C6+11aUK3XcWa5cb0avzgxuWyT5k2TtkXM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BG/VmsGfHuwYs3Sm4LL6lKwQOXL+YYr5V7bGyBE9gQX0seCxHL+7uX+VW0sDnUcFPMKOoy3VkI0NAdYoZfO+Tcw+9FJJjJHaI9bkJXr6xxs0xSJAmkzKWcNhpOpjdYc2ROFkqMpIapUeZCNm0hBQ+vi8pP+AXp5gknE4U8bq7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev; spf=pass smtp.mailfrom=davidebeatrici.dev; dkim=pass (2048-bit key) header.d=mail.softether.network header.i=@mail.softether.network header.b=HvjPPka+; arc=none smtp.client-ip=103.41.62.250
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=davidebeatrici.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=davidebeatrici.dev
Received: from mail.softether.network (localhost [127.0.0.1])
	(Authenticated sender: me@davidebeatrici.dev)
	by mail.softether.network (Postfix) with ESMTPSA id CDD30407BE;
	Thu,  4 Dec 2025 19:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mail.softether.network; s=2025; t=1764877730;
	bh=BdCWVqNl4C6+11aUK3XcWa5cb0avzgxuWyT5k2TtkXM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HvjPPka+2OuIAEQ1xvMbvexd8AKMK1AyXhVuThUy/HExstPOncQZ2qpJQP131JYw6
	 z5WNvSsYKNvqTwiZxk0/t8Z8HZEgy1/RjsHwQXLvjALGFLJc7aVNlE/6sxPN26/7eG
	 zejolCXAS3kyYahsSyACHsbKahMTNGsibh8x25toEOFMb42WLCj+xxNOesVzYTVmiL
	 pU8Q4XbLm/uNWY93tOlNWpcDmyyaSzS2e2m5be/bjbbnm5GJ7Vn9CZEgG1jfRq+N26
	 B9TKw1cJu4XfametK2zYly9xy25JIgh876nVoMuXJyFowtYyNTVPkxtLSaMmgiJ01R
	 NNM1ouQFUjd2Q==
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 04 Dec 2025 20:48:50 +0100
From: Davide Beatrici <me@davidebeatrici.dev>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
In-Reply-To: <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
 <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
 <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
Message-ID: <b3131f6c322ac4c62c4b00142b55fde7@davidebeatrici.dev>
X-Sender: me@davidebeatrici.dev
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

> However, the device also shows an output report of size 1, but it is 
> not
> supposed to send it as an input report. I wonder if the firmware bug is
> not that it tries to give the host the current state of its output
> report at plug (which is wrong but Windows must be papering over it).

On that note, I noticed the malformed packet is not sent upon 
reconnecting the
device if it's been plugged in for some time.
When that happens I can reproduce the issue by enabling a wireless mode 
through
the switch on the bottom and wait a bit before disabling it and 
connecting the
device again.
I suspect the battery gets slightly discharged and the device sends a
"charging complete" signal or something.

> - the URB is of size 1, so the fact that the constant field is not 0
> means that we are just reading random memory at offset 1 in the
> provided data, so you might have a chance that it eventually becomes 0

Good point, if it's effectively random memory we cannot rely on that.

> - the fix should be focusing on the length of the provided report, not
> on the content. However, in hid_report_raw_event(), just before you
> inserted your call to your hid_validate_report(), there is already a
> check on the length of the report which memsets to 0 the rest of the
> buffer. This seems a little bit optimistic if the provided buffer from
> USB is exactly the size of the provided "size" argument.
> But then, why would you get random data in the const fields if there
> is a memset if the provided length is "1"?
> 
> So, can you add a printk before your call to hid_validate_report() to
> show the provided "size" argument (csize), or just enable the hid_dbg()
> trace output which should tell us if we enter that test and do the
> memset (which I suppose we are not).

report 8 has csize=16 rsize=16
report 0 has csize=1 rsize=8
report 0 is too short, (1 < 8)

Which means we do enter the test and execute the memset()...

