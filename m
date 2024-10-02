Return-Path: <linux-input+bounces-7003-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7841798D0AB
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 12:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310D6283922
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2024 10:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0F01C1ADB;
	Wed,  2 Oct 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zp5Ntbo6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322C7194A67;
	Wed,  2 Oct 2024 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863275; cv=none; b=FuhrzB08KIqMsbpjjOQ7hm+6cRisNX0ATeUQs3TQGx+dBI9r8nAXvF5VmXrdVFv1AH3lowedOQ9Zu3hXDKzkuirbOloHHhXs4GXxw9Klu8AuuLf11v6wzs4giV4SqRl6L1rLkKJdBunyErIe+A9w01whv0OZeyoyZf4OgXE7Krc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863275; c=relaxed/simple;
	bh=MLr1JRAGzF98eS5MD9R/Nc8BcZNzc8wBtqKLH/3u/Aw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=s2tazoM2tH4ewWtNoDWi+cOqSIgVYDPou6TTEYcNtAwJylQdaVVwZ23CRc4sfA+0YGFREKKOCYtQTbQwZpjfqAPkL5+PC9o8Fh1DYUpMOxvDrJSIJPqQnB6wbDzzwTNIMCMx+DFFAsWmA4E6DHyF4x3rRa8qNe86h1Hz6/kO3V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zp5Ntbo6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727863274; x=1759399274;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=MLr1JRAGzF98eS5MD9R/Nc8BcZNzc8wBtqKLH/3u/Aw=;
  b=Zp5Ntbo6U7e0Xw32CE20XMS2Xuo2v7npda9K0yFYDP2VE+4B9Z0qjYCu
   T5Uu07nz1b30tNQqaR7fcEal5iSkMyb+qsFdm3fNL1r5aivXE6m9EZIgm
   T7iU9/wH4fPrEnKmfRmUXsCZkqjGL6sG9wYS/huUm8riPqOAdw1TJ30uw
   hsCiZx1Cl6cOeXzHmlSE4E0ugX1/qWraaYsml7Tb6y16cPXtq8B/eRigP
   /uAEu0dlS8NH8KUqw25Q7e5dOxE9R+TGCR/6BVKC3ebokrS//JemEo7dq
   x3gp5AYGwoFN2m6kX/qlPuj7oMT7hEKMliJ/4hEifpMXXfPdPWP1A1DjJ
   A==;
X-CSE-ConnectionGUID: FDKuquE3T22jmbdEUyrEHQ==
X-CSE-MsgGUID: 4q/4K+CfTpuXqdVuhdUSyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49542846"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="49542846"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:01:14 -0700
X-CSE-ConnectionGUID: +O3JIXVRRnmfejHgnMvfGQ==
X-CSE-MsgGUID: ppdFVU2oQjKi4BotMF3YGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; 
   d="scan'208";a="74190312"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.31])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 03:01:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 2 Oct 2024 13:01:05 +0300 (EEST)
To: Pavel Machek <pavel@ucw.cz>
cc: Werner Sembach <wse@tuxedocomputers.com>, 
    Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, 
    lee@kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, 
    miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
    cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
In-Reply-To: <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
Message-ID: <c2694d50-db7c-84ee-288a-06802e10ca8d@linux.intel.com>
References: <20241001180658.76396-1-wse@tuxedocomputers.com> <20241001180658.76396-2-wse@tuxedocomputers.com> <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com> <Zv0YlxQOFVGRS/DB@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Oct 2024, Pavel Machek wrote:

> Hi!
> 
> > > +static struct wmi_driver tuxedo_nb04_wmi_ab_driver = {
> > > +	.driver = {
> > > +		.name = "tuxedo_nb04_wmi_ab",
> > > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > > +	},
> > > +	.id_table = tuxedo_nb04_wmi_ab_device_ids,
> > > +	.probe = probe,
> > > +	.remove = remove,
> > > +	.no_singleton = true,
> > > +};
> > > +
> > > +// We don't know if the WMI API is stable and how unique the GUID is for this ODM. To be on the safe
> > > +// side we therefore only run this driver on tested devices defined by this list.
> > 
> > Please limit comment length to 80 chars and since you need multiple lines 
> > here anyway, use the usual /* */ multiline comment formatting.
> 
> This driver needs to be split into generic part + hw specific part,
> and reasonable kernel/user API needs to be defined for the generic
> part. It is really too soon to tweak comment lengths.

Coding style is not something you add on top of everything after 
everything else is done. It's much better to start with that right from 
the beginning.

-- 
 i.


