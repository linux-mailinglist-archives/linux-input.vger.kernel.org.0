Return-Path: <linux-input+bounces-8067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041F9C7D03
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 21:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C18DB281D68
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2024 20:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84120206067;
	Wed, 13 Nov 2024 20:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j2iLs3kI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FE3205E0E;
	Wed, 13 Nov 2024 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731530161; cv=none; b=D3BTYjz1LiT6SXuT5HbC55YdahqjlAzakoCwA7q11JuWxK9Irkl7CB/ML3Ig4By62DZrxnHeJg8ilH5kGYh3Do+/mQIHSCLIsTwitx81BTuQLVRzU0a/jW6bjoMh73x7GOlqhHGY0X6f+6qCQ/4m4P/v6BW1XKDCwOh7+Hm/08c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731530161; c=relaxed/simple;
	bh=7z/z6YvKvrwp2rMQbvaENk6cGLjmuEiWrFblejpMhxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDYh25fw9ml4qTen0hfeJCBlL1xXUoI8iNgH8mQl+2ZGZaQdS9Hanreye/9z3AvoBzTjyND2MkA32hv98vETR1K3lRB8ogfTrZDUTyN0mTjwpykh5znjDm/+ax3NeKY1jRBrZKaNChyHpVpnrZSgTI/XOYoJt+f/39i1caOJntE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j2iLs3kI; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-514543a08d0so573597e0c.0;
        Wed, 13 Nov 2024 12:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731530158; x=1732134958; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
        b=j2iLs3kIHfXvuFDQYwkTJNnBp7QwwoBbx9d907O7DY9MdSkrk43Hud+hpnWlJy/7kc
         obBF4X/Tf/7eIrV9khlMp/9HJnwuek/U22tRsvX3J3pH3poYfArzLoLZgTKRIbVJ/YT4
         R6+iJW08B3cm9/yLRw8ilU4DyxfVmmBFS8thfFlWOBs1bv1IuXnh9ZuwwkNMvnAI1VRG
         jp47NIcnCTgJMULZ6w6CxidJCoTl4wxOrPp9GdC7XpXpGC9E7ZFqsW8Wj0i5BsJksMSV
         nA+jAVxPpyOIOaenxjMbv5z/mwwPmoxJiDZAxjy41u2+WbS/ELRbm/zo17d/klO89mYr
         KvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731530158; x=1732134958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/sJfcthCzxrPjuRsj4tX5SjwFr74e9+VRf3E94baG8=;
        b=V1onMowdNAP+39NxU2kVZnl8URHBq1CCUFw2pASxE6MxPV188b+gPPF9aAVTFC42Fn
         7l+iDfCLqw0dOYl7g1o7xRsR9WxAnVlFabW6JWWBkzTgwgsYWKDtC/Pu8FXobDbYg+3P
         apeZdhVGkn2P9YPQ6zOXcE5SQbR0vU/Pvn9OVx0lNf3EynQlGszzOOdelGUK2O0adMwk
         taP1ISu2QSDbD+B50whuJP2ICe6+/HTtUqjY74bIhErzpSGb/IWfF9UQD1XPjYphbl+Q
         OGX0PS3lm+KGdZVlB9jubnPxQCIYKbHrnjbKwp7CyUD1BgmCt7TTQUxZ3nPM8hLRVTpl
         H5Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUxxg9o83ulMpRDenKUF8pPMdrmdAFkuoKJ19C/RhaqzzRq0/z5nrTzNWaszB8DGRW9sdM85N6AWgd9EDU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nlwF7m/48NttANxAaBd8zcrF+KmAtsPB6az02Tx4vTGWMQTE
	E2HDAqg7yyLb14Yg32CrYBepszLWHfynNizUPiL8jTA6rXA0qT739hqEfwYCglZ1odJETMmnIIF
	TcANW6zl3IF/+OHD3sxqbNisWp3E=
X-Google-Smtp-Source: AGHT+IEIPpn4HHPIF+usA6rtVxhozfZrFa/wVDvJvxg7hmjJzXgeWkot8H8vZh/T4c/n+8NbksBDE/nxMxLWoC2ruMQ=
X-Received: by 2002:a05:6122:168e:b0:50a:caec:70a2 with SMTP id
 71dfb90a1353d-51401bc7d7cmr22823944e0c.4.1731530157648; Wed, 13 Nov 2024
 12:35:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241020144736.367420-1-karprzy7@gmail.com>
In-Reply-To: <20241020144736.367420-1-karprzy7@gmail.com>
From: Karol P <karprzy7@gmail.com>
Date: Wed, 13 Nov 2024 21:35:46 +0100
Message-ID: <CAKwoAfoQ1Kt3HqW8jaFCmx1s8zmvSF9aBhNOjyqF47h8T1zmWA@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-thrustmaster: add endpoint check in thrustmaster_interrupts
To: jikos@kernel.org, bentiss@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com
Cc: linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Oct 2024 at 16:47, Karol Przybylski <karprzy7@gmail.com> wrote:
>
> syzbot has found a type mismatch between a USB pipe and the transfer
> endpoint, which is triggered by the hid-thrustmaster driver[1].
> There is a number of similar, already fixed issues [2].
> In this case as in others, implementing check for endpoint type fixes the issue.
>
> [1] https://syzkaller.appspot.com/bug?extid=040e8b3db6a96908d470
> [2] https://syzkaller.appspot.com/bug?extid=348331f63b034f89b622
>
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Tested-by: syzbot+040e8b3db6a96908d470@syzkaller.appspotmail.com
> Signed-off-by: Karol Przybylski <karprzy7@gmail.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index cf1679b0d4fb..f948189394ef 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -170,6 +170,13 @@ static void thrustmaster_interrupts(struct hid_device *hdev)
>         ep = &usbif->cur_altsetting->endpoint[1];
>         b_ep = ep->desc.bEndpointAddress;
>
> +       /* Are the expected endpoints present? */
> +       u8 ep_addr[1] = {b_ep};
> +       if (!usb_check_int_endpoints(usbif, ep_addr)) {
> +               hid_err(hdev, "Unexpected non-int endpoint\n");
> +               return;
> +       }
> +
>         for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
>                 memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
>
> --
> 2.34.1
>

Any feedback regarding this patch is appreciated. I was wondering if I
should declare an additional u8 array or maybe just do inline
conversion.

Best regards,
Karol

