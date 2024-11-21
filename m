Return-Path: <linux-input+bounces-8186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A79D490F
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 09:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C55282CEF
	for <lists+linux-input@lfdr.de>; Thu, 21 Nov 2024 08:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80801CB526;
	Thu, 21 Nov 2024 08:41:55 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F601CD207
	for <linux-input@vger.kernel.org>; Thu, 21 Nov 2024 08:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732178515; cv=none; b=FfA8gW2IWgfEpSPdfgUy5a5cK4AhxdzZWiAkGNh1jksLYksVh7P0keo/h/Lo9sjsiGyQZ3bXhxYz9+JX2XD4xHSU3zp2Zep7nIhpZWreZf0qXzhXN2+S+PWYcljWud2LgRjUAl2Dx7NPK1AKEyAxQ8SP3x8WLelaFlkR5UuwksU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732178515; c=relaxed/simple;
	bh=+bA1rXPMFxjpumxBPBsgBXGYUAll8wqXn3zjiH2FOg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tH+IWh8AoNUNYjSMiDl9bFrl3fG5toKDlzdE9qxrSSlH7SXsWMIgpPPPgdtUD0uRjCyJgBBrHTvS6vXRj6LEQK6bU0oWz8W6X/FaQjWUros/brUvCFRsx7YVf/LYlf66yZEohueWlLgv2W+z/aWT+vVUdTzTJx1eDcfv6rZjpbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tE2kh-00015R-L4; Thu, 21 Nov 2024 09:41:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tE2kf-001sK9-2u;
	Thu, 21 Nov 2024 09:41:25 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tE2kf-00731R-2Z;
	Thu, 21 Nov 2024 09:41:25 +0100
Date: Thu, 21 Nov 2024 09:41:25 +0100
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
Message-ID: <20241121084125.3ldkyd7xotjvuq2r@pengutronix.de>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-2-6124925b9718@pengutronix.de>
 <20241120165049.jzsveoms2unxt3m6@4VRSMR2-DT.corp.robot.car>
 <20241120173037.x6cro7r2wh5aoadg@pengutronix.de>
 <20241120185611.43soqjcyruztby4f@4VRSMR2-DT.corp.robot.car>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120185611.43soqjcyruztby4f@4VRSMR2-DT.corp.robot.car>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 24-11-20, Russ Weight wrote:
> 
> On Wed, Nov 20, 2024 at 06:30:37PM +0100, Marco Felsch wrote:
> > Hi,
> > 
> > On 24-11-20, Russ Weight wrote:
> > > On Tue, Nov 19, 2024 at 11:33:51PM +0100, Marco Felsch wrote:
> > > > It's no error if a driver indicates that the firmware is already
> > > > up-to-date and the update can be skipped.
> > > > 
> > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > ---
> > > >  drivers/base/firmware_loader/sysfs_upload.c | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> > > > index b3cbe5b156e3..44f3d8fa5e64 100644
> > > > --- a/drivers/base/firmware_loader/sysfs_upload.c
> > > > +++ b/drivers/base/firmware_loader/sysfs_upload.c
> > > > @@ -174,6 +174,10 @@ static void fw_upload_main(struct work_struct *work)
> > > >  	fw_upload_update_progress(fwlp, FW_UPLOAD_PROG_PREPARING);
> > > >  	ret = fwlp->ops->prepare(fwl, fwlp->data, fwlp->remaining_size);
> > > >  	if (ret != FW_UPLOAD_ERR_NONE) {
> > > > +		if (ret == FW_UPLOAD_ERR_SKIP) {
> > > > +			dev_info(fw_dev, "firmware already up-to-date, skip update\n");
> > > > +			ret = FW_UPLOAD_ERR_NONE;
> > > > +		}
> > > 
> > > If you change the error-code from FW_UPLOAD_ERR_SKIP to
> > > FW_UPLOAD_ERR_NONE, then the "skip" string provided in the previous
> > > patch will never be seen. There are currently no other instances where
> > 
> > Do we really need to set it? As explained within the commit message,
> > it's no error if FW_UPLOAD_ERR_SKIP is returned. The previous patch just
> > added all pieces which may be required later on.
> > 
> > > an error code requires special-case modifications to the fw_upload
> > > code and I don't think it is necessary to add it here.
> > 
> > Because at the moment no one is checking it except for the gb-beagleplay
> > driver. This driver prints a dev_warn() string and returns a failure.
> > Now the userspace needs some heuristic by parsing dmesg to check the
> > reason. This is rather complex and very error prone as the sting can be
> > changed in the future.
> > 
> > Therefore I added the support to have a simple error code which can be
> > returned by a driver. I'm open to return "skip" as error instead of
> > casting it to none. Both is fine for me since both allow the userspace
> > to easily check if the error is a 'real' error or if the fw-update was
> > just skipped due to already-up-to-date.
> 
> Are you saying that you intend for the user-space code to see "skip"?
> Because in the current implementation, I don't think the user-space
> code would see "skip". If you ultimately return FW_UPLOAD_ERR_NONE,
> then cat'ing the error file should result in an empty file.

I know.

> > I wouldn't say that this is a special case, it is very common but no one
> > is performing a fw-version check. Therefore I added this to the common
> > code, to make it easier for driver devs.
> 
> By "special case" I meant to say that this is the first time this
> core code has had to know about any error codes other than
> FW_UPLOAD_ERR_NONE - and the first time that an error type alters
> the code flow.
> 
> I understand that other drivers may also want to abort if the
> firmware being loaded is a duplicate.

:)

> > > The dev_info() message above can be provided by the device driver
> > > that is using this API.
> > > 
> > > I think you can either:
> > > 
> > > (1) allow "skip" to be treated as an error. The update didn't happen...
> > 
> > Please see above.
> > 
> > > -or-
> > > 
> > > (2) The prepare function could detect the situation and set
> > >     a flag in the same device driver. Your write function could
> > >     set *written to the full data size and return without writing
> > >     anything. Your poll_complete handler could also return
> > >     FW_UPLOAD_ERR_NONE. Then you don't need to add FW_UPLOAD_ERR_SKIP
> > >     at all. You would get the info message from the device driver
> > >     and fw_upload would exit without an error.
> > 
> > Please see above. I don't think that this is special case and why making
> > the life hard for driver devs instead of having a well known fw
> > behaviour?
> 
> If you are not opposed to treating it as an error, then all you need
> to add are the error code and the string to go with it.

Yep this works for me.

> Instead of FW_UPLOAD_ERR_SKIP -> "skip", how about
> FW_UPLOAD_ERR_DUPLICATE -> "duplicate_firmware"?

Fine by me :) I can use this if no one else comes up with a better idea
for the string.

Regards,
  Marco

