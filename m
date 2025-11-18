Return-Path: <linux-input+bounces-16169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AB624C67DDB
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 08:16:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EAD8A4F3353
	for <lists+linux-input@lfdr.de>; Tue, 18 Nov 2025 07:12:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20BC263F28;
	Tue, 18 Nov 2025 07:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STwthzC3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6741A2DCF61
	for <linux-input@vger.kernel.org>; Tue, 18 Nov 2025 07:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763449925; cv=none; b=J/EAe5CYOjwiidTA2auZOWhWsx2ElaeZJiC3sr5M/0voONcQVr/gUf1jCaR0Kxe9hb14jQIq1gErdWGHBMlC5rY1B2/tE5r+lepNRwm7+tqoMZapbfEG/Or+cG8Dkho31wYZCyP3iZhX0hrdd65U1F80xyS5m+4hzORvK7VCZYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763449925; c=relaxed/simple;
	bh=kqxE2BvMtXb19N0N5j2AatSUtc6E2GvOh549bXFjZO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ViPHYnr+L2At+4QRdBJcQ/Ql3c+DuYofDIDbBHOyIb8t0cHWd7te2VBnzSkQKG49tYUWMx6arsL9fxXpMntXeDpcav4OXQDnJPwPY/OP/mtdFe98MSO6adwVI31MnwQfRQ+p4W/MhLNE7TH45yJxG4BcX+xo7wnNCPWr4P7zy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STwthzC3; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9387df58cso1325764b3a.3
        for <linux-input@vger.kernel.org>; Mon, 17 Nov 2025 23:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763449924; x=1764054724; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P31eobwb2WX4rPDbQxiFfXegN3L1RPYkm6g63KDXmkE=;
        b=STwthzC3h0g/sOKTwi593XhPAg00RZUTWhev4Aivj/RTOnxp90FonitGVXkqhNATdt
         MV5CtkG4SkOH68O4jFp4adL62uX8CpdGbo9P1QJorrkiLh5gqUCf8YB7vPN07fQl7Qo1
         uZEjHi7tooAbdosJxuEAt4cZdNyt8lTT3lHujXZ+PlWXzblcEuDxWNw2BeMqm2ekmKkf
         KCKnn5QXJphOlnOQuk15A2xLfCqiOS2hp2mn5OffbafPjttOz8ZFIfO9POl5KeOnvCmE
         QETSItx40GdZfsOz0G4WEvQUBUTENw4/5DUGCWrrTnJF+kn+dBhqiY8rY78nXXjBT79B
         7O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763449924; x=1764054724;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P31eobwb2WX4rPDbQxiFfXegN3L1RPYkm6g63KDXmkE=;
        b=lPTPsuULu1p8xZySeeD2DfqWu4arK1vQZhI9e/Mrzd/9gIC6DPjAnL7cYNq8WfFlSX
         8DPaxzLF7i1xGwirv/C4UJhvsAVjMX5gS9rnUZJ/kSaaM+S4XxTWiPYiejGWmF2EaNoR
         Amks8nmw/VrOcgE2qCa/2tKNQ80tv3bHnlArJ7UZ+XFqFq6zTtSTcZdIuIfM6P6TvPM7
         GOP66FJBoGvKftpGyrA8VdeV82k0amO16kpvP0W2RC3dvGUMsvRSrt1p/haQfoyPfNPf
         a5NJWoVU20mdZfXDQlZ10D+q6zitg+/fkox4LBeO5zlvIW9u9jaJHGz7heGxDLRENhk4
         O2xg==
X-Forwarded-Encrypted: i=1; AJvYcCVM+CXHgV+Z4C+RQFaKGi8bv2UsDHobSkHQuzNVCN/EeU/e7SdGHQc01NLWNFr7hu1nN2pNFsDu2oE+Nw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxynqGfwsQwgnGtuTlrmN+TPmQE5X2e4L2f9rmoE8i0NM63JVC
	TxUvnUk09/PS1jYEfWZ34/PzWGMmp7Xteo5KK+ieJsYf3Z3xMcEtcWaP
X-Gm-Gg: ASbGnctLkCuKw06sWAhF8x9x9qf1rmux7LnTnjOnIcDNbUg0y0Y6TeziYyTd7MLyv60
	ZJLROn3m7q4/aNmieoxfItzEszH8WNGp7NQP2fHOtre+5uRmpTiCooEJS4vo/MGlvr3ETWi1VjH
	h3z+b53YQnM0eyDzyZ3BHo5Iljh7iVIhQK2s89HYPWVZ3SzVLbCl1FpwqNGStKRZsoQyPBmgruA
	OLQzzjEjEVA4/pq1ePYphKrFOwwnZOxvc+AA/oosGT2MmiZc8QnrikxsDF81uhPIPwu+qy87OWP
	LfJWmBVWi30AvR6ONth8NLTgvyvYtriY8/u29nNGn460v54vTo58jjyb+UeYNzTr9hbbTmLp3yZ
	uXs8okGjWCc5IDgRN582cF3wVWphQfjC2QfQ4iG1AET/HCndb7HMHExIj8ZzYZR0mpG+nDDotvJ
	Fu/7zwtYYg7yEHF+zfjumzqzg3merMF2VMk0XYcwlbnn+Men25RCmm
X-Google-Smtp-Source: AGHT+IFKU9joUMgDkKTU6HYQwbc8tqDI8RbaRoS2Lr7i4ZfwDoynLBGIbmA7mWAdHFzZu3XZJ5YZIA==
X-Received: by 2002:a05:7022:7e81:b0:11b:9386:7ed3 with SMTP id a92af1059eb24-11b93868327mr4742740c88.48.1763449923520;
        Mon, 17 Nov 2025 23:12:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a011:6b85:c55d:d1f5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11b0608860fsm48179218c88.5.2025.11.17.23.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 23:12:02 -0800 (PST)
Date: Mon, 17 Nov 2025 23:12:00 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] HID: multitouch: Toggle touch surface on Elan
 touchpad on lid event
Message-ID: <v24zlqrmvov4gdjoa2xa7qv353pilgq2d6ag6nprgeue7tai4f@a4i632p5fbme>
References: <20251111-lid-switch-notifier-v2-0-789723d78d89@google.com>
 <20251111-lid-switch-notifier-v2-2-789723d78d89@google.com>
 <iazucnirwewmavtsxudcynuoy2afzxhzr7nre2wke4d7glypcu@jtotz5oivpsu>
 <CAMCVhVMPuoaEzTthmaOBR+YbT3AN2YPKRv3XAw_r4owUvSRCKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVMPuoaEzTthmaOBR+YbT3AN2YPKRv3XAw_r4owUvSRCKQ@mail.gmail.com>

On Wed, Nov 12, 2025 at 05:49:53PM -0600, Jonathan Denose wrote:
> Hi Dmitry,
> 
> Thanks for your review.
> 
> On Tue, Nov 11, 2025 at 4:37 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Jonathan,
> >
> > On Tue, Nov 11, 2025 at 09:34:07PM +0000, Jonathan Denose wrote:
> > > Many touchpad modules have a pin which is expected to be connected to the
> > > lid angle sensor in laptops. The pin sends a signal to the touchpad module
> > > about the lid state and each touchpad vendor handles this notification in
> > > their firmware.
> > >
> > > The Elan touchpad with VID 323b does not always have this aforementioned
> > > pin, which then causes interference between the lid and the touchpad when
> > > the lid is closed. This interference causes a few seconds delay before the
> > > touchpad works again, or it causes it to be come completely unresponsive.
> > > To circumvent this hardware issue in software, implement a device quirk
> > > which will allow the hid-multitouch driver to register a notifier_block
> > > to listen for lid switch events. When the lid switch closes, the
> > > touchpad surface will be turned off and when the lid switch opens, the
> > > touchpad surgace will be turned on. This triggers recalibration which
> > > resolves interference issues when the lid is closed.
> > >
> > > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > > ---
> > >  drivers/hid/hid-multitouch.c | 32 +++++++++++++++++++++++++++++++-
> > >  1 file changed, 31 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > index 2879e65cf303b1456311ac06115adda5a78a2600..9a89913c193bc110a0a821a901aebd97892c66bd 100644
> > > --- a/drivers/hid/hid-multitouch.c
> > > +++ b/drivers/hid/hid-multitouch.c
> > > @@ -35,6 +35,7 @@
> > >  #include <linux/device.h>
> > >  #include <linux/hid.h>
> > >  #include <linux/module.h>
> > > +#include <linux/notifier.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/input/mt.h>
> > >  #include <linux/jiffies.h>
> > > @@ -76,6 +77,7 @@ MODULE_LICENSE("GPL");
> > >  #define MT_QUIRK_DISABLE_WAKEUP              BIT(21)
> > >  #define MT_QUIRK_ORIENTATION_INVERT  BIT(22)
> > >  #define MT_QUIRK_APPLE_TOUCHBAR              BIT(23)
> > > +#define MT_QUIRK_REGISTER_LID_NOTIFIER BIT(24)
> > >
> > >  #define MT_INPUTMODE_TOUCHSCREEN     0x02
> > >  #define MT_INPUTMODE_TOUCHPAD                0x03
> > > @@ -183,6 +185,8 @@ struct mt_device {
> > >       struct list_head reports;
> > >  };
> > >
> > > +static struct hid_device *lid_notify_hdev;
> >
> > This should really be per-device.
> 
> Just to be sure I'm following correctly, the initialization of
> lid_notify_hdev should be per-device?

Yes. I believe this is the best practice.

Thanks.

-- 
Dmitry

