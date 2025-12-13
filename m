Return-Path: <linux-input+bounces-16552-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57331CBA496
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 05:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C157B30A7309
	for <lists+linux-input@lfdr.de>; Sat, 13 Dec 2025 04:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D58C924DCE5;
	Sat, 13 Dec 2025 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TRH19TIw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DA12CDBE
	for <linux-input@vger.kernel.org>; Sat, 13 Dec 2025 04:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765600708; cv=none; b=d7+KDn/1UxGF2RgZXnQjufUGx8Zw457aGINvyAQlJ34eE2ByKQ36ziIXsTNVZeN1J4mYlJVviWNxuGGZm6nkteDo9Wf8Db5pXELpV2baA+IsYk6Qt69MBmIgO3ewSzR2KuRpW9qgwQii5I3j8kzHR1jRVwsCgKRNXiaMaKm7lVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765600708; c=relaxed/simple;
	bh=mXt7NY8SPF55gi3cvCwORk+kPEY+sYjEwQyHhrfwWDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijsotcfC4YY6dT4ASO8i69BdcX3KZXndn8W9tShgw/Tavkxw+qa9Qu9w/SnhcUA6fr9bpJlX9f5hB8l66YuWKlU8RXNYgcgqX9K+rbbkWdl61IoRVS0SDJAC/eW4jh2APe0NGQCRNkCQyWK9sWf61IRkaMfwGkIWy3Ejn8KQaEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TRH19TIw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bea8b4ba79bso1489740a12.0
        for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 20:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765600707; x=1766205507; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xFIvfMAl9TR6Q9R9Q0HiVq+PzpkLOCN1UWaM5jn2GA8=;
        b=TRH19TIwi/KJRaUMcXjmF4WpgZYUvttavN48Q7HGUh5ni5Bn5/eHv8VocPb4xzVVyN
         ddk/IOBNkyMRM9vKk6lDcyWqn4qsHQYTst1dI2Q2XtMCUJI0BrKwWNpt6G606EbvU/VA
         VY+zZcWKI5N0tKd6k3Px/t11d2r+m/6VcNMxknsXM85jnXU2gY8dDCP/1VUvgPLvWIAg
         xSvGz41a79GoJ4k8uklTDasMvEr1ppB/D5pBVCAwi5MsU2yb5uSim0Ioa+vxNf6CeLOl
         j7l1RKmM88bfNkWuCWDZDYRC6DZCg/sHk/hNrHwJW73dizJOXgYBWRmVKK+3XSXJdec5
         4p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765600707; x=1766205507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xFIvfMAl9TR6Q9R9Q0HiVq+PzpkLOCN1UWaM5jn2GA8=;
        b=PvRcmtTRZA4QXUrHdJIfMP55ijGpXAxJbWskriYBNW6PTuwx6/aYe3u/SAYjopuZUK
         fWy63EgOV7urB/MsNUeiK5e8c76QaIrG6P+5oOv1AmpW/CgFU9QgTJEesUpE+bDsgAbm
         5Y9lvbsuh0wn2bLxs+8X/Vot9JakZHCGoyXNTqC5zvplZFnFKru1l3imD/KjTCoLoNTv
         UaSDd3d/994l70Edkvo1syzpoOozF62pu2kAURSvxC/mBA/GU6NGpBTmG81dH7R0V0ND
         L5QMUYxvUGQFXqtRxRkk7OIXVJG8NyThUr6CH0x4bGM8fllmVBhQmDjTsSoLw38pxSlM
         FZqA==
X-Forwarded-Encrypted: i=1; AJvYcCW9CAzsmG5I3+Z93TklK9ZCdr53lc4WMllnGsKyTG8lGv06qnxONZzhdSM6qqYjDPToAgjxpA67kw2HDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyDPlPE8Sic0YmKd5aISOKNhX0FGw381Qy9Zr1SIc614zhvX+X
	Pjp4IQ41VOTjQV+jN7OyIBV7Dp7PvfghQL2CrOwaqWQvZZoGG9UKDrUc
X-Gm-Gg: AY/fxX5RvxPdHIncHllCv98iN7Df3VIdv+/n70n/sN9i3H+QHI/XS/xjtIwFJtIkTLX
	CQUshXCAjNsv+R6zPbo3liXPZa5ijNsQfPgvL2ZEVNrrvD3ALvxVma7jGjFF0MOkPoiZnSqYRKg
	8rPEV79q4yjm8V/izr0YOQUxuhxCidnTOBnHL7oNZhMtOOYFRxBckgj4BnwKpYbibzB/DWmSdbX
	58dhHj87TGRHpYQFzLAFaAr+WUcOvJlBFeqWgYwzZApabki4PL0LWPbnJgo+M2vEltUX9W/A0q9
	/AqSGQQZMYk6NfGIXFl14ukLo19e8xV+LArWVEO3XiRVJRyLYW6bci4SR+BaKALvW9XzALYTHsv
	c2yP2NYbUgML2LmPB/vG0p+VHBkgCwKvEqOzMigeRKhb26jRDXflVz3onYyQKqp6V20AYPHXZ0l
	+QNZnk1uv9ePQGD/ZE5Uivj/3CKKwPqz3GWBkk0Id+hPzfOLnSxkUm
X-Google-Smtp-Source: AGHT+IGzGbkisr/51ynyU/LrFMOnRRC5im7kh0psh40BLTwx+30e8kNIVF3UeSEBnDmD0Ok6TPXJTg==
X-Received: by 2002:a05:7301:30ad:b0:2a4:3593:968d with SMTP id 5a478bee46e88-2ac32223ac2mr1923105eec.10.1765600706521;
        Fri, 12 Dec 2025 20:38:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:3478:9150:d4be:149f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac191ba0fesm17378822eec.3.2025.12.12.20.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 20:38:25 -0800 (PST)
Date: Fri, 12 Dec 2025 20:38:23 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Marek Vasut <marek.vasut@mailbox.org>
Cc: Minseong Kim <ii4gsp@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] input: synaptics_i2c - cancel delayed work before
 freeing device
Message-ID: <py7u3qpp6s4nfdceefufkjpbyhkj7wp2kyetlw54vlhdp4gmwn@6vghr6bqkbxc>
References: <20251210032027.11700-1-ii4gsp@gmail.com>
 <xeski4dr32zbxvupofis5azlq2s6fwtnuya7f3kjfz5t7c2wnq@jbvlajechlrd>
 <aTlmwhOF3zB1UkrI@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTlmwhOF3zB1UkrI@kernel.org>

On Wed, Dec 10, 2025 at 09:25:38PM +0900, Mike Rapoport wrote:
> Hi,
> 
> On Tue, Dec 09, 2025 at 08:40:54PM -0800, Dmitry Torokhov wrote:
> > Hi Minseong,
> > 
> > On Wed, Dec 10, 2025 at 12:20:27PM +0900, Minseong Kim wrote:
> > > synaptics_i2c_irq() schedules touch->dwork via mod_delayed_work().
> > > The delayed work performs I2C transactions and may still be running
> > > (or get queued) when the device is removed.
> > > 
> > > synaptics_i2c_remove() currently frees 'touch' without canceling
> > > touch->dwork. If removal happens while the work is pending/running,
> > > the work handler may dereference freed memory, leading to a potential
> > > use-after-free.
> > > 
> > > Cancel the delayed work synchronously before unregistering/freeing
> > > the device.
> > > 
> > > Fixes: eef3e4cab72e Input: add driver for Synaptics I2C touchpad
> > > Reported-by: Minseong Kim <ii4gsp@gmail.com>
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Minseong Kim <ii4gsp@gmail.com>
> > > ---
> > >  drivers/input/mouse/synaptics_i2c.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/input/mouse/synaptics_i2c.c b/drivers/input/mouse/synaptics_i2c.c
> > > index a0d707e47d93..fe30bf9aea3a 100644
> > > --- a/drivers/input/mouse/synaptics_i2c.c
> > > +++ b/drivers/input/mouse/synaptics_i2c.c
> > > @@ -593,6 +593,8 @@ static void synaptics_i2c_remove(struct i2c_client *client)
> > >  	if (!polling_req)
> > >  		free_irq(client->irq, touch);
> > >  
> > > +	cancel_delayed_work_sync(&touch->dwork);
> > > +
> > 
> > The call to cancel_delayed_work_sync() happens in the close() handler
> > for the device. I see that in resume we restart the polling without
> > checking if the device is opened, so if we want to fix it we should add
> > the checks there.
> > 
> > However support for the PXA board using in the device with this touch
> > controller (eXeda) was removed a while ago. Mike, you're one of the
> > authors, any objections to simply removing the driver? 
>  
> No objections from my side.

Hmm, it looks like it is still referenced from
arch/arm/boot/dts/nxp/mxs/imx23-sansa.dts

Marek, is this device still relevant?

Thanks.

-- 
Dmitry

