Return-Path: <linux-input+bounces-9095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C00A07072
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 09:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379CD1882127
	for <lists+linux-input@lfdr.de>; Thu,  9 Jan 2025 08:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C602036F4;
	Thu,  9 Jan 2025 08:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SWqNwMAc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6A11F8EF5
	for <linux-input@vger.kernel.org>; Thu,  9 Jan 2025 08:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413127; cv=none; b=DqFh/Wvj80xAvjV9KIwQXKICMn/MpYgIjSouM1UZeT9CUWkrf8SK2lhRtK7DeI/diTv3aE8KSatoaTlE1JzMeFlfPLu+EQqG/keaTE9SjddCT+IUnRZ1xr9x4utWo6+zSj4vC8MfqX+NfkcGs9eKhLfa1Z0P65AwOCWrE85VvA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413127; c=relaxed/simple;
	bh=Iu07YxFkckes/71GUxJ1YcgUGjw7WXN4ad0s1+ULLcg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=LhWyTIm3GhJtvMab7x9k/3rpRrv8G/lfnsHwdlFJd5uRt0o7leXqYqGg+aZVGB8Aw17Myu0Ai+vF2karU1DzJ8pgJGP+EYhzsiFDQD6oaEGO3LBEGzhPBe5HcpEBE6SOTb4+OFTGp1NmCixEA3+lqO4M2nNfggxaj/zR8uIi1+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SWqNwMAc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74936C4CED2;
	Thu,  9 Jan 2025 08:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413126;
	bh=Iu07YxFkckes/71GUxJ1YcgUGjw7WXN4ad0s1+ULLcg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SWqNwMAcwGCMBG7Eca1aX0ai9hiMA0qjbBvKY500ObfIQ/eou/quCwaAgxof0zcML
	 NosLSZJkYB/QXEZymA3I8rhOBHKGSC1iuRNIKKNA85PyHgPsb9GuC7FYB4YM24aYme
	 g73LPTUUJBYb2sIaI9zz3cTvdvo1mcxVXAtwD2WGH9hYkNXdRhXNgZ5KXQaRQ2Oga3
	 /oXuHBD78Az6ED4gADyj6omo+hem9iooViRmT62saFb1Q3hwrm2EHNRaYzcXstmPqa
	 6Jx0KXKD8+P021M/7jTzya76U5eQo9Ji5pjI28NXx3X70T15HvmUGksAPh3BpYtyzn
	 idxqcm0GfcxvA==
Date: Thu, 9 Jan 2025 09:58:44 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Ping Cheng <pinglinux@gmail.com>, 
    Joshua Dickens <Joshua@Joshua-Dickens.com>, Erin Skomra <skomra@gmail.com>, 
    Peter Hutterer <peter.hutterer@who-t.net>, 
    Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [PATCH 1/2] HID: wacom: Improve behavior of non-standard LED
 brightness values
In-Reply-To: <20241210210059.87780-1-jason.gerecke@wacom.com>
Message-ID: <q6n2qrq2-1876-qon2-11s4-9o10q3q9s9ss@xreary.bet>
References: <20241210210059.87780-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 10 Dec 2024, Gerecke, Jason wrote:

> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> Assigning a non-standard brightness value to an LED can cause the value
> to slowly drift downward over time as the effects of integer division
> accumulate. Each time that an LED is triggered, a series of set and get
> calls occur. For example, if we assume a tablet with max_hlv = 100, then
> when brightness is set to "200" through sysfs, the hlv value written to
> hardware will be `200*100/255 = 78`. If the LED trigger is later activated,
> the hlv value will be used to determine the brightness: `78*255/100 = 198`.
> This lower brightness then used to set the brightness of the next LED.
> However, `198*100/255 = 77`, so the next LED ends up slightly dimmer.
> Each subsequent trigger activation will cause the brightness to continue
> drifting down until we reach a point where the result of integer divsion
> does not introduce any new error.
> 
> This commit corrects the issue by being more careful about how we handle
> scaling between the two ranges (0..max_{h,l}lv) and (0..LED_FULL).
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>

Both applied, thanks.

-- 
Jiri Kosina
SUSE Labs


