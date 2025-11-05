Return-Path: <linux-input+bounces-15896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD5C3845E
	for <lists+linux-input@lfdr.de>; Wed, 05 Nov 2025 23:59:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4816434FC9C
	for <lists+linux-input@lfdr.de>; Wed,  5 Nov 2025 22:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEE02E8B73;
	Wed,  5 Nov 2025 22:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aL0FbEEv"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267A225A320
	for <linux-input@vger.kernel.org>; Wed,  5 Nov 2025 22:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762383555; cv=none; b=G2mRKTHpi+mTJhHRMW6iOUwTAzu5jmKVGRaKv9Jw9Pw/e+KNsOE+qyMGxRGOxbI7R6uksnCKREF2KbDLwLloffZnUcZtZQliI8gql41fb7NbpNHTGhhChfE0m3vyV3Hj4DaA3QFp4r+ORqHCTECjea0rBidyUBW19sEaoEdpKZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762383555; c=relaxed/simple;
	bh=7o4gklFKgw28N/dVqpBVUUA3tE6+AIDPwGnxJE5MArU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVbA+98z3hMpC6SADeZ+l26dvS2PE5rnBmMyP/Ef7JdD0QsW1txT1t7GO5LBiYMdT1F8K0aKdvTiUMdleEHsKRuAEhe2j7exRh4R3aihLTUb3N1hApDjBPD+r/aIFr5ChyDTDsOXZPgsCMseakUQJ/cTI4kmg+diznhwNPIwSmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aL0FbEEv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-292fd52d527so3253265ad.2
        for <linux-input@vger.kernel.org>; Wed, 05 Nov 2025 14:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762383553; x=1762988353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HQiotgLAs4MrXnB3VRmkq1wlWPqo2nwCq+tDH85GcKw=;
        b=aL0FbEEvg4WU4iPT2FxSlQVbTV/pHIgWZnParEY8dWfG5HkCYkp6TOZHKJqHcgfGj+
         X7mwRQjCM7GHSUq2VKaknM5sUGNMZ1DhLi7KC/oNf3QfvVWu+ieFpNxAuVd/e2dlNg1s
         Gw+XhxRMSIYSdzHkFRbx3DLqfrvPagTpK+VEyNsPYsK92P58rJ5XbZAW5v+J0ig1Kfho
         xzO6YAs8RbPZP9IDDpxtnm0O27i/3oGvtE8b4L1cC7vio9ut2x2CZ8YfcpCblez/CR22
         K7lf0zOSf+j+lTsNLdy5Cd4djupvnlg7a+bjVe7fwBaV5laD3AuguXPbvuwwCVF1ut0A
         x2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762383553; x=1762988353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQiotgLAs4MrXnB3VRmkq1wlWPqo2nwCq+tDH85GcKw=;
        b=cLaR/h0KWaxu64/oiWAPy3/0QStBrW2UyOuqcDDqXUH+FHr80LYyd3i9ZUw5TC2Zdp
         wdjpohfOHrkq6tfZTGi6YrkIx+hVoUw8EV1DlCwrajCCUWZRLeXP4IbGNHGDCVybaVws
         J0rtG82GbZU9v/gau1CSyUCGfmdcT0tUEPwxxveHuOl8Uvmw4pTnQZq+iwtXzgNLl6Gx
         z0QpzxRBX7d11yP9dAu/x/Wi6+QzyBRBjjOBvobXhLvFO+jB7bHUj4S+sTjwlKLn+6Wf
         pwxt9L42DCF5ogRSHaMJh4wdHFw3J7MvSXy0IGBKhE4gFWEZxhleZzSsLcDejP29VrmI
         bsQA==
X-Forwarded-Encrypted: i=1; AJvYcCW2RZqqkVEvyej9nxkyy/mFwYr7i1w/1dMWQs2KJLaZAIe2WxUtmOMXIss8Yr6wd/ewEpsbODYoTE6iRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt59gMhDgUgtFPVZDz6DYleJV4+lkCyiZ4KwzbHBapII1kOVkH
	FiupQVwKtad8mt6zxDgv6Fw1/yNx9IYSq2LALZoVX6mc2JI2AAEZpgO+
X-Gm-Gg: ASbGnctIl34gfRK/ke8Cwg731PI4cSj8dULVTi2aoztrQ5gFPiX4pcPQLH0WhdV4Nvo
	3RWMY3/eOJVHysD/oE13CkFlStYKVnps4M0c7i2AZJDvkiy1w5ZPqUaKAbtSbiKfslzaYEhwH+k
	hkdoxFl9vg0OigQUB8u/sDi/jNfCJlVLUMQ/L43X+ovFbw5+79yoBt6eEIcza/hmbcG/GkTh3RU
	egJD2CFatTyf6AWl8KLBV/gSuKsE7zmyU4I3JkmeLiJCJfAh0kGMWcMYv+bgwgtf1eJq1KoWcNN
	N4hA/wGYqvM3qa+6Vk2+PlUunJhkMWdiKlbeZNkeKlLv2br1HEkvl56D8CLe0StBsUjBWr5+7Yo
	juSb6+wQVclztazmwG/w0iamPJD4SKISzR7qaZ1Hmpeh7IxzqtnXqrU2w1WYu/Zs7efgSoC4S2e
	F/U2XmzTCb5x+vrWzNu2xVQU8iUaOBc5BBQEn3jgqowA==
X-Google-Smtp-Source: AGHT+IFTIY5OSw2SJzl+Lc+/ugAeApcqWxgLSu0PU/TlO81MTYbE7Gh60ilrKYJ2KHuXdZUzvJKI9Q==
X-Received: by 2002:a17:903:1a8f:b0:295:b7a3:30e6 with SMTP id d9443c01a7336-2962ad1a9c0mr66312205ad.18.1762383553239;
        Wed, 05 Nov 2025 14:59:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:35dd:7def:e1d1:adfe])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c74264sm6056065ad.68.2025.11.05.14.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 14:59:12 -0800 (PST)
Date: Wed, 5 Nov 2025 14:59:09 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Input: Create input notifier chain in input.c
Message-ID: <h6nfc5amtqsfbka5n36i4hldcpomyped66xbvtaes3y6p3dctv@3j5iiyky6o44>
References: <20251030-lid-switch-notifier-v1-0-c58dc9b1439d@google.com>
 <20251030-lid-switch-notifier-v1-1-c58dc9b1439d@google.com>
 <a4zd7uzo3aigyrhturbpgtcsm2slmtqefivky2bfhqiupcc5aj@iorbkwz6ief4>
 <CAMCVhVP+LW27iLXttyFegRj_HMHheYrZtj4uuERLN0uqUjkR6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVP+LW27iLXttyFegRj_HMHheYrZtj4uuERLN0uqUjkR6Q@mail.gmail.com>

On Wed, Nov 05, 2025 at 04:40:29PM -0600, Jonathan Denose wrote:
> Hi Dmitry,
> 
> Thanks for your feedback.
> 
> On Wed, Nov 5, 2025 at 3:55 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Jonathan,
> >
> > On Thu, Oct 30, 2025 at 02:10:40PM +0000, Jonathan Denose wrote:
> > > To expose input events to other kernel modules, add a blocking notifier
> > > chain. Publish LID_SWITCH_OPEN/LID_SWITCH_CLOSE events through this
> > > notifier chain when input_handle_event detects events signaling the lid
> > > switch has opened or closed.
> > >
> > > Additionally, export a function which allows other kernel modules to
> > > register notifier_block structs against this notifier chain.
> > >
> > > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > > ---
> > >  drivers/input/input.c | 13 +++++++++++++
> > >  include/linux/input.h |  7 +++++++
> > >  2 files changed, 20 insertions(+)
> > >
> > > diff --git a/drivers/input/input.c b/drivers/input/input.c
> > > index a500e1e276c211d1146dbfea421a3402084007f8..b342b1ff138ccc58d4623edcf1152bd85d7054bf 100644
> > > --- a/drivers/input/input.c
> > > +++ b/drivers/input/input.c
> > > @@ -26,6 +26,7 @@
> > >  #include <linux/kstrtox.h>
> > >  #include <linux/mutex.h>
> > >  #include <linux/rcupdate.h>
> > > +#include <linux/notifier.h>
> > >  #include "input-compat.h"
> > >  #include "input-core-private.h"
> > >  #include "input-poller.h"
> > > @@ -62,6 +63,8 @@ static const unsigned int input_max_code[EV_CNT] = {
> > >       [EV_FF] = FF_MAX,
> > >  };
> > >
> > > +static struct blocking_notifier_head input_notifier_head;
> > > +
> > >  static inline int is_event_supported(unsigned int code,
> > >                                    unsigned long *bm, unsigned int max)
> > >  {
> > > @@ -367,10 +370,20 @@ void input_handle_event(struct input_dev *dev,
> > >               if (type != EV_SYN)
> > >                       add_input_randomness(type, code, value);
> > >
> > > +             if (type == EV_SW && code == SW_LID && !value)
> > > +                     blocking_notifier_call_chain(&input_notifier_head, value ?
> > > +                             LID_SWITCH_CLOSE : LID_SWITCH_OPEN, dev);
> >
> > I would prefer not having this directly in the input core but rather
> > have a lid handler that can then use notifier chain to forward the
> > events further.
> 
> Ok, that makes sense to me. In that case, do you have a recommendation
> for where the lid handler should go?
> 
> It looks like drivers/acpi/button.c initializes and handles the lid switch, so
> would it make sense for it to go there?

drivers/acpi/button.c is not the only source of SW_LID events (we also
have cros-ec-keyb.c and others), so I'd recommend putting it into
drivers/input, maybe as lid-notifier.c

> 
> > Also, here you are running in atomic context, so you need atomic
> > notifier, not blocking (or you need to involve a workqueue).
> 
> I'll use an atomic notifier in the next version.

Another option would be to schedule work and then use blocking notifier.

Thanks.

-- 
Dmitry

