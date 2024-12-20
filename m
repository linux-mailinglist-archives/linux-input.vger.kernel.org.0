Return-Path: <linux-input+bounces-8699-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7859F9253
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 13:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9352316024F
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 12:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316CC2153D3;
	Fri, 20 Dec 2024 12:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ijXIjBXg"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521F5215190
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 12:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698233; cv=none; b=L6hJh/kB6r7KkOkyYFTVpQ6n+HMEYzkJFmId1xnCGZACZzwNq899U6+JKvG9U53AG5ALyotRlC6cJoWbQ2HQjMlYikslgnXSsClQPy6yo3H98+X3tlYedU+F6IzCjKyI5nBkaC9gNoYFRl7u2AFZ+R5ESqucMZKnerP7O5lqyw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698233; c=relaxed/simple;
	bh=tORaMFyySsXGSf8Qe7/iDA5PLiNgHk/vRFxgsbxgeQk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=elO2AW7zO/T3p+KrMXEj19kqmexEfuLAEALbcXhxPtS2qDjKSy/mopAQ7iPnqkUaikZ8ub5kq/9BS03i0pfH6rwQJstpN30M3A65HGTkER7dwJDXI5P2b7Sgyt7fTS3SbnC1Xz9BmgjaWmD2ugqqJKfPUnTlwJvV23ggffaCtYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ijXIjBXg; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241220123702euoutp01076d37db48cabf20f647b07ef97c431d~S4tekCiS20832208322euoutp01W
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 12:37:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241220123702euoutp01076d37db48cabf20f647b07ef97c431d~S4tekCiS20832208322euoutp01W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734698222;
	bh=Vb9FazCzx34swWDCVuSTS9Qo9cfzO8TOGyWgAvUjXLA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ijXIjBXgDj8L1mct46PWUQ72DkDLh4JUUnIIwBNq7gZ6ztTmkEcaiZY33hS1RAijC
	 oOkaJrqAX/JQGkgqGBxOCjn211uKek+lTEUik6p1mouk146/6Qh6Py+CHd2pbhpoWj
	 vqa/UhS2UxgdOHAMitf6dkHQhO9jhyzCL1BuPKcI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241220123702eucas1p21935e8a5168845b948f727784e4e4787~S4teX-RhN1838518385eucas1p2l;
	Fri, 20 Dec 2024 12:37:02 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id B4.92.20409.DE465676; Fri, 20
	Dec 2024 12:37:01 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241220123701eucas1p23125e0738985ffe35cbe9624dff08972~S4td8iqiT1541115411eucas1p2O;
	Fri, 20 Dec 2024 12:37:01 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241220123701eusmtrp2468c13e96a49daa989e782d86573e73c~S4td7rTiO0189901899eusmtrp2W;
	Fri, 20 Dec 2024 12:37:01 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-6f-676564eda031
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id A3.FA.19654.DE465676; Fri, 20
	Dec 2024 12:37:01 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241220123700eusmtip1fcdf4a8790ddfe4c8e08aa0239ed284e~S4tdVoMUQ0813808138eusmtip1r;
	Fri, 20 Dec 2024 12:37:00 +0000 (GMT)
Message-ID: <7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>
Date: Fri, 20 Dec 2024 13:36:59 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] Input: ff-core - make use of __free() cleanup
 facility
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina
	<jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, Hans de Goede
	<hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 'Linux
	Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20241107071538.195340-3-dmitry.torokhov@gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djP87pvU1LTDWYct7I49HE5u8XhRS8Y
	Ld4cn85kcet4K6PFzU/fWC0u75rDZjHj/D4mB3aPnbPusntsWtXJ5vF+31U2j8+b5AJYorhs
	UlJzMstSi/TtErgy/j1+wVTQJVfx+M1tlgbG1xJdjJwcEgImEmfen2cCsYUEVjBKrP1h38XI
	BWR/YZRY1TuZBcL5zChxsG8eM0zH4Y1XmSESyxklzj9qYoRwPjJKrOn+AORwcPAK2EnM38UK
	0sAioCrxrOcMG4jNKyAocXLmExYQW1RAXuL+rRnsILawQKDEtQutrCBzRAQWMkpcmHKPDWQO
	s0CFxLITXiA1zALiEreezAc7lU3AUKLrbRfYTE4BB4nVnT8ZIWrkJZq3zgY7TkLgBofE//Nv
	mCCudpHY3LeDBcIWlnh1fAs7hC0j8X8nyFCQhnZGiQW/70M5ExglGp7fYoSospa4c+4X1EWa
	Eut36YOYEgKOEpdXe0GYfBI33gpC3MAnMWnbdGaIMK9ER5sQxAw1iVnH18FtPXjhEvMERqVZ
	SKEyC8mXs5B8Mwth7QJGllWM4qmlxbnpqcVGeanlesWJucWleel6yfm5mxiBaef0v+NfdjAu
	f/VR7xAjEwfjIUYJDmYlEV4eudR0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryqKfKpQgLpiSWp
	2ampBalFMFkmDk6pBia7TvdgncbZU2vTt8tua427k3aUJS/UceffeqcMrfPxrN4Ptonc66ot
	Xshx6/vl2/pGfbKTJC4bHoyNavh7suul7oMLwc6b712oazvnX328fN0yrbp5DNlZ1y4fz8n+
	2Buz0XbLyiuLK1IyX7zraz2WMO3DxX26hxT/VzVs+eAefip6qdMUYXHWuNNbTn4RnLQ/VdzG
	jVP4WP3trLNSjBcs7mbGc+de9l3LckZq/+q6nQXWHrHPvgcktTOU3XzaFn3m+91rkcHNG4Km
	2n6e2RbHXpdmW3Un2+n+sSSX3KBtARfWzfqzdpfonadPM9bGiRVYHb7w4Gyl4dvIA78uhKmm
	beVxdKlcOJXfxD7g/VklluKMREMt5qLiRACbB3CfqgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xu7pvU1LTDVrOK1kc+ric3eLwoheM
	Fm+OT2eyuHW8ldHi5qdvrBaXd81hs5hxfh+TA7vHzll32T02repk83i/7yqbx+dNcgEsUXo2
	RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ/x6/YCro
	kqt4/OY2SwPja4kuRk4OCQETicMbrzJ3MXJxCAksZZQ4tv8SI0RCRuLktAZWCFtY4s+1LjaI
	oveMEivvHGXqYuTg4BWwk5i/C6yGRUBV4lnPGTYQm1dAUOLkzCcsILaogLzE/Vsz2EFsYYFA
	iWsXWllB5ogILGSU2L5nF9gyZoEKibVL34AVCQmUSsy/PhEqLi5x68l8JhCbTcBQouttF9gC
	TgEHidWdP6FqzCS6tnZB2fISzVtnM09gFJqF5I5ZSEbNQtIyC0nLAkaWVYwiqaXFuem5xUZ6
	xYm5xaV56XrJ+bmbGIGxtu3Yzy07GFe++qh3iJGJg/EQowQHs5IIL49caroQb0piZVVqUX58
	UWlOavEhRlNgYExklhJNzgdGe15JvKGZgamhiZmlgamlmbGSOC/blfNpQgLpiSWp2ampBalF
	MH1MHJxSDUwrlud1/3mvnG398EDIH9d933b5S+sWxkgxX19f0MVRYmkq+OHe0vqv2yfIV235
	UXJCI7hp3qLFH4oy3u28u6Ru+l3Oqh1vpimyHNHcO2deweTb0tM1ja5NulnwaNFl3rBtpRfm
	/Sj4cDcyU41RYEW29AmRzWkrtDj5jUKamlwmOjzqEr58JG1LqW+Z4ceFZe3hja82lXWLzt3e
	3hVvEzSlpEhl0gF++VNWVgeYc3Y3SU17YDoxy0uKecGbu/J3N18WCnirxNtZLyOgOsvY8/im
	Ih3RIqafzGt1vNkuXflyjaH++sKD0imzbhue5hPakm/DaXVl7qpbXEciFzkcl4pY+nF3ymwO
	lve8nPPnvDJXYinOSDTUYi4qTgQAreV42j4DAAA=
X-CMS-MailID: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
	<20241107071538.195340-3-dmitry.torokhov@gmail.com>
	<CGME20241220123701eucas1p23125e0738985ffe35cbe9624dff08972@eucas1p2.samsung.com>

On 07.11.2024 08:15, Dmitry Torokhov wrote:
> Annotate allocated memory with __free(kfree) to simplify the code and
> make sure memory is released appropriately.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/ff-core.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)

This patch landed in linux-next as commit 5203b3a18c1b ("Input: ff-core 
- make use of __free() cleanup facility"). In my tests I found that it 
causes the following kernel panic on some of my test boards. Reverting 
it, together with fd5ba0501d38 ("Input: ff-memless - make use of 
__free() cleanup facility") on top of next-20241220 fixes this panic 
issue. Here is the relevant log captured on Samsung Exynos4412 ARM 
32bit-based Trats2 board:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 
00000024 when read
[00000024] *pgd=00000000
Internal error: Oops: 5 [#1] PREEMPT SMP ARM
Modules linked in:
CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.13.0-rc3-next-20241220 #15500
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at input_ff_create+0xa0/0x13c
LR is at input_ff_create+0xb8/0x13c
pc : [<c08d7e14>]    lr : [<c08d7e2c>]    psr: 80000013
...
Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
...
Call trace:
  input_ff_create from input_ff_create_memless+0x8c/0x160
  input_ff_create_memless from max77693_haptic_probe+0x1b0/0x284
  max77693_haptic_probe from platform_probe+0x80/0xc0
  platform_probe from really_probe+0x154/0x3ac
  really_probe from __driver_probe_device+0xa0/0x1d4
  __driver_probe_device from driver_probe_device+0x30/0xd0
  driver_probe_device from __driver_attach+0x10c/0x190
  __driver_attach from bus_for_each_dev+0x60/0xb4
  bus_for_each_dev from bus_add_driver+0xe0/0x220
  bus_add_driver from driver_register+0x7c/0x118
  driver_register from do_one_initcall+0x6c/0x328
  do_one_initcall from kernel_init_freeable+0x1c8/0x218
  kernel_init_freeable from kernel_init+0x1c/0x12c
  kernel_init from ret_from_fork+0x14/0x28
Exception stack(0xf0845fb0 to 0xf0845ff8)
...
---[ end trace 0000000000000000 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

> diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> index eb01bcb69d00..a235d2eb6b31 100644
> --- a/drivers/input/ff-core.c
> +++ b/drivers/input/ff-core.c
> @@ -290,8 +290,6 @@ EXPORT_SYMBOL_GPL(input_ff_event);
>    */
>   int input_ff_create(struct input_dev *dev, unsigned int max_effects)
>   {
> -	struct ff_device *ff;
> -	size_t ff_dev_size;
>   	int i;
>   
>   	if (!max_effects) {
> @@ -304,25 +302,20 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
>   		return -EINVAL;
>   	}
>   
> -	ff_dev_size = struct_size(ff, effect_owners, max_effects);
> -	if (ff_dev_size == SIZE_MAX) /* overflow */
> -		return -EINVAL;
> -
> -	ff = kzalloc(ff_dev_size, GFP_KERNEL);
> +	struct ff_device *ff __free(kfree) =
> +		kzalloc(struct_size(ff, effect_owners, max_effects),
> +			GFP_KERNEL);
>   	if (!ff)
>   		return -ENOMEM;
>   
> -	ff->effects = kcalloc(max_effects, sizeof(struct ff_effect),
> -			      GFP_KERNEL);
> -	if (!ff->effects) {
> -		kfree(ff);
> +	ff->effects = kcalloc(max_effects, sizeof(*ff->effects), GFP_KERNEL);
> +	if (!ff->effects)
>   		return -ENOMEM;
> -	}
>   
>   	ff->max_effects = max_effects;
>   	mutex_init(&ff->mutex);
>   
> -	dev->ff = ff;
> +	dev->ff = no_free_ptr(ff);
>   	dev->flush = input_ff_flush;
>   	dev->event = input_ff_event;
>   	__set_bit(EV_FF, dev->evbit);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


