Return-Path: <linux-input+bounces-5751-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA75195C3CE
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 05:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A9FDB2348D
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 03:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BCC3987B;
	Fri, 23 Aug 2024 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ0lsDik"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31126AF6;
	Fri, 23 Aug 2024 03:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724384677; cv=none; b=fvwDhoJC5BfFhSqBpIgQlBwJ3xJJ7BZuW1uGaRxzlkC65YI4MhbwSS0xpdAC+fqcFnOdhBxDdm9hlRcQ15ONbPjLCk61f3anorvA7AdyjvyhadL6cRftDgkHfK5V7wcGJyXmJL1X5hyQ1359UvF9wHHEtM6Kp6NEuyVpz4d/t7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724384677; c=relaxed/simple;
	bh=/YUaBwcec+lGu7wuHBNGfUXqG9aF13coT4vqLy/uLxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nO0QvCHDghG7TXEgu4OFdI8QWuQn9xhwBFxoEI6qIlAzgV2qCXv0iKIqW/GiV7sHjIImybJCO9femyx8gboZH/H9ee1gZanrMUh5opLuxffzUo+5GEglnb9SYKupxh/stJUBY9ifbRgzpGGs5oov1Vxd6c0dK6/OS05fqBIFkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ0lsDik; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E1FC32786;
	Fri, 23 Aug 2024 03:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724384677;
	bh=/YUaBwcec+lGu7wuHBNGfUXqG9aF13coT4vqLy/uLxQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQ0lsDikQfwmRiAXX26XCNq+KbzGnGjP+d/3x4ap9M3ZWC3AeyUwBguPfcFysHm1p
	 ECnnBb/N+gPRi0t1NG7yrZKQNSpqG/FMSxXsr1xPPIME8rLlG69UdqAdUzYP0CbG90
	 XrtFPyGfzCTbXJiH16D8Xqqkp5fBmbPLHEMb62jVnC2ZnbwCUmW+FunkSkouCIs+Wi
	 kEyuxp5HFVrfJzV24khXoW2t1RPLMbcUiLcHHCrOq0G5h+OWQOI2LsENGmwYPa9QzG
	 W4zsnMdPmqlTaECNBFAnOZ4yIH3FB9/2mfBej4M1UCri5noQCgRRoPvwvQdudL1Afp
	 5DXBNYHkZvsIA==
Date: Thu, 22 Aug 2024 20:44:36 -0700
From: Kees Cook <kees@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Erick Archer <erick.archer@outlook.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [RFC] HID: ishtp-hid-client: replace fake-flex arrays with
 flex-array members
Message-ID: <202408222044.7EA51146E@keescook>
References: <AS8PR02MB723760CB93942370E92F00638BF72@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <80976997acb82fe3e6ba54fa2708c8f40fb3eb00.camel@linux.intel.com>
 <AS8PR02MB723798FF6CEF28DCB62FAC958BC42@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <4e68c0164022ca41494c6d577766dd4b66c93e9f.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e68c0164022ca41494c6d577766dd4b66c93e9f.camel@linux.intel.com>

On Tue, Jun 11, 2024 at 11:26:25PM -0700, srinivas pandruvada wrote:
> On Sat, 2024-06-08 at 11:56 +0200, Erick Archer wrote:
> > Hi Srinivas,
> > First of all, thanks for looking at this ;)
> > 
> > On Sat, Jun 08, 2024 at 01:42:54AM -0700, srinivas pandruvada wrote:
> > > On Sun, 2024-05-26 at 15:32 +0200, Erick Archer wrote:
> > > > One-element arrays as fake flex arrays are deprecated [1] and we
> > > > are
> > > > moving towards adopting C99 flexible-array members, instead. This
> > > > case
> > > > also has more complexity because it is a flexible array of
> > > > flexible
> > > > arrays and this patch needs to be ready to enable the new
> > > > compiler
> > > > flag
> > > > -Wflex-array-member-not-at-end (coming in GCC-14) globally.
> > > > 
> > > > So, define a new struct type for the single reports:
> > > > 
> > > > struct report {
> > > > 	uint16_t size;
> > > > 	struct hostif_msg_hdr msg;
> > > > } __packed;
> > > > 
> > > > but without the payload (flex array) in it. And add this payload
> > > > to
> > > > the
> > > > "hostif_msg" structure. This way, in the "report_list" structure
> > > > we
> > > > can
> > > > declare a flex array of single reports which now do not contain
> > > > another
> > > > flex array.
> > > > 
> > > > struct report_list {
> > > > 	[...]
> > > >         struct report reports[];
> > > > } __packed;
> > > > 
> > > > Also, use "container_of()" whenever we need to retrieve a pointer
> > > > to
> > > > the flexible structure, through which we can access the flexible
> > > > array
> > > > if needed.
> > > > 
> > > > Moreover, refactor the code accordingly to use the new structures
> > > > and
> > > > take advantage of this avoiding some pointer arithmetic and using
> > > > the
> > > > "struct_size" helper when possible.
> > > > 
> > > > This way, the code is more readable and safer.
> > > 
> > > Applied and tested, atleast didn't break anything.
> > > 
> > > But the explanation above didn't give me enough clue. You have
> > > added a
> > > payload[] in the  struct hostif_msg {} then using that as a message
> > > pointer following the header. I think this description needs to be
> > > better.
> > 
> > Yeah, I will try to improve the commit message. What do you think
> > about
> > the following parragrafs?
> > 
> > [I have copied part of the message to show where the new info will
> > be]
> > > > declare a flex array of single reports which now do not contain
> > > > another flex array.
> > > > 
> > > > struct report_list {
> > > > 	[...]
> > > >         struct report reports[];
> > > > } __packed;
> > 
> > Therefore, the "struct hostif_msg" is now made up of a header and a
> > payload. And the "struct report" uses only the "hostif_msg" header.
> > The perfect solution would be for the "report" structure to use the
> > whole "hostif_msg" structure but this is not possible due to nested
> > flexible arrays. Anyway, the end result is equivalent since this
> > patch
> > does attemp to change the behaviour of the code.
> > 
> > Now as well, we have more clarity after the cast from the raw bytes
> > to
> > the new structures.
> > 
> > > > 
> > > > Also, use "container_of()" whenever we need to retrieve a pointer
> > > > to
> > > > the flexible structure, through which we can access the flexible
> > > > array
> > > > if needed.
> > 
> > I would like to know if it is enough :)
> 
> The apporoach is fine. But I don't like clubbing other changes like
> struct_size(). That make code difficult to follow.

Erick, can you respin this patch without the struct_size() change? I
think it looks like it could land otherwise.

-Kees

> 
> Thanks,
> Srinivas
> 
> 
> 
> > 
> > Regards,
> > Erick
> > > 
> > > Thanks,
> > > Srinivas
> 

-- 
Kees Cook

