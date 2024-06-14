Return-Path: <linux-input+bounces-4366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E55490900B
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 18:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF9131F22242
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 16:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A6216D9D5;
	Fri, 14 Jun 2024 16:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KcbTtm8a"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502116B751;
	Fri, 14 Jun 2024 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718382173; cv=none; b=h1QU6T87EGIPY3DlSTtw7J38qb/xJLK15YAsN480dPYI1OUmvrMDck4N8M9f3iH2WWSUosOXZH9OmGSbmi7TkJsQTsLYFKv63i1A509qmx6ppgdZkmrP8h0Q18u/33Wj1D/uuP7mktMN602quDBpPjsBzfy1r51tLJs+hRkRNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718382173; c=relaxed/simple;
	bh=fnbAgLOTfMMiJeUuSE5XbkbSe0qtEODYCIGVydsfSfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qZUHZtnqfZ+FZ3GsfHwISnYzQGgvQeT7JSTZVGdnl3edy6UaDP0U4R1r1JXZyvXp+vKZgnQaIbzXxwC4+K0AdECv30WVB7q3XOkEG7BffjDev57y/9Q9tk+pK9Bn3lb5v3ZJEW24/PToVCHbQRs4VvPGBew55m/WEgAvO2yk8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KcbTtm8a; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421757d217aso26020765e9.3;
        Fri, 14 Jun 2024 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718382170; x=1718986970; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHoUDsPBAFKjfdKT2Wcw7fH+ZbNcrP0Oy7YLPMG/sbY=;
        b=KcbTtm8aNLnqD2RRn/UprMEj2qky6ffWZHBptC1rtHNVAKrxSED57LKjuUYBtZtHR5
         KBHOnLAPHaOT4vtxOPL0tMp/F3jBfIZZMAa+G0etzRlPqa+dY40amGlDmTSzqmlYEl4g
         bTHL9qepD6P2E087UZN2Lv5hRNhpoZLJH78u3h9/eHNLInJtaMGMfSfvlCAWLQVuhcr2
         T3Ib3AAuNjS+MvsnY91ms0TBEU2UQg8GFKN7lBjknW03ITVRrY2INvpGJwaTjOk1Ab7H
         PpMszVgyiXWLdJ1tFfF2bAvAKd9JI6iL+sz5WqaH2TGmA5gQrRh/qw/2FwhkoAe2/GKo
         zZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382170; x=1718986970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mHoUDsPBAFKjfdKT2Wcw7fH+ZbNcrP0Oy7YLPMG/sbY=;
        b=XSxe/1nzCW8aY7ImkfMMAltbWwONtYcg0k9oi4tGN22b48hZolrhXNG2xs8I7yESyd
         Ia/Xpap0QiE8AeOHsg09CL7mTc2i6p14Gt7wawq83FkNqhNVlv+SwxHDnkVX6GiKx+XP
         W2GDvlJoeUR30/VpXAl5xjPPlnu2ajzeyHjvFm8Xw2/U00LEKuVGUkBWGuNP82QGjrpT
         iLXJMjBbzCxavIVoKgu44fgfxbiYMnZO+oeYp664Xe0tTxVx5jcb8fFDV8Yv0bn34qLC
         R4zR2zAfcTaJBIrxIsni1EiPk4GyRljSA7CMW38tVpkwX6LiIBDoomSrXyTxzMixoK6Q
         MaPw==
X-Forwarded-Encrypted: i=1; AJvYcCX7/Qi9faH7SuUhG8PnndrIqS+n7SmyrfP1rL86PUpT/BilKs12ZcVW5VwF4hb7kcOrO1YawYfoY9m1MUnVkUGR9gb8OanFjeL621NfVIjQ0HPCvv6eLGRAVI2+9GHsUN/1RqtC6GbKwHE=
X-Gm-Message-State: AOJu0YzE6TBjCF3bHaSILHgtCEl5mYUMx6+TkggwF0Pb+9wXO1DviZ+K
	UM/KLLwyOVgTDYQ3wvZ+Kla5eXjmx8XXgRFsUsmYvO+f/j+eBxmD
X-Google-Smtp-Source: AGHT+IHwPKb1oVe0OzriUhNOuh2dGKMPOr/keG0NpDIvE0NFORARtKt4Neke5HYOGPm38GZt1pemrQ==
X-Received: by 2002:a05:600c:32a7:b0:422:1a82:3ed2 with SMTP id 5b1f17b1804b1-423b506058amr4577075e9.27.1718382169973;
        Fri, 14 Jun 2024 09:22:49 -0700 (PDT)
Received: from fedora ([213.94.26.172])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602e0c2sm66620215e9.14.2024.06.14.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:22:49 -0700 (PDT)
Date: Fri, 14 Jun 2024 18:22:48 +0200
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Fabio Baltieri <fabiobaltieri@chromium.org>,
	Ivan Gorinov <linux-kernel@altimeter.info>,
	Johannes Roith <johannes@gnu-linux.rocks>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: uclogic: avoid linking common code into multiple
 modules
Message-ID: <ZmxuWKX9lFv3pHqG@fedora>
References: <20240529094816.1859073-1-arnd@kernel.org>
 <ZmSi5_-4mD4AaIJW@fedora>
 <54c19328-35e2-4506-aa3a-a0b08813d873@app.fastmail.com>
 <Zmcwlt6Kfpt09tKi@fedora>
 <8d93cdd6-379b-48e7-8a10-9df190b12623@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d93cdd6-379b-48e7-8a10-9df190b12623@app.fastmail.com>

On Mon, Jun 10, 2024 at 08:25:15PM +0200, Arnd Bergmann wrote:
> On Mon, Jun 10, 2024, at 18:57, José Expósito wrote:
> > On Mon, Jun 10, 2024 at 08:24:51AM +0200, Arnd Bergmann wrote:
> >> On Sat, Jun 8, 2024, at 20:28, José Expósito wrote:
> >
> > Turns out that, since the last time I checked the KUnit docs,
> > we have "EXPORT_SYMBOL_IF_KUNIT" available now.
> >
> > I think we can use it and your final patch, without the MODULE_*
> > changes, could look like:
> 
> Looks good to me, can you send that with
> 
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>

I couldn't add the "Reported-by" tag because check-patch throws a
warning if it is used without a "Closes" tag.

Other than that, I sent v2:
https://lore.kernel.org/linux-input/20240614161935.230529-1-jose.exposito89@gmail.com/T/

Thanks a lot for looking into these warnings!

Jose

> ?
> 
> Feel free to take my original changelog text if that helps
> 
>      Arnd
> 
> > diff --git a/drivers/hid/Makefile b/drivers/hid/Makefile
> > index ce71b53ea6c5..e40f1ddebbb7 100644
> > --- a/drivers/hid/Makefile
> > +++ b/drivers/hid/Makefile
> > @@ -154,10 +154,8 @@ obj-$(CONFIG_HID_WINWING)  += hid-winwing.o
> >  obj-$(CONFIG_HID_SENSOR_HUB)   += hid-sensor-hub.o
> >  obj-$(CONFIG_HID_SENSOR_CUSTOM_SENSOR) += hid-sensor-custom.o
> > 
> > -hid-uclogic-test-objs          := hid-uclogic-rdesc.o \
> > -                                  hid-uclogic-params.o \
> > -                                  hid-uclogic-rdesc-test.o
> > -obj-$(CONFIG_HID_KUNIT_TEST)   += hid-uclogic-test.o
> > +hid-uclogic-test-objs          := hid-uclogic-rdesc-test.o
> > +obj-$(CONFIG_HID_KUNIT_TEST)   += hid-uclogic.o hid-uclogic-test.o
> > 
> >  obj-$(CONFIG_USB_HID)          += usbhid/
> >  obj-$(CONFIG_USB_MOUSE)                += usbhid/
> > diff --git a/drivers/hid/hid-uclogic-rdesc.c b/drivers/hid/hid-uclogic-rdesc.c
> > index b6dfdf6356a6..6c7a90417569 100644
> > --- a/drivers/hid/hid-uclogic-rdesc.c
> > +++ b/drivers/hid/hid-uclogic-rdesc.c
> > @@ -17,6 +17,7 @@
> >  #include "hid-uclogic-rdesc.h"
> >  #include <linux/slab.h>
> >  #include <asm/unaligned.h>
> > +#include <kunit/visibility.h>
> > 
> >  /* Fixed WP4030U report descriptor */
> >  __u8 uclogic_rdesc_wp4030u_fixed_arr[] = {
> > @@ -1242,3 +1243,4 @@ __u8 *uclogic_rdesc_template_apply(const __u8 
> > *template_ptr,
> > 
> >         return rdesc_ptr;
> >  }
> > +EXPORT_SYMBOL_IF_KUNIT(uclogic_rdesc_template_apply);
> >
> > I hope that helps,
> > Jose

