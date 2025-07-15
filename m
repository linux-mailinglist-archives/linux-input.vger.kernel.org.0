Return-Path: <linux-input+bounces-13538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE6FB054BD
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 10:23:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 259B03A8A1F
	for <lists+linux-input@lfdr.de>; Tue, 15 Jul 2025 08:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C89F26C396;
	Tue, 15 Jul 2025 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pum0PPVH"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7431825F973;
	Tue, 15 Jul 2025 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752567738; cv=none; b=Bty+QAvVU/BdJ5oqL4DMLK2ldRJczWdAkTCBgjH8a0yLEE9200YGybNgHhSCwqfHf05E3+axpnzn5kuYPBRrP7kmBZCCrX/iuHP4Rp/35DDY4MZ7rJISCYubjdDHKaTW6o6M2q5Zsatpps8dHOW5sg2ddMEs+XEJ/+dtNAqU9hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752567738; c=relaxed/simple;
	bh=ixQ9mMtHtEXEWtYqP7IwY09UZX4JccWhWRs8Whx7Gz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nqyQlwIMwp25pVfIaRTl551xqxpMFTSfWbdKxB44y0gXtzQaBnGYxfRzNHt1h60By0epasz+/s4RHU67K8AagodmZsUd26fvRCX6AZMhiCKN4t+GCBNXJpCr0QCeWadJT9vlOU93JsXsn7WUwacT2OQ8OzuM7hbs2Z5cMgO/E5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pum0PPVH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C00C4CEE3;
	Tue, 15 Jul 2025 08:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752567738;
	bh=ixQ9mMtHtEXEWtYqP7IwY09UZX4JccWhWRs8Whx7Gz8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Pum0PPVHzqk2gRjPff+d6C9rtkU7NMSqZiya/jrFKDKDUq9KFTYZVZZPql9yJSNAh
	 dDnCgDney6g/MtPVKhh5QFTYAHTiJgCOrO1dFtV00NpMdYCyoWIMKKkfYETrWFQ+hO
	 IZrg0sD5Nx5niYvM5xuF2OGMXh0Uc5Ar6k8e9mSOrZiBchzc+VgfZ7K0A+L11nm27C
	 mUn05V7qiRrQY2M6I9WJUKbHcwaFGChn4r9VGNOAqOEsyLejz8lxoMAyThs2uWXuC8
	 TX24hgkCyHfRKN/g3k8vZxZqkY3VsgjmyRVWFKnEtMDTygd4Z6GJgp32ZOBrRpyzZt
	 eSNoUlH6nlf+Q==
Message-ID: <f2ea8ba7-3866-4ee7-986e-d6924b440e15@kernel.org>
Date: Tue, 15 Jul 2025 10:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.4/5.10/5.15/6.1/6.6] Input: atkbd - do not skip
 atkbd_deactivate() when skipping ATKBD_CMD_GETID
To: Wang Hai <wanghai38@huawei.com>, stable@vger.kernel.org,
 sashal@kernel.org, gregkh@linuxfoundation.org
Cc: yesh25@mail2.sysu.edu.cn, mail@gurevit.ch, egori@altlinux.org,
 anton@cpp.in, dmitry.torokhov@gmail.com, rrangel@chromium.org,
 linux-input@vger.kernel.org, zhangxiaoxu5@huawei.com
References: <20250715031442.16528-1-wanghai38@huawei.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250715031442.16528-1-wanghai38@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Jul-25 5:14 AM, Wang Hai wrote:
> From: Hans de Goede <hdegoede@redhat.com>
> 
> commit 9cf6e24c9fbf17e52de9fff07f12be7565ea6d61 upstream.
> 
> After commit 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in
> translated mode") not only the getid command is skipped, but also
> the de-activating of the keyboard at the end of atkbd_probe(), potentially
> re-introducing the problem fixed by commit be2d7e4233a4 ("Input: atkbd -
> fix multi-byte scancode handling on reconnect").
> 
> Make sure multi-byte scancode handling on reconnect is still handled
> correctly by not skipping the atkbd_deactivate() call.
> 
> Fixes: 936e4d49ecbc ("Input: atkbd - skip ATKBD_CMD_GETID in translated mode")
> Tested-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Link: https://lore.kernel.org/r/20240126160724.13278-3-hdegoede@redhat.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Wang Hai <wanghai38@huawei.com>

Thank you for backporting this.

The backport looks good to me:

Acked-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans





> ---
>  drivers/input/keyboard/atkbd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
> index b3a856333d4e..de59fc1a24bc 100644
> --- a/drivers/input/keyboard/atkbd.c
> +++ b/drivers/input/keyboard/atkbd.c
> @@ -805,11 +805,11 @@ static int atkbd_probe(struct atkbd *atkbd)
>  				 "keyboard reset failed on %s\n",
>  				 ps2dev->serio->phys);
>  
>  	if (atkbd_skip_getid(atkbd)) {
>  		atkbd->id = 0xab83;
> -		return 0;
> +		goto deactivate_kbd;
>  	}
>  
>  /*
>   * Then we check the keyboard ID. We should get 0xab83 under normal conditions.
>   * Some keyboards report different values, but the first byte is always 0xab or
> @@ -842,10 +842,11 @@ static int atkbd_probe(struct atkbd *atkbd)
>  			"NCD terminal keyboards are only supported on non-translating controllers. "
>  			"Use i8042.direct=1 to disable translation.\n");
>  		return -1;
>  	}
>  
> +deactivate_kbd:
>  /*
>   * Make sure nothing is coming from the keyboard and disturbs our
>   * internal state.
>   */
>  	if (!atkbd_skip_deactivate)


