Return-Path: <linux-input+bounces-12004-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C66A9C806
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 13:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1F2746507D
	for <lists+linux-input@lfdr.de>; Fri, 25 Apr 2025 11:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F30A424466C;
	Fri, 25 Apr 2025 11:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ouzF2G+L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E65231A2D
	for <linux-input@vger.kernel.org>; Fri, 25 Apr 2025 11:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581488; cv=none; b=S+kTAcMFBLfQZ1VBmpuFPeGyto92HhNHzJ/VRREpPZ3JY7J7GZAb7gWBf+t1q/iDZc2nKt3hpdKC8x4/Ppv3o4UUrwIk2/RHWtatftzI+AFgUcZaFR+5+ODPUl4isOFcyAwYfQBYmxitnNA727gBu3Aw5uedZC8KsgOZV92QbtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581488; c=relaxed/simple;
	bh=gMa3ssEUpcVwgHPMOV8wk/GlL9ZwJKDD2E7AauYhnRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KrFYM1BHkd0A8eEOueeY0/4lFMMLiaAx5bc6BBd5oqZFfsS2H0zmaZq5qdjFkVQA279hvLjpi0O0wB67t3Sm4nuAeVBMcprdKuET/v/m34qoPAD86Sx7RJErD/pbXTO5as58JChPMACKEP2jqeqwrjsBUB7miQnvG5UOkUeMqrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ouzF2G+L; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-702599fa7c5so25339057b3.1
        for <linux-input@vger.kernel.org>; Fri, 25 Apr 2025 04:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745581486; x=1746186286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=esSq99zt7CxJ83pdRXGK5NP+KblKe1C6+QRELy9ZoFs=;
        b=ouzF2G+LZrCOZLC574/PEekAqN7gkXjoJYTRjN8N1B9uTUbKq6/et8vpsReI+/jtBH
         3Pg8a1bJ9+5KvzyLljCxWiVo0FKjNR7bPS3jnuCVHFSmNpKgmwO1cfu+LwbFwkuThP/K
         2zt05cZYwiYVAP5YNmvqDzUp5/WpwL6XkXYrgmqGM1O7j7G+MnJ7BNf/OPZXjkSEdg6q
         QzX54MImkhmCDZvPpdKuBHOCOMi7Fimc87FMAIQsQ2WM7GeH9xQyzhrp+AyXIl0/kYqN
         Rz2EYME+n6YQiyAi5RNxQXPl6/v3TtnHnhsaryOEoz5mtaphafYHf/Q0ySwJJNVgIFGA
         zUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745581486; x=1746186286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=esSq99zt7CxJ83pdRXGK5NP+KblKe1C6+QRELy9ZoFs=;
        b=mnyVqncP1aKuAv2SnVZmkFHeWR5IvHzTGbHzWsegznFS4ahpPRFiEwcwNpfeT8m3lN
         H8sDT2Zy11YhNDkIUme2Bqnph4kdKAb8UzTs9y6qXc1Z5kqCKDn9iO1R9hgeNmNFrY+H
         NNP742HxiRDGI8btM8gwG8OD6eZgep4jjMFQ3VH9lYNv+sUeC72WJJ9FlGwyFfHzghEJ
         734p0Tnmo0ec2xe0NV+s2f0iS518OJOzPq+l2Hjhg7UTMqhqjNL3vObPrwEf9YDhQFHS
         qFXuHsjujKDJPLCOgJwKcQ3U77asle4DDcj4eLCsehCn5YZB8iqFdBPL8LpKGXqZBTFj
         26CA==
X-Gm-Message-State: AOJu0Yz0L5TPl3BF7QpbBONJNCUcMnAReiRt/WFSq1etOCE5KYaNuc9f
	Amq8E0K6S5SZr5nWCV6gCXcxCR0++hj0fAHTrryNzcR2Nzg6gX8biQHf2yoTEjftrsMMZoPbnIh
	B99oCnZ1wupef4uOTtUADKITSL/LcN/oqxwVIJA==
X-Gm-Gg: ASbGncutSldQLgqV97cek2wN+K9B5Emch8FS9FcWDfyjkJ2v1QM6kie2AwAICenQ/s7
	lhZ92uZ5PnCVGd/+pHWnS68eZt6iD7LhU+QqPH3YWEfKrobWuEAFGzPOSLvMpETiDW/z7PIr8zW
	IIhbHtFA0eBPC1hnScse22eFLkxU7GtAj4dA==
X-Google-Smtp-Source: AGHT+IEL3N0R1jVxvkTRj2zeMmdPph9d/Vt7V+IZqwZArjRPQ0F6K/RnSoN7cuZ54z2colfHGXbhgejnQ88r07obhQM=
X-Received: by 2002:a05:690c:3403:b0:703:b200:9f08 with SMTP id
 00721157ae682-708543aff69mr21890897b3.4.1745581486092; Fri, 25 Apr 2025
 04:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306115021.797426-1-ulf.hansson@linaro.org>
 <Z8_Fgx4YWwdpB1XK@google.com> <CAPDyKFqp0874O500j1StQgVyr_fQud6eJTqzQW_GqEj49Yt6bA@mail.gmail.com>
In-Reply-To: <CAPDyKFqp0874O500j1StQgVyr_fQud6eJTqzQW_GqEj49Yt6bA@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 13:44:10 +0200
X-Gm-Features: ATxdqUG1CWJrrgR6i9i4qMve8TXVlsm2c5EfOVYPWVNwMDvFx09cSzSOZOTI9wQ
Message-ID: <CAPDyKFq7Es8rP9JGjLQ=70=OX3vWtt=69kcf6kQsDSvZOnr1tw@mail.gmail.com>
Subject: Re: [PATCH] Input: hisi_powerkey: Enable system-wakeup for s2idle
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Mar 2025 at 17:37, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 11 Mar 2025 at 06:09, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Ulf,
> >
> > On Thu, Mar 06, 2025 at 12:50:21PM +0100, Ulf Hansson wrote:
> > > To wake up the system from s2idle when pressing the power-button, let's
> > > convert from using pm_wakeup_event() to pm_wakeup_dev_event(), as it allows
> > > us to specify the "hard" in-parameter, which needs to be set for s2idle.
> >
> > I was looking at pm_wakeup_event() and pm_wakeup_dev_event() and I am
> > afraid I do not understand the distinction. Why would we want to
> > abort suspend by only by some wakeup sources and not by others? And why
> > does a driver need to know whether a system uses s2idle or some other
> > implementation of low power state?
>
> Good question!
>
> In regards to waking up. The CPU that wakes up from suspend-to-idle
> may actually decide to just go back to idle, without doing a full
> system resume - unless there is a wakeup that requires the system to
> resume.
>
> In suspend-to-ram a wakeup will always trigger a full system resume.
>
> In most cases a driver doesn't really need to distinguish between
> these cases, yet the wakeup APIs are designed to allow it. That's the
> reason why pm_system_wakeup() needs to be called (controlled by "hard"
> in-parameter to pm_wakeup_dev_event()).
>
> >
> > FWIW we have Chromebooks that use S0ix and Chromebooks that use S3 as
> > well as ARM Chromebooks and I do not think they use
> > pm_wakeup_dev_event() variant.
> >
> > I'm cc-ing Rafael to give us some guidance.
>
> Good, let's see if there is something I failed to explain.
>
> >
> > >
> > > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/input/misc/hisi_powerkey.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/misc/hisi_powerkey.c b/drivers/input/misc/hisi_powerkey.c
> > > index d3c293a95d32..d315017324d9 100644
> > > --- a/drivers/input/misc/hisi_powerkey.c
> > > +++ b/drivers/input/misc/hisi_powerkey.c
> > > @@ -30,7 +30,7 @@ static irqreturn_t hi65xx_power_press_isr(int irq, void *q)
> > >  {
> > >       struct input_dev *input = q;
> > >
> > > -     pm_wakeup_event(input->dev.parent, MAX_HELD_TIME);
> > > +     pm_wakeup_dev_event(input->dev.parent, MAX_HELD_TIME, true);
> > >       input_report_key(input, KEY_POWER, 1);
> > >       input_sync(input);
> > >
> > > --
> > > 2.43.0
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
>
> Kind regards
> Uffe

Dmitry, is there anything else I can do to make you queue this one?

S2idle is currently broken for Hikey and - it's rather annoying.

Kind regards
Uffe

