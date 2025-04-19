Return-Path: <linux-input+bounces-11837-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E9A940E7
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 03:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176E646136C
	for <lists+linux-input@lfdr.de>; Sat, 19 Apr 2025 01:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1B63A1CD;
	Sat, 19 Apr 2025 01:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kOt6Q78x"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4345CCA4B;
	Sat, 19 Apr 2025 01:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745026449; cv=none; b=dUzm6uaiXvPjBqEKgu+ULbh0/UqRs/OG0jSFkwm39RQteT/m4U/uVpK+P8PWM8I3BzcSfNm2TU5ZrGmtHptFkNaVWg0WVHR22ko4lPRWvFfcftZHClcxpLs7IycP7EjkzSo0/A2K8pW/tIAB+tT2T0PJ4GGGvnh2NHAQbMRUHvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745026449; c=relaxed/simple;
	bh=hlpkew6i1hb735Cpe0eyM5TitU7dac5/K3W/LMx+65c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/aTNZ2r3OG6I8lwRtO+Y29pHxjDfoStuo5Qw0/U4U2WaDB9xOSwq4xiYgC2FyAhP3Ui8Jlt0xOaCaK9LntXQLAyEf/NMmkR/E8QRPxWgx+wK7oX2J6nhnNIk7wEX0U6KxllO3AFsQdHJm3ZpRmzpWmVeWLbYQAVZIxFxFmQQaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kOt6Q78x; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2115450b3a.0;
        Fri, 18 Apr 2025 18:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745026447; x=1745631247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JkHhjEHVyYAiB1ZZ0py35EWyFXcdVVCH3bYdClkJcRI=;
        b=kOt6Q78x+qlItu9GW/UA/CU3hvbC1z5aB7ih2v75Q0mciQdCnY6uYN/7KL/2RZzWAr
         tBMiA5tWJT3qsA5P54btt9iPz/SrxqAdfUn1kQIK613o+fBSQgsXJie4ekj4mjuJZm/p
         3zxPSg62UmV29I0GZed2lg/3+biRyUfMtPvYx3AmNd8hiYXL0UwFOtkA/NSHljwUaMVX
         /6cGUZQD6bqqPHzxSxsW3u+vSU5g+gernnpAOIt2QwhkN54gCjiqX43F8qttERodkTJX
         jX9RvM4inrld3wyiwo+mXU/krkvchFeX7iKNG4zzFCwZnirL/PIgVIw9uJds1egYovsy
         IbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745026447; x=1745631247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JkHhjEHVyYAiB1ZZ0py35EWyFXcdVVCH3bYdClkJcRI=;
        b=RhpyvuPnlh40tM6s/kPNvz6ZDisTOl90zd7HrPS4eIOqKRg8g5Dgk8IayWU3uiKDuO
         9RYqtw+tqeS8XxisbNhWkBbvxGVn9h4Nv27A9fjuzOJqxkatpCE0BJ3B2V7aaZNZ09hf
         7kha++1TZlU6RNg6A9NIKaStXxiQuMQOmrvHFDANogxyzLnEICwZY6BrUvVnL9tkZNVg
         Cce/Cr/ZC/QyJySBNmJl1Oze76McmEgKwlEDQv6A48SLvvlM7FM2rkRzyu+8eAQPhot3
         sG6f2tEQkI/j8Uy2EirNoF9Posx/15FUQfpuR1JzfIkFx5UgGt0CiJUmpuLysvC2sb6w
         FXRg==
X-Forwarded-Encrypted: i=1; AJvYcCUBAdaEnnmGCXei3org3HJEH56jOIZ0DSNz4ENcoGjjmXVMjISzkU0wY1SYS5i5smaWGcaYGSH3ona/Jbv1@vger.kernel.org, AJvYcCVNVMmNdazB3PUOl3SYmEZo9hhyE7rT9z7FVVSQUzSQ58ZZj0F8Zalkb4vyVFS0m3dBqw0yzyZHkUxoWybgJ6w=@vger.kernel.org, AJvYcCWaZxysvtSXMKQp+u5rB23rdTzmfTx00tCFSMn8uWtkyjDU55cdRDQU90Edx0Lospp/QrMJhig6/Xnc3dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRSVFGe/XVlmCSJBdxzJFw8xM05gC/cp0vAfcgm+MtJE3E54QX
	egC6W6aRV0iK8msvGECzxwq3oHacMi5Xxwu4fD9CHCOPycMXgbmq
X-Gm-Gg: ASbGncsQIi4LWTsUa257aNjLJyslQxI9DcdpkaufV9JjJi7PKHLC7oGG8Lt0OtWWSGG
	ibSsezQnuA1wxbFZOJ0LuA2LN30YjEFURZJeO8DQZf95ejZzsuD0JyirRuw+bYAtZuQc2lk45qc
	psfr5C6KFBjf0UDp7rVxFQAQPzbESUuqO4C1hNl535uaaSKQoQyX/5cM0VM/iMtuB0IWIqFscYi
	d35V1Yn+irGlsBe5p/RflRPafFAXygU0+Y3oi4/Lp13SyDZ48nlHR5dDHEchjo3O+eLaDq3Wzvg
	ZVuPMS16+YxOXuiwtCWbM5grOHsxYnFtHzp658wC/Q==
X-Google-Smtp-Source: AGHT+IF/5FZ0Hqky+APJwsH6k1csOLdh4Nd4qum9CNRcUDY5bUHLx7WJC37uvnGAdPLbU3TXT6yPMw==
X-Received: by 2002:a05:6a00:2e1b:b0:725:96f2:9e63 with SMTP id d2e1a72fcca58-73dc1616d31mr6645662b3a.24.1745026447332;
        Fri, 18 Apr 2025 18:34:07 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:eaea:89f0:c84d:941a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c020bsm2258278b3a.28.2025.04.18.18.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 18:34:06 -0700 (PDT)
Date: Fri, 18 Apr 2025 18:34:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Erick Archer <erick.archer@outlook.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] input/joystick: magellan: Mark __nonstring look-up table
Message-ID: <idho2gjzyy6inx7epop2abk3slmefze4b23k2rog2jdoqq4xvf@pso2tgumee6j>
References: <20250416174513.work.662-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416174513.work.662-kees@kernel.org>

On Wed, Apr 16, 2025 at 10:45:17AM -0700, Kees Cook wrote:
> GCC 15's new -Wunterminated-string-initialization notices that the
> 16 character lookup table "nibbles" (which is not used as a C-String)
> needs to be marked as "nonstring":
> 
> drivers/input/joystick/magellan.c: In function 'magellan_crunch_nibbles':
> drivers/input/joystick/magellan.c:51:44: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (17 chars into 16 available) [-Wunterminated-string-initialization]
>    51 |         static unsigned char nibbles[16] = "0AB3D56GH9:K<MN?";
>       |                                            ^~~~~~~~~~~~~~~~~~
> 
> Add the annotation and While at it, mark the table as const too.
> 
> Signed-off-by: Kees Cook <kees@kernel.org>

Applied, thank you.

-- 
Dmitry

