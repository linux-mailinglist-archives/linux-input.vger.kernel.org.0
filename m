Return-Path: <linux-input+bounces-3531-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5258BD735
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 23:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F7EF1F25252
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 21:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F288515B993;
	Mon,  6 May 2024 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4XXLwm5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C0715B992;
	Mon,  6 May 2024 21:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715032560; cv=none; b=uH6efIo8R9brgW0gLNRFxdIUm9czX2Qk0cXtw/l5XrH7MeIgrLk+S/FWMBvoKvOsL7hvU23ZFFDQzi/Z/z7dP/UQ6cEP4ddX5i2bF9VC9aaN+0Qyp7aiHBp/Kr6wTQggrfEgDXA1J8nfNjugrPQHJqXqlt1k+9tqPGkv/tErTXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715032560; c=relaxed/simple;
	bh=HaNjQp5cZxsrczAxh1tzgz1zTPZkppf3rqAP+7OG2z4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iM/r4RUbiJieZFHFtOTs/Bqwhn8I99bKDvsP/5np/N6OqTR1NNEeEIQiy0dyShF+kSrvcDurhSwlqTAvPbzwvyJg2jtpd5p8VhdekLv6tk+zuNypOwMD4mRI0HyiA8PyyAQ2iK4rOqKXZh6h0HWulCBsnK7Rpc+sT7ea/vJXaEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k4XXLwm5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA5DC116B1;
	Mon,  6 May 2024 21:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715032560;
	bh=HaNjQp5cZxsrczAxh1tzgz1zTPZkppf3rqAP+7OG2z4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k4XXLwm5P5AqtWVqi2cu+UnhSETq0+Vnh65Qo9avqN7Htxycj/6dhcHQfRbEqth5c
	 gITd5kXRWA539v7XR+db6Z9Kj41QK7RC+NNe5CCigjLuoCifZOjwAgOnFnLd7U97vH
	 CQ7BiAx3CmICdAme3WhCBvCyUgxdpjaEFqsCR+08Yp92fIfeOCweUbRb04F6a63UVO
	 sx1G5tItXzt/4ZZchPBx93PbJRaLYQiCaMjGw+JR9K1SgZJ6gwupVe8cc9qQzaj98E
	 gCb+d2IBY4V32ca+ARaUNNXkqbybM/193IbpNmC2ibjodAOa6L0myVK9RLyuBxtqgc
	 KqWZRVMALTzSw==
Date: Mon, 6 May 2024 23:55:57 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Chen Ni <nichen@iscas.ac.cn>, bentiss@kernel.org, even.xu@intel.com, 
    lixu.zhang@intel.com, kai.heng.feng@canonical.com, hongyan.song@intel.com, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: Add check for
 pci_alloc_irq_vectors
In-Reply-To: <5523c4770ce2de9e804a3020e0bd5c60fb401fc2.camel@linux.intel.com>
Message-ID: <nycvar.YFH.7.76.2405062355450.16865@cbobk.fhfr.pm>
References: <20240429085422.2434036-1-nichen@iscas.ac.cn> <95fadbf4772d575bff777ddb738cb6c25b85b779.camel@linux.intel.com> <nycvar.YFH.7.76.2405062311100.16865@cbobk.fhfr.pm> <5523c4770ce2de9e804a3020e0bd5c60fb401fc2.camel@linux.intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 6 May 2024, srinivas pandruvada wrote:

> > my understanding is that with the changelog rewroding this patch has
> > your 
> > Ack?
> Yes, just to make it more clear. With that.
> 
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks, now applied.

-- 
Jiri Kosina
SUSE Labs


