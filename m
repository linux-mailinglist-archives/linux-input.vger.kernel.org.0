Return-Path: <linux-input+bounces-3795-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8B8CD223
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 14:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57CBC1C20E16
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2024 12:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F86413B5B3;
	Thu, 23 May 2024 12:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tkB7Q8tk"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B91E4B3;
	Thu, 23 May 2024 12:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466680; cv=none; b=g+IxmpA7AFsNBO/u60KUXxSUF8TzM4GQ12qPeZeIiJOgH9oUoev9JwS7HzCn64HbtOnQOMMFSwc3qZEM3HOWbLmxG3NHysATazKZaGvV4Wpr/SiQ+trMJ+/BUDgt9ihWnYzAIlQN+RLNYF5lSPxwrUDtd6r7en6mS+nMXPgA5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466680; c=relaxed/simple;
	bh=7aO37F9CiT6mvhwAwSHzC9znFgm9Bnyz4DIrdvAUdKA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ufIK2pmg52+Uqw7tZPYaQydiHukGiC4MMNJ0q3hXjbHCZwWj37OIjqSwYGJwRLqbgg6/02gYDFjjLR9LHiDTRgndFs77fNgWCp9jSRKejiO0VRzTbD8w2hTDo13E8mzB/SHyghMMpzZNkIJnDfSOHFVD17J2BaLXac9F0sP15hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tkB7Q8tk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3285C2BD10;
	Thu, 23 May 2024 12:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716466679;
	bh=7aO37F9CiT6mvhwAwSHzC9znFgm9Bnyz4DIrdvAUdKA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tkB7Q8tk3Lz6sRa7u6f7tGj44Cm9blizkajVawGuvum9IhxNpw51pcIfbAPlwdAIT
	 AVrXkqJIRVj0/wEwgmo1tnNEu+L3FCyrRVQsiKHHrPP/BLdQP8IjyaXaooGZfDVZsC
	 7VcL9/DHrO74hCuL2Tvj6abQiRvaiAHpqLCrgMFBAMlGqo0YUql+8G8EqZtz6+G3uG
	 hpXhvrkOoZVI8v6aKZXKUcJb1ESmFaFuDz52e7M6dAQ7vRAXVnW/wg+PGlGsE6PLit
	 rvszT5EA+aPFHJoZ7GaI8VuGiXtHGqAHbj+h/Ok+m29oankEy3sbbH5IiwaXaNEQXQ
	 pcQ2ZAO7L1k5Q==
Date: Thu, 23 May 2024 14:17:56 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
cc: rrameshbabu@nvidia.com, bentiss@kernel.org, linux-input@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Add missing check for
 input_ff_create_memless
In-Reply-To: <20240515033051.2693390-1-nichen@iscas.ac.cn>
Message-ID: <nycvar.YFH.7.76.2405231417500.16865@cbobk.fhfr.pm>
References: <20240515033051.2693390-1-nichen@iscas.ac.cn>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 May 2024, Chen Ni wrote:

> Add check for the return value of input_ff_create_memless() and return
> the error if it fails in order to catch the error.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hid/hid-nvidia-shield.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
> index 58b15750dbb0..ff9078ad1961 100644
> --- a/drivers/hid/hid-nvidia-shield.c
> +++ b/drivers/hid/hid-nvidia-shield.c
> @@ -283,7 +283,9 @@ static struct input_dev *shield_haptics_create(
>  		return haptics;
>  
>  	input_set_capability(haptics, EV_FF, FF_RUMBLE);
> -	input_ff_create_memless(haptics, NULL, play_effect);
> +	ret = input_ff_create_memless(haptics, NULL, play_effect);
> +	if (ret)
> +		goto err;
>  

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs


