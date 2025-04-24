Return-Path: <linux-input+bounces-11975-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB52A9A9D6
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 12:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABD87189E5E5
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 10:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003A8221FD2;
	Thu, 24 Apr 2025 10:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzAqqQbJ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C756522330F;
	Thu, 24 Apr 2025 10:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489792; cv=none; b=b5u3P/otA5XxuYgLFkWEBF7CCYVuWmlefdVIU+39vjnQ3CVMIQbYXVpbgkqBxuDsSml6ji9BEOtWaUyptLmFFi27Turve2L7fozKYI24i/G90DMHiczdmkMXPk0x/KwiIXJaSvnTasfMFfFgMppKp2IhPV4WQncOSfBNtg2hYAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489792; c=relaxed/simple;
	bh=8X8bukmS2b6G9Ykx5G4mrNemy+KG3jGlShYI4D0PBg4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ik5tGZDblk3q+oUzI2gvPm8KU53Lt2UAHDHgL6DK1MioOuF2Yq0tPZSy/NccJWFX3lFnJ+H/vC385FZotJZggANCIl1fv+8A71UKzn/BawFMkJY8yJ6S3WYJYmsQU8dPofJIdVNNSNvapx9SA28t69mIhuJF1fbHsqLiiwJowvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzAqqQbJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA23FC4CEE3;
	Thu, 24 Apr 2025 10:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745489791;
	bh=8X8bukmS2b6G9Ykx5G4mrNemy+KG3jGlShYI4D0PBg4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kzAqqQbJHI/AQyuFhUuYKU/U7t83e6PTf0p3+mfBuV0o89vlV74bu9nrIQqY+VqDW
	 vjVXGAZ77+1OftmGEHF17wB5WLdoAWRQWzsTGiGi/62V2jJlFd23NjlOEZb9ucnUf6
	 ZOOWcE16hURaPOWnzDLVCSpQ1IhN1JR8bsO9Bn6g1hyePCBCRYge02DecvX7q9hvXI
	 HFk5fxp1v6otxognNq3WjP46XmXsomYBmaKBX5PL+VfK7Izs+g1Ync/9QHFGFSnEqb
	 loJxkS0F3BOmos9rHclMmkHs/Q/P+rxJ1lIDDjn/8lSibikhaoYs6O+iVZkQ39BJt9
	 D7tQ/pyemnDfA==
Date: Thu, 24 Apr 2025 12:16:28 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Mario Limonciello <superm1@kernel.org>
cc: mario.limonciello@amd.com, basavaraj.natikar@amd.com, bentiss@kernel.org, 
    ilpo.jarvinen@linux.intel.com, Shyam-sundar.S-k@amd.com, 
    akshata.mukundshetty@amd.com, Yijun Shen <Yijun.Shen@dell.com>, 
    stable@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: amd_sfh: Fix SRA sensor when it's the only sensor
In-Reply-To: <20250403031242.1267561-1-superm1@kernel.org>
Message-ID: <s0p43rp8-q4p0-nnp1-sr7o-002p9s2nqo3o@xreary.bet>
References: <20250403031242.1267561-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Apr 2025, Mario Limonciello wrote:

> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> On systems that only have an SRA sensor connected to SFH the sensor
> doesn't get enabled due to a bad optimization condition of breaking
> the sensor walk loop.
> 
> This optimization is unnecessary in the first place because if there
> is only one device then the loop only runs once. Drop the condition
> and explicitly mark sensor as enabled.
> 
> Reported-by: Yijun Shen <Yijun.Shen@dell.com>
> Fixes: d1c444b47100d ("HID: amd_sfh: Add support to export device operating states")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Applied, thank you.

-- 
Jiri Kosina
SUSE Labs


