Return-Path: <linux-input+bounces-3545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E25D58BE1BF
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:13:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FB781C22103
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 12:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2340F156F31;
	Tue,  7 May 2024 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrVqMLav"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F9152526;
	Tue,  7 May 2024 12:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715083981; cv=none; b=W3e5UESQhtQWg5djmH62EbQ2hJCNJ1z1OhToPYftvfRq31ESTKoblaZqwFUR8igpSL5/5zHcYIhYyaog6vl/Tu+OyyelajoKlbuW9jPdoVgH35AjFkEihDOSlaLPlq4jE6Lwx69p5DRJWANom8qw5ml5YypWJb4Lsc5ruY6zyfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715083981; c=relaxed/simple;
	bh=bvIDTSm84sUMH/mDqBMl+V8D6rNNSPoNQe6YfHJTyiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYR8qC0DacfOOR97UQF5xwPWqf95vD3427VvUj49q3AZQzoMGLOZBay5sAI1oSGHVKAdO7wnR/QP0c43rqyxcl8yaLvUUoG9YLVtYbQ1gpB2HemHwpMnCB8oVKtI5lJrHqHgAB+nNx2+mqx2uk+kvlfdEd6HjiG8EqwGmEO885E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrVqMLav; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ec41d82b8bso28175895ad.2;
        Tue, 07 May 2024 05:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715083979; x=1715688779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v57BawXs8F+27yVslLr4FsvfGmQpyJcAoi+psUsS6lg=;
        b=LrVqMLavUdpV4GSIT1PRJ4a/2Y3OZCyAqBOzMJ8palJko1o70GgNhXFo2cfKM160mU
         7u3Do2n5sxh62V/Q5eUGRXIj5e/MyBb5Yu6bUEFn0zytTM026IoXb9rXwy1aDhoQNAG2
         nKL6pWmnnMFQ9rQ9yC5QbH2a1XrBtXnKuZ7Aa5z7kMna2/YiNE5HafD+vLyI31DlNJ+X
         6cvMoMa6KCZZG+XKT+XB2ZCDiAGnPaF9k58NZaDm62sbvEv5jjG/loAjhpmlWltwJd3B
         XViWdeGbz6czM4qkh4i9wHofvfTKW7QHpTBxtsh7NKmZ/FFSFx3bonWRkOoOnIvR0m0Y
         +tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715083979; x=1715688779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v57BawXs8F+27yVslLr4FsvfGmQpyJcAoi+psUsS6lg=;
        b=b3VEgP4/LqiPWF0hA6pDHZgp2t+f9HnoiuCiN9Tx5q8GY5LrfABpRrE1oEMXmQG/d/
         0lFuBdrNkByve6tIJhr5075WFBBkGc5BwjxWpB3d7GG7/jCBSUJVTwnNBxcUT/C2+gUv
         uT4HY3llDyVhmcx1YuVjF6M28dGQe7TajLIDLfY50kEiPvO3d8KXp0wFG6M3nj0ZtecC
         +Bgiba9oJyRfIC/pA4fYSWzwIKO2c4qyPNNFt0dvA5HzdporeNH6Xlu1obhNfWH1MI8m
         Fj+XzopNvi0zoyV3iPRIvkPm78cri34c9GsyNCZpJbDUlfCOzAjoUDIDhOKyJT4LY29D
         Gg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKwHiaeOWGn3mpYjNhoPWi2ZdaPs944wxNMV5z+waJymblxkLYJgSvBe3rF7tP/gfXQbjbf5gpg823ZIbBc8kL1t3YG/tRpQdSQ47e
X-Gm-Message-State: AOJu0Yy8362/GNueTpBhQ6jf4LJ65jLwXmkhwJ+UNSxM1Ka9qNLc38SZ
	78nsCxGZN5mwJR24rs0MNdpeohOHshZyxEJC6UCiTpNzIXaHAFYB
X-Google-Smtp-Source: AGHT+IEoA2U/HIe8xC0UjxqiGFVipp7RQ4PFkOo3k5FlAonbqOAzOOA6vvzVePmh9eEeCnj4umyrTQ==
X-Received: by 2002:a17:903:2450:b0:1e5:10e5:b66e with SMTP id l16-20020a170903245000b001e510e5b66emr16833655pls.27.1715083979078;
        Tue, 07 May 2024 05:12:59 -0700 (PDT)
Received: from mb-board ([120.237.109.178])
        by smtp.gmail.com with ESMTPSA id ix2-20020a170902f80200b001dde004b31bsm9923084plb.166.2024.05.07.05.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 05:12:58 -0700 (PDT)
Date: Tue, 7 May 2024 20:12:49 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, hadess@hadess.net,
	dmitry.torokhov@gmail.com, Richard Hughes <hughsient@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjoaweS-czzySzPh@mb-board>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>

Hi,

On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:
> > [1] https://github.com/goodix/fwupdate_for_berlin_linux
> 
> Hmm, that tool seems to have some licensing issues there is an Apache License v2.0
> LICENSE file, but the header of fwupdate.c claims it is confidential ...

Thanks for pointing that out. The confidential claims has been removed from fwupdate.c
in the latest commits.

Thanks,

Charles


