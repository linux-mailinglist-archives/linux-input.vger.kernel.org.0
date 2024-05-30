Return-Path: <linux-input+bounces-3968-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D038D46B3
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 10:08:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA68A1C20E3D
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 08:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7881459EF;
	Thu, 30 May 2024 08:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bgBZ8BNU"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DE9176AD2
	for <linux-input@vger.kernel.org>; Thu, 30 May 2024 08:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056487; cv=none; b=KByt5IRC09IZFqsQpoUh4fW4LLWiM/5NxyiVQeMktkXONqkwLaGPa1hBr4eLCcUk1pm8ugLyltTHewn5K/9EdurvedIR/FUvszkGEp26Y83pL7ORiNz6mvmVivFFZEbqOTR6R3txe1+A3LLselJjQaU4SXI9d1+rsa0j446XQkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056487; c=relaxed/simple;
	bh=BKFupsJftGMs6W6ZZIn49gRpZlGuTWZ9PfyykZzrqn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbHSxLw/mPOv3Qjut6WpXA41rl6LZKQotMrMke8Mo4CNuQHD7PmP2nNed+w6Ugzam/haf2QKHbDqIvmRV1m0Z9gJpC/ughhUse3zW/CQIdTmQVko8MtVdfC/2RSwmgMaXzjmzzvrxg70FPdyNZRx8Q2UvIAP7ZNdJJ6yt6yIN2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bgBZ8BNU; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfa4ad7f6dfso517024276.1
        for <linux-input@vger.kernel.org>; Thu, 30 May 2024 01:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717056485; x=1717661285; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ea398ookltKnMcZe9XrXhw80TYHn5RUehEf25oaXTj0=;
        b=bgBZ8BNUj0eDg8oL2AFWY9kHE4TP6RtHeJXgfzCvA1pJ4VnoiGiRJjIX8Nyeh7XbS0
         GNA0uGA483S2wfG30ERpev70wFm3r0E2ZSX5hfGZvaH1S0xNYzUvKSy98eKMSq+ObLhe
         OxgShayuHRDO4Zl0KI9RES8Ud+EYvwbzjSX2wacIPdprMJie3X0oO58O/WF9An4z1CeW
         yXT7otZkQrKIYozDupREMnF5OzhK7YKJx7ygWuZXnjY8Q8T2YHhD4wbLwZMMHYq0a2Z4
         lkQGmz12mkLsW+v+m/bAx/y+zs1SDbzJdxqaJSlqUN6C1EGb1iGewf8/U6NyBUkP6XoJ
         jdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056485; x=1717661285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ea398ookltKnMcZe9XrXhw80TYHn5RUehEf25oaXTj0=;
        b=BaAUpLmCPF158b7NUQlcDLval1n3dFikfA+QO9yWVh4TB19q+dr3zzxJSmis2lf7Gq
         wTrtLPlEL6WRY0rNt0zP4Sgif5ZJMJHZ2l92l/vOU50CPIsW9/wRP1D/7yMJb1Xu7Y9d
         OH3k6M4Wny2iN4ODjwZN7WvD1SvWgaGxzgPjiRZKLOJCnrzcgYmMqTn+hLFLfmMUJlEA
         6uVaNPlDOisBvrrcBoPdAdouHTb7VcW0MVR3vu8tfue8Rg+5NvcLCws2diRz3Y6xIz8a
         nv4ALSEC4IpoSv3VOkK3oJGqfrjOl3puA8AdCgntRlMDIbcIrX+PmF8yLHQdsXx25JQj
         NPqw==
X-Forwarded-Encrypted: i=1; AJvYcCWjly5isM4ADJzbVanGS2tH4nmHI2YHxo/s7BjPwEw9XUnC78scrbbUktWuI6GipF7hmIcDqKkN1rWJLlkn13lkD6ZsztgX7Fnte/g=
X-Gm-Message-State: AOJu0YyISsca+D9HouYJ8GZmFukMGonyfqvMV7Ei8aXXpB3eJR5YwhZ3
	Kchl8UOdbCZhBPX3djmYe1iLwT1ReV3ovCQvjlwnqzkP1heFDt3Q5Z85429g34AiYcLwQgFu26M
	vevpBcwfCAeDJTRzrVptUAOgDFtW7i3Chyvc9Lg==
X-Google-Smtp-Source: AGHT+IGz+ZsfJJB5VdBGOljgIkzRdHhgei+gaKgI65RBquJxbv4kncJ2bpBR1QliVBmCJF1PLzPJlIZVnBu5WHt6piI=
X-Received: by 2002:a25:ac92:0:b0:dca:c369:fac2 with SMTP id
 3f1490d57ef6-dfa5a5baeb4mr1629327276.3.1717056485217; Thu, 30 May 2024
 01:08:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com> <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
 <ZldMKZ1MzSDXOheJ@intel.com> <g34f3sdk22grheq2vaaonkl543dtk7nb5sffqgmkl5ywtj5skk@p5ht5ug33q4z>
 <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
In-Reply-To: <873b7a7b-139d-498e-89da-098cb3d7599d@amd.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 May 2024 11:07:53 +0300
Message-ID: <CAA8EJpqODpGX-RthQ8qu3oU80qXp8a-N1Chz-dcQXjKYoDfEgw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during initialization
To: "Limonciello, Mario" <mario.limonciello@amd.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	hughsient@gmail.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 May 2024 at 07:41, Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
>
> >> Also a direct acpi_lid_open() call seems a bit iffy. But I guess if
> >> someone needs this to work on non-ACPI system they get to figure out
> >> how to abstract it better. acpi_lid_open() does seem to return != 0
> >> when ACPI is not supported, so at least it would err on the side
> >> of enabling everything.
> >
> > Thanks. I was going to comment, but you got it first. I think a proper
> > implementation should check for SW_LID input device instead of simply
> > using acpi_lid_open(). This will handle the issue for other,
> > non-ACPI-based laptops.
> >
>
> Can you suggest how this would actually work?  AFAICT the only way to
> discover if input devices support SW_LID would be to iterate all the
> input devices in the kernel and look for whether ->swbit has SW_LID set.
>
> This then turns into a dependency problem of whether any myriad of
> drivers have started to report SW_LID.  It's also a state machine
> problem because other drivers can be unloaded at will.
>
> And then what do you if more than one sets SW_LID?

It might be easier to handle this in the input subsystem. For example
by using a refcount-like variable which handles all the LIDs and
counts if all of them are closed. Or if any of the LIDs is closed.

>
> IOW - a lot of complexity for a non-ACPI system.  Does such a problem
> exist in non-ACPI systems?

There are non-ACPI laptops. For example Chromebooks. Or Lenovo X13s,
Lenovo Yoga C630, Lenovo Flex5G, etc. We are expecting more to come in
the next few months. And I don't see why they won't have the same
problem.


-- 
With best wishes
Dmitry

