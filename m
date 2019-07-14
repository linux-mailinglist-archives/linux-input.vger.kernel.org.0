Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0F4C67ECE
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 13:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfGNL14 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 07:27:56 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46789 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728259AbfGNL1z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 07:27:55 -0400
Received: by mail-ed1-f67.google.com with SMTP id d4so12829539edr.13
        for <linux-input@vger.kernel.org>; Sun, 14 Jul 2019 04:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0g6K/xo0TAgWcioUlUGB78Yyph5QmK55KtmxCEkpbzs=;
        b=Px5AFlp9/MpdBZ4QV//+eo3OkdKyqOiv6a5IfTWRbeFvrcxR2C6pyxHFjc1siixdPk
         TegQOsjs0DmSOgAoYK9wrpfJqQxc+jUchR/233OPGgUyE6teO4eGl8QjoJAlXQxBNUBn
         EQ/kwGDKzUlKO0ZCfeQXZgoGM/rGMbjYtj2tSO2AokjVBFhuPwUeJpwHT0+o9niveMl5
         R0ycRSqCGY11/v/tnNUOZ877at3MENGmJO2/zzKjYsUiaPLowjDX23WvD0WWWDGK3CaO
         5CWmIZF9FVjlC2obnLKROpfzqSOEhxaU678Fgb6hsaCF84GkXOq9/95RRV3LEQoPJUe/
         cWQw==
X-Gm-Message-State: APjAAAXKVzgEUIW3nMTk/cNN6Lo4hqNYpKVONF88aROsw5meiH2URZxB
        bjH6viV5veTpghLA/cfdPSqO8MMR9bo=
X-Google-Smtp-Source: APXvYqyjXx/Mc0cCpFltgZBQDw0L4MNuq3wUiCaYQGLTlgZoWFu1+DvQuLl54JDcElkxeaFgT5oXbQ==
X-Received: by 2002:a50:84a1:: with SMTP id 30mr18168975edq.44.1563103673693;
        Sun, 14 Jul 2019 04:27:53 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id l38sm4278815eda.1.2019.07.14.04.27.52
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 14 Jul 2019 04:27:53 -0700 (PDT)
Subject: Re: FocalTech Touchpad (v2) PS/2 Reverse Engineering
To:     Hamza Farooq <hamza.farooq15@yahoo.com>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <5cfd4836.1c69fb81.2b5c2.00b9SMTPIN_ADDED_MISSING@mx.google.com>
 <7effd3c6-99a8-274f-3871-981c90e67ff0@redhat.com>
 <40c0c4b0-376e-12e1-579b-ac348e2ff612@redhat.com>
 <5d1bc64a.1c69fb81.222e1.3a0dSMTPIN_ADDED_MISSING@mx.google.com>
 <67719544-4ae5-2b5e-290c-912cb2b42316@redhat.com>
 <5d1d15f3.1c69fb81.352bc.11ffSMTPIN_ADDED_MISSING@mx.google.com>
 <55f4fd02-1549-fd14-8e6a-6552e16d6a4f@redhat.com>
 <5d2a2147.1c69fb81.52899.985fSMTPIN_ADDED_MISSING@mx.google.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3d0121b4-a4f2-0057-aaa9-8777dcbb35ad@redhat.com>
Date:   Sun, 14 Jul 2019 13:27:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5d2a2147.1c69fb81.52899.985fSMTPIN_ADDED_MISSING@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 13-07-19 20:21, Hamza Farooq wrote:
> Hello,
> 
> Implemented ABS_MT_TOUCH_MAJOR (Length, min 0, max 9)/MINOR (Width, min 0, max 14), finger touch values rangers form 1 to 5+ depending on area and palm values are also around 3 to 8+. These overlapping values make it hard to distinguish between both. Anyway, I don’t think I need those at all. because MAJOR/MINOR doesn’t change much (at least I didn’t notice something special). Also removed code related to Area/Pressure because peter said it wasn’t required(in his first reply).
> 
> Kinetic scrolling on other hand is something I cannot fix on my own (for each and every app), because developers need to add support for it. Most of GNOME apps support it, I tried GNOME Web (Epiphany) and it works fine. So nothing wrong with driver here.
> 
> Other than that pinch to zoom is not working anymore, I guess, it stopped working right after I fixed tap to click.
> 
> tired renaming focaltech.c to focaltech_v2.c, but renaming “CONFIG_MOUSE_PS2_FOCALTECH” (focaltech_v2.c, focaltech_v2.h, psmouse-base.c, Makefile) to  “CONFIG_MOUSE_PS2_FOCALTECH_V2” make the device fallback to Logitech driver (single touch, standard mode). Not sure what i’m missing here. I am attaching .zip that are working for me right now. I would like this to be merged in future kernel, I wanted to create a dkms module for those who want to use/test it right now. I can’t get it working for both FocalTech device versions, so I guess I have to publish that is working for me and wait for a fix.

Renaming CONFIG_MOUSE_PS2_FOCALTECH will not work because that will disable the focaltech
entry in the psmouse_protocols array in drivers/input/mouse/psmouse-base.c:

#ifdef CONFIG_MOUSE_PS2_FOCALTECH
         {
                 .type           = PSMOUSE_FOCALTECH,
                 .name           = "FocalTechPS/2",
                 .alias          = "focaltech",
                 .detect         = focaltech_detect,
                 .init           = focaltech_init,
         },
#endif

What you should do instead is add an new CONFIG_MOUSE_PS2_FOCALTECH_V2 in
drivers/input/mouse/Kconfig and then in the psmouse_protocols array have:

#ifdef CONFIG_MOUSE_PS2_FOCALTECH
         {
                 .type           = PSMOUSE_FOCALTECH,
                 .name           = "FocalTechPS/2",
                 .alias          = "focaltech",
                 .detect         = focaltech_detect,
                 .init           = focaltech_init,
         },
#endif
#ifdef CONFIG_MOUSE_PS2_FOCALTECH_V2
         {
                 .type           = PSMOUSE_FOCALTECH_V2,
                 .name           = "FocalTechPS/2",
                 .alias          = "focaltechv2",
                 .detect         = focaltech_v2_detect,
                 .init           = focaltech_v2_init,
         },
#endif

And rename the focaltech_detect in your focaltech_v2.c to
focaltech_v2_detect and the same for focaltech_init.

You will also need to add focaltech_v2.c to the
psmouse-objs line in drivers/input/mouse/Makefile

Regards,

Hans


p.s.

I do not think that building this as a DKMS module is possible since it
requires changes to the core drivers/input/mouse/psmouse-base.c file.

