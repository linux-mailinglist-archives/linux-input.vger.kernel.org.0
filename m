Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 257D81A33AD
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 14:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726579AbgDIMCq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 08:02:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:37027 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDIMCq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 08:02:46 -0400
Received: by mail-ed1-f66.google.com with SMTP id de14so12969324edb.4;
        Thu, 09 Apr 2020 05:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=twKaaVBKlEch0/x9uwA4gV1xi58wSqfI7HxuMOBeimU=;
        b=Wkdsn1+SM7OgLx/h0cHV8CmfvQPdFnlInBuf1OYTnFQd3LIy0Ri7arIewbWep9cwB7
         70yQK6r58MANNA0zYDjWqZFht43A1aoAMtsny3nuVomAELS+GDvB+5IV8Jqxj01na0Qz
         xLzVUt3UWNt7fugpGpMWnyn7m/F9UsdM3QJdGJZ5uMibdnWUVspCYnmKj/v7K07THmH8
         8bpTYtOE8aMjZw2RgUSzimY2+y/y5ykeM8mKRmN03kzuyfNOHGXrvwcCXlyUso08TkZC
         Ht5QCkMfgF5mAH337OVnMcQhvRJO3y01vBZyL61UhrRktUmnh3+roWf4fi7iHOhXL7J+
         cP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=twKaaVBKlEch0/x9uwA4gV1xi58wSqfI7HxuMOBeimU=;
        b=ewHeaSLB7EHm3FIA0IsDBb3H09p1NiLWODyr6JsatpqJz3bayZOh3ChlJn8kNY63ay
         YMOB7+YkUMlo50JMDHWJjg3PNZ9JGMvkYtaY/QzeVk7aG6I3gp70/tu8zNzDj30G5Vs8
         +Ops9WYgOl/k+6EmD8bFid7UhzUcCvLlAmjT28ERp/K+4PO04dZN4DtYp1JsfhxsjK0y
         T/swEHQaXU4eymh5yzspO++a0+4LheHBKoN8FUXUuzprIn4lzsTLFlLXdQ6NW/Qz+1BV
         ph20Hd9hStA+YCV/YTaPF0nwDJ7VKi0udGMMW7Gy7m1zDMTKV63cCa8zbUuqzIINdMYE
         okDw==
X-Gm-Message-State: AGi0Pub9udIvrBbqYQs+9W49D92uQeYyNinbpNQihI0GAk3sT7B24jF7
        pr1X1v6WrFR0tc9QzqIIUtQ=
X-Google-Smtp-Source: APiQypIvNXmg6PpEovdL8+6IB7HmipuoGYaNts413NunzsPAJ7nxVRpY99Y83KsHl0wf8It1JrtMqA==
X-Received: by 2002:aa7:dd0f:: with SMTP id i15mr11168556edv.8.1586433764021;
        Thu, 09 Apr 2020 05:02:44 -0700 (PDT)
Received: from localhost (ip1f115f16.dynamic.kabel-deutschland.de. [31.17.95.22])
        by smtp.gmail.com with ESMTPSA id e10sm116551eds.2.2020.04.09.05.02.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Apr 2020 05:02:43 -0700 (PDT)
Date:   Thu, 9 Apr 2020 14:02:42 +0200
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     dmitry.torokhov@gmail.com,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] Input: edt-ft5x06 - fix crash on EDT EP0110M09
Message-ID: <20200409120242.GA17410@portage>
References: <1586424425-27038-1-git-send-email-oliver.graute@gmail.com>
 <20200409105253.qvezbikpbnrkig52@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409105253.qvezbikpbnrkig52@pengutronix.de>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 09/04/20, Marco Felsch wrote:
> Hi Oliver,
> 
> thanks for your patch.
> 
> On 20-04-09 11:27, Oliver Graute wrote:
> > From: Oliver Graute <oliver.graute@kococonnector.com>
> 
> ...
> 
> >  drivers/input/touchscreen/edt-ft5x06.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/edt-ft5x06.c b/drivers/input/touchscreen/edt-ft5x06.c
> > index 06aa8ba0b6d7..6fbc87d041a1 100644
> > --- a/drivers/input/touchscreen/edt-ft5x06.c
> > +++ b/drivers/input/touchscreen/edt-ft5x06.c
> > @@ -819,10 +819,6 @@ static int edt_ft5x06_ts_identify(struct i2c_client *client,
> >  	 * to have garbage in there
> >  	 */
> >  	memset(rdbuf, 0, sizeof(rdbuf));
> > -	error = edt_ft5x06_ts_readwrite(client, 1, "\xBB",
> > -					EDT_NAME_LEN - 1, rdbuf);
> > -	if (error)
> > -		return error;
> 
> 
> I don't see how this call can corrupt the stack..

I admit that this is strange. The patch fixed my problems so I posted
it. Still interested in the root-cause.

Best regards,

Oliver
