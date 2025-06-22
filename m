Return-Path: <linux-input+bounces-12991-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664EAE3225
	for <lists+linux-input@lfdr.de>; Sun, 22 Jun 2025 23:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960563B0DBA
	for <lists+linux-input@lfdr.de>; Sun, 22 Jun 2025 21:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BAD137C52;
	Sun, 22 Jun 2025 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sAiQJJmR"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2DA30E84D;
	Sun, 22 Jun 2025 21:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750626155; cv=none; b=R/6Kx+4FSMyB3rgjqKKG2kZIZKDf0lm4rgGAFgA60kzvgFb4fRp12dIAw7ThLbVjsGLLQCFu1MCw+Aw/Jdmc0B4LQeDtaYfxOZGryqDoApvVokgWIsgN+WW5aD1SfnLlK/ZizDtp0a5mjR5dOhVnZ1jTshikBKz1+4T5EWur6WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750626155; c=relaxed/simple;
	bh=toltn2CVTysoaj+TBriSsbZo1qkP3QAOaGBWJ3Om758=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FWwu5d7uzg8a8d7OawYjuHsJgV8+e9g+yeLh0aqJm/525RiP7pDs0yeJkpZB5YBBf3TXoiwEp1BQfKzn2npRQmG5DR27zOfw7uaUJc3MrnMpg4iWU1J1hJi16Lc8ivq99txiwIzDchozDRq9jJ/b+sLq+djQpSk5ZTzzzbC2YdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sAiQJJmR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBE2FC4CEE3;
	Sun, 22 Jun 2025 21:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750626155;
	bh=toltn2CVTysoaj+TBriSsbZo1qkP3QAOaGBWJ3Om758=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sAiQJJmRoOTyNZDQ5HIJ5plYF9PQbZQh9UITw2Pg28ltq6bdflyDOhLmoR/RQkT9G
	 rkjmww02QFmS6HvuISB1BV81tCGdK9hN1BdNeQUkr5YfpTiwLwkSgSXAZV88L/NO+s
	 LHDbnFzl4KyLrN6OblkvpsD1S1ItKu4IcJ0GUNmZGj+IRtenM5znkQsXioblKLRB7w
	 g9mkwYglDcSQROJg/gNV4yu+8i/o2zKxSFVfGmN6Nlt6oxf0MFRxCeOA7T/QF2plE0
	 6OrMbsqtnwOsq6qPukjdz/CXqK+k9CMn8+IWrsGZpPRTrMyIN6Eep9DbogMx9efaYn
	 vQTr+X5+5TczA==
Date: Sun, 22 Jun 2025 23:02:32 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Saalim Quadri <danascape@gmail.com>
cc: lains@riseup.net, bentiss@kernel.org, gregkh@linuxfoundation.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] Writing a Driver for Xinmeng M71 Keyboard (Battery Status
 Support)
In-Reply-To: <20250622113242.183562-1-danascape@gmail.com>
Message-ID: <2n706qq8-45os-9959-7427-83r26344q434@xreary.bet>
References: <20250622113242.183562-1-danascape@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 22 Jun 2025, Saalim Quadri wrote:

> I would appreciate guidance on, how can I continue this, I am familiar 
> with Linux Kernel and writing drivers, but would like to ask some 
> pointers regarding the same. I saw a reference that logitech HID driver 
> uses it, but it looked quite complex to me.
> 
> I'm comfortable writing kernel C code but relatively new to the HID 
> subsystem. Any documentation pointers, example patches, or suggestions 
> to get started would be highly appreciated.

Yeah, Logitech is probably the most complex (and thus not really 
appropriate :) ) driver to pick when trying to understand something. It's 
quite complex.

Specifically for handling battery interface, I'd suggest looking into some 
way more trivial driver that also exposes battery interface (in the most 
straightforward way) for inspiration, e.g. hid-asus, hid-kysona ...

Thanks,

-- 
Jiri Kosina
SUSE Labs


