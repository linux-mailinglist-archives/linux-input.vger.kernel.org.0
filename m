Return-Path: <linux-input+bounces-12604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC44AC5C0D
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 23:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1B821BA6B98
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 21:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4489C21171B;
	Tue, 27 May 2025 21:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1Ru/yxT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8C520C47F
	for <linux-input@vger.kernel.org>; Tue, 27 May 2025 21:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748380351; cv=none; b=NEHV4t6/j7+alHAlecRzK555zoCbuvGemXxZtJQg5EKhe0+5fE/vkslI93zdKc0ssB7DQFmLqklPiVw6LUme0ySLMEL9dFjEwd+fWDzYn26j5T6tFsiiPMtASMgWPJCGvJct64iEAMtSrA+Q1lj+9qCnltQt8NnQiZMLOMlWXbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748380351; c=relaxed/simple;
	bh=ac4BIBqCYFpF6upgY5BjmFnrKc/WAgrzN3U1i+9qmIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8clR6oZT5OsTAoxVfg9vOdZdvWDozY2YDY5Lpy9AOR/8vThdHyqajhu3902mAMObd+x5UZZtbbB/cGXtjiSvGrAZLjHoUC4Rw/Wc46grBE6XfB6NW8bohd1rYZ5QOlBLAmY2/x7eZ2R3OEVsK5Gegw09WZy8slW0110SOriciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1Ru/yxT; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-742c9907967so3819804b3a.1
        for <linux-input@vger.kernel.org>; Tue, 27 May 2025 14:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748380349; x=1748985149; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IV3vLTMGUK42g9JDBlfV6eQED2s/wFDtOQYHVp+l9DY=;
        b=k1Ru/yxTfBsnvokAWonvAgiMUiF+qUtV17YntnESdpKQIQc0dDqSzjVU+qpak7uMRo
         Sfwe2iefSqR9t1n0tKfyv6zdgCk/4V0rBbGDh6zecp7FC1yfwV5TQUHTJNeChPdTs/Al
         aAlrSW2NVtb8EMDTZNuaL83eI4ZrYqe7cR9QtfHS3OMdRjzUMDYfV1g9V1bGNIxuTH2f
         CZVWWDjjmvu3dYr2QZ1p7Q0w1XdyohpvKJUPQXXbEuSxdNiaKcbc4+qO6i7sVo94jScq
         TeEM1XaNS93uaYsAjD47TpSH7oXXa22TlJGxXmbYyPkValX5ndWvYGfZjb4ZUNdTntGK
         LXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748380349; x=1748985149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IV3vLTMGUK42g9JDBlfV6eQED2s/wFDtOQYHVp+l9DY=;
        b=Q668O0s9hfG4qF1hsA807lyKGfqu4bZA2KNRbcoRunT9KmeV/UTlxc1smVGcC4znt2
         7O/e1Hd1AMC/w6/KwgmKndLPgd48HA28XRMDkcKDWUlcfYIkbVnd2N9vpzvMc2O3bIjs
         vaIZHVNZG9mIyxkP7gH5Ch0IkA2GDbhnyhUK7kQFnC5YOmVlaEotfdN1lMLVS77SZEy7
         rtXOFdaw3C4XesX889vmUCECUMWmVtHDgwcQzjtcAa/fzGG70fn3+yzFmr9rEAYsobIv
         Uz2cudpK2lG6JEKJGQcV81T/Ajy4LFBKWrlEmIbkM48R4moWFUOHqt/8bJ1WlEOn9eE0
         TvpA==
X-Gm-Message-State: AOJu0Yyk3sYeOKpxNGb/5jWO9BAfxzqgQ/KJWukTCAcBP4ZEmLiP9Tb8
	oYntzCNdQuvUgEPQIlRHruC+QSWtTq2taX7xlKrSIGZ32Xt/apftJf0s
X-Gm-Gg: ASbGncvPZ0XN/jIcQ6P4LjQZ81mjTBpes5EaXWtVKLCVKZhOlTMRnR9Q7Usvun6WDEk
	ON13S2G6CNsdVLJHdyy2NvzD6uc3hOgFTcfjl/RBv8fb62v3Wx9qQ5+s3FN65D4koEat1Wmkkk6
	aif1yLYJ6t6Vvn9R6/my7REl/3079YoynF6z0nNdESQ+LUJ0TcPuXkbLWmeITtX6wX5jR34s1//
	6zS2cAEsrmey6C9Dkz5pddSIQstZnvRN3E/2VnOcVXHafWRAN6GUxtAwc8dHrc27YRQ4igr/jyI
	I17BlNE8zeqAPiDkbWcE4bgkdFxmrpfWAmijsv5tIXD0QMkXGYVZ
X-Google-Smtp-Source: AGHT+IEreTrsDZ/S+3Y/UN6JyYVwz3N5kfoq4FhThL8hlksvRBd5TII/23zxniKpgT1L3ReAVcDF1g==
X-Received: by 2002:a05:6a00:1381:b0:740:9d7c:8f5c with SMTP id d2e1a72fcca58-745fe036213mr23760197b3a.18.1748380348865;
        Tue, 27 May 2025 14:12:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:234b:b801:3ed0:528a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746683003f0sm23798b3a.158.2025.05.27.14.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:12:28 -0700 (PDT)
Date: Tue, 27 May 2025 14:12:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: lihua - <lihua@huaqin.corp-partner.google.com>
Cc: Linux Input <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: gpio-keys - Detect long press events in sleep mode
Message-ID: <yhef57wb23no3u2wnvad7xcf4oatfy4t7h46jamr5mviv4kipa@gvcz45gvrtb7>
References: <20250506055847.15389-1-lihua@huaqin.corp-partner.google.com>
 <CAAkVrDM1TyM9VQ6rctF75EcLCRbimgJqbA2oH_RvJxC8ex6_vQ@mail.gmail.com>
 <aCG2Rx_99mP6JFi-@smile.fi.intel.com>
 <44fclxle3b7hfo44ec3vlwlth3uamceaqght3ecu3lmz4eltfz@e57uk7jw3hky>
 <CAAkVrDM8CSxUffBsYA8Xab8B8Bu75fKMGgfVmpO=sfE764fN0Q@mail.gmail.com>
 <pekirpthune5m732km6pkpr5bgixha23tuecfuw6ziw44yb5pv@b3ru6gitqscx>
 <CAAkVrDNdHWocwsUQH+-1sPZ98YvEWC_=3D0NzLZ7DT7=xKVRxQ@mail.gmail.com>
 <CAAkVrDM5bdnjHrSWZ4DatfBK3v-tyVBu1psVGbRjd+KXKwuFCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAkVrDM5bdnjHrSWZ4DatfBK3v-tyVBu1psVGbRjd+KXKwuFCg@mail.gmail.com>

[ adding back linux-input list... ]

On Mon, May 26, 2025 at 09:54:05AM +0800, lihua - wrote:
> Hi, i thought about it, i don't think the scenario you mentioned would
> exist.

And yet it does...

> If it is convenient, please give a specific scenario so that i can verify
> it.
> 
> In addition, as mentioned before, this linux code logic cannot detect long
> press events in suspend state, which is also a problem in itself.
> Does the community have a repair plan?
> 
> Looking forward to your reply。
> 
> On Mon, May 19, 2025 at 3:55 PM lihua - <
> lihua@huaqin.corp-partner.google.com> wrote:
> 
> > In suspend mode, if the gpio key is not released, two down events will be
> > reported, log as follow:
> >
> > *gpio key keep pressing：*
> > /dev/input/event0: EV_KEY       00fa                 DOWN
> > /dev/input/event0: EV_SYN       SYN_REPORT           00000000
> > /dev/input/event0: EV_KEY       00fa                 UP
> > /dev/input/event0: EV_SYN       SYN_REPORT           00000001

These are not 2 down events. I see one down and one up event here.

> >
> > When the gpio key is pressed, the down and up events are reported
> > immediately.
> > The upper layer monitors the time interval between the down and up events.
> > If the time is greater than 500ms, it is considered a long press and
> > responds to the corresponding function.

OK, so the issue you are having is with timestamp on both EV_KEY events
having the same value? Yes, input_sync() after the synthetic key press
will indeed fix this and you will see distinct timestamps on the press
and release events.

> >
> > But, we found that this phenomenon would not occur in the non-sleeping
> > state.
> >
> > Looking at the code, we think it may be related to follow code:
> >
> > if (bdata->suspended  &&
> >    (button->type == 0 || button->type == EV_KEY)) {
> > /*
> > * Simulate wakeup key press in case the key has
> > * already released by the time we got interrupt
> > * handler to run.
> > */
> > input_report_key(bdata->input, button->code, 1);
> > ++ input_sync(bdata->input);
> > ++ return IRQ_HANDLED;

This return is wrong though, you do want to schedule debounced read to
make sure you do not end with key "stuck" if button is released really
quickly.

> > }
> >
> > So ,we try to add this two line and fix it.(maybe it's not correct)
> >
> >
> > In addition, why does gpio key keep pressing report two events in suspend
> > state?

Yo may end up trying to report the press twice (but input core will
"eat" one of them and not report to userspace) in the following
scenario:

- the driver generates synthetic key press when resume() method is
  running
- ISR for the GPIO runs, the button is still pressed, and so the driver
  will report another EV_KEY input event. Because input core knows that
  the key is already pressed it will not deliver this "extra" event to
  userspace
- Key is released, input event is generated.

And please, do not top-post on Linux kernel mailing lists.

> >
> >
> >
> > On Sat, May 17, 2025 at 12:08 AM Dmitry Torokhov <
> > dmitry.torokhov@gmail.com> wrote:
> >
> >> Hi,
> >>
> >> On Fri, May 16, 2025 at 09:39:58AM +0800, lihua - wrote:
> >> > The requirement is to long press the Google key in sleep mode to turn
> >> > on the flashlight, so it is necessary to be able to recognize the long
> >> > press event in sleep mode.
> >> >
> >> > But from the current code design, this requirement cannot be met.
> >>
> >> You have not completed your sentence: "... this requirement cannot be
> >> met" because ...
> >>
> >> You need to explain what exactly is wrong in the current implementation
> >> so that we can evaluate the patch properly. So far I do not really
> >> understand how not calling input_sync() in the GPIO interrupt handler
> >> one more time allegedly allows you to recognize short press but not long
> >> press? There is something missing here.
> >>
> >> As I mentioned before, returning early without scheduling another GPIO
> >> read may result in the key or button being "stuck". Maybe for your
> >> particular userspace it is acceptable, but the driver is used in various
> >> products and we need to be careful not to break them.
> >>
> >> And please do not top-post in your replies.
> >>
> >> >
> >> > On Fri, May 16, 2025 at 2:58 AM Dmitry Torokhov
> >> > <dmitry.torokhov@gmail.com> wrote:
> >> > >
> >> > > On Mon, May 12, 2025 at 11:50:15AM +0300, Andy Shevchenko wrote:
> >> > > > On Mon, May 12, 2025 at 03:57:17PM +0800, lihua - wrote:
> >> > > >
> >> > > > First of all, do not top-post!
> >> > > >
> >> > > > > Hello, All linux team members:
> >> > > > >       Could you please review this modification as soon as
> >> possible?
> >> > > >
> >> > > > You even haven't waited for a full week...
> >> > > >
> >> > > > If it's an (important) fix, made it look so (Fixes: tag, Cc: stable@,
> >> etc).
> >> > >
> >> > > I can see that missing input_sync() might hurt, but the patch
> >> > > description makes no sense. The driver does not really differentiate
> >> > > between long and sort press.
> >> > >
> >> > > Please provide a better explanation how missing sync interferes with
> >> > > your use case.

Thanks.

-- 
Dmitry

