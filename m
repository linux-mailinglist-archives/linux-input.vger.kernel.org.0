Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 890C51A3B67
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 22:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgDIUgF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 16:36:05 -0400
Received: from mail-pj1-f67.google.com ([209.85.216.67]:51158 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgDIUgE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 16:36:04 -0400
Received: by mail-pj1-f67.google.com with SMTP id b7so1783938pju.0;
        Thu, 09 Apr 2020 13:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=dFIub08dv1QQq5SgcObGuR/DyrCleszAJVI9be3EdCA=;
        b=K1cFSHTiOgekug/s67L3AghkWAlJq8b+yZbE5hI1GI+hEGEj25JWhP0qUA0QTDNMYA
         BweoAnl7DRMHegPwITP+6vnaZPuWbpAwc7ExJR2rmdkFv3VF587cVh7/S0xqT6WFX/Fq
         H7M75LG295cteN6e37Fgh0yFiFcJvocsPrUjeKni7uKgzqsBCH0x2+sSAebVURwwXntP
         xfyx0iRNfbAYd6EHs851WBbzBSbX73ojIrHUW+ujEUZjHTbCJ/NxI3Nz7HXWt7+jacp2
         KFq7EMJWE+H+B2yIuJtU5+bJ8LZ+0PKIhIW0YckEjHR/gta3f67E19wMddr6ksP79sTG
         5oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=dFIub08dv1QQq5SgcObGuR/DyrCleszAJVI9be3EdCA=;
        b=fVwpPN35x0evMHwaBC51AUOJZ0LEy2ufJ5jeY//lXPDfPxtC8YwKn6l2ZvamDN9fP7
         UKCMl1OI5uP12Ez4zBkMJaWFCaHFLtMyCxWQL6O2DNK7mRUsE9oHuo2CWb2w9CJ1MYfI
         hIiPMjMrvS6BJZRyIiugotOKPtFDmaf9vd07kiIz38PuI8D7scs63gqzDpaqHnyPonxX
         9Qzzkznb/9WT8avp5QVe9i0NiObuDgMsjRzAsiE6XO6RgixNpRgfUupVQckdSJtc7E1T
         7b476cOhku8BpW/DTpXvQnnulrxxhf+8KPtrByit6cYsOM7WKPu8bbPH6QeyjHrGtwD5
         VetQ==
X-Gm-Message-State: AGi0PuYzx5viZFF5uAtTsqF8XoZhP+bwDGvlxhApDm9obKFELaMHa1Ur
        /tKNRtyUGxVYdM5D/GhSJzA=
X-Google-Smtp-Source: APiQypIn3amnj/rWygPYz5aPM28w0LFg6zTOEBQT/lUYZ94DMZUxgOivrrJbNlYvlBUaX181p5yL/g==
X-Received: by 2002:a17:902:7448:: with SMTP id e8mr1356414plt.115.1586464563816;
        Thu, 09 Apr 2020 13:36:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id bt19sm50710pjb.3.2020.04.09.13.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 13:36:03 -0700 (PDT)
Date:   Thu, 9 Apr 2020 13:36:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Oliver Graute <oliver.graute@gmail.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Message-ID: <20200409203601.GQ75430@dtor-ws>
References: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
 <20200409105253.qvezbikpbnrkig52@pengutronix.de>
 <20200409120242.GA17410@portage>
 <20200409123622.GA3676135@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200409123622.GA3676135@smile.fi.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 09, 2020 at 03:36:22PM +0300, Andy Shevchenko wrote:
> On Thu, Apr 09, 2020 at 02:02:42PM +0200, Oliver Graute wrote:
> > On 09/04/20, Marco Felsch wrote:
> > > Hi Oliver,
> > > 
> > > thanks for your patch.
> > > 
> > > On 20-04-09 11:27, Oliver Graute wrote:
> > > > From: Oliver Graute <oliver.graute@kococonnector.com>
> > > 
> > > ...
> > > 
> > > >  drivers/input/touchscreen/edt-ft5x06.c | 4 ----
> > > >  1 file changed, 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > > > index 06aa8ba0b6d7..6fbc87d041a1 100644
> > > > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > > > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > > > @@ -819,10 +819,6 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
> > > >  	 * to have garbage in there
> > > >  	 */
> > > >  	memset(rdbuf, 0, sizeof(rdbuf));
> > > > -	error = edt_ft5x06_ts_readwrite(client, 1, "\xBB",
> > > > -					EDT_NAME_LEN - 1, rdbuf);
> > > > -	if (error)
> > > > -		return error;
> > > 
> > > 
> > > I don't see how this call can corrupt the stack..
> > 
> > I admit that this is strange. The patch fixed my problems so I posted
> > it. Still interested in the root-cause.
> 
> I'm wondering how you nailed down to this function? Have you able to use kASAN?
> 
> By the way, what I²C controller behind this? Maybe the bug in its driver?

I would try instrumenting drivers/i2c/busses/i2c-imx-lpi2c.c to make
sure it does not try to stuff into the rdbuf more data than requested...

Thanks.

-- 
Dmitry
