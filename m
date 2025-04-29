Return-Path: <linux-input+bounces-12057-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC473A9FEE2
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 03:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C06773AFEBE
	for <lists+linux-input@lfdr.de>; Tue, 29 Apr 2025 01:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364C113B58B;
	Tue, 29 Apr 2025 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjJ1IbbV"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28963C26
	for <linux-input@vger.kernel.org>; Tue, 29 Apr 2025 01:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889553; cv=none; b=DnjO1WOVgUcMaUCUIq8rNCXzlRiQBeF+UAstBKm/7K+maxSeb+V1CUS67VjYX1xtGD2aTepF4T3eyQ7EF+YSdZIhmpn0+zX3RsNEagFRjBjoJKgzponG+hKIUdwktSUHqtQu8P0k4+sLCWo94L7p18Gx+rXKen2Dek3u62KLiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889553; c=relaxed/simple;
	bh=VI9YvIby/h7vbuq/PZ6AvxDHnVk0kLkBAS8MHsO2uc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjBipUp/rAFevylLbtfjW1TGOB4UHlr6fw9SBWJG1BLbBssoGdHmaSImfHsFhLnDb1Z4LGbu1qd9YJkQeoUkxkSsFW3lEspYCUfMwtkE/2wjrgX8cP1jEWxrH5bZzHjxfTeYXlFM4ou1gaB3kviklKEeKrOl0qovHdq/GtmbhCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjJ1IbbV; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739525d4e12so4553286b3a.3
        for <linux-input@vger.kernel.org>; Mon, 28 Apr 2025 18:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745889551; x=1746494351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MuSnZEeRxe52vUvOTQT1XD4R2clfhzSQlvP707QmVps=;
        b=cjJ1IbbVQQ8VDeDRhcObnaDG8eLb39cit0eRg4bQb2/UGgUXIqdSFxMzphtTLF5Lkz
         UNBD7CS2Ko/ttgbLDmHBMu/HJ2cMS39f6kv1JRe1p5Q81xxRxDbu6qV7Fpu1OXl1kqIN
         Lt0gj/yOEjVceuMxizRig4cleVN+jlFenVGq3V6ogDfnseP6M5rMo3GpKs9JFUOn7NJX
         DN8YIgeECMxlX88drDEC7s6fPAsTgcRWHSlODAde4NiVjXhHpLPn4zRlJVPrQ3u2L7Vh
         GjrKRQXgYPAdEcshwOA2fvNTyPXs4vNeXKw1hw1EZkUmNJO7lGhSkpHuN40pKSqj2Can
         qajg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745889551; x=1746494351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuSnZEeRxe52vUvOTQT1XD4R2clfhzSQlvP707QmVps=;
        b=p8FnkypLZpSJCbUFo+G6ukWK3VBq7JA14kn8GYUfe+9Y1YnUjXAeVJV9g08XrR5YSW
         +frzcPYkwulXMCAVqEQbUPOFORBvRTweZ3SM5m37oYtTA7IeCzydOTo68WnhYOgBm1pn
         klDsybMsSe7OBJdr+htGRZ4FnZ0coVSs3QuPpPUK5NFvmscDnI8feoURr51QwBsh7odd
         yd9NDwD71GOLr3ZiSifVpH8esALyoTKOR+h3g0j8c3tutz3ZWuJb+RA/0EAhWYVFwT9v
         r+yRdGJgDmS0hrFcAEgdQH+gsK+5dllmfucwa4tgVE/vdXKsXp15OyzNGkuCnwtGs9eO
         RtBA==
X-Forwarded-Encrypted: i=1; AJvYcCWrUQ3qGzfpZDCZ3c6nmwL9VxQbia+Pp6O+WfxmyoFCQIPH6OANEyXzypu21O4l3aLgakeLtGtvqUCvvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVX1/5fJ12TYZVq7F6SYzpPN3bP9R5X7ycPXF5esmaoJaeDgI
	enRUEjqGckpyh1+2H25aIieOx7/wrwjflcPhcHC69uK+ZVn+8R1oVcfUiA==
X-Gm-Gg: ASbGnctRweaYchubrutqJGBhgf1RJpNy903vT/bI69+qpotVD0SXDsipoXFENcrN8kk
	J+ETBByj6p/gU9C7v8a2M8T3O16bH8XANzxEptPhCXgo6wg4KGuZL/McHUEH3k7yH1mjF6kfq/f
	lFw/f2W9J4DBZjvDXnIxGSAqnHb+kA6Q+4mtpNFRsgerbxA+z57WFy0OYQ4eo8fZVIft+J4Te+T
	JvYviWcnYqr/L0hq3PX9RfUdkwM5DGzD1yl/8JBucbprt8sLTwSm6U1cuuHR9pHE6+rUK+bB5bG
	lVZGFKmzxOHc89m3QUqcbCL13fmrFZLVzdIhfaSF8Q==
X-Google-Smtp-Source: AGHT+IHCA6pF8f1OHyjxY7w79VXMsMsOTcLnOUxofw9D46eEnMU4qIApW19Vt+K5QEdtcfzLgIVksA==
X-Received: by 2002:a05:6a00:21c6:b0:730:79bf:c893 with SMTP id d2e1a72fcca58-74028f946bdmr1646443b3a.4.1745889550794;
        Mon, 28 Apr 2025 18:19:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:adc2:8397:4f51:d5a0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25912efbsm8716699b3a.23.2025.04.28.18.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 18:19:10 -0700 (PDT)
Date: Mon, 28 Apr 2025 18:19:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: jt <enopatch@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>

On Thu, Apr 24, 2025 at 08:18:00PM +0100, jt wrote:
> On Thu, 10 Apr 2025 at 20:48, jt <enopatch@gmail.com> wrote:
> >
> > On Thu, 10 Apr 2025 at 10:02, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> > > And please send me another dmesg of boot with the above config and
> > > i8042.debug=1.
> >
> > My first attempt was with "i8042.nomux=1
> > psmouse.synaptics_intertouch=1 i8042.debug=1". With this combination
> > of parameters, libinput only sees 1 pointing device which it describes
> > as "PS/2 Generic Mouse". However, both the touchpad and the trackpoint
> > are able to move the pointer under xorg.
> >
> > I then thought to try removing the "i8042.nomux=1", leaving only
> > "psmouse.synaptics_intertouch=1 i8042.debug=1". libinput now shows 2
> > pointing devices: a "Synaptics TM2769-001" and a "PS/2 Generic Mouse".
> >
> > I have attached both dmesg outputs for the above. I can attach as many
> > different dmesg outputs as would be helpful to you - just let me know
> > exactly which different parameter combinations you would like me to
> > try.
> 
> Hi Dmitry. It has been a couple of weeks since I sent this, and I just
> wanted to make sure that you had received it.

Sorry about the delay. I looked at the device initialization and the
"TouchStyk" device does not respond to the Trackpoint protocol queries,
so from the kernel point of view there is nothing distinguishing it from
a barebones PS/2 mouse.

Peter, is there a way to add a quick based on system info to libinput to
identify that PS/2 device as a trackpoint variant? Unfortunately HP used
the same PNP IDs for the main touchpad and the trackpoint...

As far as the main touchpad module goes I am about to send out a patch
to add it to the list of SMBus-enabled variants. Would you like to be
credited as "reported by"? If so what should I use as name/email?

Thanks.

-- 
Dmitry

