Return-Path: <linux-input+bounces-15425-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43719BD565C
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 19:12:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C4A640479D
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 16:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4E0284665;
	Mon, 13 Oct 2025 16:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO1redT1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D8927979A
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 16:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760373518; cv=none; b=WSKchSFCI0kF6Xiw3tkPwrT4NryGk2qYXAx8Yo1fCf1RA5ezSSKXWxcZsf/AJOBUeYoNoydTnQP3Erf4jGpDiVhDoKdqz/1qNohcmDCuJ1WzTMADvH5EP7+Ac73MGmADpnnTugUu8tVAMX+g0AOTcQcLXLuRqA3KtP++C7lGN+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760373518; c=relaxed/simple;
	bh=BmCQy3oliPeWLRO6I4CCTOEAGIzf80nL8hlwN71HeHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6CQZlVnvMxnhXNoyjb+wmObeZiz3QUIyS1iy+VF6CgjZrsulOm+Q1Cx/2dhSi7cManGX4tRfVoR52bO04/u2e0MvD6CObBsbRu7bgAUppGvrdcqf/0674xLQKCkSsEZekFFPeNPVAajWpHBvETPZwXfgLinneBBDrmlxhFfIjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO1redT1; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so6251502a91.3
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 09:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760373516; x=1760978316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k9JYYdDpgeV66ek4YeGNXX7QwZ2biW325zvZ3DiYUsY=;
        b=EO1redT1ooRHr1ycAUG/9ZY7dPjz2GyesDQNHweaXIcttXbQCihM6fEHc9kUTYxMqY
         odF3iVQL8aNOrFZ3mNsLE+hxz0hMPqOgNcE8gSNBo5njj22seBzZsI/ehswJrx11cPFo
         KXUalWm6mZrSS1n05mIbvPYJn3Cvtbk6l2/zkutYqRqMlGfdvOaoGMV7sktrcLkY6ABH
         SVWC6kowYM6G85xPJkjXvSeyHj1w1UlLONMIn9PAJ55SHqwMcCJ5lPlpX3dBeH1/CSbe
         N0sLlLRniitsMQwNZJoOPE4IcHEhSJCK0r02M8iIokqNSpA+jzDlaXfrV4tc4BjEn11p
         LxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760373516; x=1760978316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9JYYdDpgeV66ek4YeGNXX7QwZ2biW325zvZ3DiYUsY=;
        b=nDU4RfjPNZ+n1CeKIRTVJstGVkI0aFUEUZXdXmorKVUA385yUHf+6sA+KhAT4pr6RX
         QsIZz5YDZNP+VkzI/51ZhxwfSUdk4YuMRAQZhJdPa8B26S0srsJSS9qMt39mAkGKDPNT
         p7vwvlSg9UBiQM0WNCCCV5vf6Ho8pTJWPZbqQUi4ibrsRv2hbFiVOLuVipn4f0n+9cbD
         cowzF/5nVkIuYk1ZlMfC31DhRPys1ETLG1M1pMPEnK+gz2cnmSdiBaVxo5oFNLrtDzNz
         olkHJi4Su3m0SoDPAvde8sEFDY+9fT6bT+/KOQb0x7CZ1F5nnYuOh+3/bi6sTXsEavMn
         ZdIw==
X-Forwarded-Encrypted: i=1; AJvYcCUuiReLVGZucda54TwDHHakAEQ2ZL+44tKaR6AJHzUAURRCj5N8sX2bvKHKmiElTYounP43r32g2YO7mA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZNmDRnVFv6bKkCyBi9iOLtmwLmsdJszPWBZx/C8JvfG62jkft
	CT23PCiQO+x1WNEBEVTmxmjoWnx20+9gx49JP2kaUunfYgsWtn+T1Lcq
X-Gm-Gg: ASbGncvmnEwWNKlITYBTUmYWJfE8Ga2vxPiFVfAWxusnsCBVlc1rHd56R0bBn3nAbN3
	pkyVWOvmnKX/xd6ZULs3mhsAMXRh2LSqoEbgcmkKvuXYYYj9zPdh3Us5c1ssXqCt727YPsQp3FB
	VJYTgFP5ZcNHPZ8+Alt115fgP0+Wl5vb6QkR22YeWREQt/IwgnRoWNQ4w/ZU2DVtKYW3Qhsyt6O
	vdbgBD7B2sjezpPGmH1gxT/pjIeZOXlbOgifOqJ2oiJ2rcniAkN9W8kEiWIKazpx1Qb2OLlX0uq
	3wnVkCEvbUuRpgdp+tZR3lvT9fQdOXaR7aDWwVeXpoujztHnte9bExw/ykxWCnGRBr6WdBWk1eS
	iOp+HfT4ipTSE3ArtLCQnP1cabQ5OxZKkIxvvjK2jG+kYrjt5TnMArT++wBqAUJggiJMpJA0Jnm
	SPmtLFNw==
X-Google-Smtp-Source: AGHT+IFxRS2UcQqMiskIECF4/ssW11b7nfNNRQ82YATASIt1Dk+EkKRi/gf5PQqVV/QcP9D8QIq3Fw==
X-Received: by 2002:a17:90b:1c88:b0:330:a454:c31a with SMTP id 98e67ed59e1d1-33b51386573mr29764371a91.32.1760373516376;
        Mon, 13 Oct 2025 09:38:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:2811:1686:ffe6:64d0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b11ca9sm12836091a91.24.2025.10.13.09.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 09:38:36 -0700 (PDT)
Date: Mon, 13 Oct 2025 09:38:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Martyn Welch <martyn.welch@collabora.com>
Cc: Hans de Goede <hansg@kernel.org>, kernel@collabora.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] input: goodix: Remove setting of RST pin to input
Message-ID: <6etmibzrkv5kh33xxyjde2p3ppp65rc2ojfgxt6lwevhtff3hi@hpuz5uzwtwlz>
References: <20251009134138.686215-1-martyn.welch@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009134138.686215-1-martyn.welch@collabora.com>

On Thu, Oct 09, 2025 at 02:41:32PM +0100, Martyn Welch wrote:
> The reset line is being set to input on non-ACPI devices apparently to
> save power. This isn't being done on ACPI devices as it's been found
> that some ACPI devices don't have a pull-up resistor fitted. This can
> also be the case for non-ACPI devices, resulting in:
> 
> [  941.672207] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  942.696168] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> [  945.832208] Goodix-TS 1-0014: Error reading 10 bytes from 0x814e: -110
> 
> This behaviour appears to have been initialing introduced in
> ec6e1b4082d9. This doesn't seem to be based on information in either the
> GT911 or GT9271 datasheets cited as sources of information for this
> change. Thus it seems likely that it is based on functionality in the
> Android driver which it also lists. This behaviour may be viable in very
> specific instances where the hardware is well known, but seems unwise in
> the upstream kernel where such hardware requirements can't be
> guaranteed.
> 
> Remove this over optimisation to improve reliability on non-ACPI
> devices.
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> 

Applied, thank you.

-- 
Dmitry

