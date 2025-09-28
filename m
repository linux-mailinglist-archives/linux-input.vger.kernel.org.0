Return-Path: <linux-input+bounces-15141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED1DBA6823
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 07:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 241F23BAD57
	for <lists+linux-input@lfdr.de>; Sun, 28 Sep 2025 05:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF156298CC0;
	Sun, 28 Sep 2025 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TdRHcTbb"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494F28C864
	for <linux-input@vger.kernel.org>; Sun, 28 Sep 2025 05:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759035798; cv=none; b=SUO94TbSvPYUZe/C4FnyJf8zrfbLgd/XNpiuUiieLZc7rG0rvqHdKldOUq5TdKdzwKvr8PFSYD95RottR2bETq+TkXJ2psnS9mtdFQfEcw/D0oKA2CnhHNyZ6ruoxxLqP3j3xyxNL82xX951QgU2Pw6QGskZNcKsmeKeuQElsow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759035798; c=relaxed/simple;
	bh=QMtV6OGFQw4H+Fr4qxLekLxCa2Qt7VL//D+5G2Q4PA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1HENu3eEWJ03kz+hDDgGsa3JRD5KLdn7iw/dSC6Hh5OzbVLZfgnFSzWZgrdrqxa3YPMuawP1byKtxZwtVwtx4rZU/28Ben2MseJyKm1nW9AeMOvQvA3cK6dbt0FFecC3soYbym7WM8gJ5cnAhcvY5TT7+Q6OHiU76c0uxTnuw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TdRHcTbb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b57f08e88bcso1521811a12.0
        for <linux-input@vger.kernel.org>; Sat, 27 Sep 2025 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759035795; x=1759640595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xm/OUWyFAO6MekzNliwFbpLwUdv2bsJ5HXnGJgKstlA=;
        b=TdRHcTbb5LaW1+g2m1lt9ldBrNDJGsGIymDK4SnGNBrNSMjpTzwyl+fx6PFd196tda
         vzJRSJ4i6MxfNzSh28mi6NeQ7pTD+4MxOKiqMZdi8ohM6hw/esAlq47ZwMK10Nkva2bK
         /jN905kgffqE2BYeitRKEz7O0StMJ3enIxwZgmHEDfPAGUQKJ/tUjBQzQwqkRMGUYPZW
         o0cSdm9w4dgHZ88NNWDgWFaDmjeCVbAk/GrjhR/l6cHQ37Ve2vp4jb9UXey9YVeP4OTG
         TT2MMy5nLjyYjpgD/w8KjNNg8euIYhVrTYODvswpaNvsPyyNPiJGGziGzPVWAn3z/LXK
         MTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759035795; x=1759640595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xm/OUWyFAO6MekzNliwFbpLwUdv2bsJ5HXnGJgKstlA=;
        b=qnQyYAqOzk4A4Z450DuxC+SLRRGp/Uy30FkY2IZwec+9HEdK/02dyT3HWiCB1LKSQw
         3dzILc5odJKgf7P4zO8rQDaVfCaTPP8GG/SApZIu5P1LekwlzNynWnJBop+TW0Jw5/a0
         Y+m9Pw+hJCzJrtCD1d2xYSXzbRc4GGrOocQfsHb0/3oI//q/a7BWnMoShhj9m+ulr79Z
         MVLHfynmlOGeaxxIJ4S/XLMhRdvHRM23IhurU5Lu47VleCGhJcI1QXAU9wuVBbqtPgnQ
         2kbsMdtSKijh3J4OA/+zUUEYmwYGxeJGrpvrRsWXk8vzfmsNWPVla9lUgG2Z1Bot+6rC
         sCeA==
X-Forwarded-Encrypted: i=1; AJvYcCUe3pdZxt3tq3JvX8Vjglbq8F98mj0N4M+pzHK7i5c5nNujNVODc+PZDZBEqEL0blsF2+Dh+PktaGJTbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kLJ4Vm2+AQny6hCAQIl5t2qPCopVUBV631Z42GlpTv75490O
	La5ecYaB1/siIDJibaOQ1FLelDP2FFVf5gSHMDN46atk7p2imZk2t6w+
X-Gm-Gg: ASbGnctLylw1yMJ5fBJNyujHCSG4KptMvnTdWn8oxCwRRaJlwpcJ2kN2ri2+p4R0p3L
	Oazsdrr5cWvprvlo2oHXTXgPMdiXNt4VUqwp1WOFs41Lv+V1kJYSMgQT+p+K/JyisbGICYRXt5/
	hWiNXmJjYYZGaDZS4hgTvN9aqClpNLg1qr5n4hycQITQkPJDLF85R9vbVRwY0jn6xxGn2rmzN/G
	WbhTGpiybQjiHid4PC/ieJuKlfVg+E7S05IRJbG6eHwgNxhZtJwOxKVaU6fB+UorOitrQAbjo6k
	Kr17Ioal9gfRxrYzkcV8e5knKeq0QiTyi4pdm5Csbc/xWiAOHpJxJv6zzemjkDOI6wrzAzlL2O7
	H6mQLtVFNqwdZoioFY6rxbhBAI+/DOPSxcyh5fB8uYH8jVPwAB7ExjmbebiYdlm73CBW2osNwkw
	==
X-Google-Smtp-Source: AGHT+IGM7HTl+rp2pt0cDMfA3KNGD3nZVxhzYLkjSlK2EgGIN6LujG//pIftIad7lmbGXj0A54imuQ==
X-Received: by 2002:a17:902:e805:b0:267:b6f9:2ce with SMTP id d9443c01a7336-27ed4a465cbmr132772135ad.41.1759035794491;
        Sat, 27 Sep 2025 22:03:14 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:22dc:7b49:8c5d:38f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bf9bdsm95854355ad.127.2025.09.27.22.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Sep 2025 22:03:14 -0700 (PDT)
Date: Sat, 27 Sep 2025 22:03:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v3 2/3] Input: aw86927 - add driver for Awinic
 AW86927
Message-ID: <gswz6zhukprs6q6mrv6pmzcitxrvzktubylhan7knjcs7tjbxf@325gvpk5cyt7>
References: <20250925-aw86927-v3-0-1fc6265b42de@fairphone.com>
 <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-aw86927-v3-2-1fc6265b42de@fairphone.com>

On Thu, Sep 25, 2025 at 12:07:29PM +0200, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
> 
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

Added missing header, changed uint8_t to u8, changed some formatting and
applied, thank you.

Thanks.

-- 
Dmitry

