Return-Path: <linux-input+bounces-16876-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4565D03D6E
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 16:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 09CED3040229
	for <lists+linux-input@lfdr.de>; Thu,  8 Jan 2026 15:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B13492532;
	Thu,  8 Jan 2026 11:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eg34aDM0"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE0349251C;
	Thu,  8 Jan 2026 11:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767871356; cv=none; b=nwoAxN5O+EoAxSCFogaXx9PSw0Wzh2u0FCfmp6lGiu1mRG5B0HWggkNxpjVCOUoiYF5obo+ebgE0j8B/GaK2JtPQcLbeVRE1k8IBL5TiwYk2TjVdWGp/QW2x+IAmd9s1DDiQTLPrSgY5OjPjBD4y11iIey538mEjCCFsXE8FmTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767871356; c=relaxed/simple;
	bh=cVNzmNaQbu29RQW/3cM6Wlip7NqDZhsMC4A8jOOmNjw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=PLCswD9oLU2y5uicI/Q2x3ZJDivZZ5Dktp+qNcf2bSRokmElfs913axu812vWbNzkbGEcIv3l+yL8dFjNZmLg3E35IUYGpXIreHpTXNJMpn1iCLJOtm2+SafH6h0kBMBKrTjTQ8SwsQcHuK4r/2fluYbVe0Ul2AMBHN4Znhdcok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eg34aDM0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70545C116C6;
	Thu,  8 Jan 2026 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767871354;
	bh=cVNzmNaQbu29RQW/3cM6Wlip7NqDZhsMC4A8jOOmNjw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Eg34aDM00fW3jxsL/Y/UurBnq0YqYyJjz/4AXCy9X6jgHAXmAtzP61nruoq9io0Zl
	 6mzHrJLVRkyDGzFg4o1oPg+6PCv9vds3OaSJyG7CFqIwphBcw/OWEs5BYIjquXBSvW
	 O1oxemOjp0sJKXPRAHeFJU5g+IkvuGgdzSRVqE5qv4OgBbQHdbUnnD7csZXRCOQ+Bn
	 87kuOavNLxOwlq7zOuryfT1L9jbZGhy4F2WWtblK8Dhv6sKEfIBs80gwSdh0X5R97+
	 LULdXWIDvFgdddW2RyeZ5EdaqsfVJtuupexg+NmboBuB3AFbfZJiBPQjPIuLLNz2Zp
	 KwPVOF3NAE+IQ==
Date: Thu, 8 Jan 2026 12:22:32 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Dennis Marttinen <twelho@welho.tech>
cc: Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, 
    Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drivers/hid: add HID++ support for Logitech MX Anywhere
 3S
In-Reply-To: <20260104125846.61191-1-twelho@welho.tech>
Message-ID: <45936o2n-qns4-1qqs-q519-n5n2r1nr0o2n@xreary.bet>
References: <20260104125846.61191-1-twelho@welho.tech>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 4 Jan 2026, Dennis Marttinen wrote:

> I've acquired a Logitech MX Anywhere 3S mouse, which supports HID++ over
> Bluetooth. Adding its PID 0xb037 to the allowlist enables the additional
> features, such as high-resolution scrolling. Tested working across multiple
> machines, with a mix of Intel and Mediatek Bluetooth chips.
> 
> Signed-off-by: Dennis Marttinen <twelho@welho.tech>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


