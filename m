Return-Path: <linux-input+bounces-16647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11019CD2312
	for <lists+linux-input@lfdr.de>; Sat, 20 Dec 2025 00:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E8083020364
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 23:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA87D2D6621;
	Fri, 19 Dec 2025 23:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie8hX2KH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3322264A3
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187411; cv=none; b=nf+U7bNMLl/PRKcahgGpYdJDwjwLp1+uHMVUPTbaD0yhs4M1aaauZlMHMmFa0ZeGr1rA4SGzm0JSL1/7icA16vFd9YKEOje4PKGf91LctxdMvllBVTXraIn3Wxo8VrGIgUbEX3mWc9r4aHvqJdXLDiTSTN/qpqBl/G6gIK8XSa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187411; c=relaxed/simple;
	bh=bX6WptA7T92cetxyoTpcGS6qaGuAeWwRp++86UrDEB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pfqVIGO2m0Zm2hXn/RsIsdX8ZDlw/ncLsRVL7scN9TAI4e1a7jlKMdr47McKU9gAFi1UYQW6qVzCT8TP1FVIWbI5sHp5+jzaTq7lP5fjCX9/iS6U3gUwM9JJHsmIE7vMl1OlAUup/sQNmyMHVbTcH4eZIh9E9JzK5yvP8BuZD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie8hX2KH; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0bb2f093aso23664145ad.3
        for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 15:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766187408; x=1766792208; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q6d+V1L8EguUUkA15AMUk8ooxyjpc3qD0QF3EwgftM8=;
        b=Ie8hX2KHb3JyS9+CzqKMZ8GLNxBhTxnIVGNuD6tANXnOJUhX5co2OIctMRDKS0rQDJ
         js2Pnyo4jMatWL15vYhXKbDP2/NP46QupcKcB0EZ9pHVmMpbL5oaru3TW+RRpxeew8ph
         bw8zLtYLQJjDb/4Evd6blzY1gaAWSjeUbkca45tPoCQxb4F4ioIhcHdNWOS6ohhUoIAd
         1qv6wICzAOkbmL7AJOBdBZDGHerR/JUAEbs2qyUfo7ziu+jcH5qtZRvZ1ztM9dlmTUA4
         5lP9Qa2gAgPNh/lWqVm3grLLr3O+ba+oHq+lTgG0Qrwzsv2zYgom5kMy9ELtrLVcUhGh
         kTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766187408; x=1766792208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q6d+V1L8EguUUkA15AMUk8ooxyjpc3qD0QF3EwgftM8=;
        b=cq1Sinqq/B7dOCc7erzcx66q2Gkzkf+uz30t8wKD90MUdGRfAj8tjh+dHFnhOy5xVO
         bCN0BUJ9WEASAPigMIHcS9XYU5jgqLwqU5D9/UdTvyIueuaEQvhx18jYwmOiAk+0zn5P
         AGdOg2+V4gDd1BUA8bR4WUPIkd485ltNWEqfXfLL1ek6ndLDT35CYvaPNMxn7mgcmnMH
         2gbkDaKPsHns/k7y+mtf3oT2ZwlA8XM6lD/3BC9oviXT/WWAn5mj/g3AEKvniV1Kr6HM
         hGWNH+mIqqIrhq+LJXwRXxbL1ewyPWnTCAx1Yn+YOBoo88nQMuVZz0Q9i/ckgdbBYvZu
         YsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVQMufmxCVL6+PX47SUG/piCxLSzpUld5A2wn9ojRQ5tnkoMVoU9wOojh0f1mv19P5A6T8vp02QNXTFVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynwMc7O6VKtMl3lHNgcDGEZupOWCW0IV2iFcOveGp7T4ALvDTK
	p5VCMvREMQIWdKSjUTQQgv3vDZbWMSK5LA4F4BowT+jmZzN3TOlVp4jf
X-Gm-Gg: AY/fxX7S4nXr8ALULebnZrEMHx+fHozZ3TodX5PdmJfOVM0ryOJYdm7/1trkd/4sjEL
	m4HHnTmBg6VTaaI2kYRapdraR/1ZuTq/XXUS2JLbneIpVJYHekLlgMvXTTOLG7FXG/K/4iWlX7Q
	4fX7eg2yOCWW/9h8GOKbSwbpcA7jPFN8hrsENVLrhEQRg7+mFAbBxEILHWreYeJjp0ZHy84LiVL
	HiGgi/KSbiasro/aySUiX4slrHZWqtLM1cmZwYFb7E7pJWdXmaG/PL1VHZA7urE3yxWnzjgqenN
	vF+I6d3SjWFBIAHMCPeRxQbPJW33XtjKiKOfnGVKzOyEMXvPw8SbKbc1xFF1aHS1ybJR+S/mgLF
	GKgTbdZ78nlv6CJTUiWqpIwbIf2DU3bdRTspO7qMET6zVYfOvU+4g+74VECvUC8YL9HuDdNby6f
	vd8BM96j6soPUubp/titVF4lAHAkuqAnmaWJmGJJ6hHIWjBZKNrxaY
X-Google-Smtp-Source: AGHT+IHKGGn7DrOExQYaaKDO7+csXyZsREGw6rH8TaP3dIwbHUcOl+KgNiZmIqHm23bUUG8WJ1xaKg==
X-Received: by 2002:a05:701b:2305:b0:11e:3e9:3e8d with SMTP id a92af1059eb24-1217230017fmr3242122c88.50.1766187408372;
        Fri, 19 Dec 2025 15:36:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ff8634csm10474346eec.3.2025.12.19.15.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 15:36:47 -0800 (PST)
Date: Fri, 19 Dec 2025 15:36:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: pip-izony <eeodqql09@gmail.com>
Cc: Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>, 
	Sanghoon Choi <csh0052@gmail.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: ims-pcu - fix heap-buffer-overflow in
 ims_pcu_process_data()
Message-ID: <hr5f6diryl6xrmszastqyyfnsfsve4uxqzee4ct7ihj6agzkmo@dm3wm2mwhg2w>
References: <20251219223417.369278-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219223417.369278-2-eeodqql09@gmail.com>

Hi Seungjin,

On Fri, Dec 19, 2025 at 05:34:18PM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `ims_pcu_process_data()` processes incoming URB data byte by byte.
> However, it fails to check if the `read_pos` index exceeds
> IMS_PCU_BUF_SIZE.
> 
> If a malicious USB device sends a packet larger than IMS_PCU_BUF_SIZE,
> `read_pos` will increment indefinitely. Moreover, since `read_pos` is
> located immediately after `read_buf`, the attacker can overwrite
> `read_pos` itself to arbitrarily control the index.
> 
> This manipulated `read_pos` is subsequently used in
> `ims_pcu_handle_response()` to copy data into `cmd_buf`, leading to a
> heap buffer overflow.
> 
> Specifically, an attacker can overwrite the `cmd_done.wait.head` located
> at offset 136 relative to `cmd_buf` in the `ims_pcu_handle_response()`.
> Consequently, when the driver calls `complete(&pcu->cmd_done)`, it
> triggers a control flow hijack by using the manipulated pointer.
> 
> Fix this by adding a bounds check for `read_pos` before writing to
> `read_buf`.
> 
> Fixes: 628329d524743 ("Input: add IMS Passenger Control Unit driver")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  drivers/input/misc/ims-pcu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
> index 4581f1c53644..402bf03ca8f6 100644
> --- a/drivers/input/misc/ims-pcu.c
> +++ b/drivers/input/misc/ims-pcu.c
> @@ -451,7 +451,8 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
>  
>  		if (pcu->have_dle) {
>  			pcu->have_dle = false;
> -			pcu->read_buf[pcu->read_pos++] = data;
> +			if (pcu->read_pos < IMS_PCU_BUF_SIZE)
> +				pcu->read_buf[pcu->read_pos++] = data;

I think we might want a warning if we're overflowing the buffer.

>  			pcu->check_sum += data;

I don't think we should be adding the discarded bytes to the checksum.
Or maybe we should reset the state of the parser, discarding bad (too
large) packet.

>  			continue;
>  		}
> @@ -491,7 +492,8 @@ static void ims_pcu_process_data(struct ims_pcu *pcu, struct urb *urb)
>  			break;
>  
>  		default:
> -			pcu->read_buf[pcu->read_pos++] = data;
> +			if (pcu->read_pos < IMS_PCU_BUF_SIZE)
> +				pcu->read_buf[pcu->read_pos++] = data;
>  			pcu->check_sum += data;
>  			break;
>  		}

Thanks.

-- 
Dmitry

