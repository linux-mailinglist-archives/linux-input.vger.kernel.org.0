Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D49917D0D3
	for <lists+linux-input@lfdr.de>; Sun,  8 Mar 2020 02:52:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726138AbgCHBwW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Mar 2020 20:52:22 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35101 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgCHBwW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Mar 2020 20:52:22 -0500
Received: by mail-wm1-f68.google.com with SMTP id m3so6248508wmi.0
        for <linux-input@vger.kernel.org>; Sat, 07 Mar 2020 17:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5QasJAXJANPmCAQYEKLP+Hq/Aqu5oxRdr352BqU8axo=;
        b=Bfj/soSyErE2xRsUqqVobT0kapMhC9HO0QfRLotJXw5pIIgd5G3sIByWBfUjA+6qHP
         POaNGd4ZH1XsfcqfshMzT65m625FEnQrAZ5NaNHHZjJyZVx+fheHsqAsUx0FHmaBU2Tg
         zI+RLC2tUlB99lb2Gw8a+EccGhgbGJVzosZh0kApMsnBVTVs9wArVGNYWOfEQMp+TdPe
         N7hEvQmq2pyjDb3sK33CYeyLWD+5zRAOM/9K3XOm0kvzxmdc5XQwUzSpIwvFRQFXntwS
         fH5dQ7O/fsHRWpcNCALRSu8U3N7QJMAWiUubQGCXVjW+QkXJyAZANEtsXyislLegaojM
         vuiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5QasJAXJANPmCAQYEKLP+Hq/Aqu5oxRdr352BqU8axo=;
        b=FtvsJQl6QnwYp+aRhIMkb08qMtx1LvFUkmUG+MaoA9cxDT1Fku6/hHetkrWTnitnJc
         bZxl7VVJKKiUq2ZKQ8V9hGYslMzFPLv7ZMp9umcYagKZ1aFY01Kng3Jkz3LCdx+38BQD
         Obz9R2eGTRDyrxx7BQCxPr9h+l6cNO9+im8F807VCBctS+Xyu/tEFkY+Ii17/NZLR8Vx
         8tZJs5dhds8wTieXtxXpntEo1v6lNVmAIvQG3p+SJnLeaLACJ1PqFATf+Z0GhyoilNbl
         jerWFz9SlgYppToygsPMh6/wl2uvbAbm7IW6QE+rei1okYnpPr76cjPNn365YKXhinTI
         T0GQ==
X-Gm-Message-State: ANhLgQ2PFZ1oJNwpDWmrdzI1DMhdUYxt/d4CejVAsN+C3952uRP5U6wS
        j9evtH9mfmbK7Ksu1b2ZpLRTmkrBXQnyFS24vlGHUQ==
X-Google-Smtp-Source: ADFU+vtsgU1PnWNdd+8IOjYDqywm+hokhT/qxYSX1J2+WHcUfnTDTAlHUdpPkZM8cklS+0kXEXh/QVAuZqaSdomfXk8=
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr12871858wmc.49.1583632341097;
 Sat, 07 Mar 2020 17:52:21 -0800 (PST)
MIME-Version: 1.0
References: <20200221195820.102457-1-james.hilliard1@gmail.com>
In-Reply-To: <20200221195820.102457-1-james.hilliard1@gmail.com>
From:   James Hilliard <james.hilliard1@gmail.com>
Date:   Sat, 7 Mar 2020 18:52:10 -0700
Message-ID: <CADvTj4qHbSWHdM1y8JH-E3nMR+Q-o6gZ+QiY7EDAJOvrfkxEfA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Input: usbtouchscreen - add support for BonXeon TP
To:     linux-input@vger.kernel.org
Cc:     Lars Poeschel <poeschel@lemonage.de>,
        Ondrej Zary <linux@rainbow-software.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Is there any additional info needed to get this patch merged?
I've tested and confirmed it works properly with the hardware.

On Fri, Feb 21, 2020 at 12:59 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> Based on available information this uses the singletouch irtouch
> protocol.
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  drivers/input/touchscreen/usbtouchscreen.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
> index 16d70201de4a..397cb1d3f481 100644
> --- a/drivers/input/touchscreen/usbtouchscreen.c
> +++ b/drivers/input/touchscreen/usbtouchscreen.c
> @@ -182,6 +182,7 @@ static const struct usb_device_id usbtouch_devices[] = {
>  #endif
>
>  #ifdef CONFIG_TOUCHSCREEN_USB_IRTOUCH
> +       {USB_DEVICE(0x255e, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>         {USB_DEVICE(0x595a, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>         {USB_DEVICE(0x6615, 0x0001), .driver_info = DEVTYPE_IRTOUCH},
>         {USB_DEVICE(0x6615, 0x0012), .driver_info = DEVTYPE_IRTOUCH_HIRES},
> --
> 2.20.1
>
