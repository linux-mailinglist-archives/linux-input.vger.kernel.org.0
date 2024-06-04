Return-Path: <linux-input+bounces-4070-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DEE8FAEA2
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 11:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2FD1C20C1C
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 09:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5D71411F2;
	Tue,  4 Jun 2024 09:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RLNwokoZ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DD4137936
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717492996; cv=none; b=D1s27mBXMIWEsL8SvCEGVx59mgPOjuCKZ5tfMzrAlw2eA7jsNVfCSletBVkhWL7tZWKIOd2G1aYtlPRKPxavYdbn3ZITU18yBPxVBDOH38wKAPG1u9NyuZ36j48OQBc9nljHYz6luRvIeBdwa4SG8PbJ5pbhUgsjDvnCmILVQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717492996; c=relaxed/simple;
	bh=1y0/79GuBzeU8WPm3L5f2EZyByRIHcOiXHsT7DA7BHU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=I/Ng0AIwqfofbXAGHrGObb6LnhNb1/P3O/5tNcYWJJKDEfq0DhYnfCiJbRe5t4Y8q0sZcgY7uIHCDFaHsIZmRrKfyRtWr8p4fCCLnS5PG4kTa7Ot44ftQPwfjUyN3AJTezWpPSLxq/CkbKybpdoYqQycvsHr71wMCsF2ia+KiY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RLNwokoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A60DC32782;
	Tue,  4 Jun 2024 09:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717492995;
	bh=1y0/79GuBzeU8WPm3L5f2EZyByRIHcOiXHsT7DA7BHU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RLNwokoZEbqBkFkTsMpbAtTrPaPmoQU0TN5iueb8+c9lnngPjwozLnuCtRZMsYIgA
	 CqFGKOvp1++KM1Qaq5HXjRnGAZKh5AuBCjk7ZLaxCEgkjgWGYsIR0mT9aBzE/zixiL
	 6rbugT0/GkNCa8WK5kw/Wv6tBieSBGe71kNBm5wX6FhBdR/MOzNGSY6DOJZqoca4FF
	 5/IVvhxwwOZjN9VOsasdvwZSWb6alhMi0NiKW4WW7rLaMUQIpiR9EfTkfrMbCImAhF
	 OMDdY/T27tRX0MZTIJkbaWHNyuI3EU96tCxHB8Gki9Z5n443xQ5sq8drwvtL3TAckr
	 7txTQ3lX/XKDw==
Date: Tue, 4 Jun 2024 11:23:12 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Louis Dalibard <louis.dalibard@gmail.com>
cc: linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
 on ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
In-Reply-To: <75245e3b-72ca-4a62-a88d-36b7c9976181@gmail.com>
Message-ID: <nycvar.YFH.7.76.2406041122260.24940@cbobk.fhfr.pm>
References: <75245e3b-72ca-4a62-a88d-36b7c9976181@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 4 Jun 2024, Louis Dalibard wrote:

> The touchscreen reports a battery status of 0% and jumps to 1% when a
> stylus is used.
> The device ID was added and the battery ignore quirk was enabled for it.
> 
> Signed-off-by: Louis Dalibard <ontake@ontake.dev>

Unfortunately, it's still whitespace-damaged. See

	Documentation/process/email-clients.rst

for some hints on how to fix that up, please.

Thanks,

-- 
Jiri Kosina
SUSE Labs


