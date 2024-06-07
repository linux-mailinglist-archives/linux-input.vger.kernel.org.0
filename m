Return-Path: <linux-input+bounces-4241-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F5C900E86
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 01:41:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306E728312C
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 23:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4927C73453;
	Fri,  7 Jun 2024 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TLKWxgUl"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0676D2F0;
	Fri,  7 Jun 2024 23:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717803677; cv=none; b=uspH4o3zxs8TxD8ynNSHk4FkqNIzAtEUq4ZZ20XG4zBrdUtdy9FzxuqsOd6vzKYGQKVaS3KmzDup/xGeDT5WVhFaSz7W1gE8m9kinuhMwQIL0x0ZcyTdG0yZn2LNH7TfjeFWdScrZIhTzTJqrew18kHtAsw8Ap4uK81OAVL6Ngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717803677; c=relaxed/simple;
	bh=HaA2i1TioETAABqiF1ikfAU4dyrTpQBsWPC+WldzC/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cB/PXr4AW3IrKfF80q8JqEXmAWEq+XTyZv8efrkg3et+mgaTjATCYjsAzxCn9B255i3UtOJ9OiBCLNGyCaCOjEIM7cZlPkSQD2KxV+uUgLX4MfsBvnM/PT4rUk7lT9F/3bhU55s7qL77DA9rs2PQRhUtYdMo2rxystkajm0gYfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TLKWxgUl; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7025b84c0daso2258126b3a.2;
        Fri, 07 Jun 2024 16:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717803675; x=1718408475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSV8acw4PuaLZ45w65e75ZAcfrvlXQqJgtEvREyVzYc=;
        b=TLKWxgUllDm6BfeW5hRb9ALb8yJrZzF/Dheo9H1gehI4NM0gfoJjrVwiHQSEZn4z9t
         0ITO7sKjuQLBEmLtdnKfJ76CKmqxfgpuAJ+zMcIKQx/n86Q468i70D0WnrCqxto8s69/
         iswJ07nUEEQNRIFz75pXSQaZu+F9cl0Z/7lkV4MGyVeQXi3mP8qo+NebUh8wh+9cqNO0
         anD7yi2UJLNCOCHIY4pTlzsetuePaKnBumHLQz7ydcP7KtdGqHueGOXCs1wX1gv+1gED
         E8M9gi/eLs1wSa8wb9xdgA4IjWoooBmI+GDtCN6+cHh1h3Xt4Pr+WUxeQSdtSmwQrUtz
         2yyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717803675; x=1718408475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSV8acw4PuaLZ45w65e75ZAcfrvlXQqJgtEvREyVzYc=;
        b=gLO3rxIDBLHwsvI8kvsI116uMHlNjMErCoR2wN5hvhOiqyo2CjUsIu6MoaoDcxUVnW
         ntSaWbbR/vqW8wNmuQsjNlrtwEih8NDIV50uwiS17idFRoygV+slEaZy2QyO9Chxk887
         ryKrEPnDG9WcewIWnkSq2PUxUU+m1zPbMk0DGMXkjVqfn/YbWxsoBsadXOJ6TCu0X6tE
         Vx1ukrmq6lQcaMkuBWIBzOP7qfoQwCvJQbN7UPgl6mWiDyyu60ff4ofAdmKALEMUJduq
         EWpG/yHK3iCQPsQBBcA3vwq6e3xhrMANfAl/6InTPrPS8bE7xpRg9fcLZochN1Ei0rTM
         0tEg==
X-Forwarded-Encrypted: i=1; AJvYcCVnO0SgZbXBwNcRB2XqWuKc53TCZbIfglHX9DCufl5AaJ3CWGdv1tZG5Zqj2pR/AD2PWz38aJPyNUbc41Dfaa9d9YBpoGW/n/sqFOrm
X-Gm-Message-State: AOJu0Yz61EGC3MDCU5nwSbAqvyU4dk3xpAG7Z4SHjbrNZ12cUD0PTt+t
	XBEEGjooGYz2gdZMtv3C24hI1F2ByVqBerGc1FK1+r71VGTpoxkY
X-Google-Smtp-Source: AGHT+IGdwsn6NlKd3417e3HHMdzFIgkkvhea0Co7J8s60YFpGtU6DzHEfFkznH4FNquTAONn9oE2Tg==
X-Received: by 2002:a05:6a20:12ca:b0:1b2:c6c7:f60f with SMTP id adf61e73a8af0-1b2f9a0db5bmr4760072637.25.1717803675038;
        Fri, 07 Jun 2024 16:41:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e4d62sm40166255ad.231.2024.06.07.16.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 16:41:14 -0700 (PDT)
Date: Fri, 7 Jun 2024 16:41:12 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Luke D. Jones" <luke@ljones.dev>
Cc: linux-input@vger.kernel.org, vi@endrift.com, maxwell.nguyen@hp.com,
	appsforartists@google.com, carl.ng@hp.com,
	christophe.jaillet@wanadoo.fr, matt.git@fastmail.fm,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for ASUS ROG RAIKIRI PRO
Message-ID: <ZmOamChB69DuXWPn@google.com>
References: <20240607223722.1170776-1-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240607223722.1170776-1-luke@ljones.dev>

Hi Luke,

On Sat, Jun 08, 2024 at 10:37:22AM +1200, Luke D. Jones wrote:
> Add the VID/PID for ASUS ROG RAIKIRI PRO to
> xpad_device and the VID to xpad_table.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-ids.h         | 1 +
>  drivers/input/joystick/xpad.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 61d2a21affa2..31c522fa4e87 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -209,6 +209,7 @@
>  #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD2	0x19b6
>  #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_KEYBOARD3	0x1a30
>  #define USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR		0x18c6
> +#define USB_DEVICE_ID_ASUSTEK_ROG_RAIKIRI_PAD		0x1abb
>  #define USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY		0x1abe
>  #define USB_DEVICE_ID_ASUSTEK_ROG_CLAYMORE_II_KEYBOARD	0x196b
>  #define USB_DEVICE_ID_ASUSTEK_FX503VD_KEYBOARD	0x1869

This chunk is not needed, I dropped it and applied the rest.

> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 6fadaddb2b90..3a5af0909233 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -209,6 +209,7 @@ static const struct xpad_device {
>  	{ 0x0738, 0xf738, "Super SFIV FightStick TE S", 0, XTYPE_XBOX360 },
>  	{ 0x07ff, 0xffff, "Mad Catz GamePad", 0, XTYPE_XBOX360 },
>  	{ 0x0b05, 0x1a38, "ASUS ROG RAIKIRI", 0, XTYPE_XBOXONE },
> +	{ 0x0b05, 0x1abb, "ASUS ROG RAIKIRI PRO", 0, XTYPE_XBOXONE },
>  	{ 0x0c12, 0x0005, "Intec wireless", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8801, "Nyko Xbox Controller", 0, XTYPE_XBOX },
>  	{ 0x0c12, 0x8802, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
> -- 
> 2.45.2
> 

Thanks.

-- 
Dmitry

