Return-Path: <linux-input+bounces-15523-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43572BE40A4
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 16:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 039E258873D
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 14:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F543254B7;
	Thu, 16 Oct 2025 14:52:40 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B2C34573C
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626360; cv=none; b=N7GJudeq0a1ed254OAWFtNSP05PBTOLVN/2J6fRzmT2XWEELHH/QXDKRkMBywF7vnzTmCra+oFAwUtwWg8Ou8KcE+oc/xw9RTKBNlfp/nPmWGD3XI1kclUtMDGwp5c8TBfPai02wswl0X1Roq+PujHusPfbkaPVoMY0rfPvfyP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626360; c=relaxed/simple;
	bh=AsrCpUMq8eWO8v2CiJZQdE55qY+E8SyMfHzBPjxsu6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TyiYdffGC6uTNiLxzcE/6g3NEyPNH7NdEG64vAI2fy/UQrT9Lbh2iC4oLDQoRTo8CVIfA0ITNXzhJ3v3wjXJlsUQ8Wm/TvKQpCDFrGSk80ik8V7g2H79VANSIKpOBsr7nwEiOMUixpLQ82tG8wTwfpN6w5RgVT2Q150oSSuSuMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1v9PKo-0005OT-2o; Thu, 16 Oct 2025 16:52:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1v9PKn-003uPG-0g;
	Thu, 16 Oct 2025 16:52:05 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1v9PKn-00HTZq-0C;
	Thu, 16 Oct 2025 16:52:05 +0200
Date: Thu, 16 Oct 2025 16:52:05 +0200
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
Message-ID: <20251016145205.244gsevx5tdloiqy@pengutronix.de>
References: <20250821-v6-10-topic-touchscreen-axiom-v3-0-940ccee6dba3@pengutronix.de>
 <20250821-v6-10-topic-touchscreen-axiom-v3-1-940ccee6dba3@pengutronix.de>
 <ifdhjgo6wchlsztqvgkaawpbnh3zahb76vmyzlomokfrqt6tjp@qjcdvcdqviag>
 <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5tlhy2jl77etqxsna42ksdmvu3x3bsp5c44poshkt45agldfsj@bkzlvbfoshsl>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Hi all,

On 25-09-20, Dmitry Torokhov wrote:
> On Wed, Aug 27, 2025 at 03:29:33PM -0600, Russ Weight wrote:
> > 
> > On Thu, Aug 21, 2025 at 07:26:36PM +0200, Marco Felsch wrote:
> > > Add FW_UPLOAD_ERR_DUPLICATE to allow drivers to inform the firmware_loader
> > > framework that the update is not required. This can be the case if the
> > > user provided firmware matches the current running firmware.
> > > 
> > > Sync lib/test_firmware.c accordingly.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > 
> > Reviewed-by: Russ Weight <russ.weight@linux.dev>
> 
> Does this mean I should merge this through input tree?

may I ask how this is planned to go further?

Regards,
  Marco

> 
> Thanks.
> 
> -- 
> Dmitry

