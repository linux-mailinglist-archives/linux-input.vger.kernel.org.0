Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E79C28BC1
	for <lists+linux-input@lfdr.de>; Thu, 23 May 2019 22:45:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387527AbfEWUpl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 May 2019 16:45:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45885 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387394AbfEWUpl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 May 2019 16:45:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id s11so3880103pfm.12
        for <linux-input@vger.kernel.org>; Thu, 23 May 2019 13:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XUm4k9ARWKn5YWfDeM9B8Aaa9MWUhmJ3Z8rFc+Mc9T8=;
        b=Tu92wqtyhtsSf3R6q4Ek3586ciME3HYxCCNaiK1naXkxUa0rw1BonIMgOjIhJbiWGu
         HZI4wF1mReM2JLPuoO3Rgkb7lDVw+3EVQ4tMOYqFTfk+PjAsCE1Y6K239aE/AKBDo1Hs
         tZhXOmlqOu93rngb984oskid1uN8on9r1OvT7C+0T2qUXvl/+Q4UJpFiE+LRSuFYYRYU
         u+lYB1UHTo5Cul20pXWmDZ4eRiuZK+OMWeZA97i3/B/O/KmSWITpPtw/OqGBKyCshpfu
         dYi+22HBAzriOWVgLqkvS1XmTd8v9reZ69WTKv98bRewEGefJn15+k6IGeMwDl9ZTaxu
         HMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XUm4k9ARWKn5YWfDeM9B8Aaa9MWUhmJ3Z8rFc+Mc9T8=;
        b=ntMBdMs9acM3XcWR46TjeGIQ+hnAEMVfq0tHvJYtAVWIvNZG9SCNN7QQynQ/yzhfR6
         hY6g85IH0Je0SLHKdl98GH2hAnH02rBOxU8YcC59UWs+9kzyFdmpiWAmj+Ys3QUnpMQh
         dCpKlPaQTpe8PPEuhPhjOQiO/mQ4dAaOtPdYF7tucUJzp1xq297fusvt2yc6bHEG1hLE
         8Jm6mzlrfK6a2f8gt9WTnaYIQs4yA1dcyAccq2m7L5w7FZPKwvZpR5KoID/371idbQea
         0FAEEPdbIXLpDo8pM4IGWXQrwgZq9jTNTGjpbQb5bxXrGwNQFJ7rZ3I25OZfoQwTo303
         TYNg==
X-Gm-Message-State: APjAAAULA3nIZJN166b+VTDxx8UhX6dVhYpXXi+pTe8n6JsSRmeSMdWp
        MW+JAfJn8RzE8ira6tzffbE=
X-Google-Smtp-Source: APXvYqxPupcuz9TCxjiJpXnWp02sDIyUsvZZiOHxjtRLx3VbZry9QBXUAb8sLQq1s58UhACNe6Ag+A==
X-Received: by 2002:a63:d756:: with SMTP id w22mr100766226pgi.382.1558644340342;
        Thu, 23 May 2019 13:45:40 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x10sm328723pfj.136.2019.05.23.13.45.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2019 13:45:39 -0700 (PDT)
Date:   Thu, 23 May 2019 13:45:38 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Axel Lin <axel.lin@ingics.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs5xx - Remove redundant dev_set_drvdata call
Message-ID: <20190523204538.GC176265@dtor-ws>
References: <20190519041148.32146-1-axel.lin@ingics.com>
 <20190519223452.GA23823@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190519223452.GA23823@labundy.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 19, 2019 at 05:34:52PM -0500, Jeff LaBundy wrote:
> Hi Axel,
> 
> On Sun, May 19, 2019 at 12:11:48PM +0800, Axel Lin wrote:
> > Calling i2c_set_clientdata() is enough.
> > 
> > Signed-off-by: Axel Lin <axel.lin@ingics.com>
> > ---
> >  drivers/input/touchscreen/iqs5xx.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
> > index b832fe062645..158707897c2d 100644
> > --- a/drivers/input/touchscreen/iqs5xx.c
> > +++ b/drivers/input/touchscreen/iqs5xx.c
> > @@ -1054,8 +1054,6 @@ static int iqs5xx_probe(struct i2c_client *client,
> >  	if (!iqs5xx)
> >  		return -ENOMEM;
> >  
> > -	dev_set_drvdata(&client->dev, iqs5xx);
> > -
> >  	i2c_set_clientdata(client, iqs5xx);
> >  	iqs5xx->client = client;
> >  
> > -- 
> > 2.20.1
> > 
> > 
> 
> Thank you for spotting this.
> 
> Acked-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

> 
> Thanks,
> Jeff L.
> 

-- 
Dmitry
