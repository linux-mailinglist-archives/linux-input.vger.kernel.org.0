Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F980597527
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 19:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238229AbiHQRgU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 13:36:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236240AbiHQRgT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 13:36:19 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8759F1A9
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:36:18 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id s36-20020a17090a69a700b001faad0a7a34so2457421pjj.4
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 10:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=3HfcrnzjmMXM57jltp/RhzB70UyLezNHId+YgX/9FXU=;
        b=3bQNbELeSxmXY9KFCkfJh2Gp6ikFn+zammI63LGO3GzhVGA8L7qE7d+LFXl+cg2xg8
         p/z9XP0RQKbDi3sNPmkvShEX7uoBWQ1l9Vw+XTSL74lc3s5mZfle/sD2+N+WSDDhIJmJ
         OzPh/KF8Xz2zo+VaHoDA2uPhR/p27iV0thaeq6/RcqaQeYN5sP/rYlIp79w/exstG1QL
         5MzkLLoLftPwW8fODgy7p+rnt2JSEUG2HVIx6CftEXIqb5tozLf6Qxu76ZSckq/s0gxP
         tz8P8wvoCCEM9i9lttFKrQPBpa5h6thSk4NuYjI4mtOXs6pOHzoS1A90wMjBKTcM6XDo
         e0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=3HfcrnzjmMXM57jltp/RhzB70UyLezNHId+YgX/9FXU=;
        b=RtB2mdOc+tdtQ18jnXwElY17s4itp+G61pE23aAEdzRhdf1l+5HXZbMx6vbGS3Fxdi
         /xJcw6mQP4cWkd6WarJB/yEzv5hS+8xaKecdpWh4Qx8gUGT+atiK1Dkt55m7S0KWR7n3
         zRGP4sO8qznHJ6tP2wtZfUn25uO9zEKqHI+l9dotij8cAp4dk4mEWw3JYZg17kd0z3Pw
         V/SxPuPP758mmW2YvYYE+cedG4Vj6pPqWmZ5HCPn5TS/niXcrATFtAg7vH62XcFIhLLN
         8tYsbHQnKYPGxsH+ECvAt0TYUKjUpu49fChdNktVjNfjzqfGIhm0/qP+sWd3aNo3dqU+
         T0bw==
X-Gm-Message-State: ACgBeo2q4lZXF9Mz3Dut34Zty6FXdNu1PDlANhhJTLs12s0voidabCUr
        m2QwT3e7dw1I8v/JbuG31iOVCw==
X-Google-Smtp-Source: AA6agR68FOAvZ29SqXmxa+tvtnj0S4ASEtWoAFMKVZNs5TRbZtlmva7LS8lZz9x2KDsPAgMzZz7ahA==
X-Received: by 2002:a17:902:ea0d:b0:170:cabd:b28 with SMTP id s13-20020a170902ea0d00b00170cabd0b28mr27442562plg.115.1660757778079;
        Wed, 17 Aug 2022 10:36:18 -0700 (PDT)
Received: from ghaven-kernel ([2601:600:8f80:973::5f])
        by smtp.gmail.com with ESMTPSA id d17-20020a170902ced100b0016d1f474653sm198903plg.52.2022.08.17.10.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 10:36:17 -0700 (PDT)
Date:   Wed, 17 Aug 2022 10:36:15 -0700
From:   Nate Yocom <nate@yocom.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] Input: joystick: xpad: Add X-Box Adaptive
 Controller support
Message-ID: <Yv0nD36XqUvoGUHZ@ghaven-kernel>
References: <20220813185343.2306-1-nate@yocom.org>
 <20220813185343.2306-2-nate@yocom.org>
 <c7c1373b84a297d2745c4fb98ad2ecf26e67f0d5.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c7c1373b84a297d2745c4fb98ad2ecf26e67f0d5.camel@hadess.net>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Aug 17, 2022 at 12:37:02PM +0200, Bastien Nocera wrote:
> On Sat, 2022-08-13 at 11:53 -0700, Nate Yocom wrote:
> > Adds correct VID/PID for this XTYPE_XBOXONE compatible controller to
> > xpad_device[] table.
> > 
> > Signed-off-by: Nate Yocom <nate@yocom.org>
> 
> Have you tested the device in Bluetooth mode? My controller's battery
> is still charging.

I have tried, but haven't been successful in getting it connected with,
or without my changes (i.e. no change), so was focused on cabled support
first.

> Tested-by: Bastien Nocera <hadess@hadess.net>

Thanks!

> 
> > ---
> >  drivers/input/joystick/xpad.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/input/joystick/xpad.c
> > b/drivers/input/joystick/xpad.c
> > index 18190b529bca..c8b38bb73d34 100644
> > --- a/drivers/input/joystick/xpad.c
> > +++ b/drivers/input/joystick/xpad.c
> > @@ -131,6 +131,7 @@ static const struct xpad_device {
> >         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0,
> > XTYPE_XBOXONE },
> >         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0,
> > XTYPE_XBOXONE },
> >         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver",
> > MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> > +       { 0x045e, 0x0b0a, "Microsoft X-Box Adaptive Controller", 0,
> > XTYPE_XBOXONE },
> >         { 0x045e, 0x0b12, "Microsoft Xbox Series S|X Controller",
> > MAP_SELECT_BUTTON, XTYPE_XBOXONE },
> >         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360
> > },
> >         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360
> > },
> 
