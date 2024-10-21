Return-Path: <linux-input+bounces-7575-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C75ED9A5C47
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 09:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B0D11F22963
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29641D0F74;
	Mon, 21 Oct 2024 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkdcFhNm"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5C81D131F;
	Mon, 21 Oct 2024 07:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729494910; cv=none; b=dEh2SehwhEM6bHH3HUw3PJoYmgCwTTpcIaqvUiyeJ1Zx829TSTtiqjOjhSdjJOSHrCrTsgV8zwWTOCl+/k1UO/hgz2Xk72PoeFI0baAlI/H4pWWwqHH0oCpvqyYavxVcpWjqlQaamjOW/lT1JBF9ykTI4q/u0EFrHW5ViSN6CAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729494910; c=relaxed/simple;
	bh=dc6pUqfdXdJQEF4Ix0lfWE493NJoqbb52K8H6be4mb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wu3Ys3Tm3FiBaUcLjhUjmCx4YMZhOSuJG4N7WdzRIggAxwBdYudyUOM02nN5WG1RubP05B4MqUDYQbaPxAHyK1qNRJGxK6fOJW11j7sR2xbFlc21i6C0r54G6d/BoVr9umDNyospFvUBOGNmA/uDqbAXdzP2KcODCsbfwxT74jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkdcFhNm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-208cf673b8dso39942615ad.3;
        Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729494908; x=1730099708; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=dkdcFhNmgMaYq+ztsg0/diFgBKAX5+yQ2rTl5t0HFvSgBZnG8GCzZXuMfPjXRCvtQR
         hDkICX3RCdq11krlMuIMTgeobRYTOV0lSQNUb7T6ZEHU5zFg8iZ8cjKt5WQXdS8JX5dI
         Z7r5aXIQyJH2nqv93+ydku3jM0KGpjkTAG5lCt0CI3I0HCdtg5iQg5xig8fYsOy6dQzr
         EopM1QLS+p0cdRLenN6iXEQoIszIV3JBUEzFQH/1mLmvfIym3jwXfKeFddNC3D1VanV3
         9cVp/e3TznuaoDQ92uShts8tVyvonSho7q9N6LMx07uA0rqQx1QdiDN2mH37A4j0GKVT
         +4wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729494908; x=1730099708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=smZfrGjVtvMSg3iZLlvbi89YS5i9FVGvaFb9EE1aWv8=;
        b=TSJSpSVG0HlmT8MsfLA8fUqq0o+s+721W7AWesbRjaxhzV+ch2ESalQZS3GivnpYBk
         YMTC2i9FR1JYUIKMFlMqYtRstinls8fWTzivE7HH8bCD++i/b4OiPnztXHKZ6BNXe3KE
         426fmg/22mQjSokolqQagKbYS7RZiIGVTqqYixGWePyP+HRuZ0lTgv0akPWaxv0/fhZS
         7Ue4JadkGvaUpUqkpWjemgGKssx5on0GwYrQFxZv0N2Slrbs3/5IMUrXJTjeaaOi4gWe
         p7t+nzc8fhTplt02+MHnaus2vvUKLNO6486856T+V2ZDDPZHzfDMPStpZRGV1n6eeCdI
         hq0g==
X-Forwarded-Encrypted: i=1; AJvYcCWdtuWQXVzuLgyk1EG3sf4YfuAIW68YFcML5r0Rw3i+qhgiEeefI0+MH+J7cLwEGBBwn3w2YdNVrMHtBw==@vger.kernel.org, AJvYcCXiIfWQeI04a5Qxob7BbfKtZ+XGiCaL9JNI5HTIpW2Td9jhJtCHphzBeJ2zmaUd9M11WK8Mh/wT9AxPSXWQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzdDDpQ8xOxPewreoN2UrMa63n6Yh8EI3TzkMIiZnIrkTxjaynx
	GJn/EwdxLkDNROg+bu1hbHMwmhnPWqtPajCqg34sPHGr6EbYp3fc
X-Google-Smtp-Source: AGHT+IHy2ChbQeyZrKCx28/8OkE6XbQjadUgTgmofH8VjxpMdlc/BulLZcrsT3LIRUIu1mJy2aFspg==
X-Received: by 2002:a17:902:ce07:b0:20c:c9db:7c45 with SMTP id d9443c01a7336-20e5a7604famr168254115ad.20.1729494908190;
        Mon, 21 Oct 2024 00:15:08 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6e21:7092:f7c7:3951])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0d6besm19607365ad.104.2024.10.21.00.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:15:07 -0700 (PDT)
Date: Mon, 21 Oct 2024 00:15:04 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH v2] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <ZxX_eL_hs-_eKW0h@google.com>
References: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241020-input_automate_of_node_put-v2-1-ddec58b4b99e@gmail.com>

Hi Javier,

On Sun, Oct 20, 2024 at 08:27:13PM +0200, Javier Carrasco wrote:
> Use the 'free(device_node)' macro to simplify the code by automatically
> freeing the device node, which removes the need for explicit calls to
> 'of_node_put()'.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> Changes in v2:
> - rebase onto input/next, drop applied patches.
> - sparcspkr: drop goto before node declaration and return -ENOMEM.

Can we switch the driver to devm so that issues with cleanup and gotos
will have less chances of resurfacing?

Thanks.

-- 
Dmitry

