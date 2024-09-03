Return-Path: <linux-input+bounces-6105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E16596A6A0
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 20:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25F351F258A4
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2024 18:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537C0191F62;
	Tue,  3 Sep 2024 18:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZP6SPzh"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22D819006A
	for <linux-input@vger.kernel.org>; Tue,  3 Sep 2024 18:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725388356; cv=none; b=gxEht3V4z57ByRvfEzk3HzwUlBhnemxYO3SxW3C9ajDuHVMoD6SdE1stUEsdcY2mhrKjOE54/sHoYNieF877oZfJGw6FCruQOBNF7RpVOdb3IitPFdA3DbMrPsvmU4kph6+85SU0JMYDuS93p/cgpUkCkcZx0O1ky3gFEFF4Em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725388356; c=relaxed/simple;
	bh=FbOmiZo3wVZDmrQrAo7tRyPSCoaJy/hpxvOgiiehzv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z59EC5KsmTjhjfLrMFT8IatjNqK/Ni0liyjP4miAJaJn417/8P2vjGVHFBVKiwFYwJXnDjnJ8GSZTq+ZzdRsjxTCTzDypyRuYYbW8/5Br64aFX+UzGyu+gVoFarOzgebwG9+aPxWco1bZbi8KtlcN855BUR+PG+0/wpya2cClug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZP6SPzh; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-205909afad3so17836345ad.2
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2024 11:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725388354; x=1725993154; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VM3nsWQHVO58s1QVjeZ2l3nK5QPSBx0X0ilicShucGY=;
        b=hZP6SPzhvM55saPzFW0iXn798ZhYzpQu7DLFHqRNZlYruvZJ/vhSNqXtH+6Uglcd12
         Xw5XBlJl9wQUCRAlHWb8KOl38swcVp+bzlE90ZZXUEyL9XYZkLj1Rybw3Kpal43HVk/J
         t5eB9XaICOtyqzlQJv+6VGBp65ZhsIhspP1uts7rb72lDhH9RoYpczg02DTG1NAPOgM2
         gTToLtecEvvMY3wAAnswxMSXsA7H3Jj5NsSUEqOGbXft679QIH6VNxQs2W56rFci8QXU
         9v4YqFtWJHxFtm9S20vILRQ7BkRJPOZAKbjQsEYDDdCjD/EJBFzSH57AVu8ryWOfDvrY
         RTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725388354; x=1725993154;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VM3nsWQHVO58s1QVjeZ2l3nK5QPSBx0X0ilicShucGY=;
        b=MiCBA73QPwevMx/d2hd883ACxQXSnTA2bKQkEG1jugqQL4lelIxhQ04IQj4VAsCnwX
         Wkddk5AXFgXVA0rzUDwxtOnI7V/6EuKzY7cqQjl99HYWZo9gD27G+rR9VjznKDV6Adrh
         ea/lOQUbXkIrSWi5n8LzX4sn/u2MlwZrnQ/6AH420gpT2f6J/GxtwKwG+05VdiedoUXh
         oa4ofWc4FX13MeHt6WuI23p/37qv+/7pdjPtSdiPhWD2FokGzJ8F/Q+JgVcKE8z7OKGd
         +iqJmhjylUaHF/wZb+guVc4XGEFro88dXOLdG07QyWP0otpgcHx7Pnu7C8lR/pP5fiNC
         yg7Q==
X-Gm-Message-State: AOJu0Yx7tDIByKTUK/pOeiauaQ8tLBCFAaytH/1SDK6Vblbzh+tk9z+E
	fK4nquqdeAFXfJQ94lr4F0hF/cdMlC5MCOzboA7v9kSObhFNHWDe
X-Google-Smtp-Source: AGHT+IG4oEY70NlZmeiv6gwAqz5igOkIZOXZBC4LZ9eV73GlHxr5lsKZ0VSl+mnlrVK7vuF+SkA+Jw==
X-Received: by 2002:a17:903:41cf:b0:205:489d:2b22 with SMTP id d9443c01a7336-205489d2dd3mr133358785ad.23.1725388353838;
        Tue, 03 Sep 2024 11:32:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:e682:e3dc:908:eef0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea5833bsm1465675ad.222.2024.09.03.11.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 11:32:33 -0700 (PDT)
Date: Tue, 3 Sep 2024 11:32:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Gerecke, Jason" <killertofu@gmail.com>
Cc: linux-input@vger.kernel.org,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Jiri Kosina <jikos@kernel.org>, Ping Cheng <pinglinux@gmail.com>,
	"Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
	Erin Skomra <skomra@gmail.com>,
	Joshua Dickens <Joshua@joshua-dickens.com>,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jason Gerecke <jason.gerecke@wacom.com>
Subject: Re: [RFC PATCH] HID: wacom: Stop mangling tool IDs
Message-ID: <ZtdWPgOiMGX6bKj4@google.com>
References: <20240903182633.870892-1-jason.gerecke@wacom.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903182633.870892-1-jason.gerecke@wacom.com>

On Tue, Sep 03, 2024 at 11:26:33AM -0700, Gerecke, Jason wrote:
> From: Jason Gerecke <jason.gerecke@wacom.com>
> 
> In ancient times, an off-by-one-nybble error resulted in the Wacom
> driver sending "mangled" tool IDs to userspace. This mangling behavior
> was later enshrined into a function so that devices using the then-new
> generic codepath could share the same broken behavior. The mangled IDs
> have not historically been a major problem for userspace since few
> applications care about the exact numeric value of the IDs. As long as
> the IDs were unique it didn't much matter. Some programs (cross-
> platform and remote-desktop applications in particular) /do/ rely on
> the IDs being correct, however.
> 
> This patch rids the driver of the mangling behavior.
> 
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> References: 493630b20389 ("Input: wacom - fix serial number handling on Cintiq 21UX2")
> References: 82527da319ee ("HID: wacom: Read and internally use corrected Intuos tool IDs")
> ---
> I'd like to get the opinion of the kernel maintainers on making a
> change like this at some point in the future. There are _very_ few
> userspace uses of these IDs (primarily: drivers, compositors, and
> tablet control panels) and my plan is to update those bits and then
> give some time for the changes to roll out to users before re-
> submitting this for real. I don't expect any kind of breakage since
> we'll be taking our time with the rollout and userspace needs to
> have handling for "unknown" IDs anyway (since Wacom periodically
> releases new pens).

I think if you take care of users of this data (it is Wacom-specific
anyway because ABS_MISC does not have a defined behavior) I'd be fine
changing the kernel.

Up to Jiri/Benjamin though.

Thanks.

-- 
Dmitry

