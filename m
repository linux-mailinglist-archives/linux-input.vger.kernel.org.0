Return-Path: <linux-input+bounces-15436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 29728BD6544
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 23:11:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6789618A812F
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 21:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62EB29D26B;
	Mon, 13 Oct 2025 21:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3kIUE1L"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC726561D
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389862; cv=none; b=s1B9GnulxuNMtMnYlrfsl83+4o36RBiu0Y8xTl8NA2izVoyZ20kkCEKK6VJUGtbmzK0qRYyogWPehL2tZComowyW18jXD/FLrEYPdoEWzULHORZBMgjJDfgrg3tNusr5Mxrfoje9ycTI0PuDbmO9JURgdSwC1l/nxUyAae4ZayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389862; c=relaxed/simple;
	bh=XRyQ8TvgonzZxSKeTWrQ9Nooy9DyVz1PgDZQ2fk4fok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRteVf2ePxKcsY5RY4smIx7f/PpLkaxESHUMIiMlnBsdJQTYYnM2d4LmDb//M2VKxB+JgWWpWYY7ajv8Rxg9H1NeekOF8HpoOA5dljiS9EwzqY02hsshGXcqxCqqyOX96mUr1jWpWrA1/AWfITT+z2yAD8/RAtAG7j9DPe4jY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3kIUE1L; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28e7cd34047so36066875ad.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 14:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760389860; x=1760994660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8T7ajPfnJGCZaEQpmGY6bA7JB2Gwt9VaIoR3OH9oz4=;
        b=I3kIUE1LBxVp7tQQ7mVMXqvgWJcA5YePrBBIIKqPeob8MN8mdfkj1I8uz1SYvvdWw/
         FIBIJIzByURcLuGk4HrpIdZ/BxayxxPD/f0p1OG2xis22XHYV0uOSA92ToHxrg0iPTHH
         fwCmIjs6xgnIvkt0IQVsmX6AKQBmQAssjBo0pqGRgtZRenR1VTR9gYy2wjJW5BsQ3Q7c
         8pcsLHLWAX3lz2EdAeST7jLC0nznZ9LYJVVneE7mwiqqZqKgl+GpcMZRQtpT++A1hd92
         a5mYD32YCm38gBoL5A8zMx0pda/fBWmS/zf1AKJc1tSxg6JuOuF3iEcRLbS1w7H6365+
         e7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760389860; x=1760994660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8T7ajPfnJGCZaEQpmGY6bA7JB2Gwt9VaIoR3OH9oz4=;
        b=SXlJ09556DvGrKT4t5zrHe8/7RRrkY+Jvq7J2E3eHi8Lyrz30F5fnD+35fd8IhgwAT
         Jb5AVA6o5br/UJwFRS50Q7hvRL1ItQetFgjdidkLG3QIjrAjsKNcvaFjwB49gTCpXkFP
         PtiR3qyKwtcryvR2+KckiM9lIbZjHc8ZX4SlWxvGvOR+jXmsSoCTlbwLe/WeQDIoNlDM
         BUJ6ug8LCCS7jLYmNPlLKjAd+63WncDGW4iUevWpDB3Rs1p2j4t1lkiOIlsE1Up7WkPO
         MY6ZPfksmkHpi+DhlRnPDQquoRlbzBFInIKI4WXkr8XG7cWhMsPUtmHjJdLAo3TkUE7t
         ex8g==
X-Forwarded-Encrypted: i=1; AJvYcCVMnghv1R6mbiBzFaruhhmJezsWztPDRbaXQMyg8ATiA+kZLo3sqlRp0GmwNlyBXHKHMZxe54oA53HQmA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5R1baUJxEV+SrIrckZSv1isEmNKXqPHfOeTsYsn2PWuWu5CDw
	NWHfhent8utOH/4X06DT/fvP0T7GD0G2ATi1OtSnJib4VBPyERPoWdEC
X-Gm-Gg: ASbGncsANs7NE4DfQy3/N6j4aQIxHK0n9hrPFdnz3F9n1eT2kThBhJ6JaZhKLfXx1zE
	NtmmgEsdMKrPSJxBDAdqjWrF2bXBkrYhNPZXRA8spfhPPMbbI7O0yH2K2IdHh9P/f5ExvC0QVAO
	TRsfU+eH6dMcIjbKRDaIVFKNYM68bUBSgzc1G/ztgn9AV7tQfqPeKy5U3FnbZWOhw+e+bQd8DM5
	mrQ5H3Ru68RrlCy1rX3+noCwRKowhwPFT/rgIMjzWbrusywMM5g0/tMOW0SBHgeomTnYH0lJ2Ii
	ntRLZDqwRA385rROd+wN8aJ2RZj1x2kItT3m2xEJDS2RJDOQQFJ0NZB/CqkZrQcMEpdJ05BINdC
	z8Kegmd8jtPN2xBP8ADuQeQFFFPqgBt/c60Q8RKcbMpG0G9vItixspVxWZy24pCXOtWUvW2OD7M
	UgnLDsyYo24CmHziXu0FVC/gPt
X-Google-Smtp-Source: AGHT+IGzrurCKDAHA2puwM3WJeIi/Do07flXwZ7TOycjcONtFRm0A/LHuoQuvrk5xFsQ3N0FJs9bEw==
X-Received: by 2002:a17:903:3c68:b0:246:80b1:8c87 with SMTP id d9443c01a7336-290272dfb4fmr277119205ad.43.1760389860106;
        Mon, 13 Oct 2025 14:11:00 -0700 (PDT)
Received: from visitorckw-System-Product-Name ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08912sm141650595ad.78.2025.10.13.14.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:10:59 -0700 (PDT)
Date: Tue, 14 Oct 2025 05:10:57 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lucas GISSOT <lucas.gissot.pro@gmail.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
Message-ID: <aO1q4coXPqU/K6KI@visitorckw-System-Product-Name>
References: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>

On Mon, Oct 13, 2025 at 08:54:57PM +0000, Jonathan Denose wrote:
> Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, until
> we implement a permanent solution.
> 
> ---

The "---" line here will cause many tools used for applying patches,
like git am, to discard the content below it [1].

Please don't add this line unless you don't want the following content
to appear in the commit message.

[1]: https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html#commentary

Regards,
Kuan-Wei

> Recently the CONFIG_HID_HAPTIC Kconfig option was reported as causing
> the following build errors:
> 
>   MODPOST Module.symvers
> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> 
> when the kernel is compiled with the following configuration:
> 
> CONFIG_HID=y
> CONFIG_HID_MULTITOUCH=m
> CONFIG_HID_HAPTIC=m
> 
> To resolve this, temporarily change the CONFIG_HID_HAPTIC option to be
> bool, until we arrive at a permanent solution to enable CONFIG_HID_HAPTIC
> to be tristate.
> 
> For a more detailed discussion, see [1].
> 
> [1]: https://lore.kernel.org/linux-input/auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto/
> 
> Signed-off-by: Jonathan Denose <jdenose@google.com>
> ---
>  drivers/hid/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> index 5341aa79f387bd0e5a76266b5928d2c978dd81cf..04420a713be085c8871b4d35255fde4cafd8de0f 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -93,7 +93,7 @@ config HID_GENERIC
>  	If unsure, say Y.
>  
>  config HID_HAPTIC
> -	tristate "Haptic touchpad support"
> +	bool "Haptic touchpad support"
>  	default n
>  	help
>  	Support for touchpads with force sensors and haptic actuators instead of a
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251013-hid-haptic-kconfig-fix-634df2bdac1d
> 
> Best regards,
> -- 
> Jonathan Denose <jdenose@google.com>
> 

