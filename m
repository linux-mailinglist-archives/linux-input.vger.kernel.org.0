Return-Path: <linux-input+bounces-16002-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099EC4D44A
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 12:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CDEFF341AE6
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 11:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76757354AEC;
	Tue, 11 Nov 2025 11:01:49 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E883546E5
	for <linux-input@vger.kernel.org>; Tue, 11 Nov 2025 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858909; cv=none; b=f7Z1lv58yfjwATFMypDN4W8FA+srp0AmB3NogTBUeFrBBNe2drwTnYrVZ8gZvUDgVraf/JyOqFpy6qfU4h9ydAduvENLPwmPEv9WbKe48RZtOncL0yJ3357E+hdk76l1I0mTebKG6qNtjAe5D7nyKgk7ci3fM7vvfR2RGebv5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858909; c=relaxed/simple;
	bh=uXKNyH5ermYmOE7AaALivQQxfbhotXP7qcgta6fTn8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbn03mxV25F+/puRxa/qLygbw/syn7De0K+u3EA/IGA7RGoFM7iQGeaWS4nrjSyOLYZaudTlDSjxNDKYlBooZl0zN30Ds5Qhai4sN6Ur9XCVco/NzDp4S0f1t0YB0S3Qtg7cNfUBS7sj9O7Z0aRNtx0G5lL/U8v61HmWSsy1Mwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vIm7c-0006Uh-Vj; Tue, 11 Nov 2025 12:01:12 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vIm7b-008BcB-0G;
	Tue, 11 Nov 2025 12:01:11 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vIm7a-00ET0X-32;
	Tue, 11 Nov 2025 12:01:10 +0100
Date: Tue, 11 Nov 2025 12:01:10 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Russ Weight <russ.weight@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/4] firmware_loader: expand firmware error codes with
 up-to-date error
Message-ID: <20251111110110.io65cbslrv75lbby@pengutronix.de>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
 <20251016145205.244gsevx5tdloiqy@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016145205.244gsevx5tdloiqy@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 25-10-16, Marco Felsch wrote:
> Hi all,
> 
> On 25-09-20, Dmitry Torokhov wrote:
> > On Wed, Aug 27, 2025 at 03:29:33PM -0600, Russ Weight wrote:
> > > 
> > > On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> > > > Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> > > > framework that the update is not required. This can be the case if the
> > > > user provided firmware matches the current running firmware.
> > > > 
> > > > Sync lib/test_firmware.c accordingly.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > 
> > > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> > 
> > Does this mean I should merge this through input tree?
> 
> may I ask how this is planned to go further?

Gentle ping.

Regards,
  Marco


> 
> Regards,
>   Marco
> 
> > 
> > Thanks.
> > 
> > -- 
> > Dmitry

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

