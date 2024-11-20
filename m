Return-Path: <linux-input+bounces-8172-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E30979D4160
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 18:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E76E1B2E69F
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 17:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15631149C4D;
	Wed, 20 Nov 2024 17:31:04 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722C01ADFE6
	for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732123864; cv=none; b=W+Pe0k5uNLbvPPnmlh3fj+kX6Fj5iaFSna/ZaYutUkLhZVEbpACKC2DlpUenrfqLhJI8EWRvHdRQiGYcvuMHXguNXVvMcrmW6hXdrC1Dy2A3mx6+juWrcVNF0Q0rBCKxc5JrxQUjSnke/ecS//RsYAZYtxkhlGPgjBsnZ/H+1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732123864; c=relaxed/simple;
	bh=UdmBR0vlYUwE0j7Xk0Auu9zw64mJgjK4bcR4taYvDfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiUswfZ8gIra180o1uITBveptQYLU1LrEPnsZf9pzjHykMSuFsi8WTSIJNklDwf1Wu+eTsPDMS4Xzk9h9OQHuGkXf4hPH9PKwUEHe/3QpNyW8z4CPVNPJGDCQ4fgJ18mnMIj8XLTQyaBlUQA/7iKHnQXqq6OoQlvklao0FIms20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tDoXG-0006Fm-Im; Wed, 20 Nov 2024 18:30:38 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tDoXF-001m6C-38;
	Wed, 20 Nov 2024 18:30:37 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tDoXF-005I5x-2m;
	Wed, 20 Nov 2024 18:30:37 +0100
Date: Wed, 20 Nov 2024 18:30:37 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Russ Weight <russ.weight@linux.dev>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>,
	Marco Felsch <kernel@pengutronix.de>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/5] firmware_loader: add support to handle
 FW_UPLOAD_ERR_SKIP
Message-ID: <20241120173037.x6cro7r2wh5aoadg@pengutronix.de>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-2-6124925b9718@pengutronix.de>
 <20241120165049.jzsveoms2unxt3m6@4VRSMR2-DT.corp.robot.car>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120165049.jzsveoms2unxt3m6@4VRSMR2-DT.corp.robot.car>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

Hi,

On 24-11-20, Russ Weight wrote:
> On Tue, Nov 19, 2024 at 11:33:51PM +0100, Marco Felsch wrote:
> > It's no error if a driver indicates that the firmware is already
> > up-to-date and the update can be skipped.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/base/firmware_loader/sysfs_upload.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> > index b3cbe5b156e3..44f3d8fa5e64 100644
> > --- a/drivers/base/firmware_loader/sysfs_upload.c
> > +++ b/drivers/base/firmware_loader/sysfs_upload.c
> > @@ -174,6 +174,10 @@ static void fw_upload_main(struct work_struct *work)
> >  	fw_upload_update_progress(fwlp, FW_UPLOAD_PROG_PREPARING);
> >  	ret = fwlp->ops->prepare(fwl, fwlp->data, fwlp->remaining_size);
> >  	if (ret != FW_UPLOAD_ERR_NONE) {
> > +		if (ret == FW_UPLOAD_ERR_SKIP) {
> > +			dev_info(fw_dev, "firmware already up-to-date, skip update\n");
> > +			ret = FW_UPLOAD_ERR_NONE;
> > +		}
> 
> If you change the error-code from FW_UPLOAD_ERR_SKIP to
> FW_UPLOAD_ERR_NONE, then the "skip" string provided in the previous
> patch will never be seen. There are currently no other instances where

Do we really need to set it? As explained within the commit message,
it's no error if FW_UPLOAD_ERR_SKIP is returned. The previous patch just
added all pieces which may be required later on.

> an error code requires special-case modifications to the fw_upload
> code and I don't think it is necessary to add it here.

Because at the moment no one is checking it except for the gb-beagleplay
driver. This driver prints a dev_warn() string and returns a failure.
Now the userspace needs some heuristic by parsing dmesg to check the
reason. This is rather complex and very error prone as the sting can be
changed in the future.

Therefore I added the support to have a simple error code which can be
returned by a driver. I'm open to return "skip" as error instead of
casting it to none. Both is fine for me since both allow the userspace
to easily check if the error is a 'real' error or if the fw-update was
just skipped due to already-up-to-date.

I wouldn't say that this is a special case, it is very common but no one
is performing a fw-version check. Therefore I added this to the common
code, to make it easier for driver devs.

> The dev_info() message above can be provided by the device driver
> that is using this API.
> 
> I think you can either:
> 
> (1) allow "skip" to be treated as an error. The update didn't happen...

Please see above.

> -or-
> 
> (2) The prepare function could detect the situation and set
>     a flag in the same device driver. Your write function could
>     set *written to the full data size and return without writing
>     anything. Your poll_complete handler could also return
>     FW_UPLOAD_ERR_NONE. Then you don't need to add FW_UPLOAD_ERR_SKIP
>     at all. You would get the info message from the device driver
>     and fw_upload would exit without an error.

Please see above. I don't think that this is special case and why making
the life hard for driver devs instead of having a well known fw
behaviour?

Regards,
  Marco

> 
> Thanks,
> - Russ
> 
> >  		fw_upload_set_error(fwlp, ret);
> >  		goto putdev_exit;
> >  	}
> > 
> > -- 
> > 2.39.5
> > 
> 

