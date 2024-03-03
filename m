Return-Path: <linux-input+bounces-2159-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8121786F77D
	for <lists+linux-input@lfdr.de>; Sun,  3 Mar 2024 23:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DBF69B20BF0
	for <lists+linux-input@lfdr.de>; Sun,  3 Mar 2024 22:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF64433C1;
	Sun,  3 Mar 2024 22:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZWGIihZS"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E451D1E51E
	for <linux-input@vger.kernel.org>; Sun,  3 Mar 2024 22:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709505910; cv=none; b=kNiBe+w5E+WftZtoaKYfMvntm5QSXWUdUeNeOdqfrJy36SP4P/zYYf8Y030b+42JAzQdwDjVkIQQH7XP8XOSloKfyXusPWAhbONMOiEH5GLIIwH9xnLC8/PKFo4/gF62+cyY/9dFNn+m7AgWCfZpQmZGWP/Ec3fpbC7JAzvLgi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709505910; c=relaxed/simple;
	bh=5uH0SKGYBGhVl6UACpRO6Mns2vNuTuumOAVPYC6gqMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hmxs/0NILOcOE7P1paSarLnr0qJGqSwgke/oClu29/jgd6bFuyBkmu+xGoP2JQM1nPfxB3wjoPAa3T9JUVsTbIDKEWAtp1KfnCSNAbxOh5qZcTx3p2fAp0FxrsmU2/BZEZdxf3n8TS3Q3WoVqydvs5RmHptQN74K84M8s8OJ3BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZWGIihZS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e5a232fe80so2219991b3a.0
        for <linux-input@vger.kernel.org>; Sun, 03 Mar 2024 14:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709505908; x=1710110708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6Yb8zYlap87HPSrdIB3Gyfc+A+bwkytjyYQNRnypKI=;
        b=ZWGIihZSyLEInlihpv9y0OQJ/9VmY3J8hgjuOrNzi4e78rEWYvoRgHYar0oEXbFlgK
         55KBSJLXBOKAvTVoA7uqlGVzAqKKObstM6fs4lB1cVGnQHKwWJD0BhRkAmkCGnwWQ6Pf
         VfwN046VL4rtzq32ffbJNgmHNg6DvL+A0AUng+LVGRYVQ4MP2xiu6ioiZkmqgJ+SwTiE
         HYENXBelndhqIza9hm5JgT+9emnwQHV83jejl3ov4cnCauhhKN78hs7d0h8BMa/Nukau
         SpxFGm496KowXbVLu7P0TWZr1KHLjEtQ3GyK0pPmdaONO0lSbmB35+BSsrU67NgjFRdP
         IQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709505908; x=1710110708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6Yb8zYlap87HPSrdIB3Gyfc+A+bwkytjyYQNRnypKI=;
        b=Gdi39kGpg//u09kwasggjke/fBT/rLF8yjZcIcrQFfrInV+7eaRdzIRPLK/AJtwyqn
         EKSRd46JJi1LKy7B+PuSWHP2+WJc7IjuLd6ShTeDmTSPO8gYWlfVyMYUR9fao8BOc5hW
         NjXSjEe4gJiEgvS2lcJE23rVFtCbNXPF885NiDI30TDY+iSUSOz+bN0uAkuVZhqpi9lu
         7/5FxfvBR7gp2g8LB80QKSyH2XbsoN5boAQSwkzrBUAuL7+9uGCPfDFen76XOQ8V3Qvx
         jOt3Sv8kJU2YlM2pFaZTG0OCvnqZ4dWe2QlpqNTiAMTTjk8rluSrMLByJ4aAt0v7DVNc
         D9Kg==
X-Gm-Message-State: AOJu0Yxnge3IdqjDdDbyQLbm72Kk4nEMOxAXqanQ5hb8KnHX72HgrIGP
	PD4f0ygBLaR/ManLFxth+PBoUnSW7Mk0eOVhbAmm98uJQ0UoirLTeBcTkIaz
X-Google-Smtp-Source: AGHT+IGmdVRRGUg2+PCOXUqiPmUYpFzXove7I+BWPLV/Llzy/NkAzPpsaLZSl7uTQnmO2n392UgAUw==
X-Received: by 2002:a05:6a20:9c8f:b0:1a0:eed4:dbf9 with SMTP id mj15-20020a056a209c8f00b001a0eed4dbf9mr16220657pzb.24.1709505908202;
        Sun, 03 Mar 2024 14:45:08 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:99d7:8333:f50c:d6a6])
        by smtp.gmail.com with ESMTPSA id y185-20020a638ac2000000b005df41b00ee9sm6172714pgd.68.2024.03.03.14.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 14:45:07 -0800 (PST)
Date: Sun, 3 Mar 2024 14:45:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Nguyen, Max" <hphyperxdev@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Add additional HyperX Controller
 Identifiers
Message-ID: <ZeT9cbHRVe7td8WB@google.com>
References: <44ad5ffa-76d8-4046-94ee-2ef171930ed2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44ad5ffa-76d8-4046-94ee-2ef171930ed2@gmail.com>

Hi Max,

On Fri, Mar 01, 2024 at 06:15:42PM -0800, Nguyen, Max wrote:
> Add additional HyperX device identifiers to xpad_device and xpad_table. Cc:
> stable@vger.kernel.org Suggested-by: Chris Toledanes<chris.toledanes@hp.com>
> Reviewed-by: Carl Ng<carl.ng@hp.com>
> Signed-off-by: Max Nguyen<maxwell.nguyen@hp.com>

Your client messes up patches :(

> ---
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 7c4b2a5cc1b5..a7e001a1f6dc 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -131,6 +131,11 @@ static const struct xpad_device {
>  	{ 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>  	{ 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
>  	{ 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
> +	{ 0x03f0, 0x08B6, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },		/* v2 */
> +	{ 0x03f0, 0x07A0, "HyperX Clutch Gladiate RGB", 0, XTYPE_XBOXONE },
> +	{ 0x03f0, 0x038D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wired */
> +	{ 0x03f0, 0x048D, "HyperX Clutch", 0, XTYPE_XBOX360 },			/* wireless */
> +	{ 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0, XTYPE_XBOXONE },

These need to be sorted by VID/PID.

I fixed it up and applied.

Thanks.

-- 
Dmitry

