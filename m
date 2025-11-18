Return-Path: <linux-input+bounces-16198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 30767C6BFA8
	for <lists+linux-input@lfdr.de>; Wed, 19 Nov 2025 00:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7EC8B4EB3D4
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 23:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26AE30748B;
	Tue, 18 Nov 2025 23:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tlcek9eW"
X-Original-To: linux-input@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49C2DCC17;
	Tue, 18 Nov 2025 23:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763508149; cv=none; b=Ry0dWSxAWLWyzdymi6U+BTeeX1C+Fnfh+D6DEVgloaWjMk4q5cuOxYuo7I+3qxvjF1Kt2oiyoqH2lUmI09w0eqxmPz8BLL1lHiv15YMVi6V2Qs817aUcwTACAFvEzcYyZUXv8pNvhQc7DSg/gGNJ1PD/pene3hzU0IxCIi5vSS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763508149; c=relaxed/simple;
	bh=YGcgACyauqbLSn6EOCivnrgI1UIiEklJzS3ysNeQZfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQD7A1+qEpn+oIp2Yrovwb8eJ+vdPTRoI+b2m0kQh6svgQHSh2aYnm5aDXqBTKwOsdeRdHMQZOd7bgvYDtFISQAWgYkLVunlGWuZpfrb8Ch6A9NyuTjsdTfFgKvq5l7PMUyCaWJ9IpCop/E0ZgAHOwbk/NGOJ5V1OrN6tJATET8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tlcek9eW; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 18 Nov 2025 16:22:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763508142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5OS2r4Tkkfz+7/umgJVmpwAA/b9UO79VBYExTqxdlvo=;
	b=tlcek9eW96YzKa2HwsaUNbavP4CxnNSLcbtOJkpRrS4F4kqdqvhrYrXwGWNBd8Dl/+gbUm
	z9dL5YIe9iDSg6M5YnFGSy9n1R21H/LD8H4lnKMqO6Uli3Whv3TjJBe65rBqWKK3RrA/FX
	yELFvZbNb6j2cufZqlB07SpSsThmfgg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kamel Bouhara <kamel.bouhara@bootlin.com>, 
	Marco Felsch <kernel@pengutronix.de>, Henrik Rydberg <rydberg@bitmath.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <juffz52dxb2txvolv7d3kb37urweg3kau67rb3zk42ovn4uze2@uqvbyz6nuecn>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
 <20251016145205.244gsevx5tdloiqy@pengutronix.de>
 <20251111110110.io65cbslrv75lbby@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111110110.io65cbslrv75lbby@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 11, 2025 at 12:01:10PM +0100, Marco Felsch wrote:
> On 25-10-16, Marco Felsch wrote:
> > Hi all,
> > 
> > On 25-09-20, Dmitry Torokhov wrote:
> > > On Wed, Aug 27, 2025 at 03:29:33PM -0600, Russ Weight wrote:
> > > > 
> > > > On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> > > > > Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> > > > > framework that the update is not required. This can be the case if the
> > > > > user provided firmware matches the current running firmware.
> > > > > 
> > > > > Sync lib/test_firmware.c accordingly.
> > > > > 
> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > 
> > > > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> > > 
> > > Does this mean I should merge this through input tree?
> > 
> > may I ask how this is planned to go further?
> 
> Gentle ping.

Marco - I would recommend adding the Reviewed-by tags that you
have received and then resubmitting the patch.

-- Russ

> 
> Regards,
>   Marco
> 
> 
> > 
> > Regards,
> >   Marco
> > 
> > > 
> > > Thanks.
> > > 
> > > -- 
> > > Dmitry
> 
> -- 
> #gernperDu 
> #CallMeByMyFirstName
> 
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

