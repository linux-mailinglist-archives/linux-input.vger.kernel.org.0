Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74D376813F
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 23:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbfGNV3H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 17:29:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44206 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbfGNV3H (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 17:29:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id t14so7258721plr.11;
        Sun, 14 Jul 2019 14:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cyMKLu1P6Moxg7Bojo9R0LnJsppb6UJHhe/6KSFBtks=;
        b=gDB9Fcj2hQInuPCt8opoHaiu1eicR4jGLimaP+Buvf2lxMDD0aYTDEAhvPoUCGef5Y
         oZS0rpn73m+gLaDjBJRDGgGRw45krvlbid4OGTCmTVL8ybZVVBUMbfbIJTOR4keOJXKl
         JD4sLuaw0iZVPWwZQK1ByGrk2K6TGHMu9L4jmA61PeBgVLap26BKdv5Ew/h/f7TUa2xH
         ygQ/qYxd3d/joVOvpB5qrV+ZkD6LALnDOIJDPiHcWU/rebC5m236w0nENr+aFCOlvSde
         7zcFkajMbV3cYXms62beZ581l/WF7bubMFH1397jQx112BMf4Saq6KDberLTQ0mCKMS8
         bP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cyMKLu1P6Moxg7Bojo9R0LnJsppb6UJHhe/6KSFBtks=;
        b=JZ9C7zalHoMzjDfjds+5kPCAkb34G2EEJou/jgMDZGmnmaAEK9oEKOIZFy0+xxA47K
         6U9Z9VnvSUhQHUIpvFzK6dGAN8Cx2FRZTO+tgI4oVw1JpbVpNDcpJq9VmW0wSYHkQ5Ty
         FOteqpPXya70tdOwiiVpWpheiOJ9FQu0A37o8016BHmT3Kvt/jo0mD0/ajjcVbNt7cf0
         RTXcs7Vc7ieh8a2Sjc/MGdzrBYPNztseETqarHd3Qr74Q4wccuqx9ALKfArHSWqaNiGd
         HMJrNW79VoilNsd+QF/15a4M+Sn/WB3RCWym7WZh1TSBW1Vv61KvbrRftBxTdyNwuE8O
         PBmw==
X-Gm-Message-State: APjAAAWwS4WoONgrvr8p9B6lJTmkVz40vY20t7WgV6y5PEa6aXbj63ag
        2Vxa959cBL3IHwgWGlguMOQ=
X-Google-Smtp-Source: APXvYqxOUNUACxTAqIkDgQM/4kwq0YAAQFWTOLxjIEWBQk3hsO2vBtbFTRVofNKXxOpqv7S+mT7Y3w==
X-Received: by 2002:a17:902:44e:: with SMTP id 72mr24563310ple.326.1563139745938;
        Sun, 14 Jul 2019 14:29:05 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x1sm13660394pjo.4.2019.07.14.14.29.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 14:29:05 -0700 (PDT)
Date:   Sun, 14 Jul 2019 14:29:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tim Schumacher <timschumi@gmx.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        tglx@linutronix.de
Subject: Re: [PATCH] Input: iforce - Remove empty multiline comments
Message-ID: <20190714212903.GA232696@dtor-ws>
References: <20190708025010.9318-1-timschumi@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708025010.9318-1-timschumi@gmx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 08, 2019 at 04:50:10AM +0200, Tim Schumacher wrote:
> Those are remnants of the SPDX identifier migration, which haven't been
> removed properly.
> 
> Signed-off-by: Tim Schumacher <timschumi@gmx.de>

Applied, thank you.

> ---
> This is probably the highest level of cosmetic-only that a patch
> can achieve, sorry for the noise.
> 
> CCing Thomas Gleixner, since the tool (is it a tool?) that makes
> those SPDX changes would have room for improvement in that regard.
> It seems to expect that all of the license information is contained
> within the same comment block, which wasn't the case for the iforce
> driver.
> ---
>  drivers/input/joystick/iforce/iforce-ff.c      | 3 ---
>  drivers/input/joystick/iforce/iforce-main.c    | 3 ---
>  drivers/input/joystick/iforce/iforce-packets.c | 3 ---
>  drivers/input/joystick/iforce/iforce-serio.c   | 3 ---
>  drivers/input/joystick/iforce/iforce-usb.c     | 3 ---
>  drivers/input/joystick/iforce/iforce.h         | 3 ---
>  6 files changed, 18 deletions(-)
> 
> diff --git a/drivers/input/joystick/iforce/iforce-ff.c b/drivers/input/joystick/iforce/iforce-ff.c
> index 2ed7da7d1f3e..4350927f7781 100644
> --- a/drivers/input/joystick/iforce/iforce-ff.c
> +++ b/drivers/input/joystick/iforce/iforce-ff.c
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include "iforce.h"
> 
>  /*
> diff --git a/drivers/input/joystick/iforce/iforce-main.c b/drivers/input/joystick/iforce/iforce-main.c
> index 55f5b7bb4cac..8c2ffa43ce89 100644
> --- a/drivers/input/joystick/iforce/iforce-main.c
> +++ b/drivers/input/joystick/iforce/iforce-main.c
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include "iforce.h"
> 
>  MODULE_AUTHOR("Vojtech Pavlik <vojtech@ucw.cz>, Johann Deneux <johann.deneux@gmail.com>");
> diff --git a/drivers/input/joystick/iforce/iforce-packets.c b/drivers/input/joystick/iforce/iforce-packets.c
> index 42cd9730e4cc..677a7773059d 100644
> --- a/drivers/input/joystick/iforce/iforce-packets.c
> +++ b/drivers/input/joystick/iforce/iforce-packets.c
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include "iforce.h"
> 
>  static struct {
> diff --git a/drivers/input/joystick/iforce/iforce-serio.c b/drivers/input/joystick/iforce/iforce-serio.c
> index 65a4fe26324f..b3fff64d92dd 100644
> --- a/drivers/input/joystick/iforce/iforce-serio.c
> +++ b/drivers/input/joystick/iforce/iforce-serio.c
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include "iforce.h"
> 
>  void iforce_serial_xmit(struct iforce *iforce)
> diff --git a/drivers/input/joystick/iforce/iforce-usb.c b/drivers/input/joystick/iforce/iforce-usb.c
> index f1569ae8381b..ec5058e05317 100644
> --- a/drivers/input/joystick/iforce/iforce-usb.c
> +++ b/drivers/input/joystick/iforce/iforce-usb.c
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include "iforce.h"
> 
>  void iforce_usb_xmit(struct iforce *iforce)
> diff --git a/drivers/input/joystick/iforce/iforce.h b/drivers/input/joystick/iforce/iforce.h
> index f1681706f526..32e91baf63f5 100644
> --- a/drivers/input/joystick/iforce/iforce.h
> +++ b/drivers/input/joystick/iforce/iforce.h
> @@ -6,9 +6,6 @@
>   *  USB/RS232 I-Force joysticks and wheels.
>   */
> 
> -/*
> - */
> -
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/input.h>
> --
> 2.22.0
> 

-- 
Dmitry
