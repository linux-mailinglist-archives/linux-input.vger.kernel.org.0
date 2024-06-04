Return-Path: <linux-input+bounces-4066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B928FADBA
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 10:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E20A8B238E7
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2024 08:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B0A1419A2;
	Tue,  4 Jun 2024 08:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJDgJ7gN"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CA3140391
	for <linux-input@vger.kernel.org>; Tue,  4 Jun 2024 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717490363; cv=none; b=jwrjsufakmMgvAnxmj39i/rn9AbbZVrdOcVGmBbs2YE3mTJbhI2IkD9/MhLrqldhKWEFtxnO8f8XQMt4kVynzM6fKanVWg76IqWB+Ue3UUqPwB2QXgVirmrvzTBZ2mQLEryILaCdzSP0nJCMiRC26uJtrW7E2BRbK25UYGEXXw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717490363; c=relaxed/simple;
	bh=HXhYsyqpc8UEtdNGn1to5iEOyxAFrtbsobjrKjfE9Bo=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cZPKJ2kvgD0DGiYtMjvnUcaNvvJN7v4m1bVccviPBsYP6Xzs3tqSj1pZ4CPdxqPgNcjoOMzM8z/xVMGA/zvpoaiRGo5+64S8BgMYWJ4TqBcyz3lyQWQv9zAhY5feraSUxtJyGLH+bmeYZPfBH6KV5ZIYD6mUemb2FqDi23G9g10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJDgJ7gN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6B62C2BBFC;
	Tue,  4 Jun 2024 08:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717490362;
	bh=HXhYsyqpc8UEtdNGn1to5iEOyxAFrtbsobjrKjfE9Bo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JJDgJ7gNAQu5IfquYLtSjL8Ip53T2k7KZAzKT0JfNUfR5CspZvlGR5Dx8MHonmz6M
	 74uCk/3fLbALV9TX7pgHpAxo5ZbhLIFL/oXSSxmrhS77aTKO/Rr0f6xLTmB4dDgJbr
	 UO5oV9VVlJCZrotGElI+FejjdIXRG7B8PuVE257C7ODkDJn12KGykO1sw1uPt7BwN3
	 qydrqnzWfhUeMzwn0HikfXT2/B0tKFmxl3st8TXwzqula7wRQ5kerLEsXDA0FTuMRP
	 lt4+D6UXYW4biL1zwUIR5pMfJH4x1ahC/8/Z5jac99F2F5fLm4DtfSUZB/Tdar7g2p
	 dbHWC/OBHcyqw==
Date: Tue, 4 Jun 2024 10:39:19 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Louis Dalibard <ontake@ontake.dev>
cc: linux-input@vger.kernel.org, bentiss@kernel.org
Subject: Re: [PATCH] HID: Ignore battery for ELAN touchscreens 2F2C and 4116
 on ASUS Zenbook 14 OLED (2023) and ASUS Zenbook Pro 14 OLED (2023)
In-Reply-To: <04cff4e6-4c6b-424b-8f27-32e439eabf06@ontake.dev>
Message-ID: <nycvar.YFH.7.76.2406041038500.24940@cbobk.fhfr.pm>
References: <04cff4e6-4c6b-424b-8f27-32e439eabf06@ontake.dev>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 2 Jun 2024, Louis Dalibard wrote:

> The touchscreen reports a battery status of 0% and jumps to 1% when a stylus
> is used.
> The device ID was added and the battery ignore quirk was enabled for it.
> 
> Signed-off-by: Louis Dalibard <ontake@ontake.dev>

Thanks for the patch. It has however been whitespace damaged by your mail 
client / service provider, so it can't be applied.

Could you please fix that up, and resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs


