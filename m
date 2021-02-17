Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4BB31E107
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 22:07:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhBQVHT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 16:07:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhBQVHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 16:07:11 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9A2C061574;
        Wed, 17 Feb 2021 13:06:31 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id z21so9290338pgj.4;
        Wed, 17 Feb 2021 13:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QOLobN1m4PsV5WCsxl2Kd4kTbQR1Euzif7wEpXKsHao=;
        b=sMPxnjaC3doNxVKbEOz3S/xfRRPgLdj9d4KFAS8qH+9ZbTpzu228z7/dKBFsoKsajL
         M1ia/SpEL4BnKNBjRTxG4XxJD7fJ8xHr5bAzQT/ZqSt4km/a9/uoSiTafhUgJUy3/4Xf
         VXK+sBd7DqyuMopV3fIPzp7KSmPGT3TdS1XAC1/IGeHSvi+OR8PswnMkCyWm643cbmmR
         DkXnMR0jl8Cpaq1fRjuizjQ2vUR0T4w7LMQc3Ti1N0sMtA/Skp1uQg62XhEVvRJjPywI
         CAHMR7jRh11AD92UrFsX89o8IaB+gB5fQJQ92Ti0uCPsQW5kaj2VtoAqzfhFDXjL40mc
         HB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QOLobN1m4PsV5WCsxl2Kd4kTbQR1Euzif7wEpXKsHao=;
        b=EKPM8kgVuX90yoFjehQHdx0cp2oh4Q+1TiNVA6BfTUavmmXBlX5ld5cpeHMTC43VsF
         EGoEqLxBU5ADNyks4FhbVMbsPqs31fVMgUD7qb/htXohfvxciZfqjOqU8RCOYlfMk9dN
         hvjC13kKGNWnV9NpzbaQAf8Rl//0EucEY+njO4GJgRxaY4jsj2SsH+yzhNPR2Urz8cPc
         U9psRhSmBVYAzua6upadHdGYAr7aDoZPB+FbyASxyEFEHQhc0x4BStPG/THCmS+3fw+q
         9nqex8R61s3EtcldsF+zuDg2D6uh1y0JWHS6BjRUtYXz6uWCDmprXKC6p3VMy4JABI69
         +QEA==
X-Gm-Message-State: AOAM533wtelQxgYdJNyxYhx94o4i/iNj1UzEv1VHJj+2E8GIf/eHINDa
        Qtf0tuhchYWpFUzTH488Uu4=
X-Google-Smtp-Source: ABdhPJxhd+vG1wnIsYR75bvhSOQfCvl0vxLh/nZEWeXT+CtBAZGvfvSMoIFdlRCzCU6v5vdTFl5mdw==
X-Received: by 2002:a05:6a00:847:b029:1b3:b9c3:11fb with SMTP id q7-20020a056a000847b02901b3b9c311fbmr1082899pfk.44.1613595990350;
        Wed, 17 Feb 2021 13:06:30 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a459:a528:1312:4d4c])
        by smtp.gmail.com with ESMTPSA id w3sm3012516pjt.24.2021.02.17.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 13:06:29 -0800 (PST)
Date:   Wed, 17 Feb 2021 13:06:27 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
        Lee Jones <lee.jones@linaro.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: applespi: Add trace_event module param for
 early tracing.
Message-ID: <YC2FUwOdIoKKg1Ew@google.com>
References: <20210217190718.11035-1-ronald@innovation.ch>
 <20210217190718.11035-3-ronald@innovation.ch>
 <YC176rlGQeyKuOpn@google.com>
 <20210217205257.GB25685@innovation.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210217205257.GB25685@innovation.ch>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Feb 17, 2021 at 12:52:57PM -0800, Life is hard, and then you die wrote:
> 
>   Hi Dmitry,
> 
> On Wed, Feb 17, 2021 at 12:26:18PM -0800, Dmitry Torokhov wrote:
> > 
> > On Wed, Feb 17, 2021 at 11:07:18AM -0800, Ronald Tschalär wrote:
> > > The problem is that tracing can't be set via sysfs until the module is
> > > loaded, at which point the keyboard and trackpad initialization commands
> > > have already been run and hence tracing can't be used to debug problems
> > > here.
> > > 
> > > Adding this param allows tracing to be enabled for messages sent and
> > > received during module probing. It takes comma-separated list of events,
> > > e.g.
> > > 
> > >   trace_event=applespi_tp_ini_cmd,applespi_bad_crc
> > 
> > You can unbind and rebind a device to a driver via sysfs as many times
> > as needed (see bind and unbind driver sysfs attributes), so I believe
> 
> Hmm, I'm going to have to play with that a bit, but one place it still
> won't help I think is something we ran into in practise: init was
> failing during boot, but was successfull later on.

Maybe compiling module as a built-in and then using kernel command line
option to initiate the trace would work?

If this facility is really needed, it would be beneficial for other
modules as well, and thus better implemented in the module loading code
to activate desired tracing after loading the module but before invoking
module init code.

Thanks.

-- 
Dmitry
