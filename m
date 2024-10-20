Return-Path: <linux-input+bounces-7563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7FF9A5257
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1101F21A11
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 360F45228;
	Sun, 20 Oct 2024 04:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhEIXxDs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2D54C7D;
	Sun, 20 Oct 2024 04:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397372; cv=none; b=gMaq4sKZVD9YUaJhYf091o5S3nkC9xgDx7dTCAdGXvMYkxiPMkZh38CFz+7jP2Hnoh/m73bjPB5Cl4YJUbB0GOy93NoMrx0pijw1S+JEBL36EB+yP00n1lAKXCuAIGi43KLin/ikCuNzpHZvi9dSqpRc6lGtEyC/GUlvqcm8o5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397372; c=relaxed/simple;
	bh=Z12vYrdNeaaYXwLkKZ54l2s8GJThK5tqZlFL7APNBhk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICT0ABv9j1YPb+fInQibsWmF1+cyRct3v8hOPzD58KMqOxuDXfAwiU8C/dPkqTVpBK0y+3GUYcgfZqnj1iiJi84/GlRE9SSpYojBB7dge3AgwIeLEzrUdGW42knCYMxVWlaQPSTjtCYjh93GlwBvINOBPp+JpEPm7eTcDxgqyJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhEIXxDs; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso2698664b3a.0;
        Sat, 19 Oct 2024 21:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397369; x=1730002169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=bhEIXxDsZ7PyIX9m9IZkMscze4bMByf3tD5raV8PiBCwyvWUg9y1HA5Q+aKx+8Pmlb
         HOzDvxcexzmunFjhQspTCja1oycvsMnaQjQArMIrYzdC3McRuohBNIIr2A2hyP//AXZe
         GuP3W8FfzLgVIbQCpMNKnrXGsSSCeeTXbNHn1L+jvbWjY4dfeHsWh2K3Cs1L833z3hYD
         C2VPXPWeLscNJ1m6cHRzmcfo9W1VkOpST8sbBvc+7YJaoy8nzmHJiBK42ikwqxN7dTM5
         Sb8WiLtsWiucLrvhgzZB8GNtsApA6fD0tiQ+0G/mnwJQq6o4aDGAish0GSU/exZccICJ
         JBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397369; x=1730002169;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTkQOWt01yI1NE4iVB+SDk4vWmptzzQ+PpISRYB8H3U=;
        b=JBscM6KpRMvaU3xTgdQD+jUNg3eb72HRRVedmEeG8iQYnLWR+2EkHCn6jcHsbOXMlh
         of5Vn9HiQrOn2j7Uj1tSNWcwiU+KJsaliTBlipe9LJAsiXHNuFv2dsBcwZ5xVj2jPUx/
         RrE6xclQJnFbT71jqQY5uMnX1GIXf+C/y5fxbkZpQvpgx2ESNcdJa0znP7ziqFPfOtY6
         +Kt0A4F5adP10kADU2utN0eYPJFo8dkn2n3kPPCbBEyiNqcbLK6CAhe1b8ZKh87syvUS
         CXQ6DFmuRzm92SEM2nKJuud9KhaUYHjuiaCgp/aWE4EEe2W00T87QH+4MrWTpUJ5/QBH
         rEag==
X-Forwarded-Encrypted: i=1; AJvYcCVSLYy1sRVMButDoyrk5q1z8KAxPgXgP8uDTlOqaFERsAo0eIAzC9mSzVs9j+0bJ737D/otqfQjPrXx1A==@vger.kernel.org, AJvYcCWtbub5nq44zz6mMvKZZ1ujj2dxpmhxRfv6JU+LYhfYbeAHrn3hrn4fzBIYQv9KH7UkbxwuhNmujC5jPFuM@vger.kernel.org
X-Gm-Message-State: AOJu0YwYisGv0uytew1eo5zVUcHSg+nCIKAJ3nnlsMQ16u+1mrZn4rud
	V1kxrWr3Aw0f0sRY3/pFb5qf8+mOyVVVLH1hsJfCVzrxBG2aHAU3
X-Google-Smtp-Source: AGHT+IE61r7LzTueKUQlFdoI5wEeGAqGUwYYiMrtwf2Mv0pNQVPEzR9fOanjd9e8cCB88vfjJr2CIg==
X-Received: by 2002:a05:6a20:ac43:b0:1d6:97f2:71b4 with SMTP id adf61e73a8af0-1d92c4bac83mr11107951637.1.1729397368861;
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313988sm493398b3a.22.2024.10.19.21.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:09:28 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:09:25 -0700
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
Subject: Re: [PATCH 05/10] Input: twl4030-vibra - use cleanup facility for
 device_node
Message-ID: <ZxSCdYPjv13Rv_JV@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-5-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:55PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to simplify the code by
> automatically freeing the device node.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/misc/twl4030-vibra.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/input/misc/twl4030-vibra.c b/drivers/input/misc/twl4030-vibra.c
> index 101548b35ee3..b8ec5c7c5bce 100644
> --- a/drivers/input/misc/twl4030-vibra.c
> +++ b/drivers/input/misc/twl4030-vibra.c
> @@ -165,15 +165,10 @@ static DEFINE_SIMPLE_DEV_PM_OPS(twl4030_vibra_pm_ops,
>  
>  static bool twl4030_vibra_check_coexist(struct device_node *parent)
>  {
> -	struct device_node *node;
> +	struct device_node *node __free(device_node) =
> +		of_get_child_by_name(parent, "codec");
>  
> -	node = of_get_child_by_name(parent, "codec");
> -	if (node) {
> -		of_node_put(node);
> -		return true;
> -	}
> -
> -	return false;
> +	return node ? true : false;

This better expressed as

	return node != NULL;

I made the adjustment and applied, thank you.

-- 
Dmitry

