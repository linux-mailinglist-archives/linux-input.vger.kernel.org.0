Return-Path: <linux-input+bounces-16927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD21DD0D3B8
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA685300C5DE
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AAB1EDA0F;
	Sat, 10 Jan 2026 09:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8WGRR8w"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FD0500969;
	Sat, 10 Jan 2026 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035842; cv=none; b=N1ezzf9gjmhwXGWJJ1ObnmNF7er3hCQXy/smVfKquijO/fK8enFQ5t2qVJLHE3eFnhtWdUG1+kf2kM3dFkazpsynRqwV5eEIhagUH+z30e9QaYigK7yze3v456woRl+rtt6mN4Yn4Pt63U4O2K2op0NCvTtLj8cGuEGMiOxZKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035842; c=relaxed/simple;
	bh=lu+fQziwxrpmcG1Lyogj+KQh7wOe5H2uCRvkTvJp1bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=dsaNgx3oXXmywPEDFAVr4wXi8un3giaoUl8U3cOPq7sigHVhwvTyjoczCq7gGx4QYmpoEHthtHKJ8CvL0E/SiMq39ls/91BeVLdaGN92+DyCYpEAqLztofqVrtvWI90M+s548gplz+0ZuYE1Mc3VvvuBLjEUVRcNlHZKr8IfLmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8WGRR8w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D336C4CEF1;
	Sat, 10 Jan 2026 09:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035841;
	bh=lu+fQziwxrpmcG1Lyogj+KQh7wOe5H2uCRvkTvJp1bs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=T8WGRR8wH0yzbmtZbB6OKQw1NIeGIXrWTDstoqGB88scGudUc89lxlK11oITvqYIN
	 WDFhvN04rd8KUNZLWkm+Szh6NJ1L4fUHtkPtCBgr/SdjLpadEoM5ASPe8w11bKwzb4
	 eZTEFwZR35M02NyLpBGDbZc8be+h1gq6Ofz+3zeq7XEJX1omsYVu4RbUZ5v7mT+U9X
	 fHa5JFprjpctDIpK8/tcBMeNIdG+m91cDSfv7RNYr5TDa4lLtpr3LgU96+tLEUZWxB
	 SEzqPjw7y5vMll0wNtEKGWwqJycBQczPUGVwy597PB96LjEkPsxSL7GiRrY4nWKJPl
	 6rVhcTfZy1Rrg==
Date: Sat, 10 Jan 2026 10:03:58 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Brian Howard <blhoward2@gmail.com>
cc: Andrei Shumailov <gentoo1993@gmail.com>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: add quirks for Lenovo Yoga Book 9i
In-Reply-To: <20251118020723.6600-1-blhoward2@gmail.com>
Message-ID: <468q5375-r032-so88-p263-r663p7646q01@xreary.bet>
References: <20251118020723.6600-1-blhoward2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, Brian Howard wrote:

> Add required quirks for Lenovo Yoga Book 9i Gen 8 to Gen 10 models, 
> including a new quirk providing for custom input device naming and 
> dropping erroneous InRange reports.
> 
> The Lenovo Yoga Book 9i is a dual-screen laptop, with a single composite
> USB device providing both touch and tablet interfaces for both screens.
> All inputs report through a single device, differentiated solely by report
> numbers. As there is no way for udev to differentiate the inputs based on
> USB vendor/product ID or interface numbers, custom naming is required to
> match against for downstream configuration. A firmware bug also results
> in an erroneous InRange message report (with everything other than X/Y 
> as 0) being received after the stylus leaves proximity, blocking later 
> touch events. 
> 
> Signed-off-by: Brian Howard <blhoward2@gmail.com>
> Tested-by: Brian Howard <blhoward2@gmail.com>
> Reported-by: Andrei Shumailov <gentoo1993@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220386

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


