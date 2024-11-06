Return-Path: <linux-input+bounces-7892-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A419BEF74
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 14:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC89AB242DA
	for <lists+linux-input@lfdr.de>; Wed,  6 Nov 2024 13:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038221DF97B;
	Wed,  6 Nov 2024 13:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLrWqtKQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D045F1DEFD7;
	Wed,  6 Nov 2024 13:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730901094; cv=none; b=r5Cvl8Z6Wrq+8yXijEPHViRKSeQuNkwxIQTkYfeSWuaxSxmTRj7zzKfEnySxtDEmPfS64zEpn68JQUC8UVp5AF+BuaYCpVNHapN7oq8xdV9nbWzLTikwTBdAy8i9FRLg4skJkEp5aSes7mXmqHTrSf2yRfGkmW0jkccDDgkM028=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730901094; c=relaxed/simple;
	bh=ut7bn+4FpXwmgiITbRJa/O/HDh1Oyigf0GJgsThJ7Lc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DOShhY4EN9ZvT3MNmuyK30Lj+dbvD72VnoFnT0StlWDXt+rHyrx+5sgloj/qR41vzULCAzJWsNuB9NqTknD3H/OCSix0nhM2RVldcJY3dMUpBk1F5GGH3Ii17UvcCLlJbLQHuaNvtGtqOXcCdMcY82rx32tND2ohW9WMnUcizHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLrWqtKQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A605C4CEC6;
	Wed,  6 Nov 2024 13:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730901094;
	bh=ut7bn+4FpXwmgiITbRJa/O/HDh1Oyigf0GJgsThJ7Lc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gLrWqtKQgEJ7Wklwfg/5jsHf2k8SIPDKDyMfsNaxEtlqy5V7UZDtJZgls535Med9o
	 R+gzwoRWz19hDafprYdHB4TOJMmCUfDU8mDeyvnt9SHvpEb+2jTD2XZHQQAy3N+mZc
	 toJBoIh12A5FeSfeuGRyGAXhaRYuktXcgH/X44SKPA+JaYk8Wc9t3FapXaRSXDVL5c
	 mJRpwCyNsN+wlhpr5fNUibJCONCYNJPWhHAobeM90i6TVPmv1dxExJlBCzUY1mG86P
	 m0UCVreZWaoIuUYCPToFzdWd1UA63m8exko6i722ga6wEKkn+hW5S2rkk6Gxp9NUx3
	 xaOkh4iA/D6JQ==
Date: Wed, 6 Nov 2024 14:51:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Tatsuya S <tatsuya.s2862@gmail.com>
cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Add reserved item tag for main items
In-Reply-To: <20240926072541.109493-1-tatsuya.s2862@gmail.com>
Message-ID: <nycvar.YFH.7.76.2411061450380.20286@cbobk.fhfr.pm>
References: <20240926072541.109493-1-tatsuya.s2862@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Sep 2024, Tatsuya S wrote:

> For main items, separate warning of reserved item tag from
> warning of unknown item tag.

Sorry for the delay, this patch fell in between cracks.

I think the change is fine, could you please just extend the changelog 
with the reference to the relevant part of the specification, so that it's 
properly documented?

Thanks,

-- 
Jiri Kosina
SUSE Labs


