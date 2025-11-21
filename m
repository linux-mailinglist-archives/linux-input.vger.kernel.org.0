Return-Path: <linux-input+bounces-16278-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B90C79F27
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 15:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 306F42DD7C
	for <lists+linux-input@lfdr.de>; Fri, 21 Nov 2025 14:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290A934D4DB;
	Fri, 21 Nov 2025 14:01:16 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBAB34D39B
	for <linux-input@vger.kernel.org>; Fri, 21 Nov 2025 14:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733676; cv=none; b=KjRlTlAIyT6xsFvd2zjiLpb9iOBwdxpq9OMChLUEg4IxkG4iPP/48XhTT4bRPpNA/4IeCzw3B5bBRA5GZ2JsTq33wtM730A/TX8ZwGeaPQ7IRgv0QjQ0OKPlBlVdrUEBU8orjJQOlM+NWkL5VKAmVAH+O/48uNqlLJJe5bEm0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733676; c=relaxed/simple;
	bh=5XQAQXaxN7gdd0mKoWTHdAfyp36WIRhodjC4bz3cAaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5Rj4Ww6SmPDJTj5VdUBUBijsKc4nD9LyghkIzZOO3q6FJVdsBnNUd0tHMFOgt2mcYFlSFiZcYqezmYRtTRWUmIkyC+AlyUb1JECvAw+EgUQujmzrBD50vpQXrcQM4Ph99zoSMRP/XR1XSCbPl5JO/pYEWSmgk9WImQBoZ5AxFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vMRh1-00008x-CX; Fri, 21 Nov 2025 15:00:55 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vMRgz-001azs-09;
	Fri, 21 Nov 2025 15:00:53 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vMRgy-00FuR9-2t;
	Fri, 21 Nov 2025 15:00:52 +0100
Date: Fri, 21 Nov 2025 15:00:52 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Russ Weight <russ.weight@linux.dev>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>, devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Marco Felsch <kernel@pengutronix.de>, linux-input@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <20251121140052.f5ry3jljvyg24smn@pengutronix.de>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
 <20251016145205.244gsevx5tdloiqy@pengutronix.de>
 <20251111110110.io65cbslrv75lbby@pengutronix.de>
 <juffz52dxb2txvolv7d3kb37urweg3kau67rb3zk42ovn4uze2@uqvbyz6nuecn>
 <20251119101007.za2373biybt24qfs@pengutronix.de>
 <20251119-elated-caribou-of-witchcraft-0508ed@lemur>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-elated-caribou-of-witchcraft-0508ed@lemur>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Hi Russ,

On 25-11-19, Konstantin Ryabitsev wrote:
> On Wed, Nov 19, 2025 at 11:10:07AM +0100, Marco Felsch wrote:
> > > Marco - I would recommend adding the Reviewed-by tags that you
> > > have received and then resubmitting the patch.
> > 
> > I can do this albeit I thought this will be collected autom. by b4.
> 
> You have to run `b4 trailers -u` for it to be collected.

Is this okay to run it on your site or do I have to add and resend it?

Regards,
  Marco

> 
> -K
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

