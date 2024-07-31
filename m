Return-Path: <linux-input+bounces-5256-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E39094368A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 21:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FDE61C21B7A
	for <lists+linux-input@lfdr.de>; Wed, 31 Jul 2024 19:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125A54879B;
	Wed, 31 Jul 2024 19:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bXPHct8W"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921483AC2B;
	Wed, 31 Jul 2024 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722454636; cv=none; b=FUN9Gxe82YRqnbXjz7DZqFqFJRjvRoiYT0R4atu550D0Vvo1OJ/fCKwfft1O4v1Jab71SjIdkSjZS63/XX2vbrSOFPhGt8eQa3ARTWl0Zv8b9k+YmOcIW2mKHD0rFsy0k2tWwTnkbPAGKIVnn/bC9Z2QGpqvqXb2ClWF0UyUX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722454636; c=relaxed/simple;
	bh=8sQV8hQZlJcBrfuhPlpF/4AyA4M3+E20KMn/oRn5rnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2YExh4z0FMeeb8GdzLPWF3KzNpMFC+BozKYMMB3XWYYD0vg9mCN2dQqJcnRJPnmuerFiJL0wvLxTvWfHf99tZ1/7XnrnS3v5hFttNxkY/bnx8txoUQCjfBkbdKI717sGmeR5qaoa4fhsRkgWUdvzACEiNTw1Gz+YGkNcIT2YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bXPHct8W; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d2ae44790so4361314b3a.2;
        Wed, 31 Jul 2024 12:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722454634; x=1723059434; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ig46mG1vCNzw0Uopgd/HaUZWxx4bHwU4G8lr9HaEMgg=;
        b=bXPHct8WLGMQ/a0i49ZajIg1HlD/qQghGv425y3a9+ubxMHoTSZnMsQgZkYvYZM0v6
         KJds/PrOtnCK7qEmwFw4UY8m9rQpGVMvZdhjezJ6kuvlxO0LA7pItG60y3xUUiXkcdro
         vnQPGpJ7ROkq4rZXmTe/e69hFH3D6eE0N+9tj2yHkIAdbRHgGmbLehdxZ3NZKxNDSkoo
         LyuP8vS9omlfLL45EbC/xvF7wMbUJ+DxQhiXmIGnFEnGR1lrEXiXVMDaf0FCwgPrOmej
         76b7rTXyIZPzDqb8jGEbLI97OryTO7zIBRjOwy08Trh1+quFD+Q3r1ErJSilqi6FIxKc
         Guog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722454634; x=1723059434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ig46mG1vCNzw0Uopgd/HaUZWxx4bHwU4G8lr9HaEMgg=;
        b=XP9iaOdp09VRY8B7yCtDPKwfqgoHYWWXQsC6IqJCDOcVbVtHcRAbHDC2eRT2PSUw3u
         gEyLWsIOv45KaycbmssnDdnW39wvel2ahReymfJ982ekhm97gBMlhuYfrfYhb0D/jupZ
         1s3GiO/2U53VESOj3QGU11nRmUhKKPW+d39ktkhxXrkK/zj8FefcQLWAewJsuCsS14iH
         NX+0qy5QQ+s6GmHXiYGRuA3YIfzOnV4PJOHbz9XpITwPwUOC9wp8ejvmr494day8AXX0
         M1OnZYCdm/H39+G+Gz/74hPDhvohcMex/GHGRMXkvFiqI+OOuY+OEZCrvXTJsT/06jMW
         Em9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNADy/bKvfrnA5tAdZfLrvacXGJ1r49SiCixnqe63NtYMZ4OC6KN1MU0JuGCTqxlOQXitNxxjsPEoqZQsiwQHhxzNT/HvKegd1JIzH
X-Gm-Message-State: AOJu0YzN7CpcsBVe5rY07zjIvjS1fqMX4nKTbw7p/7eVIZt4/gzxtzaw
	fDjm4Q6xTNhLWczAnYopxotNGUe6H36am0Aj/k3b+T74UkTq6uKk
X-Google-Smtp-Source: AGHT+IFGDwKffMcpar/FeabXR8gZELHNi2qNyhGyCnh8A5/E3bcawMFEDWsYDUEX8ldycRd81qZHJQ==
X-Received: by 2002:a05:6a00:39a5:b0:70d:26f3:e5c5 with SMTP id d2e1a72fcca58-7105d72d3a5mr367786b3a.17.1722454633736;
        Wed, 31 Jul 2024 12:37:13 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e0ff0sm10324933b3a.35.2024.07.31.12.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 12:37:13 -0700 (PDT)
Date: Wed, 31 Jul 2024 12:37:11 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] input: tc3589x: Use of_property_present()
Message-ID: <ZqqSZ3ZBwnO21VKH@google.com>
References: <20240731191312.1710417-14-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731191312.1710417-14-robh@kernel.org>

On Wed, Jul 31, 2024 at 01:12:52PM -0600, Rob Herring (Arm) wrote:
> Use of_property_present() to test for property presence rather than
> of_get_property(). This is part of a larger effort to remove callers
> of of_get_property() and similar functions. of_get_property() leaks
> the DT property data pointer which is a problem for dynamically
> allocated nodes which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

