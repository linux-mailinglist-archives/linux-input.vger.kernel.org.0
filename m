Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F807243200
	for <lists+linux-input@lfdr.de>; Thu, 13 Aug 2020 03:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbgHMBVa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Aug 2020 21:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726554AbgHMBV3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Aug 2020 21:21:29 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77C06C061383;
        Wed, 12 Aug 2020 18:21:29 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id x6so1972825pgx.12;
        Wed, 12 Aug 2020 18:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lQIgWLskafx/ldXdduKgobildOhYZxik0ZHwho1Zfoo=;
        b=mGN4/7qavgQWwG5YfUkeYeG0wYOtcBkAYp2bPdv6B36KhbQa9wrpecPbkjDWFoOW9L
         JeE25dc4lsSrciIgNBYihQti5o9VWJxedN3krMCF85tLA7O96PgOvMkeen5dNdfXc7n3
         j2PSPmE5MwIE3VKLLwZowwQtUX73oolFxjkmk4y2XXmvbOfELNdK/++VPg4E4mHz2Fed
         qE51NDmggB+4+meJqc5PNTqDKFly23rsPUviIIr27sdvHwCqh61BgJx2F44kH3YjS10d
         6bjf91qQeNf2vXIxXZfR8FG1mDbxUpIObEy3qkI1UxDWQTo/JhgYQeNx6yql7PO0U8kB
         zNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lQIgWLskafx/ldXdduKgobildOhYZxik0ZHwho1Zfoo=;
        b=eLaA+VOkCvL+mAV30/AdWAAIXexBM6SVR/zD1HYUeHbv32tHeJcoy3MlqSZmiUMoNO
         yrLyJLgT3lHCu82NfSXiyJxtWig1c3TclXj2lRo5HVEwClZS7TP7w5gEgJhrjcvNzjBw
         0tl3RiEeJLVfYAJujkTtPOOpetaJTQiT4rNAhQ/658JxCUfBI2TByXD3K5/2XjG9XrDp
         OC2lXSzCR9ZAl4F38O954Wl8D+3qOawVlYvVGVAO57LNvgqRqqPfnOw7yQwE/A29kxXB
         JP6Den9eTSeiN8Mit0NBVQLmdPRFWYJSoZGAmqbXtuOb94uZHztKqserLZotqEMo9OsG
         bDAg==
X-Gm-Message-State: AOAM530VbIoJpKh+wJKov6dKfe7lvPfcpqhD3sg/z57Es2DHoY2W2XNp
        2XejcG6DUa7icStej7YRsJQ=
X-Google-Smtp-Source: ABdhPJwgpHzsTo8nz0kD/mHsAPY6qklFCQrg9J1XaxdO5YaRJOgQgPo0AsWWb4+Qp5+EfzyBbeCg+w==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr2004878pfc.229.1597281688701;
        Wed, 12 Aug 2020 18:21:28 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m22sm3346397pja.36.2020.08.12.18.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 18:21:27 -0700 (PDT)
Date:   Wed, 12 Aug 2020 18:21:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Raul Rangel <rrangel@google.com>
Cc:     linux-input@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "S, Shirish" <Shirish.S@amd.com>
Subject: Re: PS/2 + i8042 intermixing commands
Message-ID: <20200813012125.GV1665100@dtor-ws>
References: <CAHQZ30ANTeM-pgdYZ4AbgxsnevBJnJgKZ1Kg+Uy8oSXZUvz=og@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHQZ30ANTeM-pgdYZ4AbgxsnevBJnJgKZ1Kg+Uy8oSXZUvz=og@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Aug 06, 2020 at 09:28:41AM -0600, Raul Rangel wrote:
> >
> > <- atkbd_event_work->atkbd_set_leds
> > [KB recv data: 0xed] # CMD 10
> > <- Wait, where is the data?
> >
> > <- Continuation of i8042_port_close?
> > [KB recv cmd: 0x60] # CMD #14
> > [KB recv data: 0x43]
> > [KB eaten by STATE_WRITE_CMD_BYTE: 0x43]
> > [KB set CTR_RAM(0x00)=0x43 (old:0x41)]
> > [AUX IRQ enable]
> >
> > <- Here is the data!
> > [KB recv data: 0x00] # CMD 10 (data)
> > [KB Unsupported i8042 data 0x00]
> > [KB recv data: 0x00] <- Did the host retry?
> > [KB Unsupported i8042 data 0x00]
> >
> > <- atkbd_event_work->atkbd_set_repeat_rate
> > [KB recv data: 0xf3] # CMD #11
> > [KB recv data: 0x00]
> > [KB eaten by STATE_SETREP: 0x00]
> >
> > [KB recv cmd: 0xd4] # CMD #15
> > [KB recv data: 0xf2]
> > [STATE_SEND_TO_MOUSE: 0xf2]
> 
> As you can see CMD #10 starts between #13 and #14, and then completes
> after #14. Is this expected behavior?
> 
> I'm not quite sure if #13 and #14 are coming from i8042_port_close. I
> don't have a function trace available, but it seems to fit.
> 
> I found this comment:
> /*
>  * Writers to AUX and KBD ports as well as users issuing i8042_command
>  * directly should acquire i8042_mutex (by means of calling
>  * i8042_lock_chip() and i8042_unlock_ship() helpers) to ensure that
>  * they do not disturb each other (unfortunately in many i8042
>  * implementations write to one of the ports will immediately abort
>  * command that is being processed by another port).
>  */
> static DEFINE_MUTEX(i8042_mutex);
> 
> Does that not mean that i8042_port_close, i8042_enable_kbd_port,
> i8042_enable_aux_port, + any other function that calls i8042_command
> should be taking the lock before calling i8042_command?

Yeah, I think this is right. When I added the mutex it was because 2
deices were clashing with each other and I did not consider that closing
port in the i8042 driver itself may also disturb in-flight command.

Thanks.

-- 
Dmitry
