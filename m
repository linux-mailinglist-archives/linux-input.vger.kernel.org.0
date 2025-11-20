Return-Path: <linux-input+bounces-16266-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B4DC76153
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 20:31:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 35F144E102A
	for <lists+linux-input@lfdr.de>; Thu, 20 Nov 2025 19:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65B2BB13;
	Thu, 20 Nov 2025 19:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcrK5CR4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480336D4F1
	for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 19:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667062; cv=none; b=Tjpk9pe4r+ozwq4HEsZwJQ3Drig7CFg/m8u75kRwFZ3OiO3DAAb6QyobVXQEIRxzTCTg1QzQFfm7gphUQ3I3cEDZ66srd9lePpBpZpp0qKrUpPPBPHS8yVNhRyBvkKnuRVtYieNYV4AfVMb7PTZ8B4OBWXsg17Ogv7FwKJL95og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667062; c=relaxed/simple;
	bh=eahziV9MI85JUeAGUiVjR0rszmwKr7+OYLU7ncf4BhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfTX3sDaDyF8/IwcBJwH1/+aBhFcd5Irjhz9dbefCMs2/Aly9XC9dnNo/gQFis3444zg0ryprClzZfKx2Mh8o65XGQG9oxhP10U9Traqve1aE30NYzvtsCfNvCkjEQVclG1XEBsXSugIr/I+hIAl35dWYqDDPILXNKguY97fzuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcrK5CR4; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ba55660769so1186968b3a.1
        for <linux-input@vger.kernel.org>; Thu, 20 Nov 2025 11:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763667060; x=1764271860; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PRVJZy5dkqK+dIV+YwP8rCogUc4kibHesQnaNYNc96I=;
        b=JcrK5CR4GLJ61aPuef4h+YEz299rB61WubQ07i5qtGcZ9XqLyD+vvxkd403RwXQbYj
         nv9UKfIWzFNMx5PCMm8ekGdVt9vT8CURg0a+BT+zu0TQz4l6ju2k/KW56ldsRGi1v4Cl
         0Oypj0mm2kx9N6mYKbT8GQ8dMF7HVLlt9Tda/jMrYs59QIVi2Czf4b4cSwuacsaCua7E
         4bj3LHB233q3wM6+QMm0J6hk9xFxH//2f8QQKG6WqygeqlP7kuuTMAz60OSzydh1iMGQ
         W16CxBn8gQ5S5RiNumWOIyGtEt1nqiHqjgq1bMWIw5MGT5Nasd6ftX3SNIgyjMrJbawA
         pi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763667060; x=1764271860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PRVJZy5dkqK+dIV+YwP8rCogUc4kibHesQnaNYNc96I=;
        b=Bh/cdK9TUIhjdhtW7kcsM01zz1JsGA0omQcMHQBVqF6HyWbvr2DXbeWciObUdPUPXq
         EK0KKVLxJJuHa7bbXY5+KOaqcKOuKmNSYKS6m/pAw5DxQ9TMlS+J3Puhl1n9yqrpipxZ
         1gr18VKmDZ2CAxPf7Hl1c+pngo0rC4h12NLTdi82Aq8rBjgjBQRpQGsL64tHXViMizmp
         uKtwwhAJh9kJs07QVIuFB4FrOuoMBleCY5WG5lOi1vIPOEYPmvn7x4AwFr+rqLG1Xy/p
         HzmQpRl4NEVwNKggjDgCJHd4vxqtI9vvTCxdNRFS6QymuRCXJToUfQvaYl+3iLcbthKM
         5MfA==
X-Gm-Message-State: AOJu0YwQ5gj1uD3jnY0xvqrMLPfG7R2bfAJ3/RaUONifgj472dYLZ0Ct
	Te86uGKoDs7mxq38RyLsEK0CTmuL6qIg4ng9Ei6kZn7gUlAMDDMQpW0W
X-Gm-Gg: ASbGnctOaY8P4/GA3zlfWtlGwQeXm/p/2iGGEh2dUjSKEEj4NFksnPZjQvwAHT6xY4C
	zz/sFHJRglQ5AcO7yBKgmzH7DHP1yIfY6b7eRYineNumf3d8ihn5GF8hoDuEjgydaURx0yojmbq
	npDcYrFTTeicwPJnw8DtGD+eyHhTCRlW5G7lWK6ijEMTfokQNTZhfSafpxSpzfnUvsrE4W3ukQD
	covQ+MSCTub+wgXkbdXXt8+bo1Fcu4F9u8tYknMxHnrbZKMQai9a4JU2Pll4h7f+dgJY3obQqIm
	OK2zFgEjCCTbjss5aULXB2iGQ3HI14umFO3op/WRyDOHH16lGvjM32hoOO06y9bC5mhBQGw45yn
	y76mQx7ybmv60CY1HUPpx6+XPNy4rxX6FjBjvOwO4DKoeVG0AcHmg9yIhfJ6vV8f9B8XdIJe7q+
	D11pon00Mh+lSu7wtfBJHs8vIFBnmDDlZ3GWysLCPoOYkUC2fjDzXi
X-Google-Smtp-Source: AGHT+IFyekVgq0Fe4+8lyhfmB64TVSD6lEbdD1s6FF2lT5ucCTckF4Fkqg9L/hs9aeX2ceHzfg6sgA==
X-Received: by 2002:a05:7022:1508:b0:11a:2ec8:de1c with SMTP id a92af1059eb24-11c9389b302mr1388681c88.36.1763667059698;
        Thu, 20 Nov 2025 11:30:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:13c9:31ec:82bf:a8bf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93db4a23sm13507723c88.2.2025.11.20.11.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 11:30:58 -0800 (PST)
Date: Thu, 20 Nov 2025 11:30:56 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: "open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	joe_hung@ilitek.com
Subject: Re: ili2130: touchscreen-size-x/y DT properties are ignored,
 firmware reports 16384x16384 range
Message-ID: <aabnty7qup23lung5md4v62d6kxmj3qvjnarrzcayllfdm6gx7@iuweu3nzzgpc>
References: <CAOMZO5DhfCk9=uMONdwndrYgEXtYj6L6-mRbYyP-q5M4J9_DAg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DhfCk9=uMONdwndrYgEXtYj6L6-mRbYyP-q5M4J9_DAg@mail.gmail.com>

Hi Fabio,

On Thu, Nov 20, 2025 at 09:40:14AM -0300, Fabio Estevam wrote:
> Hi,
> 
> I am working on an i.MX8MP-based system equipped with an Ilitek ILI2130
> touch controller. The device tree contains:
> 
>     touchscreen@41 {
>         compatible = "ilitek,ili2130";
>         reg = <0x41>;
>         interrupt-parent = <&gpio5>;
>         interrupts = <13 IRQ_TYPE_EDGE_RISING>;
>         reset-gpios = <&gpio5 12 GPIO_ACTIVE_LOW>;
>         touchscreen-size-x = <800>;
>         touchscreen-size-y = <480>;
>         wakeup-source;
>     };
> 
> The device probes correctly:
> 
>     $ cat /sys/bus/i2c/devices/2-0041/product_id
>     product id: [2130], module: [ILI2130000000000]
> 
>     $ cat /sys/bus/i2c/devices/2-0041/firmware_version
>     fw version: [0700.0000.0000.0000]
> 
> Using evtest, I see valid multitouch events. However, the reported
> coordinate range is always 0–16383 for both X and Y, regardless of the
> touchscreen-size-x/y values provided in the DT.
> 
> The ili2130 driver exposes screen_min_x/y and screen_max_x/y but these
> are all initialized from firmware data. The DT properties appear to be
> ignored for this model.
> 
> To make the touchscreen work correctly with Weston on an 800x480 panel,
> I currently need the following hack:
> 
>     x = (raw_x * 25) >> 9;   /* 16384 * 25/512 = 800 */
>     y = (raw_y * 15) >> 9;   /* 16384 * 15/512 = 480 */

Touchscreen controller coordinates/resolution is separate from the
display resolution, userspace is responsible for the conversion.

Thanks.

-- 
Dmitry

