Return-Path: <linux-input+bounces-10114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE11A3A845
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 21:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A4616B697
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2025 19:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79E3D1EFF8D;
	Tue, 18 Feb 2025 19:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lbTc2t7G"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557BA1EFF89;
	Tue, 18 Feb 2025 19:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908785; cv=none; b=VyAL72XQ1d7rCmxRVhf5Xf0fhCAWR8fABG9DLMBD/8XBkY3KCvMc8/4qByb0XVeWP1mHdP7NQ+GDbn7+3qts0+wIb+ErVseFHyBVk+XPhi2rTl2rKyg+nx5+yZXlJmbHyczA3rQS5gqfzz6Gq7occwJG+1o4z3RjfiCVpQCN2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908785; c=relaxed/simple;
	bh=FuctMuwAg8JVrJdwwuHP0XTPxGYEKWPG9v+jRV46Sb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ho/RYKIDM24/Za3KXheHhlhsS+XeHrETR6y9oNezxvhHHia+9yCzV1MFlOTrurp3E1VuqaQdEEW3v6Rj4y79ALbE9766MD3tRlk7/YTTe+da6F5j0qagCTmfiMo/AmKoMR60oUQcGehbA2qwy1zMMPofC/jw1QpnIbs88USF+t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lbTc2t7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED30C4CEE8;
	Tue, 18 Feb 2025 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739908784;
	bh=FuctMuwAg8JVrJdwwuHP0XTPxGYEKWPG9v+jRV46Sb8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lbTc2t7GtYMaQPI70izSx4+yNGGor1/R2vTV0dzH9hSTolTJLatOCMXjVxM4S9stS
	 PfxOj0aBS3NW9dkS/s+1xeMFjq4dftSZUxfiy3EQeE4CpIIqXRbRFl21cWe8wa0VJQ
	 sZm+4qh37rTSMItGoL71jkbMH/+xOq1iMWI+0kG1jmaMGyeA9DfTyiiCpZApnOjgN0
	 Plt2QKtmidotn4HADi6DDg3MbM6WbAtb4OMMEXzQMjcMNpCPqcDteA3GVTrhFUmCpo
	 rqZj6I5uRgCY5XznwA5w12Ijabr5a1N6fps/ifsxjKZ1/kVDNPDolR2z86o0rc9uf/
	 LQ6ZeKovheVUQ==
Date: Tue, 18 Feb 2025 20:59:42 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    "bentiss@kernel.org" <bentiss@kernel.org>, 
    Alex Henrie <alexhenrie24@gmail.com>, 
    "jose.exposito89@gmail.com" <jose.exposito89@gmail.com>, 
    "bruners@gmail.com" <bruners@gmail.com>, 
    "seobrien@chromium.org" <seobrien@chromium.org>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] HID: apple: Use common table for MacBook Pro fn
 mapping
In-Reply-To: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Message-ID: <p3r8538q-11op-32q6-43p7-2n3941126n51@xreary.bet>
References: <CEFE855F-CC63-4361-8ABD-875BD5662294@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Feb 2025, Aditya Garg wrote:

> From: Aditya Garg <gargaditya08@live.com>
> 
> The only difference between the fn mapping of the MacBook Pros with esc key
> and those without is of the presence of KEY_GRAVE in the translation table.
> 
> We can easily use a flag instead of writing the whole table again to omit
> it from the models that have an esc key.
> 
> Additionally, APPLE_IGNORE_MOUSE quirk was unused in this driver, so has
> been removed in this commit.
> 
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---

Why am I getting v1, [RESEND v1] and v2 in the timespan of 1 day without 
any documentation whatsoever what are the changes between the individual 
submission and why do we have so many of them?

Thanks in advance for clarification,

-- 
Jiri Kosina
SUSE Labs


