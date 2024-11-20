Return-Path: <linux-input+bounces-8171-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7D09D4112
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 18:22:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 27EF9B274AB
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2024 16:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76122153814;
	Wed, 20 Nov 2024 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eG+8L5r0"
X-Original-To: linux-input@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D60A153BED
	for <linux-input@vger.kernel.org>; Wed, 20 Nov 2024 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732121465; cv=none; b=Iuuf6L7WIKknEbYoxIjM61EOzzHXtFTS0/thgIG8XOtjIQ9MvQOtT5NgIpWTFh7wi7OhPOATe1UDrpNSNapvnYkj5svcIZGHYVxqGQcNSDSjQMZwuBFcjrpvklYq8jq7MeW/0VQPwhXv7Wj+dmoKYaKF3Q5vrOZgJqfqksUpnDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732121465; c=relaxed/simple;
	bh=CArJjqyZn29K7jqNLHvcRGyvEoXAG9RjhAjwmglVuTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDnzapbTf+Rorpfo6bnkjK+uV7/r4hDRnBK7YMag+eOVzQmtXr40KM3eeVLJ22gxMdsE7GIYmlpBxKTR3rzliyKJ/uENBHleMsrGb6OWLfwAQE70ApzgMdpJLuNUg8LVgO8/QIrar6X3EUP+k8ChuRLoeJFPgLVZ4J28cV2e5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eG+8L5r0; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 20 Nov 2024 08:50:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1732121460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JW6CUngLOu75VOV9f472xCW07lVeBTteuDR8jNnNruo=;
	b=eG+8L5r0N3ZU3xEKnaOmGokcBySKemg9tZZ+pRsL4ENHRbcW8bl81OLaeXKPHO3fWbRzBh
	5D0zg6aHKJE7IzNHdD2E3ZA033N6YRItW+4Urr3xPpoAytY+P4MIU5e7o01nm1R2irf6IU
	T8evyv6vvMxVYObWuwU3ccJi0+YPyZA=
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
Message-ID: <20241120165049.jzsveoms2unxt3m6@4VRSMR2-DT.corp.robot.car>
References: <20241119-v6-10-topic-touchscreen-axiom-v1-0-6124925b9718@pengutronix.de>
 <20241119-v6-10-topic-touchscreen-axiom-v1-2-6124925b9718@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-v6-10-topic-touchscreen-axiom-v1-2-6124925b9718@pengutronix.de>
X-Migadu-Flow: FLOW_OUT

On Tue, Nov 19, 2024 at 11:33:51PM +0100, Marco Felsch wrote:
> It's no error if a driver indicates that the firmware is already
> up-to-date and the update can be skipped.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/base/firmware_loader/sysfs_upload.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> index b3cbe5b156e3..44f3d8fa5e64 100644
> --- a/drivers/base/firmware_loader/sysfs_upload.c
> +++ b/drivers/base/firmware_loader/sysfs_upload.c
> @@ -174,6 +174,10 @@ static void fw_upload_main(struct work_struct *work)
>  	fw_upload_update_progress(fwlp, FW_UPLOAD_PROG_PREPARING);
>  	ret = fwlp->ops->prepare(fwl, fwlp->data, fwlp->remaining_size);
>  	if (ret != FW_UPLOAD_ERR_NONE) {
> +		if (ret == FW_UPLOAD_ERR_SKIP) {
> +			dev_info(fw_dev, "firmware already up-to-date, skip update\n");
> +			ret = FW_UPLOAD_ERR_NONE;
> +		}

If you change the error-code from FW_UPLOAD_ERR_SKIP to
FW_UPLOAD_ERR_NONE, then the "skip" string provided in the previous
patch will never be seen. There are currently no other instances where
an error code requires special-case modifications to the fw_upload
code and I don't think it is necessary to add it here.

The dev_info() message above can be provided by the device driver
that is using this API.

I think you can either:

(1) allow "skip" to be treated as an error. The update didn't happen...

-or-

(2) The prepare function could detect the situation and set
    a flag in the same device driver. Your write function could
    set *written to the full data size and return without writing
    anything. Your poll_complete handler could also return
    FW_UPLOAD_ERR_NONE. Then you don't need to add FW_UPLOAD_ERR_SKIP
    at all. You would get the info message from the device driver
    and fw_upload would exit without an error.

Thanks,
- Russ

>  		fw_upload_set_error(fwlp, ret);
>  		goto putdev_exit;
>  	}
> 
> -- 
> 2.39.5
> 

