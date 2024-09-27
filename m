Return-Path: <linux-input+bounces-6797-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF61987FBB
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 09:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 726311F24857
	for <lists+linux-input@lfdr.de>; Fri, 27 Sep 2024 07:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E39A189528;
	Fri, 27 Sep 2024 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Z1pAR0Mf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62317C98E;
	Fri, 27 Sep 2024 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727423338; cv=none; b=FGf2vD6tDtB8RfffTGXUVPIG+vA/grslZXKcsjjWHNvBRtn+5R1/FcRv/cas+1h5qKZpl/Nb+ENbf3L23uGKkanlWtYwFvx20JKLO6tPoEhdMjP8MEj6Yt2h38WMvDnHoGY0kPDJ9DVacuf7KhOXJnaWgzcMQmWxsb76+UrGZUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727423338; c=relaxed/simple;
	bh=uSBYZZC6JlBumJiMVawfTROQsH4EB117xXamFISwXPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=V5t2tXDI6oM7zHuev+RhkyIwlnTHAen+j/INGQj4kRC/98oaFMTrQ7hbrLg5DPa/cbsqBlWe5xtQA1kiXkHhAHrcZR1MjMEdBfIMsTria9Y0qk5zLLz6WbRdURTPTFN4mRfzKtoR0A191z3jLqQSQhUese0RPaR8cUckjaLPWeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Z1pAR0Mf; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=r3VXkLqqaHWYRT95kF//XcQ9Hrfaa0RT4MJ7J4BbU9A=;
  b=Z1pAR0MfmyYhEgwOyogDmtwmb7nsQbJXmmt87X5IkfR14hmOZ0naJizw
   tnfN/C7gu0WrEZmAr4aAxCPNHN6iq54iPXNyoccKktwqFCfwZmxUtO2ZH
   KNHiAl+JlNXhwffJQs+sxDdwQAkh4YG3pXOIb3c7NNt/KnDs3e5KRZL6f
   w=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,158,1725314400"; 
   d="scan'208";a="185442369"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 09:48:48 +0200
Date: Fri, 27 Sep 2024 09:48:47 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Luke Jones <luke@ljones.dev>
cc: Markus Elfring <Markus.Elfring@web.de>, 
    platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Jiri Kosina <jikos@kernel.org>, Mario Limonciello <superm1@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [v4 3/9] platform/x86: asus-armoury: move existing tunings to
 asus-armoury module
In-Reply-To: <5951153c-3262-43d0-928a-14a399452d51@app.fastmail.com>
Message-ID: <61e3f4e3-236a-5960-8fcd-93475afd4b87@inria.fr>
References: <20240926092952.1284435-4-luke@ljones.dev> <08320b8e-a71b-4055-9fdf-1df76530ec1a@web.de> <f3b059cd-0045-435e-9bb9-467bb9cb0cc1@app.fastmail.com> <22c231f2-c28e-4083-8e62-590a8c2d8844@web.de> <03cfc83f-6f19-436f-9896-78fd6b8cd8f7@app.fastmail.com>
 <2ace33f8-5596-4b4b-9ab9-e7c0fffa990b@web.de> <5951153c-3262-43d0-928a-14a399452d51@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1274801818-1727423327=:3591"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1274801818-1727423327=:3591
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 27 Sep 2024, Luke Jones wrote:

> On Fri, 27 Sep 2024, at 7:24 PM, Markus Elfring wrote:
> >>> How much would you like to care for standard compliance concerns
> >>> together with your software developments?
> >>
> >> I only ask about because it seems to deviate from everything else I've viewed. For example the older `asus-wmi.h` has:
> >>
> >> #ifndef _ASUS_WMI_H_
> >> #define _ASUS_WMI_H_
> >
> > Such a naming approach is “popular”, isn't it?
> >
> >
> >> and every other header in the drivers/platform/x86 dir is similar. If what I'm supposed to is omit the leading `_` then sure I'll do it, it's not of any consequence to me.
> >
> > I dare to propose possibilities to take safer identifier selections
> > better into account.
> > I hope that we can benefit more from corresponding collateral evolution.
>
> My sincerest apologies if I missed something in my tone when trying to convey might thoughts - for some things I am still learning in regards to C (I am mostly rust) and the difference was a curious thing to me.
>
> The code is now updated to match your suggestion.

Markus is not an authority on Linux kernel codeing style, rather a
collector of random suggestions about C code that he would like to impose
on the Linux kernel.  So if you consider that his suggestion is not
appropriate in a Linux kernel context, please disregard it.

julia

>
> > Regards,
> > Markus
>
>
--8323329-1274801818-1727423327=:3591--

