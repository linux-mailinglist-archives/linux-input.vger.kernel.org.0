Return-Path: <linux-input+bounces-10321-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7B8A43544
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 07:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A57B4171D24
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 06:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4B8625B68E;
	Tue, 25 Feb 2025 06:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IcLdfoF6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FF725B678;
	Tue, 25 Feb 2025 06:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740464986; cv=none; b=Muej5xEFdsVRmEMHWYPPcHk65kJc1NRuXQxGoDfFs4afdon0O7qfsJO3mF4YZ36YS0VBHmf4q4G/gwn2kSR3pWcK+7gu8GXf0L++1rDn37btRpginIpU2rTElSYkFftnTEaFapR3+7SlqtErgBuxDQ49iv2Cke/KjrsB1dYv5DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740464986; c=relaxed/simple;
	bh=yRYOKfULkV53oO8Rz0BODMQU3XKL2g/35WTPAX2HXUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kqs2RhYfZPm9Nnu0BvzBJhmUr0TDWeSTgsOifztXCT5FYMUFsumKqzp0lXWYmXRa1g8vNTVn/Ysa2zipkXfNolhRRccOeEvfliActeMuS/8HGOy9YSvA8tiIOd1Z8Srzd2orrhPdBm9dQrBzNswrbxNTlzUDWUU8s9G+8Kff92M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IcLdfoF6; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220c8f38febso110181185ad.2;
        Mon, 24 Feb 2025 22:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740464984; x=1741069784; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+f1hUvDkXZQBjtzK58ov0lklvW60dTX93rXfPj7emh4=;
        b=IcLdfoF6aeQ0wx7lPXNSivTYaWWTXCpc2Tbh/Oy/cLtORRKeKOV7xlST/W6xJGtxBH
         hht113EvAEGrsYdRPswyX+CKVcm9h/BV8DZCf/4D8t2G6rCfqIoLijZwb0aAPG6oFGhP
         h4m+S0ZO4H98IJNzheN0tOxe7byHxurjkVf9l//lFlyzaZ3ost3wgfdVCZckWxjFvC5q
         JTecEaojBDe1hEuq+Zgvbd7pRMONc8Ab1W14FFLBNtuhXKTnXMLH6og/71DrAs/E6N0A
         B66LKG0ZoR9N8+9a5i6ZNKE6a1DD69sSfOuNue8OBLjkZ1tQ6MORwf3UWfzfJbEW+GCS
         WHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740464984; x=1741069784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f1hUvDkXZQBjtzK58ov0lklvW60dTX93rXfPj7emh4=;
        b=EPxbjL0f3Mej2ViWotr2qppC0cQXrmDhM/g6mJkOjLufrW3koVFgj3hIiC+Xi5W4q8
         LPghhS7gwB6L/yksiZ45TigjWn5dfoX2xjF7e1XgOr/7pLYEkOtFU82BwD0UVYpwZZL6
         JpFNdzyQ8nOTntLPrItnsbk6a/3bvraOAa1lLnondVzI/U8V9qeM3fp+mjdEUbCVd3aO
         au+JNv8eaOGNY+F524YAFTjjxEXplE6UrVMDH0bpHpZ6GalYI5m6cRGiPQhgm95WPAXX
         b/otd4K9sZAzBRJyxTc0eeKjwKlh6MSU8TxbBnA7av6RMehsDwcVOTdLRem1YLEHjEw/
         NcTA==
X-Forwarded-Encrypted: i=1; AJvYcCUbIeyHlNqma24EeT7AbPM5J0B1Opa7hI/PDt1ftb1Kf5OcNnyJnBNXuHQev3AqfGTo50/gxoH4qBL0kYQ=@vger.kernel.org, AJvYcCV8P/tIXMJ1Vr8shEH1kzLNATzs/ckcSAHWs3ilXHOnbEWd7r1BCNieEyB2DPd4+OslMPj6x1g16TnU5Q==@vger.kernel.org, AJvYcCVVFlHBWnUgpGMGUWdp7RUoDOdGSXuEzDhzqb5B8Y02aD5vhcoDYMi8L38hShKazz7K7o2Gdtjthe+a+cpq@vger.kernel.org, AJvYcCXWgRGeDTl1F75fekIok+6JvY7M2kxXT14xexoV/JgSW7Rw6ABfufc0139w+cVZWqTs+g7y1MrV@vger.kernel.org
X-Gm-Message-State: AOJu0YxbmeF2xN7J1wZID0uBe+ZMErQh/rxykzc3/hjugL7MGmYAIfTz
	f/RRnu3hFE0I1O5ARcNSRPOIUuv5QE7SxQrnf1ri5Irv/Hwmk+mL
X-Gm-Gg: ASbGncuVqzJZovBVsVMNuWZgjSJj9nmdNG4b29AgqPiuTU/Dxogf9heUlMmkcJ06tG+
	U3L2SjzK+0GyksqQC7pyISgD6QwkBjbawyoz7gJ/kvwxG+p/8Grk8pmcFKptuJYlI6kNuPVVyH8
	yzzA+VXR/v7Ufsmlh5cIVoG0kQzw0KyqkWXSlavFo3VVavqidw0JgxzU2EGjke4UMrmzOpm+mwv
	5DkwnjX7E5/L1SUFtyC4m/RrvTwT4LCLYXhL2cDiub6sNqXeujTJNJtS59DZcBTroGEFfv9ILjY
	SEPeriaThIINPmDeMDwaz72VPQY=
X-Google-Smtp-Source: AGHT+IFXSieuGfl63NCGaegFak2YYGly32E4Gjw0/onV28txeg789Sb7vqek4p48AX/riu1hOGv1PA==
X-Received: by 2002:a17:902:e550:b0:216:282d:c67a with SMTP id d9443c01a7336-221a00156f6mr243620125ad.39.1740464984499;
        Mon, 24 Feb 2025 22:29:44 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:464c:6229:2280:227e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0aec2dsm6547595ad.221.2025.02.24.22.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:29:44 -0800 (PST)
Date: Mon, 24 Feb 2025 22:29:41 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bastien Nocera <hadess@hadess.net>, Hans de Goede <hdegoede@redhat.com>,
	Jeff LaBundy <jeff@labundy.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Charles Wang <charles.goodix@gmail.com>,
	Jens Reidel <adrian@travitia.xyz>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: goodix-berlin - fix vddio regulator references
Message-ID: <Z71jVeD10z_25sWr@google.com>
References: <20250103-goodix-berlin-fixes-v1-0-b014737b08b2@fairphone.com>
 <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103-goodix-berlin-fixes-v1-2-b014737b08b2@fairphone.com>

On Fri, Jan 03, 2025 at 10:21:36AM +0100, Luca Weiss wrote:
> As per dt-bindings the property is called vddio-supply, so use the
> correct name in the driver instead of iovdd. The datasheet also calls
> the supply 'VDDIO'.
> 
> Fixes: 44362279bdd4 ("Input: add core support for Goodix Berlin Touchscreen IC")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Applied, thank you.

-- 
Dmitry

