Return-Path: <linux-input+bounces-8175-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3B39D424A
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 19:56:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA342834BF
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 18:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871AA1BBBCF;
	Wed, 20 Nov 2024 18:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qq/6H8St"
X-Original-To: linux-input@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB8713C83D
	for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 18:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732128992; cv=none; b=oQhXW13p0rCqORl2JyjitrYxhK4oTGclm0v6QJMxPwvlsHn7PbeOFFK8WQ+Hqyz04+sEr848G0vt5DCxqSAPL/4JUeDUFsj0MEPdm/RxrAVn9rJsCrKplkU4E7PhIUvy3/9KUyhpe4hfC1RRUDtCqkIYVxYSGki+8teMgnoQRiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732128992; c=relaxed/simple;
	bh=6OMVb1cP7lwG0cKH2mxInLBQsdinK0PjS1MpnWYh0vs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WSuyaMpIkZn28kaPfnfNp77n+7mV+rpk2VuAovEIz9E5tWweB/N1pRwYyy66StGBw9gxK1X66OB3yX26f8jFmm0yBMk5+DZFIR8rGCNDRmHf45AE1zdj/VPjQfqgLR91Yv3SOYg68pUTFCAC2ChfOjNj/QCuoHsBq1g/8A+rA0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qq/6H8St; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 20 Nov 2024 10:56:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732128987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0l9hkEoEyIxKnpHx142wYDgJUJrgnU+jeao/cnQv+nc=;
	b=Qq/6H8SthQ1x4jah1i77G9wcr1j2qvCYtJr/DWCGvQFQPp1/HrA/ZiJAMBBy2EQKfs0Znj
	MlCNa36AaTrTYGG8QSqTx7V+JKe7Y9DjtGnLRuEZZxIFVMbcIK5sL5FVCVUhp5rmIEaIAn
	i64F/YBlDgRC/BxhtauQv/zOTsYcvhg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Marco Felsch <m.felsch@pengutronix.de>
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
Message-ID: <20241120185611.43soqjcyruztby4f@4VRSMR2-DT.corp.robot.car>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-2-6124925b9718@pengutronix.de>
 <20241120165049.jzsveoms2unxt3m6@4VRSMR2-DT.corp.robot.car>
 <20241120173037.x6cro7r2wh5aoadg@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120173037.x6cro7r2wh5aoadg@pengutronix.de>
X-Migadu-Flow: FLOW_OUT


On Wed, Nov 20, 2024 at 06:30:37PM +0100, Marco Felsch wrote:
> Hi,
> 
> On 24-11-20, Russ Weight wrote:
> > On Tue, Nov 19, 2024 at 11:33:51PM +0100, Marco Felsch wrote:
> > > It's no error if a driver indicates that the firmware is already
> > > up-to-date and the update can be skipped.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > ---
> > >  drivers/base/firmware_loader/sysfs_upload.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> > > index b3cbe5b156e3..44f3d8fa5e64 100644
> > > --- a/drivers/base/firmware_loader/sysfs_upload.c
> > > +++ b/drivers/base/firmware_loader/sysfs_upload.c
> > > @@ -174,6 +174,10 @@ static void fw_upload_main(struct work_struct *work)
> > >  	fw_upload_update_progress(fwlp, FW_UPLOAD_PROG_PREPARING);
> > >  	ret = fwlp->ops->prepare(fwl, fwlp->data, fwlp->remaining_size);
> > >  	if (ret != FW_UPLOAD_ERR_NONE) {
> > > +		if (ret == FW_UPLOAD_ERR_SKIP) {
> > > +			dev_info(fw_dev, "firmware already up-to-date, skip update\n");
> > > +			ret = FW_UPLOAD_ERR_NONE;
> > > +		}
> > 
> > If you change the error-code from FW_UPLOAD_ERR_SKIP to
> > FW_UPLOAD_ERR_NONE, then the "skip" string provided in the previous
> > patch will never be seen. There are currently no other instances where
> 
> Do we really need to set it? As explained within the commit message,
> it's no error if FW_UPLOAD_ERR_SKIP is returned. The previous patch just
> added all pieces which may be required later on.
> 
> > an error code requires special-case modifications to the fw_upload
> > code and I don't think it is necessary to add it here.
> 
> Because at the moment no one is checking it except for the gb-beagleplay
> driver. This driver prints a dev_warn() string and returns a failure.
> Now the userspace needs some heuristic by parsing dmesg to check the
> reason. This is rather complex and very error prone as the sting can be
> changed in the future.
> 
> Therefore I added the support to have a simple error code which can be
> returned by a driver. I'm open to return "skip" as error instead of
> casting it to none. Both is fine for me since both allow the userspace
> to easily check if the error is a 'real' error or if the fw-update was
> just skipped due to already-up-to-date.

Are you saying that you intend for the user-space code to see "skip"?
Because in the current implementation, I don't think the user-space
code would see "skip". If you ultimately return FW_UPLOAD_ERR_NONE,
then cat'ing the error file should result in an empty file.

> 
> I wouldn't say that this is a special case, it is very common but no one
> is performing a fw-version check. Therefore I added this to the common
> code, to make it easier for driver devs.

By "special case" I meant to say that this is the first time this
core code has had to know about any error codes other than
FW_UPLOAD_ERR_NONE - and the first time that an error type alters
the code flow.

I understand that other drivers may also want to abort if the
firmware being loaded is a duplicate.

> 
> > The dev_info() message above can be provided by the device driver
> > that is using this API.
> > 
> > I think you can either:
> > 
> > (1) allow "skip" to be treated as an error. The update didn't happen...
> 
> Please see above.
> 
> > -or-
> > 
> > (2) The prepare function could detect the situation and set
> >     a flag in the same device driver. Your write function could
> >     set *written to the full data size and return without writing
> >     anything. Your poll_complete handler could also return
> >     FW_UPLOAD_ERR_NONE. Then you don't need to add FW_UPLOAD_ERR_SKIP
> >     at all. You would get the info message from the device driver
> >     and fw_upload would exit without an error.
> 
> Please see above. I don't think that this is special case and why making
> the life hard for driver devs instead of having a well known fw
> behaviour?

If you are not opposed to treating it as an error, then all you need
to add are the error code and the string to go with it.

Instead of FW_UPLOAD_ERR_SKIP -> "skip", how about
FW_UPLOAD_ERR_DUPLICATE -> "duplicate_firmware"?

Thanks,
- Russ

> 
> Regards,
>   Marco
> 
> > 
> > Thanks,
> > - Russ
> > 
> > >  		fw_upload_set_error(fwlp, ret);
> > >  		goto putdev_exit;
> > >  	}
> > > 
> > > -- 
> > > 2.39.5
> > > 
> > 

