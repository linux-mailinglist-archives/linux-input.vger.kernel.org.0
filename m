Return-Path: <linux-input+bounces-5563-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD7195128A
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 04:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06075B23322
	for <lists+linux-input@lfdr.de>; Wed, 14 Aug 2024 02:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158301CD00;
	Wed, 14 Aug 2024 02:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e69hQIRF"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0747EDC;
	Wed, 14 Aug 2024 02:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723602967; cv=none; b=EY0S8JcQEFHDlckAnx8kiuwGpqx7inK5oiv+eZ1xjAdByJgT+SpGIfyTpaK+IwL+3MSujHUr9uiDpoTS8JGGabUD61ftL3OuvoEhAumvq+EpX0dBPuKFFtwOzGymmj/OgwMyGE/psDGuXLWYe37fgx9mK4AmHA50RuwQQ7f5CWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723602967; c=relaxed/simple;
	bh=z/e/Vw0J4e5obvgn8lfb9etDEk2Oq7XUTJr1vdgeifs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHES0VE0+CVEhzlZVljHER0hKReNsgjtBC6Qgza80CSeFLeTIwcLKE436pCxMGx+0Pp+ZYl1VC/RCSCrFJW8naUCNUJ3kH8kV+3fCelbYmCeZvg/J3jvILYxwM8Vkd/6W7qjTBwJQe2wUzSFchtJzES8iO649AOwhFNnSrapltY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e69hQIRF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70d2b921c48so4730633b3a.1;
        Tue, 13 Aug 2024 19:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723602964; x=1724207764; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGrfiY7leOQdilBK/c5t/S7zb9gbYrFjlFEhTRyYzCI=;
        b=e69hQIRFhWMsztMlS9iVlb/05Q4gnM334gAaBL1MoEJV4jBy22QC9awWUfWQchqnpo
         AuziQe2IyIry6d3WSeiRCXO1GpAC7WmpYJJ9tZdsYAUM1UA7WDqhd4v4RZAJRq0NNl1s
         d5ebSioiOR8NBukgO6i6CX0GSehV0rgn8YNwFSc5pXu8M/pF6xCmRWtftceDwdnxS+hV
         6bLVVAq9fSb0zzEU2T5cJA5LYOcOLY1gZSGurFbyHxW7rMGopCsG63380lHrAuIX0pYb
         tgcGU1loXa8gXtZU2abRZXBBqiq1YiU4wpt97gXegup29t4+fj6p/+zhhGgSyoH45vS8
         UGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723602964; x=1724207764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGrfiY7leOQdilBK/c5t/S7zb9gbYrFjlFEhTRyYzCI=;
        b=c0v6QseqqnB8MvueZktdtdX2DLH4ry6fF2o40huV+09rOaRvVQnoWHeFA1+e1cQRAl
         vuWactsTPEAaTZMj+XXI4ik9lqW/lT0igBltf/wOtCb/XaisMZo03pE4We9KDu78q56V
         MUnL4SCIleasZPjsT7ODJSmnhesm/0D6uwFS3ENYDyGFZK6/8NBhkDlClJy3bLlmRnTa
         u935ziTz3dT+qJiSfFFiW02V/mKNkisAHECvkXuZmYI/hz0pJClVNfDZt1KfZEiwJ2B+
         B6KY8e+qUEE+UXzv9jjSF5T1THN04c3EKU2vLVrbxZn1Qzy5kAzCnOQNIZXrhWDyK/Kt
         HCOw==
X-Forwarded-Encrypted: i=1; AJvYcCWKfoPi+FVd4WXx/LNkmCMQQENMZ3iL7tuOi9C+NGSE/LdyS2eVwpKTQkszDajLGrODsefdrp2/p0HEOZ01ICKcH/WligQlIZ2oWGHzF1FlKLrTyVLPto1Gu2Gods+hI2R+mgPwclOrGGwyIP/ssswNlVJywOYmNJXck+JcWxAp1YzNWnU3
X-Gm-Message-State: AOJu0YzauZKN3jMmsqNxHn31ou3kd6kQ33pyJRuiUIbsSRy1V0uuweXD
	KDDluzm08WqAeeVfLf3APjBuPn4XodMuvm1dkmGrgfoSUHZuJACk
X-Google-Smtp-Source: AGHT+IE2XDoQD0tgEpCNZpFSxZqtp4NHG3T0t2UiTIYkq4SxxY/f4xrxn/uhgImMEp+sN3wtW05MQw==
X-Received: by 2002:a05:6a21:9204:b0:1c8:b849:c605 with SMTP id adf61e73a8af0-1c8eaf86728mr1844532637.44.1723602963657;
        Tue, 13 Aug 2024 19:36:03 -0700 (PDT)
Received: from ux-UP-WHL01 (mailgw01.gttektw.com. [45.117.96.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7f9dc6sm336868a91.29.2024.08.13.19.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 19:36:03 -0700 (PDT)
Date: Wed, 14 Aug 2024 10:35:58 +0800
From: Charles Wang <charles.goodix@gmail.com>
To: Doug Anderson <dianders@chromium.org>
Cc: dan.carpenter@linaro.org, conor@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	hbarnor@chromium.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] HID: hid-goodix: Add Goodix HID-over-SPI driver
Message-ID: <ZrwYDvAtwIbLTS18@ux-UP-WHL01>
References: <20240813133612.49095-1-charles.goodix@gmail.com>
 <20240813133612.49095-2-charles.goodix@gmail.com>
 <CAD=FV=W7rqE+sSbspo6b0un=FbBcxgS24sKLUZ+NTkOdveJObg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=W7rqE+sSbspo6b0un=FbBcxgS24sKLUZ+NTkOdveJObg@mail.gmail.com>

Hi Doug,

Sorry for missing the "Reviewed-by" tag, will fix in v7.

On Tue, Aug 13, 2024 at 10:26:15AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Aug 13, 2024 at 6:37 AM Charles Wang <charles.goodix@gmail.com> wrote:
> >
> > This patch introduces a new driver to support the Goodix GT7986U
> > touch controller. This device is not compatible with Microsoft's
> > HID-over-SPI protocol and therefore needs to implement its own
> > flavor. The data reported is packaged according to the HID
> > protocol but uses SPI for communication to improve speed. This
> > enables the device to transmit not only coordinate data but also
> > corresponding raw data that can be accessed by user-space programs
> > through the hidraw interface. The raw data can be utilized for
> > functions like palm rejection, thereby improving the touch experience.
> >
> > Key features:
> > - Device connection confirmation and initialization
> > - IRQ-based event reporting to the input subsystem
> > - Support for HIDRAW operations (GET_REPORT and SET_REPORT)
> >
> > Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> > ---
> >  drivers/hid/Kconfig          |   6 +
> >  drivers/hid/Makefile         |   1 +
> >  drivers/hid/hid-goodix-spi.c | 810 +++++++++++++++++++++++++++++++++++
> >  3 files changed, 817 insertions(+)
> >  create mode 100644 drivers/hid/hid-goodix-spi.c
> 
> As a point of reference, in v5 Dmitry gave you his "Reviewed-by" tag
> [1] despite having some nits. It's usually expected that you could fix
> the nits and carry the Reviewed-by tag on the next version unless you
> did something other than what was requested in review feedback.
> 
> [1] https://lore.kernel.org/all/ZoW4_hctu_cSiKA5@google.com/

Thanks,

Charles

