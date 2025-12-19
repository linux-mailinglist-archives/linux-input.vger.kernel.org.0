Return-Path: <linux-input+bounces-16630-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F52CCE7D8
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 06:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C4A9302AE3B
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 05:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B91622C0263;
	Fri, 19 Dec 2025 05:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S91halNJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCB23AB9D
	for <linux-input@vger.kernel.org>; Fri, 19 Dec 2025 05:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766120890; cv=none; b=f3dIZrRd36UZesgQ8A0uvM8h/Zhqkr0cJoL5ZawGQ6iRPVjLoLdVUleYhiGgG9OngmmUGLUScD74bjEhmnSpihUrDTUOvAWmH1IUXBd0ITP7FXQ9ymwMnD9rkTrUL5LH3XmMlZKXe3gPVxSPvVrGrvesFNth2j9texWgR2O+ML4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766120890; c=relaxed/simple;
	bh=lfIsODuXNScsLi1F0tAT+F0fuOdfI3V10d/wPgyOIoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6JXC7q3+3JYNB6/KnrriWJ7SvUz3Ys/Dq3xYcWSiP5+ylG6IatDw2/aqpkLhhz1VDbvgIN1YdQwIT//+6zjBRSjZncEAwPpaknZUYC+MFEil1kAMkeDl3D4caNsa2DwXm5VmnmOYAmi1d/plBE/XzBXy7XjIsljcbJxzotU1rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S91halNJ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c03ec27c42eso771237a12.1
        for <linux-input@vger.kernel.org>; Thu, 18 Dec 2025 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766120886; x=1766725686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87Vh+MXKDGCm5ZeAor6PNr85iM/G4XTScUX4GRiPl3g=;
        b=S91halNJAbb+LR7YQFCV6gdayV0nO3Kg4vaOmart69oOJLW6d9qaoc3WKSybNXUeR2
         OLogNbxi8g6CBHtVkHe4FbBaGJkAWDm13zoA8Fmq9WG9TfhieN5K8S8V6dfQbSOw9Dvs
         tcww/c1Jv8lXLfcdIPH9XNLNvXcp8rbcp6WRVJs6VwIJ9micvjUntjteXjHabYv1XdOJ
         IJ62ItNKoKgx59v4MpDhdivuuG0cVe/1RY1WxQU1IcMp9gHDrRTui7ctoh0p5UHQO2BO
         8m+nWXGe+CLuhkA6VXb/pUwZqEorj0MPzvvvlked7GRgIoU+DLerp0wWNqlOP8PmsMeY
         kyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766120886; x=1766725686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=87Vh+MXKDGCm5ZeAor6PNr85iM/G4XTScUX4GRiPl3g=;
        b=LX9uCN4ynCtDdFRmfMhJy6x48BKIN10pzTGC0MsriABBdu9as8pKQuw6PX1KPbmXQY
         jUEe1W4w909nU0LbxU+26Ji4+L2Ajm4GcIs3PdS3I9/UlI5922fmpE/rvfX8pq0D3OSX
         axir6+koAwh4wECY0f9phgp1YGJvM9tr3NblkqgxUSy6Yn5k2rY8Px+1O7Bm/WX4V7/5
         mMgtNnxwRkuF3U9kKhIEmnUy9GWFIS8/e4io5RRpPYGtGZ7jZRO91FOClFDG4CP/Abnn
         v5LAEMOSz9Wyw+S3+fsLI1lvjU0gPiD+tekAaj1e3b5Z1YdgDgEfmPCUn12F2zz49VEn
         L3AA==
X-Gm-Message-State: AOJu0Yz88NjW3cP9ZKcu7Mmr+lIPNAeQ7h5xoaagvWEmdtbko61Qkx8h
	fO/+ymt3l7x+bwA91RJNF1PpFQET0w3ys6iVkN3EBQ1gpd+i6noRln5M
X-Gm-Gg: AY/fxX5RaXMxBota3VLf/AHoSOp6vUdTz0egtVeSpNfOObHtcEhj/7vgs8ilEq85fVn
	DMerswBw9EsxuUjn6xm5LBSRsIhVsjkNePARXUsgoYdwEEICPs5BGlLXLupQGbEp7l7JEU3QyP1
	BLpG5FaV9aZB3QcuMqm/jELufM6uJxLXkFxj/ESus5JyN9QyYovqiiNXLLUmahhPOZ0rDPbVBqj
	mxBOSzlAInal7Pw1G5VRnqb4IZZcMiklDUtce269Sji6N7tGfd29HUA8tOWCRwXuDdujXZf0crA
	/5/dWp7o6Yk60hQPCzSq39FqgYRl/ydXi1AXB2AGcz/5e+7Nvmhsqf2lTKjJJEc1zBjm7+Xqh+O
	8zLF/EE8Eempa3BBCkdfWZ0A+72vc8djMcUb2f1xXUxgsXYgFGe2ZDBfiEiR1aLuSLwx7jkFHxh
	r0H2YN1qDCUcL8yqTF1Gt1g1gTYBTgxac/+eTzsIS1pVhS3Ml5fBHS
X-Google-Smtp-Source: AGHT+IFpCUbYtt9YcCTHssXbTdmtZ8lobf+scbpHbsF35DC67ZbmCBf8SX+qBXqq57FLQTqHJgWrVQ==
X-Received: by 2002:a05:7300:4717:b0:2ae:5ad4:718d with SMTP id 5a478bee46e88-2b05ecbeecemr1527101eec.43.1766120886124;
        Thu, 18 Dec 2025 21:08:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c932:b7cf:9dde:f662])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm2808444eec.5.2025.12.18.21.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 21:08:05 -0800 (PST)
Date: Thu, 18 Dec 2025 21:08:03 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Philippos Boon Alexaki <palexaki@xs4all.nl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for the ZD O+ Excellence
 controller
Message-ID: <copxfwjjvudsgq3s72wqimsdcqmrwxzjry3wweg7yrifr6s3cd@gv6w23g4open>
References: <aQPtBpx6bQMCw1tF@htpc>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQPtBpx6bQMCw1tF@htpc>

Hi Philippos,

On Thu, Oct 30, 2025 at 11:56:06PM +0100, Philippos Boon Alexaki wrote:
> Adds support for the ZD O+ Excellence controller.
> Tested with a wired connection.
> 
> Signed-off-by: Philippos Boon Alexaki <palexaki@xs4all.nl>
> ---
>  drivers/input/joystick/xpad.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 4c94297e17e6..3805780d5be3 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -296,6 +296,7 @@ static const struct xpad_device {
>  	{ 0x10f5, 0x7005, "Turtle Beach Recon Controller", 0, XTYPE_XBOXONE },
>  	{ 0x10f5, 0x7008, "Turtle Beach Recon Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
>  	{ 0x10f5, 0x7073, "Turtle Beach Stealth Ultra Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE },
> +	{ 0x11c0, 0x5505, "ZD O+ Excellence", 0, XTYPE_XBOX360 },
>  	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
>  	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
>  	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
> @@ -541,6 +542,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x0f0d),		/* Hori controllers */
>  	XPAD_XBOX360_VENDOR(0x1038),		/* SteelSeries controllers */
>  	XPAD_XBOXONE_VENDOR(0x10f5),		/* Turtle Beach Controllers */
> +	XPAD_XBOXONE_VENDOR(0x11c0),		/* ZD O+ Excellence */

It is really weird that the matching is added for XboxOne but the type
is set for Xbox360...

>  	XPAD_XBOX360_VENDOR(0x11c9),		/* Nacon GC100XF */
>  	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
>  	XPAD_XBOX360_VENDOR(0x1209),		/* Ardwiino Controllers */

Thanks.

-- 
Dmitry

