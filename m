Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCD7E14492E
	for <lists+linux-input@lfdr.de>; Wed, 22 Jan 2020 02:05:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgAVBFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 20:05:01 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41225 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728609AbgAVBFB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 20:05:01 -0500
Received: by mail-pl1-f194.google.com with SMTP id t14so2131489plr.8
        for <linux-input@vger.kernel.org>; Tue, 21 Jan 2020 17:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=lMWF4oYPKXj4AfbeunVAiXIgHshatN7223Vq0UjWqCA=;
        b=Yi/797m13kfs5JPEbcHc6NvrGydvkVF3Bnd32wTlV18lMktb/JACfiBUMGmGlSWHcw
         jxWXZXRqWn1F6AZMwH8L7bYERbDWuVaQud3GY7Wvo7nuIkgQSKd1PvMn6qwgAY2VORJ2
         VWZQbo1KVsCv16vM9jeYf2UKZwUlD+1Eb4ESGCxoWHb8QXsTdT4+MpvARpoLukLuhKFx
         15N0JfhrouCVryeRqdKARE0WubFWCun7z0eYi9wRORyKMhYtXR7v1mfdTxkFqHTkSlkk
         oMnJSasSOnakNrcvfkZG7jCR4ICYE9qSrop+GcHRAHnSpzdhoSMslrZTD13RE16Wkoqc
         vNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=lMWF4oYPKXj4AfbeunVAiXIgHshatN7223Vq0UjWqCA=;
        b=I6MTLhFeGLUXmkGYQJ8YeU/5eKSqSMrHmg7QgvkBi58G3BqWe6r3pXGkak8leQ+WFY
         SzGyaAcsgTbSomwf95n1kfE9FKnHZdN84FCo/TLiLFj1Q27G3OlOSsZInX5LXOX6hsuM
         bDm9heLr5yI0B9FecCfLBrlCuumEPQDg+7d6x7Z5+U3Zh1AokMHT+zAo6ZLsCx4V9cDx
         dpy11BWURp+ipDBuRFZpM92Qf8AJu7zJldonrzBKq/rM4DWMiL5x4R34kXw7mi85tOeC
         TrcFbhyzLhk2OLy3kZOreLNKqw5QNL8jBUMw63Vmyk+I2mNvXcyBuXUxcEGVwvBMA9a1
         wUHw==
X-Gm-Message-State: APjAAAVknxoSjeLyZOVKj+x5cY8SEfNZmTYV6F2iVvkW/W5zLrUmgFLt
        /ELHCcPm+gCTSLLlSPauBtpAoGeR
X-Google-Smtp-Source: APXvYqyvTvbJBCmXh2J9TaOaS4xlqm7F/2ph8QnZsZMujDnTvCRXnYwuObuamTnh8mKMrjSYmQS+BA==
X-Received: by 2002:a17:902:6b8c:: with SMTP id p12mr8137267plk.290.1579655100246;
        Tue, 21 Jan 2020 17:05:00 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id n15sm43293518pgf.17.2020.01.21.17.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 17:04:59 -0800 (PST)
Date:   Tue, 21 Jan 2020 17:04:57 -0800
From:   "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        "Leutwein Tobias (BEG/ENC1)" <Tobias.Leutwein@de.bosch.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
Subject: Re: [RFC] linux-input alps - loosing precision
Message-ID: <20200122010457.GA110084@dtor-ws>
References: <988f2b799a6046af87a25c996ebbfacb@de.bosch.com>
 <20200117094206.xu47p6ybxmsf5ne2@pali>
 <20200121213441.GO47797@dtor-ws>
 <20200121233558.GA399961@jelly>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200121233558.GA399961@jelly>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 22, 2020 at 09:35:58AM +1000, Peter Hutterer wrote:
> On Tue, Jan 21, 2020 at 01:34:41PM -0800, dmitry.torokhov@gmail.com wrote:
> > Hi Pali,
> > 
> > On Fri, Jan 17, 2020 at 10:42:06AM +0100, Pali Rohár wrote:
> > > On Thursday 09 January 2020 14:26:16 Leutwein Tobias (BEG/ENC1) wrote:
> > > > Hello,
> > > > 
> > > > At the file
> > > > https://github.com/torvalds/linux/blob/master/drivers/input/mouse/alps.c
> > > > I've seen that values coming from the trackpoint/trackstick are divided at some devices, which results in a loss of precision.
> > > > 
> > > > As I was not lucky with the behavior of the trackpoint of my computer I've made a fork of libinput https://gitlab.freedesktop.org/leutwe/libinput/tree/master/
> > > > where I changed  src/filter-trackpoint.c . With this change, the values from lib evdev are multiplied by a factor (dpToFac_au16 []). The array element used from dpToFac_au16 [] is also the value received by evdev.
> > > > 
> > > > At higher forces I use a factor much higher than 1, so the undivided value from the device would be the best for me.
> > > > 
> > > > In order not to change the behavior for other users, it might be possible to change the divider at runtime via the sys- file system - like it is at trackpoint.c and take the currently used divider as default value.
> > > > 
> > > > Positions at source code were I see the division:
> > > > 
> > > > alps_process_trackstick_packet_v3()
> > > > /*
> > > > * The x and y values tend to be quite large, and when used
> > > > * alone the trackstick is difficult to use. Scale them down
> > > > * to compensate.
> > > > */
> > > > x /= 8;
> > > > y /= 8;
> > > > 
> > > > alps_process_packet_v6()
> > > > /* Divide 4 since trackpoint's speed is too fast */ input_report_rel(dev2, REL_X, (char)x / 4); input_report_rel(dev2, REL_Y, -((char)y / 4));
> > > 
> > > Hello Dmitry!
> > > 
> > > This problem is about fact that alps.c for some ALPS devices already
> > > truncate precision of trackpoint movement.
> > > 
> > > Tobias is unhappy with this fact and would like to get all bits of
> > > movement information, not just some high.
> > > 
> > > But existing userspace application expects that for these devices kernel
> > > already truncate precision and process truncated data from kernel.
> > > 
> > > Now question is: Are we able to send to userspace input data without
> > > doing truncation and without breaking existing applications?
> > > 
> > > It looks like that for such thing we need some userspace <--> kernel API
> > > which disable truncating of precision.
> > > 
> > > Have you been solving similar issue for other other drivers or in other
> > > area of input code?
> > 
> > Unfortunately I do not think we can automatically "recover" the lost
> > precision without help of libinput, which would need to tweak the
> > trackpoint [sysfs] property letting kernel know that it should send
> > original data.
> 
> Right, so the problem here is simply: we don't have write access to sysfs
> and most of libinput's users don't either. For evdev devices it's fine
> thanks to logind but that won't apply for anything else. Which means that
> sysfs is no-go unless you want to shell-script your way around it.

I wonder if we can do this via udev rule that [newer] libinput package
would install? I do not think we need to support multiple input stacks
on the same system at the same time, so system-wide config could work...

> 
> It's been a while since I looked at the trackpoint code but from what I
> remember it's a historical mess of inter-dependencies. The kernel driver did
> something, then userspace adjusted based on that, then the kernel driver
> couldn't fix anything because of userspace, and that looped 3-4 times.
> 
> libinput has the magic trackpoint multiplier quirk to work around this
> deadlock but multiplying doesn't give you precision back. As an immediate
> brain fart, maybe we need a "subpixel" REL_X_FRACTION axis?
> Not ideal, since every relative device other than trackpoints just pass on
> device units and rely on userspace to make sense of it, so the trackpoints
> will likely stay the only users of it.
> 
> Alternatively - add the sysfs file, make libinput read it and adjust its
> behaviour and then eventually toggle the default. Less breakage that way but
> now you're talking about a multi-year inertia. And you rely on userspace
> updating with the kernel.
> 
> Or introduce a resolution field for the EV_REL scope. Not sure how to do
> that either and let's be honest, it wouldn't really be set by the kernel for
> most devices anyway because it doesn't scale well (would've come in useful
> for the various dpi settings on mice though).
> 
> That's all I can think of right now. For any solution - the libinput bits
> are the easy ones, it's the inertia and possible other input stacks that are
> the killer here.

Yeah, none of the above options with new resolution, or event code
appeal to me too much.

Thanks.

-- 
Dmitry
