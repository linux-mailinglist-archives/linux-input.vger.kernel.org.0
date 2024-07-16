Return-Path: <linux-input+bounces-5047-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E3931E3B
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 03:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91BFE1C21E53
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 01:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A362017C2;
	Tue, 16 Jul 2024 01:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C36iLi6U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C17AD24;
	Tue, 16 Jul 2024 01:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721091848; cv=none; b=YAwewXAPVbCyOK5LU21UsRsguNcaz2vTpvkafdPxWEtQ3t4kKEjJzOpklgce9AYb+efvuZgDanbS36O/3vfQiTUxevMqO20MJpbHiLCvBqd8PO9wvXTqIsjEhKJ4bBQbAFaHg9FEFW1RI3wYAJ2H7cf2//JR3xYCnko0NE0jPPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721091848; c=relaxed/simple;
	bh=JykLpQbTyoukdRXHFjpu2mN/Wz8dPUDG8VaxidhVyjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUvYrv6FwLjAsiV1HzjBUAxNVrZYtkGpYlnnIFGmF1eQm/TVrhHWqpxY+H1wKon24wtJdJ4yZ0pGjieN7OjTtO2mldxtWAtQosirzQMHDGfanYjWDqENgdlvo+g6puFfglfFRhp1T4lfK3lcSfsF8A23JTc7E0Z74NIMEsSmDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C36iLi6U; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70b12572bd8so3362156b3a.2;
        Mon, 15 Jul 2024 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721091846; x=1721696646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tlte24jdXSyuVqMMgCxd4aC/sf94qwR/jmVRbqiCIzc=;
        b=C36iLi6UEfx6dfMFD8mHCd2Nagl6CI06uej63b33tMgPwq5XIB1KSOpac89dK8jsJZ
         MBCOM8YVeXatI85PJVSHWhYQhawYp56ifcG0KuIvT2pGDKJVfiUeCfbv9wxClnpEToqC
         mVSiNs5eOI80U7WQCjLyFE+b46L5uhbDS/l6aU2Kdt5ElW3osahlUpwonblsibOm+A52
         6uZmHL5XcI+mshU/N3Y2R7V+rJmEyxeCTK/zNF/8RZtu3JeddrInibXNjZTdk+UDlTbQ
         geJgaGtOffaNc6ISFMkMceA21EfhR11bYNmOrI430Gh45i/OVpPW1jewjNdX92sRLg9Q
         9VsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721091846; x=1721696646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tlte24jdXSyuVqMMgCxd4aC/sf94qwR/jmVRbqiCIzc=;
        b=RVY8R4uyT1W+oWiEl9F61leqx8a+sR6n2uIkjShnZd6ZAVGML8A9HKTgRksoWCQRsh
         Tt582MCXmm1R7Tvubg9O+zCJO9OLyxlpAdxNSv9bXEFY8bM3cv2JWMn0x/Rd9hvNhEuu
         8UO23XvlbiMTG3yGjamoXIoNXBfOYfF2wWwV0kW1YLljKcC6a5R0i/pWh138TpnF0ZPJ
         DhZokJrglv+OEW3YVJhdnNKgh4Cabi+jFqzigOcoM8TYRHRd1ZFixLz2pZpvTj2LZX/T
         L8jngt2USOpPRpMKDgcSlzMskdoWAfJcG39hsu0LTDgCtZvew2yoPTbtCCDIv+yg64jo
         JwvA==
X-Forwarded-Encrypted: i=1; AJvYcCVrEhN2/q0nyaP0UAiCPo31JXzknmZBIbiVDDxBIHK6b/LCa+P1nQHEkiPkiBeoTWHfM+3g5Cu8CP4938+6Wm3A9Ii9pdwCsKalwz59
X-Gm-Message-State: AOJu0Yy/ryqnigqgFn8HaE9KvHE6q/7RGTB2Hk0xJYW8MIggQxCLFstr
	7Hk7Xq+hXFwMoRhaqU1lSCABpWKX1QGbpz50GPuJIA78eK9q/dAkx2itFA==
X-Google-Smtp-Source: AGHT+IE/6TRveaY0Y6sSrSyjvFT0kDbVPysVwYRP3ptgHxGoXyXvuQ0351hSyDQjvvhe4lNU/xAO7w==
X-Received: by 2002:a05:6a00:9a3:b0:70b:2a:15cd with SMTP id d2e1a72fcca58-70c130a5276mr1073521b3a.0.1721091846163;
        Mon, 15 Jul 2024 18:04:06 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2b21fsm3218428a12.47.2024.07.15.18.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 18:04:02 -0700 (PDT)
Date: Mon, 15 Jul 2024 18:03:57 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] input: qt1050: use
 device_for_each_child_node_scoped()
Message-ID: <ZpXG_TOdvq6SF22s@google.com>
References: <20240412-input_device_for_each_child_node_scoped-v1-0-dbad1bc7ea84@gmail.com>
 <20240412-input_device_for_each_child_node_scoped-v1-2-dbad1bc7ea84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412-input_device_for_each_child_node_scoped-v1-2-dbad1bc7ea84@gmail.com>

Hi Javier,

On Fri, Apr 12, 2024 at 10:57:31PM +0200, Javier Carrasco wrote:
> Switch to the _scoped() version introduced in commit 365130fd47af
> ("device property: Introduce device_for_each_child_node_scoped()")
> to remove the need for manual calling of fwnode_handle_put() in the
> paths where the code exits the loop early.
> 
> In this case the err label was no longer necessary and EINVAL is
> returned directly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/keyboard/qt1050.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/keyboard/qt1050.c b/drivers/input/keyboard/qt1050.c
> index b51dfcd76038..6ac2b9dbdb85 100644
> --- a/drivers/input/keyboard/qt1050.c
> +++ b/drivers/input/keyboard/qt1050.c
> @@ -355,21 +355,21 @@ static int qt1050_parse_fw(struct qt1050_priv *ts)
>  		if (fwnode_property_read_u32(child, "linux,code",
>  					     &button.keycode)) {
>  			dev_err(dev, "Button without keycode\n");
> -			goto err;
> +			return -EINVAL;

It looks like the chunk actually switching to
device_for_each_child_node_scoped() is missing from the patch. I added
it and applied, thank you.

Thanks.

-- 
Dmitry

