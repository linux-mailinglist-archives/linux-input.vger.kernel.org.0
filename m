Return-Path: <linux-input+bounces-16925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5E2D0D3AC
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 10:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4C233004EC4
	for <lists+linux-input@lfdr.de>; Sat, 10 Jan 2026 09:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB542D0C9D;
	Sat, 10 Jan 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="szpLcysE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F91EDA0F;
	Sat, 10 Jan 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768035606; cv=none; b=VVDU21z32+RRGMrDR5S4rkE1OSiyjfw/hOEC5XXDL4mSldoFhbyViWHlPSkr0vueVsHAELXnvhF5k4Xntm9Lo+Skh7uRfjMAiBxyAnAQOXmp/hwZX+R1QJtpzB+wPvOEaWgp70N6KRjh6ar8YKbQ67sqvxHGdrcmwSD3JNOb5/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768035606; c=relaxed/simple;
	bh=Ra0+hppvmGB1Uq1/e8BsbK0kNOj9cc0H/x3ZXr0Qv5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oUBVwkO/2ckwyXzZeTEYP5iEKI80cAFZV5bqLKdPvljTmQ1YB2lxFerpJcm/zwUtY2AcZonDyzGHcEwRLx8chQnZ37xv/Zy+b9oV11l+R6KlTsRs+19Oq/ryD6GwiaJaw7C6V+6rwWtgK6SAia18336o34yVAK1nWDz0QkRH/IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=szpLcysE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CFEFC4CEF1;
	Sat, 10 Jan 2026 09:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768035606;
	bh=Ra0+hppvmGB1Uq1/e8BsbK0kNOj9cc0H/x3ZXr0Qv5I=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=szpLcysEuOC7bjv4q18MHlID5XHWYhwmKxTe2KNLR+7fLd2TjcT7CabIkCp0k9lwK
	 c0jdKs0A0/Gb9QhsUtsmVU+uJQNqibiLmazQS9Pf0q17KHrFaJID/hxYyUoJz1tElk
	 WQrkhqNeYGHk9EzdRUQ6PB6URjC1ZcC4+doCzCjzam5grvGAIVKTXYzUnp7PY4EjWm
	 8AlaCkowu9xZALoqD1iPnj1GNqMGyjSBJL2zDLXzNvQYD8LGbqmyQBYY/PF7/wsJmL
	 e2fzyxVHXCmGInf6Ff9WjXvv/QE2RPDW7HuSweW+XeVm64wIrd3wayFZAyS/8QACoK
	 uInGbL31QJ6qQ==
Date: Sat, 10 Jan 2026 10:00:03 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
cc: roderick.colenbrander@sony.com, bentiss@kernel.org, 
    linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: playstation: Add missing check for
 input_ff_create_memless
In-Reply-To: <20251117082808.1492-1-vulab@iscas.ac.cn>
Message-ID: <2nn8276r-50nq-5655-o1r2-o610sp1s69q6@xreary.bet>
References: <20251117082808.1492-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 17 Nov 2025, Haotian Zhang wrote:

> The ps_gamepad_create() function calls input_ff_create_memless()
> without verifying its return value,  which can lead to incorrect
> behavior or potential crashes when FF effects are triggered.
> 
> Add a check for the return value of input_ff_create_memless().
> 
> Fixes: 51151098d7ab ("HID: playstation: add DualSense classic rumble support.")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/hid/hid-playstation.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 63f6eb9030d1..aea8d6cf46a2 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -769,7 +769,9 @@ ps_gamepad_create(struct hid_device *hdev,
>  #if IS_ENABLED(CONFIG_PLAYSTATION_FF)
>  	if (play_effect) {
>  		input_set_capability(gamepad, EV_FF, FF_RUMBLE);
> -		input_ff_create_memless(gamepad, NULL, play_effect);
> +		ret = input_ff_create_memless(gamepad, NULL, play_effect);
> +		if (ret)
> +			return ERR_PTR(ret);

This particular change by itself is good, and I'll be queuing it in 
hid.git#for-6.19/upstrram-fixes.

While reviewing it though, I came across the fact that just one line 
below, if input_register_device() fails, I believe we're leaking the 
already allocated struct input_dev.

I'll send out a separate patch for it.

-- 
Jiri Kosina
SUSE Labs


