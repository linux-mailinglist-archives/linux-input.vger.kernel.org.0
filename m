Return-Path: <linux-input+bounces-9206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB36A0C28B
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 21:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68571188796D
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 20:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBAB1CBE96;
	Mon, 13 Jan 2025 20:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0HszRc+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826951BD9D8;
	Mon, 13 Jan 2025 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736799904; cv=none; b=dmyvsw6PqEMOSxCRannrvhR2VSXIRStXg1dscNE1ntJeTH7nF2kHhLiXC/4kkCOGOk1pz/NnIu8dxM/rpkPSgpl8KSruxoSSX0Av6YgrJ//dCFCbv4ovpZbZ1YAr94hDR89zIy+vuGuiWB4KHoqu2eZa0QbmYt+/Aw9BufraFxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736799904; c=relaxed/simple;
	bh=KRoJpSvEIbFzntfwIYHbTjlcupLxPf5HFzGhsQujORM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLVHwCWEAs1zWFY1AwzRzx/jUQX5f5+NkZZVNzrZpxWQx5fLxjILVNp2bt1RXM6lQbZLn+WBQhakLANSNl8SrEfvDm6vk6CgpYcaN5Cama6dTINEblfqe6Qi2q2ypthhU9Bt85XAKDXV5zRAM/BGlVrLcly8Ms5Q5vSUCqdAoZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0HszRc+; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21628b3fe7dso79680395ad.3;
        Mon, 13 Jan 2025 12:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736799903; x=1737404703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BGwCOTFKopyF1Twjy34AnWbAxudSAUcqWUBnPveTEco=;
        b=K0HszRc+wdVO9Fa3loRPLkSZljagYqoeZIF3BMcD9Tw0EmtpHDGOLoE/H5WCmm6ZZM
         1UbsmOZODaIZF0ERfPl9YBJb0fb75IBO/y5pfhSgbGFBxxt3d+c8R7tZkmo/h5W+BNe1
         +tgi6AiabKXyTmie+lWsljk6HKn3zEnK3d1FgeBe02fJ5wg3k1+3otLI2VQtRzYWRCeb
         1L0/klO/vI473RhcgQJ/8ZjuWMq+GAMYkNzVWAuX0u0Q1kW8hPGq/iy4ZELgnDOXIlw4
         vETEfbFbT2rtbfVmKd+GIQRUuUzbCB1L2anhomQH5ghbIYQ0x/dLLpkBk0LhpeMgJ3fn
         OSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736799903; x=1737404703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGwCOTFKopyF1Twjy34AnWbAxudSAUcqWUBnPveTEco=;
        b=CihujTXb1rgukwuXjxnOlSKvtstGUcTCCmbjcT7v5DA2tkDk+YsMaXu8uKPt3u9Szd
         6D5ofx5l4t9+j6AyHMvRVykEgK1xNYof4tDJGuLAC2Lzx/8eKy4oL+omH7pHkAGsD2sh
         Rfg5Djbi+tdFGiCqVJWZbPANdjEluVgLKTFN7D0f/f8Gij+7Wto5s0F3FQnOw6aiaq4O
         KNCxy9F/LThPvhh/U5lESLvSq2TcWVBi+5617z9W48DcRodB9zSxBDoMMTw21O0Xv0/r
         J5EaP35OZyosTm7+nEN/gmfacun6tC6yTnlGI3GUIRCBDw5zHL3S0PL7mdOVu8I0Y2QI
         6qHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUffi57LZo1ZZ8OtN0TmdXHID/5Hc7xe7b23gh3RoRaL+h/JJKfhKhT1v2Xy7UNAOim1O4YxHB/EShNpw==@vger.kernel.org, AJvYcCWpOw+7s22bjsHK9YbHyeGpFJbYPsND1jt/bKI7wUkwpU0sS5cKBwbUA3cGanPwvikY88dBnb5Qg7aLa+ypllyRqORgVQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOKKD8Nc1L1S61Pe6hlLinN2KhRNZZbqTIFtn+NTnJoWiY4PUB
	FNkbPf939CISUhhCf5yPQA2qT3g9WDSQxc7CcqpsE0c8mGIO0LjZ
X-Gm-Gg: ASbGncvevoaNsEX1IakCQIqY/XARMvdmG7QCFY3jNlHJj5Yhp4whMV4MPeN4mjUm80Z
	j4qkJWz/U+g6bNdHOAorEshC1rcJIugtwBwJIN5S5biXeYS5PbbWFkllCDbcYZg1EcnWbRDpDla
	xkfkp/hhdA7Qsqc648r/0iCPbdyMVpFowScCkJ579SRG34Ha+n8aWhu5wfLCHJEfwAKxPbtdqF0
	qGQY/Z+hdE1bzYaMV7Mltj1CFpp4UHUjkIYcK57X9raoO5KPRs+NSJPCw==
X-Google-Smtp-Source: AGHT+IHa7tva12SDzJmJ8jNTW7dI9GlDi/mHqt9o3Hq3MYPiugFM4H34JsPIiidkO2N5wy1N9vAg4Q==
X-Received: by 2002:a17:903:124d:b0:216:4cc2:b1e0 with SMTP id d9443c01a7336-21a83f4c041mr288607995ad.20.1736799902584;
        Mon, 13 Jan 2025 12:25:02 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:2345:9641:c9a2:f3ca])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22f306sm57364435ad.194.2025.01.13.12.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 12:25:02 -0800 (PST)
Date: Mon, 13 Jan 2025 12:24:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Illia Ostapyshyn <illia@yshyn.com>
Cc: linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/2] Input: allocate keycode for phone linking
Message-ID: <Z4V2m9VWqM0xZS1I@google.com>
References: <20241114173930.44983-1-illia@yshyn.com>
 <20241114173930.44983-2-illia@yshyn.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114173930.44983-2-illia@yshyn.com>

On Thu, Nov 14, 2024 at 06:39:29PM +0100, Illia Ostapyshyn wrote:
> The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
> Gen 5 laptops includes a symbol showing a smartphone and a laptop
> chained together.  According to the user manual, it starts the Microsoft
> Phone Link software used to connect to Android/iOS devices and relay
> messages/calls or sync data.
> 
> As there are no suitable keycodes for this action, introduce a new one.
> 
> Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Please feel free to merge with the corresponding driver change.

> ---
>  include/uapi/linux/input-event-codes.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index a4206723f503..5a199f3d4a26 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -519,6 +519,7 @@
>  #define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
>  #define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
>  #define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
> +#define KEY_LINK_PHONE		0x1bf   /* AL Phone Syncing */
>  
>  #define KEY_DEL_EOL		0x1c0
>  #define KEY_DEL_EOS		0x1c1
> -- 
> 2.47.0
> 

Thanks.

-- 
Dmitry

