Return-Path: <linux-input+bounces-16618-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44289CC93E2
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 19:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 152AE30006D4
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 18:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EAF531A570;
	Wed, 17 Dec 2025 18:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsBNzT74"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1F03346A0
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 18:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765995201; cv=none; b=JKeHDc9sY3V/P/1K/pyFrzzMwVNNW67hTOizWKOJQn5BuL4KZAeZrdDPh8eVsKzmZ46DPvTZbOsE4j18aN0bNiBVL6psU9ARK4Hj8x3BhN6O8DBk27wKGtfZZ7vzl3vwsLSQe3Pz/wvISHV7Sxc3iOsOHgQM2ryIobou7m899UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765995201; c=relaxed/simple;
	bh=aFOLYOSKUzeZxW/OJIyl43jX9xjAQtiOU/17GG+iG/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gt6S4/rv6WMSvnR5BDWDRiSdlni5whn6comqm9vSGV5cP0T2B5PNYLBzLa+lRnqfLOVBxv0D2v23IQXOGoykBXdScdZotWZbajVZUNgz5nl7Ou9Iqs0wv8U3YsP1qqXPFAxFiCVXC3eqjsk9g0ZNY/QNIRZul/+jjxE4mME0anA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsBNzT74; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so7196078b3a.3
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 10:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765995199; x=1766599999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfcwRRci87pNAIeEDncW0m0kM7bfprQd5RYFjiaSWOs=;
        b=ZsBNzT74FNumDAhEBCnIlC145k6pPcLDchmis9A/hdkymON44b6bURe1yXBaP+Uiya
         HDRfbDEFPCiuq+OaMer4xiSFvxzyI7wzxQIPO9iuUkugqKWI2kdK0+3hc0N4Lur9MBI8
         qbx9J07pTWnLkTcO3c3zrL6jEDm+QsqQhQsIoolLHiJPQ3NSiGQPamCGi8CnPVeXAHmu
         nfk9m8ld+LDM2dWOJIz7QsIDQdIzaNk1GW+JLCrmKk8cGkeYWS7wte2gdwV84nmSFGYl
         9+Igf98CehMOhmPYfEmHoXu11unt06fW/3R8wrIWJUFbIbEyXKrEew1aDlRj9wZadMPY
         66ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765995199; x=1766599999;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfcwRRci87pNAIeEDncW0m0kM7bfprQd5RYFjiaSWOs=;
        b=qPTuW/5LNP4vsekyTK05qTsdFugmqJ6RtiW0RIJMvMgv8cLr68+xtKKDxn05dbsIzW
         E/pibfJzb/UBou9Foj8QROucaX8N7UHAXshVdMukk9/H1hDoeeLWwg5fc2+QoG3IfBMl
         AbEVTG++GjwFIDkf59yBl2nt7Z6itRrIBusgM7zoE9ARHzoEWzScnHbbimxWGJJfHuDn
         uxWjJzvBdbml5vCn7knin1GqmzJLXtJoDJMG2XvAYUYHzhIEsnr4VTLWsL0psCwYBmsO
         8RlZUNlrm2B4ZVae/8gM0Z/3Bj1rI6Ch5YTz3b1rqXTqdsRqmsUjP+Q/5lWKjOMx98k7
         QTsg==
X-Gm-Message-State: AOJu0Yx2MOPs32JvMjkpFRB1IywwkWNVtNY5vwZVat3w/r9hb2kE06sy
	VjdAdOWS+sAtcXIOMKRe0AW4gvCPQ818RIEjaDFuebS+S37Vus0WFy+8
X-Gm-Gg: AY/fxX7xoJ4yY6VJOknDHRoGj9wa/xC/IcHPyCshguFfMkQ90nQgpNKF0Pz/T2+74vz
	TxVNl/rp5BGFSgztj6sJzFIUrtH/p/KsEDYqDo3UWp7o66ZyFAecDTC60e4w0yWn1WyU1XVa3Q8
	kGrazh5YXPW8mfjOFIJxB+JBLr/YLP4DRSxnQHfp0NBo684qVRRwAqp1v5MmZzSs4FXVPCnSWHP
	EeBDKAwjfY1hSj3IQ668NilaohvueW3kdtxFbCmi1f+bN5mdBQ9yg6Wf6m05I1qm3ZEyyB4wJ5x
	LyPXMksfZgLrAfdvIH0It705WJraAnxiG8oF+gpwt7HgAPUIzJGNZaiW71I1v8IU84rC+ox1ZS4
	Keyec/rYARpZ+BwYldWbG/I6Tp4mlmi9EHEPrfmeGio0Q3Ed5ViXkLr8G1fzURazyBSd5bKf7wa
	cEkWShEIlpu17JZPVac2maPtICVqIvC1afTOAFpspiuPR5jgcVkw==
X-Google-Smtp-Source: AGHT+IFtrh1khe0LAEAmju/RPgkBITXBMpMNQnuZ28AK4FqGhmZEVVydGIEwE2fYBog/J/xFuTDmtg==
X-Received: by 2002:a05:7022:f316:b0:119:e569:f622 with SMTP id a92af1059eb24-11f34bfa4a9mr13574795c88.27.1765995199077;
        Wed, 17 Dec 2025 10:13:19 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86:f92f:a027:b12a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f47269sm14004c88.4.2025.12.17.10.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:13:18 -0800 (PST)
Date: Wed, 17 Dec 2025 10:13:16 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com, 
	akpm@linux-foundation.org, johannes.berg@intel.com, pkshih@realtek.com, 
	hverkuil+cisco@kernel.org, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, 
	mingo@kernel.org
Subject: Re: [PATCH v2 RESEND 2/2] Input: psmouse - Replace flush_workqueue()
 with disable_delayed_work_sync()
Message-ID: <joqpa647tq7mh3lyl27zjv3wr4xbixuuvq7ifti3isifz3gfxg@p3ibbvrsuxud>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e40a46e5d9e6e3237702958b8f641263c28d2e4.1765939397.git.duoming@zju.edu.cn>

On Wed, Dec 17, 2025 at 11:00:18AM +0800, Duoming Zhou wrote:
> The original code uses flush_workqueue() in psmouse_disconnect() to
> ensure the completion of both resync_work and dev3_register_work.
> Given that alps_disconnect() already uses disable_delayed_work_sync()
> to cancel dev3_register_work, replacing flush_workqueue() with
> disable_delayed_work_sync(&psmouse->resync_work) is more robust
> and efficient.
> 
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
> ---
> Changes in v2:
>   - focus on the robustness and efficiency improvements of disable_delayed_work_sync(), not on the UAF aspect.
> 
>  drivers/input/mouse/psmouse-base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/mouse/psmouse-base.c b/drivers/input/mouse/psmouse-base.c
> index 77ea7da3b1c..eb41c553e80 100644
> --- a/drivers/input/mouse/psmouse-base.c
> +++ b/drivers/input/mouse/psmouse-base.c
> @@ -1484,7 +1484,7 @@ static void psmouse_disconnect(struct serio *serio)
>  
>  	/* make sure we don't have a resync in progress */
>  	mutex_unlock(&psmouse_mutex);
> -	flush_workqueue(kpsmoused_wq);
> +	disable_delayed_work_sync(&psmouse->resync_work);

Before we replace flush_workqueue() with disable_delayed_work_sync() we
need to also add disable_delayed_work_sync() to
drivers/input/mouse/hgpk.c that also queues work to psmouse workqueue
and relies on flushing it when disconnecting.

Thanks.

-- 
Dmitry

