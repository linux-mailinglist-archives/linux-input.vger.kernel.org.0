Return-Path: <linux-input+bounces-16698-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 579D1CDF64B
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 10:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 566613002D5E
	for <lists+linux-input@lfdr.de>; Sat, 27 Dec 2025 09:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EE80221FAC;
	Sat, 27 Dec 2025 09:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7rIctsA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0365B23D7D4
	for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 09:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766827520; cv=none; b=YbvcRAsVVY5Oa1CqZRRLEyP6gSquHFNAkTyLB4C1d6a9V0h36JMmz9+1VcsUPdIu4jfbeiZv3pcNBYpEcoqUpk4tzdvMj1jPC36ogt+TuKEwHgKKLs/+GclQuZPK5xfYdXozgJCxt3QMulef/hfd75mHCus5nNk3BF5xttE/H3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766827520; c=relaxed/simple;
	bh=Z6PHwIJKh4YdeVJmyiFlBdy4RbmW4/OAtwsPTlrcmCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uscazZyGhf1hYgyzthrtymtFEjjRuk7ZjumlCPl3WD+WwLweXamTuelOSglT9lEn2OaH06qJ4e6FAhZiqV95rqHodjDREnYfpKxMiHOFhQqz/MgY3+KEy9fMLODO0l54N78guhEaAzj0O0BghpEN0M6O9V+BX+9Ch/PV5a6Us0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7rIctsA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a0bae9aca3so113452405ad.3
        for <linux-input@vger.kernel.org>; Sat, 27 Dec 2025 01:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766827518; x=1767432318; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i3BFYNAbtZG3leNGBtINQ5cb2IgVIFK6WqdrJTyS6gI=;
        b=j7rIctsAOayDeWIrbD3x5sqNsvWd6OanKbGbdRcaC+xowTuiAVo4yfSjUVKBTs9ucA
         r84l51sxuCWg03i/rNKXNn4/mBDWRHLkMnPhA/3SPFXhCltfhpCmar65l1G6JjMZUcPn
         b/O87NUhKXyQG/gOyjBTihyr7pd+FRvmbjwUMhEw+brJmXcfzrBYRcKt000Wj/e0J8c5
         4iyRnQqqXyAuCMagtyffqWIia9mYgWuTcyqcrshwKBNMdyOOOEp7FHGHuYCCjoo5NYsQ
         P58pOVrdRPtvKfYespqmA7PsSYWVtQMDgenQw3wwCCVoqufOBgo0uQbBcHjWtDssj0BJ
         JEYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766827518; x=1767432318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3BFYNAbtZG3leNGBtINQ5cb2IgVIFK6WqdrJTyS6gI=;
        b=dx7R1lzO4aMnLvXictQUIYnFsj1elRYTFY0Ije0AYNw5rE9gzkyqn0A6WdPBfgTRpX
         DQFmwkudkRqSm37DaiA78AqcqkyMuKwmMcgoX9joSzFV/8YlM6jQAsTTwWjtGDJSs/Ol
         vx+auA/d5YvIz0jLuU37cqjjfWzXa0h86x8V/XG4uxXZXs2ScEL9NX35LT5EPTOj59i/
         bHOloJ0YeWQTCwB/Ub2yqkDrHV2Gw1s/gOYJPSso5zi8ysRfdUTKvNHwugcc7mtBYV1Z
         bdeL4Ljenmd6cTiDm4CZfXLoOgYLu/xojFafyo4tOVGuoBms1/F5pK9UBvXWjX46SmbI
         PNPA==
X-Gm-Message-State: AOJu0YweC35YP46kVscT9XoxMUuNRZb+RtuR/oH5LRPXSaG6txnkBKZm
	G66xDm18Bq8tzcnhiOy4B3cq6O37zFhgSdgcURleP7xpfim4cULtmJVn
X-Gm-Gg: AY/fxX6NpN13ZNQPBSkTwtUN5JeDjWVlqz2D0Pgu1mCxpmDy4Vobzi70aFxnaqV8XaP
	MXkF43LSse7R5omtB0wsLF2GT7RLcqlzJnZAq6RcvKt47zpcRu0nAq7Mqj/Wv+DqsqQu1kVTYJc
	DOeG56urrjsFPL+RwBnOfSM6k3EpD/1sG+GB9W6HvR/RGD6uu6iPtSwZFrNs+DIh5ua57GFnSkx
	zX2KJuY9/m7D+Xo+ZmbhNEdDlgIjksKaxUDkzEPgQ6sNDLYXCcgPcJYbcMptan1Pq5e8AdgTYrO
	fvRSWs24PlOkFSqE9TDe5ADLur95QiDGKVz0tl3hY6H/DogbYRhYCGT0CdQINLlcfC/lsbxOTiw
	xLtcF9y+ZPWEDmxTDFsyqL5TU0vdbnGjQL355aPMnFRKTrmT3LCEwqqBUM9Us6NJN0dp3BJUGqZ
	+QnRHNrxv4y7RltfHDY20nDpeaDk5MIylHScHpYimzZgwmNOcE/epu
X-Google-Smtp-Source: AGHT+IHTsCcvui8jRKA+O0QjNDk69pkIhS+aMkjJbTknqnEW1ap1FqjJpZKfTlqOyL0AMW68Vji5fA==
X-Received: by 2002:a05:7022:4287:b0:11b:9386:a3c8 with SMTP id a92af1059eb24-121723018d9mr31134476c88.41.1766827518050;
        Sat, 27 Dec 2025 01:25:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:6177:f7e0:90bb:6d94])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm97196074c88.17.2025.12.27.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 01:25:17 -0800 (PST)
Date: Sat, 27 Dec 2025 01:25:14 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Input: twl4030 - fix warnings without CONFIG_OF
Message-ID: <cnh4xmnzegu4kcfqpfvuusgbhxml434ole5ew3ifkvlyuj66ub@6myllf7zll4k>
References: <20251222144250.453508-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222144250.453508-1-andreas@kemnade.info>

Hi Andreas,

On Mon, Dec 22, 2025 at 03:42:49PM +0100, Andreas Kemnade wrote:
> There are unused variables without CONFIG_OF:
> drivers/input/misc/twl4030-pwrbutton.c:41:44: error: unused variable 'twl4030_chipdata' [-Werror,-Wunused-const-variable]
>    41 | static const struct twl_pwrbutton_chipdata twl4030_chipdata = {
>       |                                            ^~~~~~~~~~~~~~~~
> drivers/input/misc/twl4030-pwrbutton.c:46:44: error: unused variable 'twl6030_chipdata' [-Werror,-Wunused-const-variable]
>    46 | static const struct twl_pwrbutton_chipdata twl6030_chipdata = {
> 
> Fix that by avoiding some #ifdef CONFIG_OF
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512220251.jDE8tKup-lkp@intel.com/
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/input/misc/twl4030-pwrbutton.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-pwrbutton.c b/drivers/input/misc/twl4030-pwrbutton.c
> index d82a3fb28d95..7468d0d3e97a 100644
> --- a/drivers/input/misc/twl4030-pwrbutton.c
> +++ b/drivers/input/misc/twl4030-pwrbutton.c
> @@ -132,7 +132,6 @@ static void twl4030_pwrbutton_remove(struct platform_device *pdev)
>  	}
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
>  	{
>  		.compatible = "ti,twl4030-pwrbutton",
> @@ -145,7 +144,6 @@ static const struct of_device_id twl4030_pwrbutton_dt_match_table[] = {
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, twl4030_pwrbutton_dt_match_table);
> -#endif

I think you should also remove use of of_match_ptr() and replace include
of.h with mod_devicetable.h.

Thanks.

-- 
Dmitry

