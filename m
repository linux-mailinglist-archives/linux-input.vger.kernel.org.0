Return-Path: <linux-input+bounces-877-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4A68194C5
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 00:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E581F23B29
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 23:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D85D405CB;
	Tue, 19 Dec 2023 23:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=who-t.net header.i=@who-t.net header.b="u7QabCbq";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MNVgutu4"
X-Original-To: linux-input@vger.kernel.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03EC405C9
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 23:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=who-t.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=who-t.net
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 93D4A5C0232;
	Tue, 19 Dec 2023 18:51:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 19 Dec 2023 18:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1703029916; x=1703116316; bh=fzkPXwrlRK
	Kf4oqrbET2fASWvSAwAh5SyGfPziesfRs=; b=u7QabCbqjvSfRhz9ISNGvSDT0S
	8Ov41ySj76XTDZL6+gpsPTDg1sTcHwCk8HQMEbfSE8hZhMYookSUTPywfUrW6lUj
	6FiMvsG2gsJb4Dt4AwNrYYNLWaFBmc46UrFHXsq5RlOhlfKjTOCr9qnThI/Nl5/c
	ZXNBswAcg8y0db/PrSEG5FsVUjOpUEPYAk2HG0DffaOZUPUX3UNIEbuVKy7UDPrs
	jyNup3A6blV+k2jA22GFva4W942rB35cCnWrNvylFPPiWnTUNGuZx1T/kUvw+PTg
	Ux2EhaKZTkJuvRSCGWZEqltHCPV6xK3T3Txq9EJEB6BRKI9B/VZ1PWosqNzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1703029916; x=1703116316; bh=fzkPXwrlRKKf4oqrbET2fASWvSAw
	Ah5SyGfPziesfRs=; b=MNVgutu4DFax8tSJDbEUdWJJuzc87FDaQQ5CMQwcmxHJ
	mVG9ALEXzOY0bp+csfPuggRF8hS/3nnkMgI8jX6hFACsQg/mNJUdI+7M9+3+CbPc
	69cUReJ1SntpTxZGUOZlOGlZMUJHbO9Iv8abqcgpmp9dZRVkoCcoW71tDjAvRIfD
	kZ8SKsqQ/G+erD+T2VcMXc+MZiOKA2hgZ2CoQPvFH6IaSWTEGwCZAslB2zMjPYm0
	u47urh0B1D/yo2Jpw+/bjuWXtl6v3BGbw6FKjRlBzd20eNtgjKUd5FvSpw7JGAnn
	KHjWedcKAOdzKUHqUOH/NG9l1G6eTQFf1K8W6Aku1A==
X-ME-Sender: <xms:nCyCZQ1M5jXH7k_oNxG8rdwI79lUGRjF33L73fXvC8dyAUG3UOLnZQ>
    <xme:nCyCZbErVIWu8-BwYNxQFPqkNalKw9ZJkEVFZmDv4poabMpxw2eBnWVN6c28XCa5g
    Bjo7c8VR9sJ6opSRWo>
X-ME-Received: <xmr:nCyCZY74oyAeJl68VBg9CWp6ULbHZT1NFx8BSGhsbQ4rasf0glB2Y6EM2jBqhvdSpwxgSpANP7-HzNQ68mlPKuPrsHDDJVpCA0Nv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdduuddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheprfgvthgv
    rhcujfhuthhtvghrvghruceophgvthgvrhdrhhhuthhtvghrvghrseifhhhoqdhtrdhnvg
    htqeenucggtffrrghtthgvrhhnpeetgfelgfdviedutddtffeggfegieehveeludduffeg
    udeuteejteetfeffhefgleenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgvthgvrhdrhhhu
    thhtvghrvghrseifhhhoqdhtrdhnvght
X-ME-Proxy: <xmx:nCyCZZ3U68Kz_s-kX_BSLEZlX9yfccP1gCfa_UvOmAQLfoD2ZDt75g>
    <xmx:nCyCZTFZbkKEfBQ7S4nMz71dI1qBoSpmUyA7jQx71Hmlg72AoBkv7g>
    <xmx:nCyCZS-cMKX7SBG_xbjQ0NNn7892fBGakEQUJHbtIVJE03esD90Iaw>
    <xmx:nCyCZY7OYn0MSR15MN3-81vdlmstLiwsRbGaZzXCRKbYIrgHoQwluQ>
Feedback-ID: i7ce144cd:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 19 Dec 2023 18:51:53 -0500 (EST)
Date: Wed, 20 Dec 2023 09:51:49 +1000
From: Peter Hutterer <peter.hutterer@who-t.net>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, svv@google.com,
	biswarupp@google.com, paul@crapouillou.net, contact@artur-rojek.eu,
	Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH] input: uinput: Drop checks for abs_min > abs_max
Message-ID: <20231219235149.GA3401344@quokka>
References: <20231218171653.141941-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231218171653.141941-1-macroalpha82@gmail.com>

On Mon, Dec 18, 2023 at 11:16:53AM -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Stop checking if the minimum abs value is greater than the maximum abs
> value. When the axis is inverted this condition is allowed. Without
> relaxing this check, it is not possible to use uinput on devices in
> userspace with an inverted axis, such as the adc-joystick found on
> many handheld gaming devices.

As mentioned in the other thread [1] a fair bit of userspace relies on
that general assumption so removing it will likely cause all sorts of
issues.

Cheers,
   Petre

[1] https://lore.kernel.org/linux-input/20231219234803.GA3396969@quokka/T/#t
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/input/misc/uinput.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
> index d98212d55108..e90dbf2c0b34 100644
> --- a/drivers/input/misc/uinput.c
> +++ b/drivers/input/misc/uinput.c
> @@ -403,14 +403,7 @@ static int uinput_validate_absinfo(struct input_dev *dev, unsigned int code,
>  	min = abs->minimum;
>  	max = abs->maximum;
>  
> -	if ((min != 0 || max != 0) && max < min) {
> -		printk(KERN_DEBUG
> -		       "%s: invalid abs[%02x] min:%d max:%d\n",
> -		       UINPUT_NAME, code, min, max);
> -		return -EINVAL;
> -	}
> -
> -	if (!check_sub_overflow(max, min, &range) && abs->flat > range) {
> +	if (!check_sub_overflow(max, min, &range) && abs->flat > abs(range)) {
>  		printk(KERN_DEBUG
>  		       "%s: abs_flat #%02x out of range: %d (min:%d/max:%d)\n",
>  		       UINPUT_NAME, code, abs->flat, min, max);
> -- 
> 2.34.1
> 
> 

