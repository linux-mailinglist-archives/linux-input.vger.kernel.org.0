Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF8F140300
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 05:24:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726925AbgAQEYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jan 2020 23:24:13 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51344 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726566AbgAQEYN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jan 2020 23:24:13 -0500
Received: by mail-pj1-f67.google.com with SMTP id d15so2583414pjw.1;
        Thu, 16 Jan 2020 20:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ANpzFmgjjuaZgNEEBDm5PaG+F+Suwy/uIclI0OaRnP4=;
        b=cIVbgfHFRatkQnOmtGISxJXOYHYBnXKXuk/8gi0JxX7/6LqD7P28IGHSgERryqKAp3
         qR4KGBZ2DCGcmtX+wZMFcOIuyjoxC2zW2YUI4XlgN+ao4SvFQXmcrv09ev3cGvkFj47s
         q5RiJCo5xsqJ9Lf2XQEoaXMXFyJ4nKsj7/lQNoX/tkhFnTLE0kqF7wzs2Wmo9Ox5jhgJ
         uiYY/5jaadyzv5m64cGex4Rc33tZ6Cl+oQWe0T2P7lmJnQogFAKZluEcG/0sP6gZu1J9
         X9ZMQepYdPVTNRcTyR9mWXpoPukvLzVaAeuopMyYLoHgnJEv/OfYNVnfWtLtAFrEgnLA
         LWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ANpzFmgjjuaZgNEEBDm5PaG+F+Suwy/uIclI0OaRnP4=;
        b=eCFW+pTG3wHAnVrnLfA8wDnaArkXK0dixsjfRPp/Etr0AfnAAvVJ+E4hXDN8IoAnYO
         SzGr60YNKPBmEhFelPPeXDPoE+ovTpKwnM9jyHWpNKjPVzLNCe9pqjhrUsPChojF7UCZ
         YqMxtXxThj4DRjUWGFSujLAUBADAumYRduEZw238bBeqIZ/dfLg3I936BfugJ+rhbOIo
         GdrQLCSo0NNTt3vv1IvKZxa9MMBVmQQJCBIka9CxJRKNjJbUtxuNwFgDDSbGB6IpAOGk
         Ozcf6xGtBredW6jtSvGnKMkJTYXz6LY3n/iQUk6qaqB5G+ikTroJSpf5gV21GT8CCwvp
         qgAA==
X-Gm-Message-State: APjAAAUPqvD9nEXZslvwiILJJ+dySYdB1QcpyEKRpbCP4Q6wGfn1UExW
        5RFdMXnaZZ/OG/b5stIlEH4=
X-Google-Smtp-Source: APXvYqwE05jpaDTRqD3BU1fHu6zE7cC/ZX1k2DsUR0/fW/MOvfolBW34Hl0kZoAtkbRKjImpQRTWzQ==
X-Received: by 2002:a17:902:b48e:: with SMTP id y14mr36241040plr.260.1579235052436;
        Thu, 16 Jan 2020 20:24:12 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id j125sm26799062pfg.160.2020.01.16.20.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2020 20:24:11 -0800 (PST)
Date:   Thu, 16 Jan 2020 20:24:09 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] input: max77650-onkey: add of_match table
Message-ID: <20200117042409.GE47797@dtor-ws>
References: <20191210100753.11090-1-brgl@bgdev.pl>
 <20200110182841.GT8314@dtor-ws>
 <CAMRc=Mcu-oNC009JLkNSDrKjg_ygb63ZTnrmu+8NwNZrOVsEZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcu-oNC009JLkNSDrKjg_ygb63ZTnrmu+8NwNZrOVsEZQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 11, 2020 at 11:22:55AM +0100, Bartosz Golaszewski wrote:
> pt., 10 sty 2020 o 19:28 Dmitry Torokhov <dmitry.torokhov@gmail.com> napisał(a):
> >
> > On Tue, Dec 10, 2019 at 11:07:53AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > We need the of_match table if we want to use the compatible string in
> > > the pmic's child node and get the onkey driver loaded automatically.
> >
> > Do we really need of_match table or adding
> >
> 
> Not really. Technically not anyway but we merged bindings that define
> it (at the time I didn't know any better) and seems we're stuck with
> it. Please see the discussion below a similar patch for regulator
> subsystem[1].
> 
> > MODULE_ALIAS("platform:max77650-onkey");
> >
> 
> This is already in there, but if someone defines the compatible in the
> device tree as per bindings, the module won't be loaded despite the
> MODULE_ALIAS() definition.

I see. Applied, thank you.

-- 
Dmitry
