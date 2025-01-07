Return-Path: <linux-input+bounces-9002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B152A0488C
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 18:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32AEE1886375
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 17:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC7C1F2C48;
	Tue,  7 Jan 2025 17:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IhneqM6j"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A71C18C01E;
	Tue,  7 Jan 2025 17:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271875; cv=none; b=XPb66lrkHrr00GslFrDg/cK1R63LiqdYQh4MQ2PlnfhgKkohWv7FZ/4UBQh6sQ7xpta+QR5nU4KksNMQxFyg4Lwkvr8CVUNJtRYzWcSLwMg3/l+mOHWUf47hhfnveHK59P3yfqnwCDyOScrA/kC5STUVcwI13WOzNEwHteuDY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271875; c=relaxed/simple;
	bh=2Yo/jYMa6G2VCfch/A17TBkdJM6L+KmbxoIbH4/a3Gg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Rdu8d7etmY4TuyUsPqU6ekr/mOkkEqVO0eZP8X8A+vFs4OJr/M2azASRgaYPQSi4b/j/rW/gbFqcMtKnGfya87f0DsvBlBKzknSRaqdcDzXZE7UdbFxmJ9Lm16u11tj2JgLrn5/gic6/IIk+yLK3N6RRgJ70+Xmq8SWyFQ78Soo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IhneqM6j; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736271872; x=1767807872;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2Yo/jYMa6G2VCfch/A17TBkdJM6L+KmbxoIbH4/a3Gg=;
  b=IhneqM6jrEpPPa+g6u6r/5tUAYGJAbRgitntuwwa204i0H+4CLTxMcu6
   DBURzAchaCjMabaPHNFcqqUymI3my+Rw49/9iTz6pL9G6RynXf8ZCyonF
   wFUBGwUxL2TMBqQdqOW1GD7Woi278tXcXLhxJoJKsd6U3VJW4SZcAVvms
   Hu9bi+nUCWcms5fDTq7NOKdIH4akqIeHtA8n3FZwLPTwRjfYoJ+KzNNqh
   FEvvhWD0MYgvAwcZx7ik1ARWvg6Ger3luIMqd/TTvTMDqkgafkzr5dgJQ
   1TxHv6UgFnYJiZ7l+2JGB5fX7R48ppAIXZOLxKx2Bso2J4oM/+GzFx+md
   Q==;
X-CSE-ConnectionGUID: xUhWiQ6iRRiNLIiviGZDoA==
X-CSE-MsgGUID: ks4WRB/EQKmmJ2ctmMtZIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36361303"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="36361303"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:44:31 -0800
X-CSE-ConnectionGUID: lYxcOWNJTKaHGplmRhYSQg==
X-CSE-MsgGUID: q/WMifpkQuK2zq3kk7gcYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140182497"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:44:28 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jan 2025 19:44:25 +0200 (EET)
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc: Illia Ostapyshyn <illia@yshyn.com>, LKML <linux-kernel@vger.kernel.org>, 
    linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
    ibm-acpi-devel@lists.sourceforge.net, Hans de Goede <hdegoede@redhat.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 1/2] Input: allocate keycode for phone linking
In-Reply-To: <8127d500-6eb4-d196-849a-48c3847ebc53@linux.intel.com>
Message-ID: <a6e15842-1a05-888e-621c-fa185f20119d@linux.intel.com>
References: <20241114173930.44983-1-illia@yshyn.com> <20241114173930.44983-2-illia@yshyn.com> <8127d500-6eb4-d196-849a-48c3847ebc53@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-609653861-1736271865=:1001"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-609653861-1736271865=:1001
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 2 Dec 2024, Ilpo J=E4rvinen wrote:
> On Thu, 14 Nov 2024, Illia Ostapyshyn wrote:
>=20
> > The F11 key on the new Lenovo Thinkpad T14 Gen 5, T16 Gen 3, and P14s
> > Gen 5 laptops includes a symbol showing a smartphone and a laptop
> > chained together.  According to the user manual, it starts the Microsof=
t
> > Phone Link software used to connect to Android/iOS devices and relay
> > messages/calls or sync data.
> >=20
> > As there are no suitable keycodes for this action, introduce a new one.
> >=20
> > Signed-off-by: Illia Ostapyshyn <illia@yshyn.com>
> > ---
> >  include/uapi/linux/input-event-codes.h | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linu=
x/input-event-codes.h
> > index a4206723f503..5a199f3d4a26 100644
> > --- a/include/uapi/linux/input-event-codes.h
> > +++ b/include/uapi/linux/input-event-codes.h
> > @@ -519,6 +519,7 @@
> >  #define KEY_NOTIFICATION_CENTER=090x1bc=09/* Show/hide the notificatio=
n center */
> >  #define KEY_PICKUP_PHONE=090x1bd=09/* Answer incoming call */
> >  #define KEY_HANGUP_PHONE=090x1be=09/* Decline incoming call */
> > +#define KEY_LINK_PHONE=09=090x1bf   /* AL Phone Syncing */
>=20
> Any thoughts about this Dmitry?

Ping?

--=20
 i.

--8323328-609653861-1736271865=:1001--

