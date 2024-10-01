Return-Path: <linux-input+bounces-6945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40B98BD2B
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B95AD1F22276
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C91236C;
	Tue,  1 Oct 2024 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yvo8k5lG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD1863B9
	for <linux-input@vger.kernel.org>; Tue,  1 Oct 2024 13:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727788549; cv=none; b=llyJilawyTiU9l/A5i//xM42gsAU3b34yyIZbiGqG2k0x9XrzFfsO2XgU97nhnJbJv1aJAoPF8k3p1xyqxMkvdz4Fmk6XF5tKj9AQRgJ31b1T+D4pgNBebGFpkeSMX20FX90YYmAAzgMoq0dRRaSmIWuwoMo6o64iPxHjRfo//k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727788549; c=relaxed/simple;
	bh=1B6ZFCeddxSIWcEsjASHe+Plj2V7LTxPPohScpMGuko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OMqq9+p1iPtgyAWlaciM9cA6hqqDsUnlLJJeAKuunLs2PGW/do5sK/RfPp+AejVvuyGZf5s0swP7qTDfQPtihNiE4zCaIxL5JcM0HFNyo88B0cAx7762JJumq37HgedhDdaitL9CkpBrQIE7VxjdMdDphZnSZj3vmc6vvSm1MCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yvo8k5lG; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7e6ba3f93fdso3475183a12.1
        for <linux-input@vger.kernel.org>; Tue, 01 Oct 2024 06:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727788546; x=1728393346; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Rh3Z6Vdqt6Gyp4RV25Ozr3Z7T3F6F4LuAKb8Pq4O7yk=;
        b=Yvo8k5lGCQSRiILSy9DZsfiyKX0LAdWta7cY9WGy4qcWmB6ZaFGelrooHJKik2qO28
         VNkbQHEKlSar9TlftXBLXKUHGfblM0DbhXjfEkf06bLlYnHz0EJZBhMq4V014OL9KxAq
         hkU1bSOgbdlRuSVV9GcWVJbPfp0ceI2+f9MLD5KVDbE+oaJa2UdvOyI++AJGMJ0xqvVD
         kM/JZvW55uriqBgpy39pRtpZfdM6tRq5HuWrcU4JFr7fBpIdACd+PR0PUNIv/jQ5TkeG
         D9g4g0ODSiAPwjth/jUK7fzzDcyAwI6TRtlffzYVN1KvoUeeLloualB+JGqVpzqWIwc9
         EZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727788546; x=1728393346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rh3Z6Vdqt6Gyp4RV25Ozr3Z7T3F6F4LuAKb8Pq4O7yk=;
        b=SVUdY7vLtCjvLUNcDMZqJaZ2mc3Ej0VHv6huyLwyfP4wUdNFrHD/DKO8FfjL7owhuA
         KTY4sh1jmpR/rqNCCfm6mvSSPC301AHbcoSLS+wa8Bao41YLp36Nupas5jnY4SrlCWEj
         2ROJiISF/+mCCXLF5n0DBOvcVkA86VJ1Z23iDnkLwXkuEjDcgOKjnhHJfGRO3NmTviQe
         pqZp4oRMr2fL1dPkBtTuAzg6hYOK5GPVK5F3Mn4ue2qatBDOb3g/UjN7GuoycHcQa01z
         uwkQBspodr/Awpap0PZVRGywubUowxk3FMMEX5ipmcs1xDWZd4dY57DnTHl39dJw9/FD
         oiSg==
X-Forwarded-Encrypted: i=1; AJvYcCVsi8RE7PWhgbXZnTefvFgsJ+hW9+wKU2N+Cfgzu99EG/QpbK0d8BPwfCmCdstvRE1tJ4q5bhuFRSBofQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/gYD/yNEGuwbY5+WrvtWVzZJCRKQLTqADzGSx6gvSf+Dtw+V5
	gXgSncH+LfmjJ2032NtjTtOzm3eSVPb9XdvI747FjIbLBn2qKTbk
X-Google-Smtp-Source: AGHT+IGefQzOYYPzw9DlP2Xrm5mtVN3prpeYOOD91uiy8ZCwUWjN6LbJ2MrKCfJI5gvaZK20hKlP7g==
X-Received: by 2002:a05:6a21:8cc4:b0:1cf:6c65:68d with SMTP id adf61e73a8af0-1d4fa806e98mr23177967637.46.1727788545539;
        Tue, 01 Oct 2024 06:15:45 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:70a4:8eee:1d3f:e71d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26515e8dsm8006294b3a.105.2024.10.01.06.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 06:15:44 -0700 (PDT)
Date: Tue, 1 Oct 2024 06:15:41 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>, Jon Xie <jon_xie@pixart.com>,
	Jay Lee <jay_lee@pixart.com>, linux-input@vger.kernel.org,
	Xiaotian Wu <wuxiaotian@loongson.cn>
Subject: Re: [PATCH v4] Input: Add driver for PixArt PS/2 touchpad
Message-ID: <Zvv1_bHoH94-e33b@google.com>
References: <20240704125243.3633569-1-zhoubinbin@loongson.cn>
 <tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus>
 <Zvu4mMaOzuL3tDTW@google.com>
 <Zvu7JOw0N6XB4ON6@google.com>
 <ykmhjrx7wrwqmhsyi6hawbobwfmwi2mkzyykgprlrq7iss7zet@a5hlj7qyqxxj>
 <Zvvh_tiWQ9Ig7du3@google.com>
 <CAAhV-H6WuYVa=X08NV+2XtDrcxDNfT8ti9zQ0Kc+tWM7m9iLQQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6WuYVa=X08NV+2XtDrcxDNfT8ti9zQ0Kc+tWM7m9iLQQ@mail.gmail.com>

On Tue, Oct 01, 2024 at 08:16:07PM +0800, Huacai Chen wrote:
> Hi, Dmitry,
> 
> On Tue, Oct 1, 2024 at 7:50 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Tue, Oct 01, 2024 at 11:21:10AM +0200, Benjamin Tissoires wrote:
> > > On Oct 01 2024, Dmitry Torokhov wrote:
> > > > On Tue, Oct 01, 2024 at 01:53:44AM -0700, Dmitry Torokhov wrote:
> > > > > On Mon, Sep 30, 2024 at 05:59:01PM +0200, Benjamin Tissoires wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On Jul 04 2024, Binbin Zhou wrote:
> > > > > > > This patch introduces a driver for the PixArt PS/2 touchpad, which
> > > > > > > supports both clickpad and touchpad types.
> > > > > > >
> > > > > > > At the same time, we extended the single data packet length to 16,
> > > > > > > because according to the current PixArt hardware and FW design, we need
> > > > > > > 11 bytes/15 bytes to represent the complete three-finger/four-finger data.
> > > > > > >
> > > > > > > Co-developed-by: Jon Xie <jon_xie@pixart.com>
> > > > > > > Signed-off-by: Jon Xie <jon_xie@pixart.com>
> > > > > > > Co-developed-by: Jay Lee <jay_lee@pixart.com>
> > > > > > > Signed-off-by: Jay Lee <jay_lee@pixart.com>
> > > > > > > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> > > > > >
> > > > > > It looks like this new driver made in v6.12-rc1 but is already breaking
> > > > > > other touchpads in fedora:
> > > > > >
> > > > > > https://bugzilla.redhat.com/show_bug.cgi?id=2314756
> > > > > >
> > > > > > The reported touchpads used to work properly but are now directed to use
> > > > > > the PixArt PS2 driver instead of the old one (I would say it should be
> > > > > > using Synaptics).
> > > > > >
> > > > > > I haven't touched PS/2 in a long time, so it's going to be hard to
> > > > > > pinpoint the error from my side, but it seems that the new driver is a
> > > > > > little bit too greedy.
> > > > >
> > > > > OK, I gonna revert it and hope PixArt folks will figure out less greedy
> > > > > probing sequence (or maybe we need to push it down a few sports).
> > > >
> > > > Although, as I am trying to read the referenced bug, one of the
> > > > reporters are saying that they touchpad is USB:
> > > >
> > > > SysFS ID: /devices/pci0000:00/0000:00:14.0/usb3/3-3/3-3:1.0
> > > > ysFS BusID: 3-3:1.0
> > > > Hardware Class: unknown
> > > > Model: "Synaptics Unclassified device"
> > > > Hotplug: USB
> > > > Vendor: usb 0x06cb "Synaptics, Inc."
> > >
> > > I guess this must be the fingerprint reader or some other synaptics
> > > device.
> > >
> > > In the 6.11 logs (now publicly available), we can see:
> > > [    1.601507] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x92, buttons: 3/3
> > > [    1.614026] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input5
> > > ...
> > > [    2.286700] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input7
> > > [    2.286834] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input9
> > > [    2.286873] hid-generic 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> > > ...
> > > [    2.337123] input: ELAN0672:00 04F3:3187 Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input10
> > > [    2.337173] input: ELAN0672:00 04F3:3187 Touchpad as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-0/i2c-ELAN0672:00/0018:04F3:3187.0002/input/input12
> > > [    2.337212] hid-multitouch 0018:04F3:3187.0002: input,hidraw1: I2C HID v1.00 Mouse [ELAN0672:00 04F3:3187] on i2c-ELAN0672:00
> > >
> > >
> > > So the touchpad seems to have the PS/2 fallback, and then switches to
> > > i2c-HID. However, with PixArt the PS/2 touchpad isn't initialized, and
> > > doesn't answered to i2c-hid (or is too much initialized, not sure).
> >
> > I see. It is interesting that the first probe fails:
> >
> > [    1.649119] psmouse serio1: pixart_ps2: init: Unable to query PixArt touchpad hardware.
> >
> >
> > but then it goes and detects it a bit later:
> >
> > [    1.945075] input: PS/2 PixArt clickpad as /devices/platform/i8042/serio1/input/input5
> >
> > It would be curious to get the logs of the failing case with
> > i8042.debug=1
> >
> > Anyway, I reverted the patch adding the driver and will send a pull
> > request to Linus soon.
> Don't revert now, I found the root cause:

OK, so please make a fix and resubmit the whole thing for the next merge
window. I think it needs to cook a little bit more and get more testing
before it can be merged in mainline, given how fragile PS/2 detection
is.

> In pixart_read_tp_type(), we can see
> 
> +       error = ps2_command(ps2dev, param, PSMOUSE_CMD_GETINFO);
> +       if (error)
> +               return error;
> +
> +       *type = param[0] == 0x0e ? PIXART_TYPE_TOUCHPAD : PIXART_TYPE_CLICKPAD;
> +
> +       return 0;
> 
> This means, a non-pixart device will also be detected as "pixart
> clickpad" and return 0,  unless the ps2 doesn't work at all.
> 
> And then in pixart_detect(), we can see
> 
> +       if (set_properties) {
> +               psmouse->vendor = "PixArt";
> +               psmouse->name = (type == PIXART_TYPE_TOUCHPAD) ?
> +                               "touchpad" : "clickpad";
> +       }
> 
> This will confuse the later logic.
> 
> Huacai

Thanks.

-- 
Dmitry

