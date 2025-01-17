Return-Path: <linux-input+bounces-9353-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D93A155C1
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 18:31:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0E66164AC6
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2025 17:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8F319AD8C;
	Fri, 17 Jan 2025 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR924E3J"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54911A95C
	for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 17:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737135059; cv=none; b=mH1LKk0UdHykFB0GUeRewgLkk1OaffKCeGiIGSXotxuk7h1AamMNKuzIrRzy0OuEJ5pHS/SaOIOrqFehvaTKBu9pCFjnuIOPU4VXfUEQ1KdAoGtanU/d6O4bfgF3EoIpInoa3YmcsyD5WCzVCejvGkH/L6OuRss6joLFVYr6Whc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737135059; c=relaxed/simple;
	bh=WzergvxZ1ULbiQO6SPqNaBVrxglcPt2LZ3L0Caglspo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qHtSVfU/3qEuchf8IrxEekhOAeREo8hXMWH1ExCJDojpQ8LlC5CxZY3royd1rIPYrdx0P4C6jDB6ATsuxee+MUTLhsSOI6uI8rTTZk+E8rHUdV7Gtgivk412E04PIYoQwQ2AwlbFv0uKs8BBjOrTeHH68qV/fBfuuX1Oz2BAdJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR924E3J; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso5741573a91.1
        for <linux-input@vger.kernel.org>; Fri, 17 Jan 2025 09:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737135057; x=1737739857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t8X95ImV6z0obH5wumu//BhLTAjQKjKJr+UboUYDwpY=;
        b=hR924E3JKxweSknSd36xOrFQydor0uuFo1KLIotYTEmgWU26rja0SsHiT+JxryUFr8
         BYMSCYb1gnzqY/HIioTnp6f7LChTZCPY4d8q5MQVIUPNyCR2EAScdW4UnVroEoFZ3zca
         K7ID1AWkjrSsKigkwFaNt3h3A2AUIPRMcVLYxI0Hl4CrUP6xuYn6f+RxiihFhwN7+mvp
         kIPyjc9TkGO/QvCTSTn2+pCGUIgyYERHOnx8Xweuulj2dBa8d4F5Z66Ssd+GWlUhlX8E
         axlYjX1x2+bhf4xQ0/02qvIlBNWPiI9Qclo3axqccf3y1ejY8N6dcxnLeRcaLpklLObq
         Rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737135057; x=1737739857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8X95ImV6z0obH5wumu//BhLTAjQKjKJr+UboUYDwpY=;
        b=CWPeN34Hq/g6ChQpdoopV25pVb3GXEAsRl6pzmwbOe8Nai1SQn7bXSu7NXXZjD1447
         SRMHQfPbmaNl58aiSh81WYHmAn/O+bRdh2q/VlmT3glIiF97hvTzTNgOc2ZYlIVs4wu4
         CWk6RP+djoaYBR2UXo+F5+FZCfBw6goEOkJLkn3BKx17mUTokj4RmiTZjEB755Fvwf5C
         WJy3rlw6AhORzLoRwRqjAv/e+TDsTj8nHx20xdpvkSPl/eKaLo9nTnSHIJ2qq6WlDjMM
         SdFm1Rmz2eYLn8S0J0j4a9ER34vH0TAOwuc2GK4jGre3thgz+rp4VkOrQvMQ4uIb+9/a
         xFZA==
X-Gm-Message-State: AOJu0YwXSrp5cFDUaXgvW2uvVFBm2ZSfqPHnHXQtTr3O/RPEvFiH4GlM
	n3Qvnz2QBsPIPjPTEqJ7FnQE/G2/DLp4EK5WUQ8VcMV0WXR3nvqbVFrzDw==
X-Gm-Gg: ASbGncvyUpqO1Nh/XVPOia83hR8PeM9NdStW4dJhTLK+hY0ko/rpOj8T3VmJH7Jiw1K
	5wZvDt+6fpEqf0d8RXOgypTzZCxSBJL61khuq5ov5YGZd27U8oB/j8fXNEO0HAcU04S/wv9iqxI
	MW3wKxc6jQlELrhn11D622nMJNCAsocOMns0bcS9NyVZXWiEzmvtVoTK8m0SqTIX6LSIdv+lC+j
	CSTGYa2KQtf909WdxwpNNZTCiWcnZ3MFOODOr2S0zan1QRmDgZ2YfPasA==
X-Google-Smtp-Source: AGHT+IF5s/wV4r64XoaeHqXb2070yTS4Fijr9wvLXgML0Vykm1nheKm9z+r0ANEO30cLI63Af5CRuA==
X-Received: by 2002:a17:90a:d647:b0:2ee:7e53:bfae with SMTP id 98e67ed59e1d1-2f782c49d85mr5130840a91.10.1737135057427;
        Fri, 17 Jan 2025 09:30:57 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5b21:de92:906f:1f41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f72c174e45sm5438621a91.11.2025.01.17.09.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:30:56 -0800 (PST)
Date: Fri, 17 Jan 2025 09:30:54 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
	Matheos Mattsson <matheos.mattsson@gmail.com>
Subject: Re: [PATCH v3 08/11] Input: xpad - add support for Nacon Evol-X Xbox
 One Controller
Message-ID: <Z4qTzrFGDtInMfz5@google.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-9-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107192830.414709-9-rojtberg@gmail.com>

Hi Pavel,

On Tue, Jan 07, 2025 at 08:28:27PM +0100, Pavel Rojtberg wrote:
> From: Matheos Mattsson <matheos.mattsson@gmail.com>
> 
> Signed-off-by: Matheos Mattsson <matheos.mattsson@gmail.com>

I checked several patches against the github repository and in github
there are no "Signed-off-by"s from the original authors. I understand
and fully appreciate the desire to credit the original authors, but you
can not add SOBs on their behalf.

I think the best way would be to combine all the changes into one patch
authored by you and give credit to all the people involved in the commit
description.

> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 237704b3fab5..18e33e2aeaa7 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -394,6 +394,7 @@ static const struct xpad_device {
>  	{ 0x3285, 0x0607, "Nacon GC-100", 0, XTYPE_XBOX360 },
>  	{ 0x3285, 0x0614, "Nacon Pro Compact", 0, XTYPE_XBOXONE },
>  	{ 0x3285, 0x0662, "Nacon Revolution5 Pro", 0, XTYPE_XBOX360 },
> +	{ 0x3285, 0x0663, "Nacon Evol-X", 0, XTYPE_XBOXONE },
>  	{ 0x3537, 0x1004, "GameSir T4 Kaleid", 0, XTYPE_XBOX360 },
>  	{ 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>  	{ 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
> @@ -543,6 +544,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x2e95),		/* SCUF Gaming Controller */
>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
> +	XPAD_XBOXONE_VENDOR(0x3285),		/* Nacon Evol-X */
>  	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
>  	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
>  	XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
> -- 
> 2.43.0
> 

Thanks.

-- 
Dmitry

