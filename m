Return-Path: <linux-input+bounces-8109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663789CD540
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 03:05:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17F2F282864
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 02:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6291E519;
	Fri, 15 Nov 2024 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K3+wZb5E"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDE9126BFF
	for <linux-input@vger.kernel.org>; Fri, 15 Nov 2024 02:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731636305; cv=none; b=ekQYJ8kb5W1pwOYcgnv255n87vt5nHdhaAXzn8hklUPpklMJ8jqywcEZIIbbK6wbe24+1KStqCVDgKsMoVEFdEk5jurH/DwvNDllq2KGUAiqaAPo048Anzep17CzbFQh7+S0FNbYiXTEcx80cL/V5/Cxcb2xW8a8qhISzTxHqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731636305; c=relaxed/simple;
	bh=jL2s2t/zhJpJ+qG123A/AS1ete6L8+lC03CZs2yFVLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ajv5GFo13TJkoMg3xjyReKqeWZn9GlNzgjpHd2KQTAs3DsO5WABSRdkn8hdqsXxyvd6IYOsDL6EMjTIFR+WWJnfP00c9RjZ75NSg9DGfKC0X6D9X4wf2LxOSuLXSbb8p+owvLmt1TMXm65mndhqtlPalYnbC0Zyn4hp20wdkzAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K3+wZb5E; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cb47387ceso14772985ad.1
        for <linux-input@vger.kernel.org>; Thu, 14 Nov 2024 18:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731636302; x=1732241102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Un3CG6pCAJkVBfC1wRNirZ10KSeDAdNR1yEq+oR3gcI=;
        b=K3+wZb5EjWk99P4EqO1kXnNkEKEcRtYoQrjaPm1UDDhVttQirU7c5weBbtBoR1IF7c
         aX5MO2XFccFOYpvF/E74N7OwrgfVxZ8PZ5wAJ3QKkwFG1ijW2P0Fvf99RgFUfUJeoJKt
         zfA2Y2VOeCXAv3kETNvS/L5nwzKgG7o0WutacgjZ0dICbVapwfybanvaHaL2GLW+BN5z
         RBchz6ctKRec0Oj4oS6f4AkMLVzoCMxpcJY+THWu8NWXCDQe65z+hw5L90QM8ibHoYsE
         KKU4wv/aiQ0WIDiKOC8tZz528KBF/Kd/Q5Sqw2hH41fJ1SkYCDIC33osDeH/FfLLnqyJ
         Mbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731636302; x=1732241102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Un3CG6pCAJkVBfC1wRNirZ10KSeDAdNR1yEq+oR3gcI=;
        b=A9Y8Sif+P01iMrWqpmIayCXYQWH38WA3z9XFrKsNfYLmga4/U95c6ItsM4peNzIvPF
         NeSnKlOYB2R9SZ957kyuM58I+zT6GaoqYNRXtWTsGNICGQ9J+JlWNok7Q6t0VCiJdfkm
         rtHiLy5fRHz4Fi37okMZMPyD8SWrLxT3DUR4biaxYfJ8h4iYZQvCjnU5ptwdXWdITUcb
         b7Q4UCK+kFk4JHsuqWA6IeAjweuECuJBzNUp31Pv+euaX7b3khusTQslfQr1baBZpsqh
         PCesKiTFSirkcVUUV0X9M6fOb+0SdqeP/tj8SqCAZh2Y7qQmXASd++MO+IKwSyZBBYrd
         XkHA==
X-Forwarded-Encrypted: i=1; AJvYcCUMD6G3Iqu3uyakEmajDASNozRT7TexIWh1DATWk1nql4M27nMj9HxVSTVUsegC4pvRMltzoAV5I3pdFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSRXV20dz7EHORSaBTbWm1Vv5eCa6vQkOBFmbXGBbnWPTPhRrO
	SJqXBPQbC94kUAWB1cvOPNDt5IPsTXYe9+q+Mc60XbWJmEcS7a/faO2Rd/1j
X-Google-Smtp-Source: AGHT+IHuju1uUcuI7sPhozxnpX9DM2JJjm9MZFu6wM19m/lqqUGsSkVyUtUpZbburP1WLyFNgftIEQ==
X-Received: by 2002:a17:902:e806:b0:20b:7be8:8ecf with SMTP id d9443c01a7336-211d0ed2bb8mr14996985ad.53.1731636301875;
        Thu, 14 Nov 2024 18:05:01 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:82bb:de58:4fde:fc46])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47c0fsm2873415ad.214.2024.11.14.18.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 18:05:01 -0800 (PST)
Date: Thu, 14 Nov 2024 18:04:58 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Marek Vasut <marex@denx.de>, linux-input@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] Input: ads7846 - Increase xfer array size in 'struct
 ser_req'
Message-ID: <ZzasSty3XHbWBDJV@google.com>
References: <20241111-input-ads7846-increase-xfer-array-size-v1-1-06cd92e9f20f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111-input-ads7846-increase-xfer-array-size-v1-1-06cd92e9f20f@kernel.org>

On Mon, Nov 11, 2024 at 08:09:55AM -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y, trimmed for brevity):
> 
>   drivers/input/touchscreen/ads7846.c:412:2: error: array index 6 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
>     412 |         req->xfer[6].tx_buf = &req->scratch;
>         |         ^         ~
>   ...
>   drivers/input/touchscreen/ads7846.c:416:2: error: array index 7 is past the end of the array (that has type 'struct spi_transfer[6]') [-Werror,-Warray-bounds]
>     416 |         req->xfer[7].rx_buf = &req->scratch;
>         |         ^         ~
>   drivers/input/touchscreen/ads7846.c:334:2: note: array 'xfer' declared here
>     334 |         struct spi_transfer     xfer[6];
>         |         ^
> 
> Increase the size of xfer in 'struct ser_req' to ensure that there is
> enough space for all necessary members and there are no out of bounds
> accesses, clearing up the warning.
> 
> Fixes: 781a07da9bb9 ("Input: ads7846 - add dummy command register clearing cycle")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied, thank you.

-- 
Dmitry

