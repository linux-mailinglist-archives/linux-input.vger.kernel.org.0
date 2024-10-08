Return-Path: <linux-input+bounces-7130-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A68993F61
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 09:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 112A61F24DA2
	for <lists+linux-input@lfdr.de>; Tue,  8 Oct 2024 07:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0061F1B6536;
	Tue,  8 Oct 2024 06:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSjHYS/V"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5E18E37C;
	Tue,  8 Oct 2024 06:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370010; cv=none; b=dlp4MUq1PlNVsEsmLpyf2ZLOEuIydpMd+85F0btNsd18t+poJaHNAUzGKfq/vJuo3LNFLIWKU/Otwv2otUGulJUURDox2ZHY0UKXVqj2tXwI1J5KsGcmKlN5MNKNO6OObSL1y36JDFBpFm7BiugKNmJz7fN/a82bVidvqqMA9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370010; c=relaxed/simple;
	bh=LQwzrxVR0VxE3bim0rHs1rPyV5wQKH57LwW6Kr5/fv8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sDhoQxpF7qKITrJbV5stAFb2tWK8KOFVO5biC0Q4qbZTgRxO5RJ7kCM8HYtSbBtVxkOie1fyQpQ/kWQ2gM/VkLbkP/7xmkMMgLOLNwH/DeVyi90WadB1NoqFdRfy/MSfnv3oOFKL/prWbik2juYMLp6DKLdbx12qnk0ei9IVuF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSjHYS/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0A3C4CEC7;
	Tue,  8 Oct 2024 06:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728370010;
	bh=LQwzrxVR0VxE3bim0rHs1rPyV5wQKH57LwW6Kr5/fv8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RSjHYS/VUWRtLyYrOaHajZNZ1Kdemd52i8k0KHHfgQ6Le5Mvbw2sqE6Gn3fl0a+Gw
	 xoWzgYOc6EhYAAeSpFBHMOS0xNrFPHLp4+4arXIhR3JI7IU63eabZcqFEWY5cc70i3
	 ysYbw5+M+M35HgdpzwR/jERSF50EDtLgcEUYSiST7LOdfHCz+U7t6NcRXIvu80+DDn
	 c69UmFeAFFcWS/5+DeqIPA4F7ZUTMBEMFzo8UJnfSoru0HHjVOOtnuqsrKRHqB/rNE
	 Dn9n+JRV+rfrMNabpFYYa378H0WqWVzAZo8au3qv4/1BQiVJZ4rUMV+BS+trEQYjDE
	 rlj9tM8eCiY2g==
Date: Tue, 8 Oct 2024 08:46:48 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Wade Wang <wade.wang@hp.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] HID: plantronics: Workaround for an unexcepted opposite
 volume key
In-Reply-To: <20240916085600.1387418-1-wade.wang@hp.com>
Message-ID: <nycvar.YFH.7.76.2410080846370.20286@cbobk.fhfr.pm>
References: <20240916085600.1387418-1-wade.wang@hp.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 16 Sep 2024, Wade Wang wrote:

> Some Plantronics headset as the below send an unexcept opposite
> volume key's HID report for each volume key press after 200ms, like
> unecepted Volume Up Key following Volume Down key pressed by user.
> This patch adds a quirk to hid-plantronics for these devices, which
> will ignore the second unexcepted opposite volume key if it happens
> within 220ms from the last one that was handled.
>     Plantronics EncorePro 500 Series  (047f:431e)
>     Plantronics Blackwire_3325 Series (047f:430c)
> 
> The patch was tested on the mentioned model, it shouldn't affect
> other models, however, this quirk might be needed for them too.
> Auto-repeat (when a key is held pressed) is not affected per test
> result.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Wade Wang <wade.wang@hp.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


