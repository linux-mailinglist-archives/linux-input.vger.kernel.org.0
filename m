Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90017325F57
	for <lists+linux-input@lfdr.de>; Fri, 26 Feb 2021 09:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbhBZIn1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Feb 2021 03:43:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhBZInT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Feb 2021 03:43:19 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73ECDC061574;
        Fri, 26 Feb 2021 00:42:39 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id a17so9724670ljq.2;
        Fri, 26 Feb 2021 00:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S793k6H/hAoKut98VLLNPVGW+xzCsgbTJeqIulBxCBw=;
        b=h64S2zuIRShIjBfvFzDjoP6//eyY5VC6QbDGkArM0HMd6e4MmeZFplJrSqwvJlNWXU
         RpW0UumJqRJFE9d5zSgYXZGfMXbOIEagfowr9VMZ2zm2jkGNiB4+37OdYmcm3vDWF56w
         d30jPCUoqNExnK03TaUtur8nGH9evze4uVGY/OtXuOts6PKaAHXOvlEh9/+20aBoNC0o
         0ANZhjAmaUz5L5XjCl84v9o2OvVMRa1BTiOOtmWMr03Y/Rl6yO+QTDoWmJd4lgCeUdIt
         dtgFuwgMoNMUmSL8jpfHGAxFn8HCknmEB1o5gP9MDLOD9YcHjD0cMQiqK5CSNZDjYDeR
         b4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S793k6H/hAoKut98VLLNPVGW+xzCsgbTJeqIulBxCBw=;
        b=HdGLzgGaJev/FxC6QNiAiRp9efrBhBU2O28HPxGl/1yx6cPenBaE8fbyu6tot2UrAT
         dTt8TxI19WMVoKZp0NAYTrJfylgUcxxhPmHTXOpTTWYgqoeRqwTi18DUMqcP7L7Y9ELr
         2diC+YrpzQU9HpQq1JcquiyMi8Oz36+1y1+qZaWoBnY3oHZ3sTdGnPxHpRbPoB1DuMFp
         ZsdmC/sefmlsAnv8TbXxTEJfDQCZ9r97zQBG2Hpb/vFMeIJhbcjiXpn15rWbRvL2rS/6
         YDCYzC1YSwwbAIQYjT+5vsLN/hsD6sexnJsOlH8Ih2wKbJGCfO6X5EMlYnvNI3HblB+V
         okaA==
X-Gm-Message-State: AOAM531T5YQeniAwelkWv5Sp/iUdj8xya5Z83ZsPTmVNsxMmuE6p2Uos
        RxHLX7JDFl+npx5HfyieU7c=
X-Google-Smtp-Source: ABdhPJyUy8uHsfuWICzA7wts9QSpVKpBFPWOl9A2pMGEOc3u63vmbe0M9XKkNd3Tsmi7TpQOvzttCQ==
X-Received: by 2002:a05:651c:1183:: with SMTP id w3mr1059612ljo.131.1614328958012;
        Fri, 26 Feb 2021 00:42:38 -0800 (PST)
Received: from localhost.localdomain ([146.158.65.224])
        by smtp.googlemail.com with ESMTPSA id 12sm1312245ljc.106.2021.02.26.00.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 00:42:37 -0800 (PST)
From:   Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To:     snovitoll@gmail.com
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, rydberg@bitmath.org,
        syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com
Subject: Re: [PATCH] drivers/mt: restrict num_slots in input_mt_init_slots()
Date:   Fri, 26 Feb 2021 14:42:34 +0600
Message-Id: <20210226084234.3477119-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202120807.1394788-1-snovitoll@gmail.com>
References: <20210202120807.1394788-1-snovitoll@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue,  2 Feb 2021 18:08:07 +0600, Sabyrzhan Tasbolatov wrote:
> syzbot found WARNING in input_mt_init_slots [1] when
> struct_size(mt, slots, num_slots)=0x40006 where num_slots=0x10001,
> which exceeds KMALLOC_MAX_SIZE (0x40000) and causes
> order >= MAX_ORDER condition.
> 
> [1]
> Call Trace:
>  alloc_pages_current+0x18c/0x2a0 mm/mempolicy.c:2267
>  alloc_pages include/linux/gfp.h:547 [inline]
>  kmalloc_order+0x2e/0xb0 mm/slab_common.c:837
>  kmalloc_order_trace+0x14/0x120 mm/slab_common.c:853
>  kmalloc include/linux/slab.h:557 [inline]
>  kzalloc include/linux/slab.h:682 [inline]
>  input_mt_init_slots drivers/input/input-mt.c:49 [inline]
> 
> Reported-by: syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com
> Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
> ---
>  drivers/input/input-mt.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/input-mt.c b/drivers/input/input-mt.c
> index 44fe6f2f063c..e542f45a45ab 100644
> --- a/drivers/input/input-mt.c
> +++ b/drivers/input/input-mt.c
> @@ -40,13 +40,18 @@ int input_mt_init_slots(struct input_dev *dev, unsigned int num_slots,
>  {
>  	struct input_mt *mt = dev->mt;
>  	int i;
> +	size_t mt_size = 0;
>  
>  	if (!num_slots)
>  		return 0;
>  	if (mt)
>  		return mt->num_slots != num_slots ? -EINVAL : 0;
>  
> -	mt = kzalloc(struct_size(mt, slots, num_slots), GFP_KERNEL);
> +	mt_size = struct_size(mt, slots, num_slots);
> +	if (mt_size > KMALLOC_MAX_SIZE)
> +		return -ENOMEM;
> +
> +	mt = kzalloc(mt_size, GFP_KERNEL);
>  	if (!mt)
>  		goto err_mem;
>  
> -- 

Following-up. I've also just found out that in this function, there is another
allocation with num_slots length:

int input_mt_init_slots(..)
{
	..
	if (flags & INPUT_MT_TRACK) {
		unsigned int n2 = num_slots * num_slots;
		mt->red = kcalloc(n2, sizeof(*mt->red), GFP_KERNEL);
	..

I've checked HID vendors' xrefs for input_mt_init_slots(), most of them
pass >= 5 value to num_slots parameter. So either we should choose some
optimal limit of num_slots or just restrict it with big KMALLOC_MAX_SIZE.

Comments?
