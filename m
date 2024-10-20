Return-Path: <linux-input+bounces-7566-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0859A5262
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 06:20:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD4C4B229CF
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 04:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCDB79E1;
	Sun, 20 Oct 2024 04:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDxfQUBY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302EFBF6;
	Sun, 20 Oct 2024 04:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729397996; cv=none; b=WPXAA8GcP2Q18860gCNrMzQOnxAyeKEo8pSR0RVLYtLVdswTrA/JHsqS6mO0QlSWGTS2RFU4Ir0BrWi3CxikC9MA+hoDcLe3eV2KmJp/q06xMaOURU9f7MWq+M8m6vtebx2ftzLNlpbXngR5OVMgtHRu0jWlZcuFMnDQlkki5Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729397996; c=relaxed/simple;
	bh=OYV0ggcr2+0/kvs5wz9yaD96vES5ppcnhPp0nu2ddXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeLhHCDwZ1FeoEdi+clroyCyaRarI7GP0QLxpWVc7DYmzw/cy3kPzLb+xQUH2LnWEbE2t7p+0UVuZpc4qLTen8MRhuioiKxyDsfdkPGHT/YGK2uC/a7BA8OREopPcr0TumQP6nSMs2fCjt8w7KlbU7P0md6CFf55oDU7m4zWL58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDxfQUBY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e592d7f6eso2180872b3a.3;
        Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729397994; x=1730002794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=GDxfQUBYtg2SJqXiAqpclt5Nq3ObMFSXM0hw2jK2qV0kjpRwuWZ1oImbBP8fofag88
         n63jnXUx6kOOukLInn+Ioy/VPyr4A1nIX0Xi4KWJ4Ixyz1xl7mgvHM9ggacFYrGNCByb
         MIgaR7R6BHAhD1+sZDOLb1+memv4KNT0Xa833VGUxQmAB+4g1tlaFH6uvCPRrtsUuPWh
         ij11drRwMmC87FmhY80MoDuhMJMOmF1yOooplZ5qnr6hgbCteuDyezbeePHxZ/QbFnJR
         HUeaoCv/2iYvjXSjuKZmJiqm4EdbnwVvdxc2kXyhY56hhGYApwBLMvQDd0/Kv2k9ENo/
         jOlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729397994; x=1730002794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvD5zxUD8sPwgrPuyc+CgRrn6Hv13waPalrojCn8pqI=;
        b=RUM6464LI7aZUd/YM3Iighg2YrcLv/4A2+ZeL25JUwpotlHiCVgUrTEiq6SXQwrDeu
         iUWEN2wbZKLLGI2fvn5Teq/41yZMUgagLxIhmLkBtAIwARtTOKkBj4pWCuIX9yNyniOP
         3KX3Mh1HNrNqWtAo0463876lTF1z3GTg6ebiAB19dsJrEkW5MOI7rtkN+KFizEFNF6WO
         zCPvHx7ZeUiOL3Q3PHZuuLEkzhsCIlCazb5xgWR3SGXdCvvi23p7RagiciDMZxJjsmXA
         dSfa9xeaY41R05ZDGPnvtV2Pmf5rigajTxSOmebElXockpMSJI+0oknpLpR71jeT4T+U
         Qbbg==
X-Forwarded-Encrypted: i=1; AJvYcCW1/O+kE8X2wLmws3z76aO+NuMR+ZaqjGppnrRp9tAZYCbTQOn/j87xT6pFz2E2LNIRJ3Qv5RzXyWVmFQ==@vger.kernel.org, AJvYcCWnyXqS5t8FLcc88znub0V2HyB+ksjuYHk4lSTnvodTNF0kxZcmEGi1nXCgBr73X1dGFaxLwq71l/XUAzRA@vger.kernel.org
X-Gm-Message-State: AOJu0YzxqBS8f6MAfbKouZ74lSuYP6VANpPwzdg2wk1YfyHXAoPqrZ9g
	/4SkVQU92at0SbpW6tKMZm3tehqHMiz3vBTxpZXi09ZGHp/ohQsC
X-Google-Smtp-Source: AGHT+IEaqtdBarckQ2MLamn5brMtFxndPeCUFri6Du9gBuXr8+fp6GAzR0kiZvvGZMIDLC3RejE/0Q==
X-Received: by 2002:a05:6a00:2789:b0:71d:f15e:d023 with SMTP id d2e1a72fcca58-71ea314d7damr9272975b3a.11.1729397994019;
        Sat, 19 Oct 2024 21:19:54 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eb2c0sm508744b3a.142.2024.10.19.21.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:19:53 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:19:51 -0700
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
Subject: Re: [PATCH 08/10] Input: i8042 - use cleanup facility for device_node
Message-ID: <ZxSE59Qc_Zp_Azb3@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-8-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:58PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
>  drivers/input/serio/i8042-sparcio.h | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/input/serio/i8042-sparcio.h b/drivers/input/serio/i8042-sparcio.h
> index c2fda54dc384..8f38b6f4ae77 100644
> --- a/drivers/input/serio/i8042-sparcio.h
> +++ b/drivers/input/serio/i8042-sparcio.h
> @@ -106,17 +106,13 @@ static struct platform_driver sparc_i8042_driver = {
>  
>  static bool i8042_is_mr_coffee(void)
>  {
> -	struct device_node *root;
> +	struct device_node *root __free(device_node) = of_find_node_by_path("/");
>  	const char *name;
>  	bool is_mr_coffee;

This temporary is no longer needed. I removed it and applied, thanks.

>  
> -	root = of_find_node_by_path("/");
> -
>  	name = of_get_property(root, "name", NULL);
>  	is_mr_coffee = name && !strcmp(name, "SUNW,JavaStation-1");
>  
> -	of_node_put(root);
> -
>  	return is_mr_coffee;
>  }
>  
> 
> -- 
> 2.43.0
> 

-- 
Dmitry

