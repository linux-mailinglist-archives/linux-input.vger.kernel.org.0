Return-Path: <linux-input+bounces-3840-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE78CF288
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 06:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 581301F21355
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2024 04:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1B2138E;
	Sun, 26 May 2024 04:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxhbv0fZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6C31849;
	Sun, 26 May 2024 04:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716697199; cv=none; b=dkl9lbQwcHlhIrDTDLDZ1YvqpGat1kHQJjlIKhvhYo1ZPal7WcIlBuL/6puS2i3d2lXy3Sb8UIM+nJU3RrMAmMcBsGLWsKLu+qTv5o7FR90oUXri1klD96gNHVHdJk9OA45xBMVWd5yHLlcEFc6pyeW4/qyhg2pu676YP+Bpk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716697199; c=relaxed/simple;
	bh=jm+RnBkEUCU1T3TiydBY5m+7pQquwNq6LA2+i1Asy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jev8UMkpo0Yi9xwqnzGr0yFcApLEh0ffB3hHeVRFjkERPKB4xAinhYEGf8r83QaClKDQriFrSIsoKngxV2SadjDhefQlceWF8LQd53z30eSllPTfe15bSzRkH5/IbxdJLMjwzQm7DFIV+cr1S0YZuTjwMf6V03UGhwV2xkLp9Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxhbv0fZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1f34b5f1964so22756605ad.2;
        Sat, 25 May 2024 21:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716697198; x=1717301998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObMiA0piVqbZSuowBjqA5ZXg6gBC5BwDJdOBOWLZ6M8=;
        b=jxhbv0fZ87Jm+gIBu0fpcbL3Z8Rpbx7nVtyWxqmm6XfFgxpH57xoCHXWXEM7znvCm7
         HGxBN3/tzu2nPJihLqvpoMwRFKzEu+c8c/jicPi0py4z0V8YBsL2A2L7nuD7HYsr2uPK
         8gfw69wMhe/hlFclus/Zg6gkkHmMZUq+PtFYnh9oGfT1fYJDjPRKXx6qCDsp/m8W/E5i
         dqsO+GxsH4cpYKVsa7dOPWnubto1jG9zG7MbJSP8gkSVZyELofxrWkvZz/J2y9HYBGi1
         BKyNONSZTIuB3XWQ1me5bt2RioG71Ff5HYbXUwagcxUX+HOqN4SYPwknfOz98o2cLo4S
         m50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716697198; x=1717301998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObMiA0piVqbZSuowBjqA5ZXg6gBC5BwDJdOBOWLZ6M8=;
        b=plO6VcXC/OTvzZhlnDdW3+yjNi6FfQQeg6Zwd6XKs8Aq64npk39SMwchrgmTTE2ODs
         h+qNG8F0Osjf/bbsy4lAy77rjjgra+pwRdNBWQTLvnc05qoIJpf5Im8EMw0Yi5m//gld
         hmUHv4BNjMjoxF3+9984qa4BGa8BgGvznGxxx3oqkD8J3Or01LRoP+eQHm8bHuZArhzE
         kuBMKQGe1F9Pgs9IcLiXb881Uc5ntMdTh25wa7cjIdd91p+dks4mqjNfTmYZQ0VrKNl3
         GuEgIzQ9wBjLUqputQ5Z7jMnz5PAQMWIRvmqlTlhzQt8txZbLF/872LYs0L6loyE6wZW
         xU2w==
X-Forwarded-Encrypted: i=1; AJvYcCVOd87mFSIEBSDiLSp2joCTszv6I7GOoWRP1I+URsG9D6+fPKRrintmWYeHj0gowIg0qG/xJgF1aeyoHUXHTwPkiJ84vixOX9RcSHok4nb7Ly6KawNohTZ3Z3VHLRrEeOWlt293EAbUaeb3LfzXZR1W
X-Gm-Message-State: AOJu0YyBYEXF/WNwvJa3ChIMHL3aePAuuBiFYGgYo+yVkX1g49n5f2AD
	QDxpGIoxLRH+n9YuQQB8Eejl79tXFGkp8Kl3yPZ4gTLKZ1Altk4w
X-Google-Smtp-Source: AGHT+IE05PCh22LKVQumkICBfL3oAMUQOJMdfZNPAk1GXRDHoo7qHLD/rKzFH8vEcHGhkasU8q8Tbw==
X-Received: by 2002:a17:902:cec8:b0:1f4:8738:6510 with SMTP id d9443c01a7336-1f4873868eemr10081665ad.44.1716697197783;
        Sat, 25 May 2024 21:19:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:ea6b:814c:973a:32f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9d2815sm37208975ad.287.2024.05.25.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 21:19:57 -0700 (PDT)
Date: Sat, 25 May 2024 21:19:54 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
Message-ID: <ZlK4ar5rnqW7F_4e@google.com>
References: <20240525193854.39130-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525193854.39130-1-hdegoede@redhat.com>

On Sat, May 25, 2024 at 09:38:52PM +0200, Hans de Goede wrote:
> Hi all,
> 
> The first patch in this series stops making the maximum number of supported
> fingers in silead_ts configurable, replacing this with simply hardcoding it
> to 10.
> 
> The main reason for doing so is to avoid the need to have a boiler-plate
> "silead,max-fingers=10" property in each silead touchscreen config.
> The second patch removes this boilerplate from all silead touchscreen
> configs in touchscreen_dmi.c .
> 
> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
> best to merge the 2 patches separately. As long as I know that patch 1/2
> is queued for merging for say 6.11 then I can merge patch 2/2 independently
> for the same cycle.

Why don't you merge both of them with my ack for the silead.c?

Thanks.

-- 
Dmitry

