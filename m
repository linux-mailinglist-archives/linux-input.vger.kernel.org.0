Return-Path: <linux-input+bounces-16527-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E94CDCB31EE
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 15:15:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 75AF63165336
	for <lists+linux-input@lfdr.de>; Wed, 10 Dec 2025 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BA5316905;
	Wed, 10 Dec 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="WROrKGBA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074B2FFF84;
	Wed, 10 Dec 2025 14:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765375826; cv=none; b=E+OnQdRQ7BhHbIKhi+F4K3LrONPDYitbvwOMGd9k4frfZJ5oJHUZvffzyJ8bZmGAhPkGe8VgR53f8qNSFbITkPBb4zREl59TpP5+8r/K97UPDZjTjqkv+yd2YEWxnU7SNi96z7exj8A8qGeX9/OnwFbiMP0FPp11TzOSb0X9+Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765375826; c=relaxed/simple;
	bh=eRSg4jk+zLVq8GfCtZV94T7XYnKHEXKp2zy8qUFXBFI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=guc0MT/rxLJf48FgYcCpNPtB2LF9V+JdZAAqyVGothz48rORQuQCmFTWLETphEUOxAs8sH8WtINn5RKcowcj4rN/zmUAmDCJYHkXm7pCHDWkJIT8ha9S7ndTC4JumNuBw1qremFzJMXZSLaO7WPMgDH96i07vnjgNsIl/F42iRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=WROrKGBA; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 2AD2F2FC005B;
	Wed, 10 Dec 2025 15:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1765375813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ivuuWu4P609JXxM7NoamvVbzHi8v3Py+RLXg8GVpYEU=;
	b=WROrKGBA/f6/mNSBxbXQEclIZccpdbLNx7+SPSQsoEQLGZVYyObUiFtXt04Rj26oSSt+3d
	arPdkbxqckwncW1j+35D1bZ0jsMK5rjIyVgI90zMT6LQwkbv0sI+U0thhCo+bvf7vvRBFy
	3IQ505r3a3QQsw7on+GNMqW7zGU3YyA=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b19a80a1-0611-47b4-8cfb-dccf77e9b86d@tuxedocomputers.com>
Date: Wed, 10 Dec 2025 15:10:12 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: i8042 - add TUXEDO InfinityBook Max Gen10 AMD to
 i8042 quirk table
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Christoffer Sandberg <cs@tuxedo.de>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251124203336.64072-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20251124203336.64072-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 24.11.25 um 21:31 schrieb Werner Sembach:
> From: Christoffer Sandberg <cs@tuxedo.de>
>
> The device occasionally wakes up from suspend with missing input on the
> internal keyboard and the following suspend attempt results in an instant
> wake-up. The quirks fix both issues for this device.
Just wanna make sure that his doesn't get missed for the 6.19 cycle.
>
> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> Cc: stable@vger.kernel.org
> ---
>   drivers/input/serio/i8042-acpipnpio.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
> index 1caa6c4ca435c..654771275ce87 100644
> --- a/drivers/input/serio/i8042-acpipnpio.h
> +++ b/drivers/input/serio/i8042-acpipnpio.h
> @@ -1169,6 +1169,13 @@ static const struct dmi_system_id i8042_dmi_quirk_table[] __initconst = {
>   		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
>   					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
>   	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
> +		},
> +		.driver_data = (void *)(SERIO_QUIRK_NOMUX | SERIO_QUIRK_RESET_ALWAYS |
> +					SERIO_QUIRK_NOLOOP | SERIO_QUIRK_NOPNP)
> +	},
>   	/*
>   	 * A lot of modern Clevo barebones have touchpad and/or keyboard issues
>   	 * after suspend fixable with the forcenorestore quirk.

