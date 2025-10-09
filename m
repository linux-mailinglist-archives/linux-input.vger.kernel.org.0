Return-Path: <linux-input+bounces-15345-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F5BCA62D
	for <lists+linux-input@lfdr.de>; Thu, 09 Oct 2025 19:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C40C4E83D5
	for <lists+linux-input@lfdr.de>; Thu,  9 Oct 2025 17:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243CA24166C;
	Thu,  9 Oct 2025 17:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5QNkLnA"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2AA23B605
	for <linux-input@vger.kernel.org>; Thu,  9 Oct 2025 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031263; cv=none; b=HPU1Nz/y0HEjLIdEcET598BxHjXYMU/OCtWlO7Z8Ij2aesLhwdL0jLBoIIvjrBJ+SIjVlBKjkfMfCupEpjLGySdNCknoJA96BZohwWXIt2EiapP3bHQzNzN+Hfp8sO5mY2LJfWHRXRkQdOadtnX+0LVRlNSWyvj0saZDFJVyg9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031263; c=relaxed/simple;
	bh=nhvrtGcS3u1fCmAmUlvHcQ0TLObODLwGAtqos5CLtRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYrHpLwK3982s/uDk2PUOmmkGqncuEdcDFnK18/5/ZG9jqB7aE10S0xE31V8hWEx4+iZANt4fjUIA8q/C2T31LV5T5HstX0TS/+thOD11D3yHP0Hz+mZArUxX1kU6RpDaEZ+poPINHjsQmulz79ALVYJ1oi3nsKcOG+3MgR07Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5QNkLnA; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso819873a12.0
        for <linux-input@vger.kernel.org>; Thu, 09 Oct 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760031261; x=1760636061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gZec7guQB1/23fuKfkx/BbJ2ooYxivX+gc56zQve75Y=;
        b=a5QNkLnAhQCrp35iypTHh5ZpkZlY8MRDytQ7CR643chmt9CSStEzjBlCWcf/mUcCYr
         q+TWcnzNexilrKa5UNaNukBe9S2Gfrsw7UF4PHlze6SxfAVvzZFWM0o5/xmL967OziaB
         NPSyhpD94E0kAQgXcBpQg1iHcqPehd51qkB6ksAHACiM358kFdCYPoGJNi/4LZdE+tH6
         azyR7H4oiFrhAhG9iZwibqEUgaLygDMLx916f3uWViKlulPW8raPzFo39KkcPndVzlHe
         BqtE81NZ+k4uW2FKNcWgGd9pTrC6GL9Cb4hmW16L3LFrxCtUrCcT3+Disk6ENr6eegIW
         6kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760031261; x=1760636061;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gZec7guQB1/23fuKfkx/BbJ2ooYxivX+gc56zQve75Y=;
        b=aP+oZuokgwCgDNDQ7gnwJEXKRtQNkUkViDktBu5WzAzPX0s47BUji2Cv/z9xhf7DaG
         8cNgQWp0qJnyO1Rumyu7HtlNBL+Ne2rSdStUReuVWo0bHeSK2JkTpZQfxBbbCchmgj9s
         mFwudRfPMfsBJzrLvyCO0MW8MzzArFFxvaPl2pQibizJ4VuwbC9deRZqTUAeRYdAnRcd
         UHH57yKvuFVTx/D8Czf0v/q60KQPm7S55Ik8xwBiiOSWHwwTuPIw1Xwd4zkjTTVVOnQf
         PCcPnLgJaG/+Qfkl5r2U84o6DtrqyZ0eVjxxEuNsibIBbPNZbHKQDb1paKQCAdwyf3sO
         rYpw==
X-Gm-Message-State: AOJu0YyOnKzaEvIS3qVVPISRUXk2yNrd87iiK42+Yit2cDIR8dxlUrpK
	fjL7Vdv7YxQh9a3qH5wf4c8Cs6cRkJ5dZ7Qx9Vde262QwsATm01tcskF
X-Gm-Gg: ASbGncs07zO1+Mwegz0ifN8CC2Va3QhWPqub7JpVLCfI6e/DRGN6SGv7+n+L8dnQ3yb
	beMqWV3yegfabX9lk2BxaGnUpZOeD5eT2PRqpT1gV6Jn4FqYljv1EXeBj8YSvJ1SHjc7reW4ys5
	hIB6RnWDeR5cbKfKcFiW1fp6AteNqWZh4hfsZ4jHfVup1vdh1KOHdWgs4zVYv0MSrzNGeLEALXe
	/St39V+i/JixdBeWU1WeaBDaqeoeE4EC/urhUYxw5PcBYYqQkn1BhWqf2ewF0kmechvSJ2ABvAy
	z89Ww3hiuV/2PyvACaXNKtZsP+Mi3eguYF42I6MGfBSmXxoIzVT5rJCi1nWYWVpCwlgniI02B4F
	7jTjaAkv3SSPBbPwR/pJLvXbpCwT5/iCZ/RnH33+DzYU20rUByMOPkk3uvZJDPDxNy2uDdS7I
X-Google-Smtp-Source: AGHT+IEZkDXyWcjmyEIZEBGDL6gaOvmfLfQvDuTZAyEkYwTd8bSBEAjejEH3nXfsszGdDfHk9p5n+A==
X-Received: by 2002:a17:903:1a03:b0:267:a1f1:9b23 with SMTP id d9443c01a7336-2902723ff44mr103416485ad.18.1760031260759;
        Thu, 09 Oct 2025 10:34:20 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.180.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f4ad6esm34197345ad.109.2025.10.09.10.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 10:34:20 -0700 (PDT)
Message-ID: <25836029-baea-4de1-8d06-6f97c25f31dc@gmail.com>
Date: Thu, 9 Oct 2025 23:04:16 +0530
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
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, bhanuseshukumar@gmail.com
References: <20250903085506.6042-1-bhanuseshukumar@gmail.com>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
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
Hi,

I just wanted to check if you had a chance to review it or if any changes are needed from my side.

Regards,
Bhanu Seshu Kumar Valluri

