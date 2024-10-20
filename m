Return-Path: <linux-input+bounces-7560-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDA49A5223
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 05:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BAE3B23B30
	for <lists+linux-input@lfdr.de>; Sun, 20 Oct 2024 03:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65AED440C;
	Sun, 20 Oct 2024 03:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9HCsbO6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF664431;
	Sun, 20 Oct 2024 03:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729396772; cv=none; b=CPw9SVARS0L/meoHbe4IBGTQssmfb7Gg8cilV0tHLqn1iyyGTbbDSkbeDa0OJZLtYdRHsLuP2z8jGrJB0Z0YnY/RhN21wsNXo3eoe8wYD9a7hKN9zdpgMpbvuAArFX8eb8lzSIXLK/YxMXvECPfreemPJc6CQAZXUUnRM0cvVIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729396772; c=relaxed/simple;
	bh=vN/xU3v9rI3HBZYkabBsSUu0cq0zQyoVLOimRycrs7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+/pYWhFDDqvSGLlAWY5hHpEbi/2dFfJ4gGKeEbA3OmV8BhVYqxi4hVRMczHSTkXITq5KUWQjeaAoigPQr4KX52ggTTa+aYkobM5P/wiLkVCuUeAE8ICkXvr1I13WXOPy7AGAeTbsymDSpAZI0hpy4KacclNfCH8W1cn/TZS5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9HCsbO6; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e4244fdc6so2382623b3a.0;
        Sat, 19 Oct 2024 20:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729396768; x=1730001568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=K9HCsbO6oiys09sdCDHTNMfqLF+k4DFaDDKZ74oLt4pI4qKA0zN0Ti57UnroEE6A2A
         lI/FUW7N20/NhclNnn/CCGXSmxjMzeQ2fJd5Voo9LIpCPFfwH0Oo3acSDwrtnkSHk5KH
         gHXDjsTTEAyf1GjGZCcE/WjvYZneuijbW4EmRiwZdPOXJlfPHfnFbyVfDa16aD0U1l9Q
         5PPo4f+14hFsFv925B3DZl5EwxH40l9agPitaLQc7ycMVQ+IJwhkbarm10CQLa7369AY
         fFqGEVFHhlYLBg2jMLsuHfFMpqJL3tfXwEiQGtKnsgDQfgpe8EFI19Y+grm13Lwvw/qp
         mQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729396768; x=1730001568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AoRk7upsfv9NWt7MBCmfOuNRDL4bBF9fcV9bVsrVk/0=;
        b=ojG1MH3Wg2ricktaNGTCkCsrPg0kHF9+VIBWWflsawHRcpikqw3F3HsH+INciUOw7n
         h9PvD/K/Pp6qaItR+BMyHvCgLnMYzejd15E07Y+hw3gqTjxALHEsL8JKUqcvjnzZmEWW
         Xi/ISBb0TNhMihYHHWT506j0fxOP+MEaWhQV4wyl9B0A89KeIyKnDOQApDrgM4YIzUl5
         sHZFbgcivQ6IwFqWb+LwP4hoiNewD01XwWrGK/oREGUb7+XnpBuM7LEmxcGvQaPxMK+c
         Bh1z2tfha2KE/uIkrX6+rHprYQhcSDxCYrDTily2YuyghSabUxj0vEl33l3BCikkV0MJ
         4yfw==
X-Forwarded-Encrypted: i=1; AJvYcCV8hOCoVChlKtJUylibF/NvO9c7Mfe5Mv+BZI53lX2rMcBm8cTNYMtUPqcjizntGvf53x7y954PaUU5ES2l@vger.kernel.org, AJvYcCVtjvftAnOMekWfjxIuklQAk3ZjNuqinceTZeJtbut1yqhakcAoZrnquAAcH6F7TMPZU/RbDssSYExx1g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRCI5Lyl77sflmiNggk//z0oLB44LWQK11ziRVBKOYHEuaXafI
	Ws88Ex93BFFzO2PwoxryLbw/F8/ixjY5NrGYGQFudW0xabeIpL1L
X-Google-Smtp-Source: AGHT+IEauN6DVG29XwxoUu8C/NrTja4DP2UcbOXGEqzr1/C/B8/WXeDTqF9qwFarcPA6JhNmwEv9Ag==
X-Received: by 2002:a05:6a00:9298:b0:71e:5de:ad6d with SMTP id d2e1a72fcca58-71ea323b91dmr10395281b3a.24.1729396768251;
        Sat, 19 Oct 2024 20:59:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1415bd5sm468654b3a.187.2024.10.19.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 20:59:27 -0700 (PDT)
Date: Sat, 19 Oct 2024 20:59:24 -0700
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
Subject: Re: [PATCH 01/10] Input: cap11xx - switch to
 for_each_child_of_node_scoped
Message-ID: <ZxSAHGCAg-cDMo5D@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-1-ebc62138fbf8@gmail.com>

On Thu, Oct 10, 2024 at 11:25:51PM +0200, Javier Carrasco wrote:
> Use the scoped variant of the macro to simplify the code and error
> handling. This makes the error handling more robust by ensuring that
> the child node is always freed.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

