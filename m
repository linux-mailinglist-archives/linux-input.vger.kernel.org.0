Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 766CD67F939
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 16:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbjA1PkE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 10:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjA1PkD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 10:40:03 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 554E92798E
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 07:40:02 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id y11so7222169edd.6
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 07:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNDUhsWODPUHTQUXXrzEZgL/K326j8DLn9YY4vw91vU=;
        b=nbKhoB02rkY9lJUiDUrJF9a0a2XN3czVrdL1tx6YJEh76j+ervGhQleYYpN0JozX+H
         Cfn6HEmdLnA+TdQpL8/GQ8xaHpFppL+Q0CWxvtRT1BDxPAclrL9Kn5RTnz4AMJt9aPeL
         NL9Xpa3MSYNMi3TF8DikjfxPSiLv+aeMwhrr68nSssvbTLmsxmJq5uBGmF0k3KkZoqZI
         gXaz69h5mlFMcFNNBujKZz4Z9LN47JR5h/OBxEVHERKYfDOHoNucYlm+p54CK2Rf+iPw
         b6orb0YGaJnTreilMT92UKd4p4uTHgRUPdPi++xcKdtEXXaCchnePaKct32OM80CkbnN
         58vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNDUhsWODPUHTQUXXrzEZgL/K326j8DLn9YY4vw91vU=;
        b=Pm5ukULGA5m7jSSNueiOU6duFNVpe+lNFGAn+UcpAG5pjZFAmOzvshbIlCWv4o+uJC
         5qgsd4L6PeuNI+5ehdZmMO2WEYta7FaBSWm3ThEC6C4qBeVr1FpgsIINGSjRF6w2hFku
         e4RZIML+5BDBlhfxj5sP+yF86g4XXqDIglnpC31b9yKVTBLafDG7Twp0LJ1FnYDlYQS0
         T6Gw3sMbmaJJTb0jCOFN59/Ipp2VwoMU+hvj1Tt42pfEuNQFIFm57c3YTVexka35uP/3
         OQcFk5rZpHshMD5kuARGHrYODM0ONTK9QPUNknPOnniVq3S2STYE+i2WRRYN7c5j0jpY
         i03g==
X-Gm-Message-State: AFqh2kqtC1XU5cT3QJQEiOvQbPdNq6+bf2xyr+KmQXiybQq0LpXpMCm0
        ceeOPzpoXmO0JvQbMRW3KegcSPu+H++lPA==
X-Google-Smtp-Source: AMrXdXv1NPtACLwX7AuUP2EUejsnk1Ql24YErbkdR7b2tJuXM8wz2Ix1auVEIPo0p59p6wqkUkzzQA==
X-Received: by 2002:a05:6402:d0:b0:49e:746f:adfa with SMTP id i16-20020a05640200d000b0049e746fadfamr38838349edu.31.1674920400787;
        Sat, 28 Jan 2023 07:40:00 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id w11-20020a50fa8b000000b0049e09105705sm3980404edr.62.2023.01.28.07.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jan 2023 07:40:00 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
        id 545F6BE2DE0; Sat, 28 Jan 2023 16:39:59 +0100 (CET)
Date:   Sat, 28 Jan 2023 16:39:59 +0100
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Tobias Klausmann <klausman@schwarzvogel.de>
Cc:     linux-input@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: Linux 6.1 and 6.2-rc make mousewheel on Logitech G903
 (046d:c091) report too many non-hires events
Message-ID: <Y9VBz/GVZPqG3KwM@eldamar.lan>
References: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9GmnIjUgIGuYtk2@skade.schwarzvogel.de>
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jan 25, 2023 at 11:01:00PM +0100, Tobias Klausmann wrote:
> Hi!
> 
> As it says in the subject.
> 
> At some point between 6.0 and 6.1, the kernel (if HID_LOGITECH_HIDPP was
> m or y) started reporting a full event for every hires event on a
> Logitech G903. 
> 
> In my quest of finding out what the root cause is, ive filed these bugs:
> 
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1029584
> https://gitlab.freedesktop.org/libinput/libinput/-/issues/852
> 
> The libinput one has the most detail. The most relevant one is this log
> from libinput record, showing what happens if I turn the mousewheel by
> one notch:
> 
>     events:
>     # Current time is 20:37:11
>     - evdev:
>       - [  3,  63476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3,  63476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3,  63476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +3063ms
>     - evdev:
>       - [  3, 139476,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 139476,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 139476,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +76ms
>     - evdev:
>       - [  3, 197482,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 197482,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 197482,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +58ms
>     - evdev:
>       - [  3, 227485,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 227485,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 227485,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +30ms
>     - evdev:
>       - [  3, 240484,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 240484,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 240484,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +13ms
>     - evdev:
>       - [  3, 250470,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 250470,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 250470,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +10ms
>     - evdev:
>       - [  3, 256486,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 256486,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 256486,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +6ms
>     - evdev:
>       - [  3, 264472,   2,   8,      -1] # EV_REL / REL_WHEEL                -1
>       - [  3, 264472,   2,  11,    -120] # EV_REL / REL_WHEEL_HI_RES       -120
>       - [  3, 264472,   0,   0,       0] # ------------ SYN_REPORT (0) ---------- +8ms
>     # Current time is 20:37:15
> 
> Note how it reports both REL_WHEEL and REL_WHEEL_HI_RES at every
> instance.
> 
> I've tried assorted kernels, both Debian as well as hand-compiled
> vanilla ones, and the problem only shows up if hid_logitech_hidpp.ko is
> loaded, so I am blacklisting it for now. Also note that even unloading
> the module didn't fix the behavior, though that may be because X11 was
> still runing and so libinput's state ight have been still mangled.
> 
> The most recent kernels I have tested with are 6.1.4 and 6.2-rc5.
> 
> Best,
> Tobias

Let's loop in as well the regresssions list.

#regzbot introduced: v6.0..v6.1
#regzbot link: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1029584
#regzbot link: https://gitlab.freedesktop.org/libinput/libinput/-/issues/852

Regards,
Salvatore
