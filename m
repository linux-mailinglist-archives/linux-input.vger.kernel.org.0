Return-Path: <linux-input+bounces-7087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89F9906B4
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 16:51:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2516EB26734
	for <lists+linux-input@lfdr.de>; Fri,  4 Oct 2024 14:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9287521D2D8;
	Fri,  4 Oct 2024 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RBhXcd1A"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA421D2CD;
	Fri,  4 Oct 2024 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728053223; cv=none; b=Bjtxrc8Aw2nNBtdC/Iq7hDd5QU1Cqd46pp6B4qyZ2oVeupoB/AeGj0nCw0gu3DR4Xe8iuQff7ng7W4pR7IaAUWPICihGppd+GUNTpc3vK0MHKBdRUmEs6S0dV+0S9AObO1c7IhXtuWeRaYz8F5unrRk8yABxmlIEIUkLC52HBdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728053223; c=relaxed/simple;
	bh=gpDESdIH7u+B964YQBozH7uDbFJdt+fik9h9olFCT6A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kPg+8BC2TKT9tNhmxaoxEnJWatbKnWwdLYWnyjQ/WQyAV4REGhFHUerMVPJZhutyha0bo54gNwIBkdZJkXKYX5I62zekud+iMRZqlnJlDehTsfgOdwk4GIg4AcDtKmOYs+cfPtFyWZV7OT5ObLNgd0DYKCezTj5AZTnPlp5hYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RBhXcd1A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728053220; x=1759589220;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=gpDESdIH7u+B964YQBozH7uDbFJdt+fik9h9olFCT6A=;
  b=RBhXcd1AbS6A3HLUoc9KL+DoaEztpIybxq5fmNqPOksTFQYsRTtN2AcE
   fbeNsn2UB8gcD4V+lVS82eChr0NPt+AkLVleA7e5Zqiojdr+MVCC0fRY2
   aV66Pbxy1b0ff5MUP2w/w0hNcYantt/6aPFeJIK2NBP8bxrE6vhTNF8Ie
   dz5xN7C0IsuTorQFPXYmAYkf8TLl3rr7YHi6VOKFAUX6LEc5XrfkjX5HW
   22Mc7FQTrnrvovxKejNIgm3EJqacHAbiEE0O+ZN7JA3rvHLiadHfkQII+
   gGJRhYPTYpgDAkIQ7IZ/5bvom+f7vXXGhA8mWeAO51ui4pROd1+x50+MF
   w==;
X-CSE-ConnectionGUID: TJ3Dv57CSZmNXD3AAo42FA==
X-CSE-MsgGUID: zV6ofEreQdSk06W+jPKCgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="37847128"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37847128"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:46:59 -0700
X-CSE-ConnectionGUID: C1Gf8WVtQEKW3bGkYuLaDg==
X-CSE-MsgGUID: ADnZZNiHRwSvD8wgaZf9KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="78717018"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.148])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 07:46:52 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 4 Oct 2024 17:46:46 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org, 
    dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org, 
    lee@kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org, 
    miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
    pavel@ucw.cz, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray
 for TUXEDO NB04 devices
In-Reply-To: <98883fb1-c895-4aad-842b-ed525d4c42f6@tuxedocomputers.com>
Message-ID: <07e29712-4c33-efa2-c8c6-ae19e21376fa@linux.intel.com>
References: <20241001180658.76396-1-wse@tuxedocomputers.com> <20241001180658.76396-2-wse@tuxedocomputers.com> <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com> <fdfaaad5-59e7-4825-bc06-db44831ac741@tuxedocomputers.com> <49beebf1-db73-a3a1-3376-e1822ce2e569@linux.intel.com>
 <98883fb1-c895-4aad-842b-ed525d4c42f6@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-558844353-1728053094=:957"
Content-ID: <12779ba9-89e7-dc78-8aa4-3e38be204c34@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-558844353-1728053094=:957
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <1a604cdc-a092-b688-97b7-2cd68c9b909e@linux.intel.com>

On Fri, 4 Oct 2024, Werner Sembach wrote:
> Am 03.10.24 um 12:54 schrieb Ilpo J=E4rvinen:
> > On Wed, 2 Oct 2024, Werner Sembach wrote:
> > > Am 02.10.24 um 11:52 schrieb Ilpo J=E4rvinen:
> > > > On Tue, 1 Oct 2024, Werner Sembach wrote:
> > > >=20
> > > > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have =
a
> > > > > per-key
> > > > > controllable RGB keyboard backlight. The firmware API for it is
> > > > > implemented
> > > > > via WMI.
> > > > >=20
> > > > > To make the backlight userspace configurable this driver emulates=
 a
> > > > > LampArray HID device and translates the input from hidraw to the
> > > > > corresponding WMI calls. This is a new approach as the leds subsy=
stem
> > > > > lacks
> > > > > a suitable UAPI for per-key keyboard backlights, and like this no=
 new
> > > > > UAPI
> > > > > needs to be established.
> > > > >=20
> > > > > v2: Integrated Armins feedback and fixed kernel test robot warnin=
gs.
> > > > > v3: Fixed borked subject line of v2.
> > > > > v4: Remove unrequired WMI mutex.
> > > > >       Move device checking from probe to init.
> > > > >       Fix device checking working exactly reverse as it should.
> > > > >       Fix null pointer dereference because, hdev->driver_data !=
=3D
> > > > > hdev->dev.driver_data.
> > > > >=20
> > > > > Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
> > > > > Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
> > > > > Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> > > > > Link:
> > > > > https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@=
tuxedocomputers.com/
> > > > > ---

> > > That why i choose the rather generic names of just the input and outp=
ut
> > > length
> > > because there is no semantic connection between the wmi methods in
> > > tuxedo_nb04_wmi_8_b_in_80_b_out and tuxedo_nb04_wmi_496_b_in_80_b_out
> > > respectively that would make for a good name.
> > So the only valuable characters are prefix + 8/496/80 the rest doesn't
> > really tell much despite all its characters :-). Details like which of =
the
> > numbers is in/out and that the numbers are in bytes could IMO be left t=
o
> > struct's comment without loss of much information value.
> >=20
> tuxedo_nb04_wmi_8_80 kinda looks strange to me, what about
> tuxedo_nb04_wmi_8_in_80_out? but that's on 4 chars shorter.

Perhaps just tuxedo_nb04_wmi_8in_80out ?

I can see you like to use underscores a lot so I can understand if that=20
feels a step too far :-) (no offence meant).

--=20
 i.
--8323328-558844353-1728053094=:957--

