Return-Path: <linux-input+bounces-16482-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B5ECAC8F8
	for <lists+linux-input@lfdr.de>; Mon, 08 Dec 2025 09:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E138F305A13A
	for <lists+linux-input@lfdr.de>; Mon,  8 Dec 2025 08:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6232E5437;
	Mon,  8 Dec 2025 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6EMxuqM"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6387A2E764B;
	Mon,  8 Dec 2025 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765184080; cv=none; b=uLSStgmLCDLl0ydnAv22E6xEAJJVur6TxqzVYMRxcO63Mx8zjuj5X5S6Bm3RINlaIgfDO8bjHkYWBGWdemQ9e8QStbe+LXhWN3bGvgMupKgEM/bjIKRBPVZHbzg1ZaAwD/W5DI3UE0oqf3LZY8BWRSxCZRSii/x1SxxdoZpbobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765184080; c=relaxed/simple;
	bh=GFQBlHl/cjRJEtNWthioMvgheVzFKVtdy2AoEqBl/AA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd2TSt9f8z8LuyaDkF/4jXCqPLqgwSyJQRYHm5Vae23CiS/njeYCGWD+PhAaGKEJ314gBQVQFJh7bAhfu4O4GMQGwLWFdF2WSwt3Xnvcq1O631h2dyoqTipdBdG8NU41J4pF8Mg9tvPyb4S2odbHzZ/aK6dCB0ZHpkm8G5FSfT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6EMxuqM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A425C4CEF1;
	Mon,  8 Dec 2025 08:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765184080;
	bh=GFQBlHl/cjRJEtNWthioMvgheVzFKVtdy2AoEqBl/AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6EMxuqMb8tCgNyvDgyTthSEuVTGbCu3ZfQVLrzOM14HyTXb6mr7BCWzWMb61NlCi
	 8x9as21YoF/WMgee3cOyMFe7xWbYJBg4qSBM+y41m3n6ulb1U3UbEj0zSw9r8bBEr+
	 4764K1e+lVVlS8IFJbsj6iJPusqnB3MU/b9uf/HjXM5ZDkOs0/i0Tx4JTVenWq1iH7
	 wu2dn7/fUSpn4JZec6Us3yfBshK1XJ/N/42sEQ5bFQNRJjviaXkRMPDKujju8ME9jj
	 W8dsm6bnfG8+/Uket6uLmcQ0bKepGtT/wTCKpZwXFZW7Iildz9c4URss09IkqsL/Pd
	 JXRtEe5THfKLg==
Date: Mon, 8 Dec 2025 09:54:35 +0100
From: Benjamin Tissoires <bentiss@kernel.org>
To: Davide Beatrici <me@davidebeatrici.dev>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, jikos@kernel.org, 
	benjamin.tissoires@redhat.com
Subject: Re: [PATCH] HID: validate report length and constants
Message-ID: <iq4fdv5yak7xqiitlsmglsulsdzqaklsqdcv2rxswsduwqxfpy@lknyfow3yxwg>
References: <235531f556c5abfcae254a4e56441ba6@davidebeatrici.dev>
 <xyh6scqrfzft3hhmqowyverzezb2xsmsexegk3sydyfbiknba4@6sy3qbtsinrr>
 <a7d352dd1d310bf07263106f2ce0f8ed@davidebeatrici.dev>
 <91117308-7eb5-4258-ac87-1afb2d46d2b5@cosmicgizmosystems.com>
 <9e44de7bab6967a200d7404ebb068071@davidebeatrici.dev>
 <dob7q77qxuv3rmr4kliqp5kic36updvh6qxj4ld2be353zi7ba@5qte5m5fsuwy>
 <b3131f6c322ac4c62c4b00142b55fde7@davidebeatrici.dev>
 <8aefde3322ab7676034cae9d291fc5b6@davidebeatrici.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8aefde3322ab7676034cae9d291fc5b6@davidebeatrici.dev>

On Dec 05 2025, Davide Beatrici wrote:
> > report 8 has csize=16 rsize=16
> > report 0 has csize=1 rsize=8
> > report 0 is too short, (1 < 8)
> > 
> > Which means we do enter the test and execute the memset()...
> 
> I added further debug prints to trace the flow after that:
> 
> hid-generic 0003:373B:1107.000F: report 8 has csize=16 rsize=16
> hid-generic 0003:373B:1107.000F: Calling hiddev_report_event()
> hid-generic 0003:373B:1107.000F: Calling hidraw_report_event()
> hid-generic 0003:373B:1107.000F: Calling hid_process_report()
> hid-generic 0003:373B:1107.000F: Calling hidinput_report_event()
> hid-generic 0003:373B:1107.000E: report 0 has csize=1 rsize=8
> hid-generic 0003:373B:1107.000E: report 0 is too short, (1 < 8)
> hid-generic 0003:373B:1107.000E: Calling hidraw_report_event()
> hid-generic 0003:373B:1107.000E: Calling hid_process_report()
> hid-generic 0003:373B:1107.000E: Calling hidinput_report_event()
> hid-generic 0003:373B:1107.0010: report 0 has csize=7 rsize=7
> hid-generic 0003:373B:1107.0010: Calling hidraw_report_event()
> hid-generic 0003:373B:1107.0010: Calling hid_process_report()
> hid-generic 0003:373B:1107.0010: Calling hidinput_report_event()
> 
> The last report is a normal mouse movement.

Thanks for the logs.

So the most conservative change should be to either:
- have a HID-BPF program that strips out reports of size 1
- have a new kernel driver for this device which maps to .raw_event()
	and rejects reports of size 1.

AFAICT, all the transport drivers are allocating the buffer with enough
space, so the memset should be safe, meaning that we can not enforce
the size to be at least the report size without risking of breaking
devices as this code has been around for a while.

IMO, the simplest is the HID-BPF route, as it's a matter of going to the
udev-hid-bpf project [1], add your program in the testing dir, and
submit a merge request. This way your device will be fixed and I'll
eventually take care of putting the HID-BPF program in
drivers/hid/bpf/progs so it gets installed in all distributions.


Cheers,
Benjamin

[1] https://gitlab.freedesktop.org/libevdev/udev-hid-bpf

