Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7F22BA0D5
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:09:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbgKTDJF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbgKTDJF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:09:05 -0500
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E97CC0613CF;
        Thu, 19 Nov 2020 19:09:05 -0800 (PST)
Received: by mail-pl1-x641.google.com with SMTP id p6so1741184plr.7;
        Thu, 19 Nov 2020 19:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WMS7aIB/NO23lt6kXE+g+Izg563EAupRBJuHmpCuhEE=;
        b=KjaWdXHV32ExNaCnM/RAMs6mXpiiJte1G+bLAUxzpPVhlZnAyLMNapxEuN4l7cEH82
         iUpx3qivue8v+FMZtP7J4Y6z6cscSPuYwsVppFj8cjdcPER4rapcHrr2JC1/vtozpccz
         BFn06mtaZ8hLOvXXZdU/6d+QIiniCitSS4b4T8eXAA4xH1PpJv0WoCuMPfMxUvyLDsb+
         UILzsTcp4iszvomoxyUKWz8GzpxJyzCPNY5JxSlRm9EtXf4uSHtcuHTDFXqkZkFYazph
         VGrlFcodwhSFlbtX0mQjGbuSzGmc5elPuLcsECQLigRbtPHF1Bnv/N8gRhJu5EfJl8om
         VfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WMS7aIB/NO23lt6kXE+g+Izg563EAupRBJuHmpCuhEE=;
        b=Zz/aDGJkbIl/cCWdgXONA3+FLKzqtXy5u8DE4Gh7pn68nGiob1wONATE3DNi6dclwP
         xOerqcr9x4DGmiPoumpBbPLfAlELBCfPQtpYxBanTmqcrKw40h8Q6fXzuyqsQ1yN4gd9
         +XiLvA0dZIRxEKovZ9FKKgSMWloIiRzTXcfzz3a/RaeGycjiW/+Hg6vdbEwrz+EFCMV6
         Ws6Hm3+rD/d+UzXFvndPjOcNVSpBNtdXXssKmRNrzcPX9ZXnB1Ke6GPQm2KcLvPHZ58c
         OA1BcfW9h4hRV/3wLO/b0I086oy1FE5HF6/rK7Ft/9vOiZ/GPlAzmCVLU95X8kKyV5Dg
         u+Yw==
X-Gm-Message-State: AOAM530P/oVRJQNpPxZL1arcT3pR0Hl53ikDOzVO5MRfqcSnBYJQNDLx
        6qv2WkrfZWKbSXv8wAE9zxY=
X-Google-Smtp-Source: ABdhPJyNVla3Pmulonbh3wDLr6fTNNWELSlFmgNvvmy98CJcKGu2bNAuz1gNwh+kyZru2yZbinKXGw==
X-Received: by 2002:a17:902:7c08:b029:d9:8cb:5775 with SMTP id x8-20020a1709027c08b02900d908cb5775mr11474870pll.56.1605841744601;
        Thu, 19 Nov 2020 19:09:04 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id q23sm1550662pfg.18.2020.11.19.19.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:09:03 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:09:01 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Sangwon Jee <jeesw@melfas.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 06/15] input: touchscreen: melfas_mip4: Remove a bunch of
 unused variables
Message-ID: <20201120030901.GJ2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-7-lee.jones@linaro.org>
 <20201113074202.GJ356503@dtor-ws>
 <20201113075525.GH2787115@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201113075525.GH2787115@dell>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 13, 2020 at 07:55:25AM +0000, Lee Jones wrote:
> On Thu, 12 Nov 2020, Dmitry Torokhov wrote:
> 
> > On Thu, Nov 12, 2020 at 11:01:55AM +0000, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > > 
> > >  drivers/input/touchscreen/melfas_mip4.c: In function ‘mip4_report_touch’:
> > >  drivers/input/touchscreen/melfas_mip4.c:474:5: warning: variable ‘size’ set but not used [-Wunused-but-set-variable]
> > >  drivers/input/touchscreen/melfas_mip4.c:472:5: warning: variable ‘pressure_stage’ set but not used [-Wunused-but-set-variable]
> > >  drivers/input/touchscreen/melfas_mip4.c:469:7: warning: variable ‘palm’ set but not used [-Wunused-but-set-variable]
> > >  drivers/input/touchscreen/melfas_mip4.c:468:7: warning: variable ‘hover’ set but not used [-Wunused-but-set-variable]
> > > 
> > > Cc: Sangwon Jee <jeesw@melfas.com>
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/input/touchscreen/melfas_mip4.c | 11 -----------
> > >  1 file changed, 11 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/melfas_mip4.c b/drivers/input/touchscreen/melfas_mip4.c
> > > index f67efdd040b24..9c98759098c7a 100644
> > > --- a/drivers/input/touchscreen/melfas_mip4.c
> > > +++ b/drivers/input/touchscreen/melfas_mip4.c
> > > @@ -465,13 +465,9 @@ static void mip4_report_keys(struct mip4_ts *ts, u8 *packet)
> > >  static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> > >  {
> > >  	int id;
> > > -	bool hover;
> > > -	bool palm;
> > >  	bool state;
> > >  	u16 x, y;
> > > -	u8 pressure_stage = 0;
> > >  	u8 pressure;
> > > -	u8 size;
> > >  	u8 touch_major;
> > >  	u8 touch_minor;
> > >  
> > > @@ -480,14 +476,11 @@ static void mip4_report_touch(struct mip4_ts *ts, u8 *packet)
> > >  	case 1:
> > >  		/* Touch only */
> > >  		state = packet[0] & BIT(7);
> > > -		hover = packet[0] & BIT(5);
> > > -		palm = packet[0] & BIT(4);
> > 
> > No really happy that we'd be losing information about protocol. Is there
> > a better way to suppress the warning while keeping this info?
> 
> Yes.  We can either convert the information to comments, or mark the
> variables as __always_unused.

If __always unused suppresses this warning that would be my preference.

Thanks!

-- 
Dmitry
