Return-Path: <linux-input+bounces-16319-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B704EC81F68
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 18:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75EEB3AB6F1
	for <lists+linux-input@lfdr.de>; Mon, 24 Nov 2025 17:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4296B2BFC73;
	Mon, 24 Nov 2025 17:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gdb1TZre"
X-Original-To: linux-input@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386302192F9
	for <linux-input@vger.kernel.org>; Mon, 24 Nov 2025 17:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764006411; cv=none; b=kHtkQUS9hQm/fqhu2Ugumk6RTEP/yaQQDdWXH3JJj28jHUM1iV6j4lV0FOIJGkpwfzuuDbE90QeJFRz+KxadQ47dPgjlx4BH3I2klfDiY+nA7BJu4dYnZuByQH2z/1JJpT5jgM0BMzMcgP7549UMVsRbpE6flUDXw2QbnnzvHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764006411; c=relaxed/simple;
	bh=2NlUiMVspjHy422pOguqWlTVaQsqHHsBtnMH0JtaTxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT/OenKA796uQC6JN+Ctv7G8BxVAa0q2/hZLpZfKXs1YcDtoUc0PdIr37aaFKAgSrrybz866U+zA31y9AiciTI4Ria2u8O6P1guWr9hA3AlEifPxl0grIeSdTHHg4ECyvs9VVf9jqCllteoRElFMxs7h+5ce4lA/zbGOgt9MHBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gdb1TZre; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 24 Nov 2025 10:45:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764006395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A7KsEx3IMMvVvQOVv3eGb75FdpgkL0eFHL2uf+s/d7E=;
	b=gdb1TZreCJ+2/T6O0kRPJIcGQBw/TJdnZMaOtZ0w3ujEgCL6YfqykTM2euS+ueRTugdMHO
	mOeREDWStFdPeG8mt7dm0t6EqFcBLWpYxKoMLXzpBrFuWFsVICnTqsDHrypdBzfu6wDMNN
	0X2wirb6SK5OOlGlxm3tVfm0fE8Pdu4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, 
	Marco Felsch <kernel@pengutronix.de>, linux-input@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <3ige6tcoaivxrgmpieyisoskcsxa5mhbjhc7dm5zvlzuwurvyg@guccsc5kzcnk>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
 <20251016145205.244gsevx5tdloiqy@pengutronix.de>
 <20251111110110.io65cbslrv75lbby@pengutronix.de>
 <juffz52dxb2txvolv7d3kb37urweg3kau67rb3zk42ovn4uze2@uqvbyz6nuecn>
 <20251119101007.za2373biybt24qfs@pengutronix.de>
 <20251119-elated-caribou-of-witchcraft-0508ed@lemur>
 <20251121140052.f5ry3jljvyg24smn@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121140052.f5ry3jljvyg24smn@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Fri, Nov 21, 2025 at 03:00:52PM +0100, Marco Felsch wrote:
> Hi Russ,
> 
> On 25-11-19, Konstantin Ryabitsev wrote:
> > On Wed, Nov 19, 2025 at 11:10:07AM +0100, Marco Felsch wrote:
> > > > Marco - I would recommend adding the Reviewed-by tags that you
> > > > have received and then resubmitting the patch.
> > > 
> > > I can do this albeit I thought this will be collected autom. by b4.
> > 
> > You have to run `b4 trailers -u` for it to be collected.
> 
> Is this okay to run it on your site or do I have to add and resend it?

My role is primarily code reviews - I'm not the person who would
pull the patch in to a testing branch. I would recommend adding
the tags and resubmitting.

> 
> Regards,
>   Marco
> 
> > 
> > -K
> > 
> 
> -- 
> #gernperDu 
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

