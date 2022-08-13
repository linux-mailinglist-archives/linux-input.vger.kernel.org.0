Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A822591C3F
	for <lists+linux-input@lfdr.de>; Sat, 13 Aug 2022 20:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbiHMSVI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Aug 2022 14:21:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239932AbiHMSVI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Aug 2022 14:21:08 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58680F9
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:21:06 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id r22so3344930pgm.5
        for <linux-input@vger.kernel.org>; Sat, 13 Aug 2022 11:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=yocom-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=626Owr46W4O2cIKZNRlyf1bEXxBYUtigyJdQ4471vW8=;
        b=LLqDOAP5F+6bP21Qtn4s6vuDRNKaqRzP2ShfpUTl6B2bZUKsAsgEuZoSqsU/aV9yTX
         dyVY9dO41rGGMMaQr1OUm551hiJOL2Y7b7CUZTLUzRJE//6AR2ndm3QJVeIESJXowQ8A
         xU8eq+yTdiezDpB12FzOHHwWM5ydN7aGaFxiZ/aLe+4NmQcOXtK+X+GrNp/C9ouAn0Id
         PwkUzR+FHcE0TbWwz/+2t96Uw6o+GDe/hLTVaNrl7DBhGm/lnZwnjJUzKEnrJ0sRekpe
         XbkIcFfCQkvDAOFQ9FDFK28RQqf0j+5MM3tJ3yb4ecU7eka2IjiP9Jdjd8oZeY6KH8yS
         Wjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=626Owr46W4O2cIKZNRlyf1bEXxBYUtigyJdQ4471vW8=;
        b=KKINZm0F/PImOAjSw6lJB8uFDnx/A7xvhtkeF8oFkSkh50G21Dix279QrpuyXSFXNU
         OqHEXc3TUOQdUiXpYFFTm6qRAw/M8K+c52NbyuE3XGVJtaWtvunfSHH/FrM5hnOfDztj
         sFgKbYPJKwQvhDnmUfQMV/GB4ICtG8hb7tRuXqd143LLKo3F8YCARDyGpslJPWmJCOtr
         EOuLU7eqNTz72W7f4nzbuvzUR6HLRbNkIEpW2YNl8zbRWqb9IHcrmYzA+KftjufZsMWm
         qBepyZ9GT5F5XLFoTtpbNzxEmCTrA0szGFqhPCR2VL3umugSX71/jgz3hOccw4+M8I/j
         /iaA==
X-Gm-Message-State: ACgBeo0mSVA4Im7wAo5wMuhKx3YDaM2SYO59lKsdwDP8dFFm/teCIChC
        93D2Nw6BheuLs+NxbXxv4CADRw==
X-Google-Smtp-Source: AA6agR7ye+Uzwf8p3RvsKwciKU7BY9BWx6miAiwX7dT0VMcvujYj6MEHPzHiWNrnRCPXGZGj+iYM4w==
X-Received: by 2002:a05:6a00:27a0:b0:52f:8947:4cc5 with SMTP id bd32-20020a056a0027a000b0052f89474cc5mr9377087pfb.16.1660414865734;
        Sat, 13 Aug 2022 11:21:05 -0700 (PDT)
Received: from ghaven-kernel ([2601:600:a07f:e6ac::1c])
        by smtp.gmail.com with ESMTPSA id y4-20020aa793c4000000b0052c456eafe1sm4001974pff.176.2022.08.13.11.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Aug 2022 11:21:05 -0700 (PDT)
Date:   Sat, 13 Aug 2022 11:21:03 -0700
From:   Nate Yocom <nate@yocom.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Input: joystick: xpad: Add X-Box Adaptive Controller
 support
Message-ID: <Yvfrj11PBPmNXHeN@ghaven-kernel>
References: <20220810141511.11827-1-nate@yocom.org>
 <32f116c30f1f071d57e8e2d15425178cbccf9b70.camel@hadess.net>
 <Yvfa3BZ1z0bNq8sN@ghaven-kernel>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yvfa3BZ1z0bNq8sN@ghaven-kernel>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Aug 13, 2022 at 10:09:48AM -0700, Nate Yocom wrote:
> On Thu, Aug 11, 2022 at 03:19:50PM +0200, Bastien Nocera wrote:
> > Hey,
> > 
> > On Wed, 2022-08-10 at 07:15 -0700, Nate Yocom wrote:
> > > +               /*
> > > +                * X-Box Adaptive controller sets 0x02 when x-box
> > > button is pressed,
> > > +                * we could probably condense into just data[4] != 0,
> > > but explicitly
> > > +                * checking here ensures no regression if other
> > > devices set other bits.
> > > +                */
> > > +               if (le16_to_cpu(xpad->dev->id.vendor) == 0x045e &&
> > > +                       le16_to_cpu(xpad->dev->id.product) == 0x0b0a)
> > > +                       input_report_key(dev, BTN_MODE, data[4] &
> > > 0x02);
> > > +               else
> > > +                       input_report_key(dev, BTN_MODE, data[4] &
> > > 0x01);
> > 
> > 
> > I won't be able to test the patch until next week, but I would actually
> > implement what you mention in the comment as a separate patch. This
> > would avoid having a special-case for a specific VID/PID without a
> > quirk like "MAP_LAYER_BUTTON" defined, and if it were to cause
> > problems, it would be straight forward to revert.
> 
> Thanks for the feedback, should I make this a series of 3 successive patches then?
> 
>  1) Add the device to xpad_device[]
>  2) Support the Layer button with MAP_LAYER_BUTTON
>  3) Support the X-Box button (as suggested in the comment instead of
>  VID/PID checks)

Actually, it occurs to me that I can just mask for 0x03 to allow both
existing and the new controller to work - without a VID/PID check.  I'll
test and break into a multipart patch v3 shortly.  
