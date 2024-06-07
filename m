Return-Path: <linux-input+bounces-4240-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C535900E7C
	for <lists+linux-input@lfdr.de>; Sat,  8 Jun 2024 01:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96F721C21F43
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 23:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15B2549628;
	Fri,  7 Jun 2024 23:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNxWOsin"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B867C11718;
	Fri,  7 Jun 2024 23:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717803346; cv=none; b=IEykWvkDPnYCZ9dW5BzN9kfPNMhFPCvHYOltRL44Nywr246zzdIXRWPpjJpJIm7rraF/DzK0BXwH7G8oAWIreOI/4V4iXhI0IfCA1LYjqm4mJe5T45bUcChNtQoiCqA5E3Jzv1vDrP4+2QmxGPGAyybxKZSS7jf2XaGc2gPR8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717803346; c=relaxed/simple;
	bh=VpZ1nUuYtXqO79dvGShzDHtoTd5ur0ZKutNZiTa8/qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pa3+QnsICaHum1YG3e2lYCNKULVdeFcYv7yaiWqWlwt3tu9EkfvE1wp9a15tKIGcbAaGpPogGxKSQCRVlMbeGcSDv837bBecIq0PoMHBwpcwNeGDQB8cDSkFv75JBqyCEnbxNj5mNqFtDyKafP1uZxAM3vCSMz2nf96yHrfibnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNxWOsin; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f658800344so21897225ad.0;
        Fri, 07 Jun 2024 16:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717803344; x=1718408144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HhsCE0tTOPtJooMevw8aLHygUUiFdfuHO9+TyTDYcy0=;
        b=BNxWOsinNuTtTxCGANPehzCWFI5kRTc9oAJzazYNyqR9H9gO9IgpE69Q89naFDMWtN
         TgoYce4P8k7qSOuYA6X5OYNG/sqvGcFg9IxombHlnmbHS68hx2v0dMGWsYKiP0jo4WRs
         tR2qfyb6BVHHREtEtUAb95EqBdDZ9lvg72zZXc1h6FPGL1PFZz/2/KmFc59LpaGJE7lR
         Byfd7vbzfRjboWoXo6bBE6UEDRaGlFnkDFGB/dgl3Dnb6r0JYQ9qYaCpqtpzAbaCjsxb
         iT5GcA3gCidciFMSzNfvhV0mF5xZ2yPplrabOfIZqzh5vhT/vMoF/7Dmf6+WPy+axcAN
         tX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717803344; x=1718408144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhsCE0tTOPtJooMevw8aLHygUUiFdfuHO9+TyTDYcy0=;
        b=VkVmXSdNuCVkSubs8p4BRe7HtskXb1lQiAGIqgIpfuj54p5jB6p+QwCYzhEg3x31zD
         69PgXqCay2xVjN4xyjytMq8croI9Q0wQQMFAZlyux9Lvv6Brxsn7xKw2NUfQgOsPhcb0
         I+rK5Hhn+wb9dfSNbxgiMBYU9s+uw6huhG0folwwZrpT/cNuBSou2kfY6uEjHveUYL/Z
         NuOR2CAIFLK85Axq4ZG4TG5gJlrd11ps7tbHw7Zn++3PFDGMJzGkt7hUjgCVn0Xi4SLG
         tCjkzJbnygDPzaBJxyTC98jdw3a4GH/OK6iFhAg7u2y3ePuyCaffLF3r9W+LRT3QpP3I
         812A==
X-Forwarded-Encrypted: i=1; AJvYcCUFG031HR+izkjRVfPuK3bOrsch5jwJqqmZ0J8RqTYEwpGAFb1nEMkzZN7V62bYPNM2jq0NUR+tff0bQaK16wG+wGN9GSPaWQpZGvft
X-Gm-Message-State: AOJu0Yyz6j2TVrbvLWsPIhpMPmvbGj/WmneqJ+2QQ6mxXNPG4Lg9wXed
	JvV7iPAy4Njkyh74HBI+rCV7Q5Rya1bdIHlejZOxQfmLBhJDdmH6LAuWqQ==
X-Google-Smtp-Source: AGHT+IHPrxyADyWL5g7AGoLWsZHb486elmUngy0vWyMD/0PGTQr6QdgXp6Hynb3DgJzF6+0dsm6/PA==
X-Received: by 2002:a17:902:e887:b0:1f6:a8d2:4ab3 with SMTP id d9443c01a7336-1f6d02dd157mr52949205ad.19.1717803343923;
        Fri, 07 Jun 2024 16:35:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b8e9:3447:a54a:310b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7f7ea0sm40190895ad.270.2024.06.07.16.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 16:35:43 -0700 (PDT)
Date: Fri, 7 Jun 2024 16:35:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: John Keeping <jkeeping@inmusicbrands.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: ili210x - fix ili251x_read_touch_data() return
 value
Message-ID: <ZmOZTLOzxslTH2F8@google.com>
References: <20240523085624.2295988-1-jkeeping@inmusicbrands.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523085624.2295988-1-jkeeping@inmusicbrands.com>

On Thu, May 23, 2024 at 09:56:24AM +0100, John Keeping wrote:
> The caller of this function treats all non-zero values as an error, so
> the return value of i2c_master_recv() cannot be returned directly.
> 
> This fixes touch reporting when there are more than 6 active touches.
> 
> Fixes: ef536abd3afd1 ("Input: ili210x - define and use chip operations structure")
> Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>

Applied, thank you.

-- 
Dmitry

