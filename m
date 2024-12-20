Return-Path: <linux-input+bounces-8704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B11559F98D9
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 18:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E1557A2CC0
	for <lists+linux-input@lfdr.de>; Fri, 20 Dec 2024 17:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B529C219A9A;
	Fri, 20 Dec 2024 17:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jal0EHsR"
X-Original-To: linux-input@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FBC21D5A8
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 17:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716292; cv=none; b=nHyBB7O1qZ2VpIfafEBfHo77iAfBD6w0JCQhxyr/Oz+66Fw/GpXP0LcQ4SXbDIsY6+bXAVAoCFiBO+AdYNPWXauj92uvskrukDnXcK5ZKEL+HWP9r9pjY90HIm2icCL7BaC1QOFTxxhHQhKI2kP2piMC31bwCH1jtwHOdq/7H0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716292; c=relaxed/simple;
	bh=pfuJ80VnkiiOuyWz7Xtl+XWcQaKjewmJD9K8OZtY6jU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=PRGCFKjcckVr4b8h+ld2jzt4bF+IvBx4RpzfXqQk74ACeL5Ou/ft0rNsBXZy3cyW3j9VcHTQrt0wln0Bjz25FmzlmeW/DMf9Zd/+5gQ9s6Xab3j7QAmdTlg1ZUbXSCA7yIxjHweH2nHJ+WlFcB0UAuhvwWlE1pZ69zynViD2Jqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jal0EHsR; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20241220173807euoutp01b234ba0f5a32c7cf2f796514aff50189~S80WuYugE0916609166euoutp012
	for <linux-input@vger.kernel.org>; Fri, 20 Dec 2024 17:38:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20241220173807euoutp01b234ba0f5a32c7cf2f796514aff50189~S80WuYugE0916609166euoutp012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734716287;
	bh=bJ6KA/0um+GA6RiT7flnrgDQCoWyoa2TPUmE4fzS1bg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=jal0EHsRfeRfs5VXQmAdd0GwiYn8cp4jQLrmYan+IOAkmTnElmKibk7rexCyyvH7N
	 NPC3WVfRT3QzGQDLoBz84AKI41Xu7IFRNqiTIZKhP12Uw4PSt3vjI+e7Wy0WDhgT9i
	 Vk2MEwCYFHBQw0UYU5uGuYbxpfc/cYRI93tO0NZw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20241220173806eucas1p12847165db21541975af50ec82491ab27~S80WUvK8R2073220732eucas1p1p;
	Fri, 20 Dec 2024 17:38:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 18.A8.20409.E7BA5676; Fri, 20
	Dec 2024 17:38:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20241220173806eucas1p20876ba65ad771db4eec8c9a74f2a50a9~S80WBlf5h3069730697eucas1p2W;
	Fri, 20 Dec 2024 17:38:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20241220173806eusmtrp2a17d5de719c041dfde13577c3a8602f5~S80WA--At1545915459eusmtrp2W;
	Fri, 20 Dec 2024 17:38:06 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-31-6765ab7eb335
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.2D.19654.E7BA5676; Fri, 20
	Dec 2024 17:38:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241220173805eusmtip2c526e58b39a5103c09b7d12387cf61a4~S80VCGq_z1802618026eusmtip2X;
	Fri, 20 Dec 2024 17:38:05 +0000 (GMT)
Message-ID: <d9130467-7141-4a5a-a520-a0550031111f@samsung.com>
Date: Fri, 20 Dec 2024 18:38:04 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] Input: ff-core - make use of __free() cleanup
 facility
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, 'Linux Samsung SOC'
	<linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <Z2Wn2wTesz3nj-vO@google.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djP87p1q1PTDZ4+VrE49HE5u8XhRS8Y
	Ld4cn85kcet4K6PFzU/fWC0u75rDZjHj/D4mB3aPnbPusntsWtXJ5vF+31U2j8+b5AJYorhs
	UlJzMstSi/TtErgy7u0tL9gnWvHy32O2Bsb9gl2MnBwSAiYSS6fMZwaxhQRWMErcfZ3SxcgF
	ZH9hlLh16AkThPOZUWLOhgssMB0v9i9nhEgsZ5Q4s+w2VNVHRomli+6wg1TxCthJ7Ox/zwpi
	swioSiw7fYANIi4ocXLmE7BJogLyEvdvzQCrFxYIlLh2oRWsXkRAX2L77F9gG5gFXjFK3Ji+
	B6yZWUBc4taT+UwgNpuAoUTX2y6wOKeAlsSPfWuZIWrkJba/ncMM0iwhcIFD4vTv7cwQd7tI
	fPrTD2ULS7w6voUdwpaR+L9zPhNEQzujxILf96GcCYwSDc9vMUJUWUvcOfcLaB0H0ApNifW7
	9EFMCQFHicurvSBMPokbbwUhbuCTmLRtOjNEmFeio00IYoaaxKzj6+C2HrxwiXkCo9IspGCZ
	heTLWUi+mYWwdgEjyypG8dTS4tz01GKjvNRyveLE3OLSvHS95PzcTYzAxHP63/EvOxiXv/qo
	d4iRiYPxEKMEB7OSCC+PXGq6EG9KYmVValF+fFFpTmrxIUZpDhYlcV7VFPlUIYH0xJLU7NTU
	gtQimCwTB6dUA5NMVJOMidIP8+0//fJ5xeRte/guavx+sqJG6DzLdtZI5fnbnm3cf+GO0g2D
	1W2W/+dqfeKTu64S/UMg4UOVxtmbPovspy/buWKL568vUmK/M83Er5Z73mlmd3G+kZF91rv/
	VJY0y4ySjsvq7ctDOddXzD36vNzh6u3Vsz/vfheWO6szdskJUfa1zeWX1JxunK5SufkmyzE5
	dlfhH9mCT17f/m/IUHtfuLT+34urj7iFgm8zFO8T2KLVxKT9iNHkhgLv6gVBNWf3dK4x+cW8
	6mxhwmLvzYtqJqxboVIzy9OVp7o5XTHaZ5aBVa6x2+R3RQbNst9uyyouq8+/fvhH6bIEzZXv
	eLs2nD5evuV6sLwSS3FGoqEWc1FxIgDzwEoeqwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsVy+t/xe7p1q1PTDZa+4LE49HE5u8XhRS8Y
	Ld4cn85kcet4K6PFzU/fWC0u75rDZjHj/D4mB3aPnbPusntsWtXJ5vF+31U2j8+b5AJYovRs
	ivJLS1IVMvKLS2yVog0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQy7u0tL9gn
	WvHy32O2Bsb9gl2MnBwSAiYSL/YvZ+xi5OIQEljKKDGp6QELREJG4uS0BlYIW1jiz7UuNoii
	94wS/3tXsoMkeAXsJHb2vwcrYhFQlVh2+gAbRFxQ4uTMJ2CDRAXkJe7fmgFWLywQKHHtQitY
	vYiAvsT22b8YQWxmgVeMEg8P8EEsmMckMXtPNwtEQlzi1pP5TCA2m4ChRNfbLrAFnAJaEj/2
	rWWGqDGT6NraBTVIXmL72znMExiFZiG5YxaSUbOQtMxC0rKAkWUVo0hqaXFuem6xkV5xYm5x
	aV66XnJ+7iZGYKxtO/Zzyw7Gla8+6h1iZOJgPMQowcGsJMLLI5eaLsSbklhZlVqUH19UmpNa
	fIjRFBgYE5mlRJPzgdGeVxJvaGZgamhiZmlgamlmrCTOy3blfJqQQHpiSWp2ampBahFMHxMH
	p1QD02Jdkew6MzepHFb70uKdS+/l3b269zf/1BepW5rbJ3+WXLTi3NPt6TMfStRwZak675r/
	PH3FU6+tmvfC/+Vva+7hmnzHXfJT/3+RMml+YU47m4NfA+2rPgacWPYp9qh5+dR1N3f11Stf
	Oauz6bwP6yFTxsMBnrOudkgcultkmasTz6Vnlr5JTW8zkwn7p44InbhUhvlr/mU26R567Xhw
	BR9ffKpSX9I9lyjmuxVWk+9tfXJjnnXK41ksN+pso2+WXFl1RM5f4GS3j6B2j2XLUd7/L2T8
	poQxt6dYzW9aEhhw7NaFd9zW0wu6jQ77vPf8x7YmYXly8SNLhtbPO2TSN3JaMzR+n9FRk73g
	eWS9EktxRqKhFnNRcSIA8ugjdD4DAAA=
X-CMS-MailID: 20241220173806eucas1p20876ba65ad771db4eec8c9a74f2a50a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241220123701eucas1p23125e0738985ffe35cbe9624dff08972
References: <20241107071538.195340-1-dmitry.torokhov@gmail.com>
	<20241107071538.195340-3-dmitry.torokhov@gmail.com>
	<CGME20241220123701eucas1p23125e0738985ffe35cbe9624dff08972@eucas1p2.samsung.com>
	<7d1e1c89-d4a6-4b3d-a674-5ef497c2c496@samsung.com>
	<Z2Wn2wTesz3nj-vO@google.com>

On 20.12.2024 18:22, Dmitry Torokhov wrote:
> On Fri, Dec 20, 2024 at 01:36:59PM +0100, Marek Szyprowski wrote:
>> On 07.11.2024 08:15, Dmitry Torokhov wrote:
>>> Annotate allocated memory with __free(kfree) to simplify the code and
>>> make sure memory is released appropriately.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>    drivers/input/ff-core.c | 19 ++++++-------------
>>>    1 file changed, 6 insertions(+), 13 deletions(-)
>> This patch landed in linux-next as commit 5203b3a18c1b ("Input: ff-core
>> - make use of __free() cleanup facility"). In my tests I found that it
>> causes the following kernel panic on some of my test boards. Reverting
>> it, together with fd5ba0501d38 ("Input: ff-memless - make use of
>> __free() cleanup facility") on top of next-20241220 fixes this panic
>> issue.
> Gah, I fixed this once and then undid it for some reason. I think the
> following should fix the problem:

Yep, this fixes the problem. Feel free to add:

Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>


> diff --git a/drivers/input/ff-core.c b/drivers/input/ff-core.c
> index a235d2eb6b31..c25e05eeb8e5 100644
> --- a/drivers/input/ff-core.c
> +++ b/drivers/input/ff-core.c
> @@ -315,7 +315,6 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
>   	ff->max_effects = max_effects;
>   	mutex_init(&ff->mutex);
>   
> -	dev->ff = no_free_ptr(ff);
>   	dev->flush = input_ff_flush;
>   	dev->event = input_ff_event;
>   	__set_bit(EV_FF, dev->evbit);
> @@ -328,6 +327,7 @@ int input_ff_create(struct input_dev *dev, unsigned int max_effects)
>   	if (test_bit(FF_PERIODIC, ff->ffbit))
>   		__set_bit(FF_RUMBLE, dev->ffbit);
>   
> +	dev->ff = no_free_ptr(ff);
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(input_ff_create);
> diff --git a/drivers/input/ff-memless.c b/drivers/input/ff-memless.c
> index 0bbeceb35545..e9120ba6bae0 100644
> --- a/drivers/input/ff-memless.c
> +++ b/drivers/input/ff-memless.c
> @@ -524,7 +524,6 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
>   		return error;
>   
>   	ff = dev->ff;
> -	ff->private = no_free_ptr(ml);
>   	ff->upload = ml_ff_upload;
>   	ff->playback = ml_ff_playback;
>   	ff->set_gain = ml_ff_set_gain;
> @@ -541,6 +540,8 @@ int input_ff_create_memless(struct input_dev *dev, void *data,
>   	for (i = 0; i < FF_MEMLESS_EFFECTS; i++)
>   		ml->states[i].effect = &ff->effects[i];
>   
> +	ff->private = no_free_ptr(ml);
> +
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(input_ff_create_memless);
>
>
> Thanks.
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


