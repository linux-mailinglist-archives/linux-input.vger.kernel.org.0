Return-Path: <linux-input+bounces-13137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E43AEBE6E
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 19:28:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19C317A24D6
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 17:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22DC12EAD09;
	Fri, 27 Jun 2025 17:28:43 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815822EACF6
	for <linux-input@vger.kernel.org>; Fri, 27 Jun 2025 17:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045323; cv=none; b=WlkVC4fwefiqn2yUdb30CtuczN3pzu3V4mzQsLmocniDzgcL7b7pjhokbLH2ieHEPhObNU/3AJzSf2FOCfaQGxH1vMTsPorc3S+IzblVuGiXFpf73LiVDgxDjq0xLXPfDIguSgUqQSbSP3eXLASz0c5sic40UPqilfdspHbOjEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045323; c=relaxed/simple;
	bh=+0C2Py53QX3fVfhJen5AoFbcBsazdegSy9P4LgV3ZNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbDMySr1vAiW+KfxLr+K84xMDTTXsFHX9tb2nOmev/n50sbzh6FgbuhsdDvoBUUQQ8fFpclWybIteSq5m/DK9mUp/8PiITpn78ZEXjfSTWO7alkqxUcrBlRPN6f5w9n+rpUBT+MOt1dp+5Y5ZnJaONHzvVFIfkEW1paCRcf717U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1uVCs3-0005XS-EX; Fri, 27 Jun 2025 19:28:15 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uVCs1-005eW0-2n;
	Fri, 27 Jun 2025 19:28:13 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1uVCs1-003eZ4-2O;
	Fri, 27 Jun 2025 19:28:13 +0200
Date: Fri, 27 Jun 2025 19:28:13 +0200
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
Subject: Re: [PATCH v2 1/4] firmware_loader: expand firmware error codes with
 skip error
Message-ID: <20250627172813.x2bgp6frsjrzgx7l@pengutronix.de>
References: <20250529-v6-10-topic-touchscreen-axiom-v2-0-a5edb105a600@pengutronix.de>
 <20250529-v6-10-topic-touchscreen-axiom-v2-1-a5edb105a600@pengutronix.de>
 <b5jlh7ngl64aqrm7b2hkpafvfk6rmuyhwshzogxqozpal3owmj@u26s6bpwbax7>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5jlh7ngl64aqrm7b2hkpafvfk6rmuyhwshzogxqozpal3owmj@u26s6bpwbax7>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org

On 25-06-04, Russ Weight wrote:
> On Thu, May 29, 2025 at 12:08:42AM +0200, Marco Felsch wrote:
> > Add FW_UPLOAD_ERR_SKIP to allow drivers to inform the firmware_loader
> > framework that the update is not required. This can be the case if the
> > user provided firmware matches the current running firmware.
> 
> The changes below look fine, but the commit message is inconsistent
> with the actual changes. The commit message should reference
> FW_UPLOAD_ERR_DUPLICATE instead of FW_UPLOAD_ERR_SKIP.

Argh.. you're right. Will fix this in the v3, thanks.

> 
> - Russ
> 
> > 
> > Sync lib/test_firmware.c file accordingly.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/base/firmware_loader/sysfs_upload.c | 1 +
> >  include/linux/firmware.h                    | 2 ++
> >  lib/test_firmware.c                         | 1 +
> >  3 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> > index 829270067d1632f92656859fb9143e3fa9635670..0a583a1b3f4fde563257566426d523fbf839b13f 100644
> > --- a/drivers/base/firmware_loader/sysfs_upload.c
> > +++ b/drivers/base/firmware_loader/sysfs_upload.c
> > @@ -28,6 +28,7 @@ static const char * const fw_upload_err_str[] = {
> >  	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
> >  	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
> >  	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
> > +	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
> >  };
> >  
> >  static const char *fw_upload_progress(struct device *dev,
> > diff --git a/include/linux/firmware.h b/include/linux/firmware.h
> > index aae1b85ffc10e20e9c3c9b6009d26b83efd8cb24..fe7797be4c08cd62cdad9617b8f70095d5e0af2f 100644
> > --- a/include/linux/firmware.h
> > +++ b/include/linux/firmware.h
> > @@ -29,6 +29,7 @@ struct firmware {
> >   * @FW_UPLOAD_ERR_RW_ERROR: read or write to HW failed, see kernel log
> >   * @FW_UPLOAD_ERR_WEAROUT: FLASH device is approaching wear-out, wait & retry
> >   * @FW_UPLOAD_ERR_FW_INVALID: invalid firmware file
> > + * @FW_UPLOAD_ERR_DUPLICATE: firmware is already up to date (duplicate)
> >   * @FW_UPLOAD_ERR_MAX: Maximum error code marker
> >   */
> >  enum fw_upload_err {
> > @@ -41,6 +42,7 @@ enum fw_upload_err {
> >  	FW_UPLOAD_ERR_RW_ERROR,
> >  	FW_UPLOAD_ERR_WEAROUT,
> >  	FW_UPLOAD_ERR_FW_INVALID,
> > +	FW_UPLOAD_ERR_DUPLICATE,
> >  	FW_UPLOAD_ERR_MAX
> >  };
> >  
> > diff --git a/lib/test_firmware.c b/lib/test_firmware.c
> > index 211222e63328f970228920f5662ee80cc7f51215..603c3a4b385c849944a695849a1894693234b5eb 100644
> > --- a/lib/test_firmware.c
> > +++ b/lib/test_firmware.c
> > @@ -1133,6 +1133,7 @@ static const char * const fw_upload_err_str[] = {
> >  	[FW_UPLOAD_ERR_RW_ERROR]     = "read-write-error",
> >  	[FW_UPLOAD_ERR_WEAROUT]	     = "flash-wearout",
> >  	[FW_UPLOAD_ERR_FW_INVALID]   = "firmware-invalid",
> > +	[FW_UPLOAD_ERR_DUPLICATE]    = "firmware-duplicate",
> >  };
> >  
> >  static void upload_err_inject_error(struct test_firmware_upload *tst,
> > 
> > -- 
> > 2.39.5
> > 
> 

