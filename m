Return-Path: <linux-input+bounces-14731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D52B57EA1
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 16:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFF4E4C2E89
	for <lists+linux-input@lfdr.de>; Mon, 15 Sep 2025 14:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D3731B102;
	Mon, 15 Sep 2025 14:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtZa6tXI"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1006E31B834
	for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757945672; cv=none; b=HxBWXDkBqeXbGDX54Lxc1JIgaw7GWr+CbinNlD6RhqXfR18XfiRnJvfKTVmFGoIUR9JQm/5vjIlzPWIVbM32UI9oheBNfX0G7lA/kjUc1hYjK0GWklN5VrbYDoVE8tk2d4AAT8gFZ0zTaxudvQW/kKMnSpzHNn4Myu+RCYHwlKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757945672; c=relaxed/simple;
	bh=12Emjj+7/Y21r7ax12Etcbi4CasxbBKPE6TE0rhUvbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0Kcmr3hhY0Pq/20tnv+2lxhfDg3JqcA1f+pmlFRffmVc73xFio/jWG9o/uhbgJppRYgkVx6oFznseBgCQsYP0LainsqSCN/Teco5dLaq44vexqmCtwgLYZijKwxsL3OWx44sXExJdGeU1exIeSxk80LuNMj3FMlQd8/r2JzFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtZa6tXI; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7725fb32e1bso4410788b3a.1
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757945670; x=1758550470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B/TbOYmHOQBrAm+qdpMKoJI4NJtD8Trd/XZ08rPp4G8=;
        b=XtZa6tXIlBOZmyea91dD9c9ZlqT/ihWeYnOF3odBFyDFFVYg2T3Y5PYR4Q1mwnrAPl
         zj6SQp5JTkfE8m0rmPeEDIEBRr5u4oWp5XZLdyUZgV1X3BkhL+VuQ5LVPVfXvTztZsqX
         2DeA5/mFeT5NV4sbK6nL96RqKvDj72xg+4s6+edu4/qgA7jw4XbZKdB6DMW8CQpQM4t5
         19Gj/1vI54Cx0oJQvi0i6TeIuvLng9gAeYuo2zPeGVTvbj2vejUCk664uCOwBCKWjWob
         wRzLoBqA+9DaHMReY73Rp3dbmjxMv6yVz4tD5KzgFT///jKM+Xiey6R0GPAH0aEBp25V
         6FyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757945670; x=1758550470;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B/TbOYmHOQBrAm+qdpMKoJI4NJtD8Trd/XZ08rPp4G8=;
        b=MqRkzEcSKR9NE3he9K8Nv46uZHZFwvT7Isj638hEmf3em8DqenYH21Z1LziHdBeemj
         Zpb0KKNA+GV/d8KSUFp7QQ8z0ZhxupfNrITLajyvIbNE9ug0Arw0hg6l27ryc1Zm3i6p
         mJWd86iDc/iMoSND4AxQq9pPeIPnTGsSiqHu8OkEcxCgu51OhyOtdGPmcMcGfrOdHl1v
         i28b/yKSTBYLxyeekORs1qiQsWeLDhI9UA0XohH4s75kGpskiyzGu8A0iVOMYwujlZnY
         a5FcdYsT/PRw/b8d+uEqPeCkBZgAus8GBl3gPbtepsq8Vohjsas4iQVShsSrf/bcHJZ0
         ksfw==
X-Gm-Message-State: AOJu0YyUasbkx3vJmvOVOiIZoOz/DRFE0+ugEs6r8s7olW9qeWHM7Isv
	Oej09iUJ70ha/UwtwjYSNIi5SxjrEOc7YB1aeyKz74b+ovLay/x4+kSU
X-Gm-Gg: ASbGncuqHJYbux+whr4Gu+o0RSEbiX/RO8B9NaM34nBXLVmzbCX2Rse7HenXQSTEb14
	Sh3k9MPtWbldRWL5n/V/MSlesuqSedf8gdE5mfBgrdmRa8xDhtwlfLo0QbWbJDRmIApgKaqrejK
	NFEczCOXRi8oFZF/XPEjqxutteb986E6f8yZrPYkGj1oDrZesCrua2xIzAeiyUJqfDIFzTtG/be
	qsATlHPr1NgLzEYUIzR9Ac0qTbqS6rW+h1znGLxJ74Ae2wiesWaRfNhRkKY8SUkZDuUA2oPDN+T
	0nzJjNdAEF1EgNCzXyGpzsJ1arWq30334O6R073N27JJWniKJ2avYzUeu8WZvK6KUrFZbkKzhpQ
	eFapUS+8qMC2L0bYURy7705XG98VkFwMUKlp69cauOxoY5Ky/upy0pXdoo2s=
X-Google-Smtp-Source: AGHT+IFoAiO4nMA477oqCu8LJLJfHZM9TOyXyx33nI3ilJAse1dz47T2WKEsQopizBPSqSaJhxuBDA==
X-Received: by 2002:a17:902:f792:b0:24c:cae9:77bd with SMTP id d9443c01a7336-25d283184bemr187323915ad.54.1757945670053;
        Mon, 15 Sep 2025 07:14:30 -0700 (PDT)
Received: from [10.0.2.15] ([152.57.104.175])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3ad2fa37sm125830025ad.111.2025.09.15.07.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Sep 2025 07:14:29 -0700 (PDT)
Message-ID: <ecba3708-e233-470e-b3ff-d5212286d437@gmail.com>
Date: Mon, 15 Sep 2025 19:44:24 +0530
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
To: rydberg@bitmath.org, dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: bhanuseshukumar <bhanuseshukumar@gmail.com>
In-Reply-To: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/25 14:25, Bhanu Seshu Kumar Valluri wrote:
> Debug printk messages are converted to dev_dbg based logs
> for better control over debug messages using dynamic logging.
> 
> Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
> ---
>  Changes in V3
>  1. Name in the from tag & signed-off tag are matched.
>  
>  Note: This patch is tested for compilation.
>  v1 patch : https://lore.kernel.org/all/20250902164351.36828-1-bhanuseshukumar@gmail.com/
>  v2 patch : https://lore.kernel.org/all/20250903061908.41910-1-bhanuseshukumar@gmail.com/ 
> 
>  drivers/input/mouse/bcm5974.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
> index dfdfb59cc8b5..03e112666c2e 100644
> --- a/drivers/input/mouse/bcm5974.c
> +++ b/drivers/input/mouse/bcm5974.c
> @@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
>  MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
>  MODULE_LICENSE("GPL");
>  
> -#define dprintk(level, format, a...)\
> -	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
> -
> -static int debug = 1;
> -module_param(debug, int, 0644);
> -MODULE_PARM_DESC(debug, "Activate debugging output");
> -
>  /* button data structure */
>  struct bt_data {
>  	u8 unknown1;		/* constant */
> @@ -550,8 +543,7 @@ static int report_bt_state(struct bcm5974 *dev, int size)
>  	if (size != sizeof(struct bt_data))
>  		return -EIO;
>  
> -	dprintk(7,
> -		"bcm5974: button data: %x %x %x %x\n",
> +	dev_dbg(&dev->intf->dev, "button data: %x %x %x %x\n",
>  		dev->bt_data->unknown1, dev->bt_data->button,
>  		dev->bt_data->rel_x, dev->bt_data->rel_y);
>  
> @@ -688,7 +680,7 @@ static int bcm5974_wellspring_mode(struct bcm5974 *dev, bool on)
>  		goto out;
>  	}
>  
> -	dprintk(2, "bcm5974: switched to %s mode.\n",
> +	dev_dbg(&dev->intf->dev, "switched to %s mode.\n",
>  		on ? "wellspring" : "normal");
>  
>   out:
> @@ -718,7 +710,7 @@ static void bcm5974_irq_button(struct urb *urb)
>  	}
>  
>  	if (report_bt_state(dev, dev->bt_urb->actual_length))
> -		dprintk(1, "bcm5974: bad button package, length: %d\n",
> +		dev_dbg(&intf->dev, "bad button package, length: %d\n",
>  			dev->bt_urb->actual_length);
>  
>  exit:
> @@ -753,7 +745,7 @@ static void bcm5974_irq_trackpad(struct urb *urb)
>  		goto exit;
>  
>  	if (report_tp_state(dev, dev->tp_urb->actual_length))
> -		dprintk(1, "bcm5974: bad trackpad package, length: %d\n",
> +		dev_dbg(&intf->dev, "bad trackpad package, length: %d\n",
>  			dev->tp_urb->actual_length);
>  
>  exit:
> @@ -786,7 +778,7 @@ static int bcm5974_start_traffic(struct bcm5974 *dev)
>  
>  	error = bcm5974_wellspring_mode(dev, true);
>  	if (error) {
> -		dprintk(1, "bcm5974: mode switch failed\n");
> +		dev_dbg(&dev->intf->dev, "mode switch failed\n");
>  		goto err_out;
>  	}
>  
Just want to know the status of this patch. Let me know if any further modifications needed.


