Return-Path: <linux-input+bounces-16164-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B67C65E1D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 20:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 5B5372B3F8
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777CA316194;
	Mon, 17 Nov 2025 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb7vhjgo"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8629E30DD0E
	for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406054; cv=none; b=GXM9CGP49kyHXYBW/qpr621vdmzhdxGPtqHZ9fWL7BpY7lQp+/Xq+m341B+DmSKzjRj+ZW8QL2R1/gSRhqI/y1L+5HfVAdzXXNPM0k+dcdjXUARz1dzxrIUKhK9Tw1BriXrUp1CUhgp6mZr4KjHsm6zWSJysZxd2T4KkLZT6EtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406054; c=relaxed/simple;
	bh=9LwQ8cgiBx+GR9gi4Ze2NRYHzMsmpVYF+u+bBwx5cCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBSjh8mEy+YV7055T8gGxBuXku7D4cIBHZR1UHMpIRv2du3ZHSGxNg3AtiKIZacUVK2zmN/5jwzjKMaWMqtTydd1ZeK7i8CQKAmebCc5B8+P6MlAn+gbXJyMyv+0i77gx7odKT3GASFNfrTF47TdYEwbsnvtcSQ8KOlHNPILmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb7vhjgo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29808a9a96aso48216285ad.1
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406052; x=1764010852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=Bb7vhjgo8i3MdNxVG4EuzsP0kY56sHhKC0hWXy3SNDE+0Ky7g2//Vfq9gp+Z3YGBG2
         kEV2VMszuPQ4nQazsSKgdPOTiRGD1zm95jdORpTJBag6XwmEn5c2/HvrxvuQ0/2Y921F
         UvQBWH0YZMZjhyeFp2YU/N52BH0iW//+scsr+miVtegB+9hZP+42GsqTErMJdr37zFTf
         YF7gzWQjdjmNsm/SlxP/4ZKN6wnkOMpf8uEmxEjzhHoPjE0GreCvD45hd39nEQskXra/
         bg/GnRKMnZp3vn2z/u0j8s3BNDcw8sZ4BbHamAFyvnzIlSksGSxQ/4P1O7k3ELztEwXd
         9h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406052; x=1764010852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=nDpZ3fJswqJ2zd2DuffYacI6GSKgWPhHMKS9F3LkEHDn1hnS0Uz7INlmYJVB115RZU
         AAj1V6zkuXHalS8lpZDksXSaitRZhaHVYRGoBRuxm4n75fTCTnJvBVhgREb3m6TRKIlO
         BC1w3juyWrc4GVBO4DbLlTTfGsBrQdRbHn1+4PILnA1OFytW1gxau6ZmEvlaoHcGl6qZ
         LaHK6ucEq5ulZd+VDPT7uUPLCMiHlC9xJ70qIu12BSeqT6ZVdGGgYGbiI7hUufOGE2JC
         t2bGbgrvBkmpkJZ/xA0W/Ye8fon6nPec1KoUoBmo9d/ttMy1armsljpNTADzDIty8xLt
         MrUg==
X-Forwarded-Encrypted: i=1; AJvYcCUCGybC9uM/LXUgn1hmWetCs1foHGcJieYJV5/BStzhNMkFFetK5W9e2LEhloKDjp5ByUt8sjGJ3Z4/nA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRawhk9QEzZOB3IY4G75pRICJj/1dOeOdHLabIMw1KFcczzvIQ
	zxq288GM+F8cq8VaNoqxPz8XPLreninDvTiBTrRdaeygHvk+BBbnYFFM
X-Gm-Gg: ASbGncsXJseZMkipgOlvYV3WzFiuFpZ5FlwdTsv404EyaTcE5dhcfPlqKVVeMqyWCLy
	9wKou1yEWQ21Oo18HoUBn0r29hvVUQVVtGMI8lGIv4RqrI1skh1/VGfqTeHsp+fGbLxOWY47LCj
	wTwnOlEJz6wYw5mMmom9/oxndX+QLGIxNKtVE2y68J0RlvimwpqsiC7aqp6MdHVG9PYgt2vI5BY
	vVLv2bPg1egHKQFmR62efpdR6GmL6CiivxYNrTlgEQnKl5ja93HsDYgA+xLRqiqdpGuZ/ZpzmbU
	riVGrqadHuStfHiB021M4t5L4e2G781Vbx4d99lQaKHbZ4nq6em+ff7AC0Bh7MuoVUAROXCqgsC
	SzyIkehx7jAfQQRFw2x/CnVGQ9hEPIsHj81fjVv1IheC/khnDgL64H0nYayF2kJfjYb5Vwn/Ix2
	g49Rg410j9k2Wjf1Io5VHFVgrpIMsnqJfWJGbQNxluyJ2K
X-Google-Smtp-Source: AGHT+IGDVNZOalPoeGLRx0StV1WyF6OuSXplI/tFFH2YjaxRb6M+ZouwxCgXlyJ+r8uHMpC01NlQdg==
X-Received: by 2002:a17:903:198d:b0:298:2af7:8d26 with SMTP id d9443c01a7336-2986a76a26dmr169206325ad.54.1763406050080;
        Mon, 17 Nov 2025 11:00:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm146281525ad.21.2025.11.17.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:00:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 11:00:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <7a445358-ce9e-4180-99dd-1a771c8ffa98@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

Applied to hwmon-next.

Note that I can not apply the devicetree patch (2/11), presumably since it depends
on the first patch of the series.

Guenter

