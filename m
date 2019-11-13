Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BE3FABB6
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 09:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfKMIFr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 03:05:47 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39172 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbfKMIFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 03:05:47 -0500
Received: by mail-pf1-f196.google.com with SMTP id x28so1106854pfo.6
        for <linux-input@vger.kernel.org>; Wed, 13 Nov 2019 00:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1VNtpxA+xns0+HvR9pjtHdo7qWmIpQuOu+mCOMct/Dg=;
        b=LSuj3jRs/Q+lgczFwrAb4yYq5E2ZBJj9G5sYpwaZ/ieW8ip5V7fV5lwA+X3q2WD1Yy
         iP+H1WQYaPBJAnA/IBaYR0eYCzWbfs9AGcuPJGsnifLlTxsexcQHvpWHtaF8ceZPc/8w
         bp0yIaQaRkEg+JbzJCEwq/oEibM8nYCV8C7XBuJOZMavkPzipz09gjZVgUkQ/utIOFlT
         u/S19B2tKZZaPmI0pO7cBSpdliKv10GkmTpRaAeaxqe0+XGbhPHl2W1OcN93K2p+XnYa
         O8a1g+hCc+M4LLw2nBAVrrTHyOq4wtkPf4u/+UQc7qwXB/KCkTc+CAeUn9FyDEZ/tqD2
         Gtig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1VNtpxA+xns0+HvR9pjtHdo7qWmIpQuOu+mCOMct/Dg=;
        b=nSq/lebWHMIHio+8yqTxiTlyz515+smkBeAvynh8JI9wgUG4ys6YKE4cQ6HRN+06DU
         3xeWbcGAfvddEPNc2QhULSEDyMWDV0NGaBm7ZH24mlYpUTZvLeAgL/39u+CjJgXCMeFR
         ouojs7KCCGA12yUTbcdLzwHSB3fJXIDmSY4/EDEbjASrcEw2EXa1k9yWZRIE/FcPgy3s
         q5GR791egjacV6T939e28DKXNOHlu6MbFJGfB/cJ1EALy78HrKzeGeaWNH4tgoVvdooS
         1lnmKSE4tP0heZYucn0UI9hpVc05ImbP5AEpa6JCWGRsXxwU3ZyD+bTThHVQPzi7p3cg
         j51g==
X-Gm-Message-State: APjAAAXobTjEba3yXg2xmA2KPVglWwPhXmB2uFOZRqcpFGoMytSejAnp
        Iix88VodYhyvBxY5ptwtT8ZYV242
X-Google-Smtp-Source: APXvYqwlKzhBtQCi/9psWFe0MyS1DlpfPGNmafoOOhr0kvDkcLq9E1Cm1pCD+OyHwwNp4pUQEGPKiA==
X-Received: by 2002:a62:2cd7:: with SMTP id s206mr2793083pfs.106.1573632346371;
        Wed, 13 Nov 2019 00:05:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x2sm1503078pge.76.2019.11.13.00.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 00:05:45 -0800 (PST)
Date:   Wed, 13 Nov 2019 00:05:42 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "zhengbin (A)" <zhengbin13@huawei.com>
Cc:     pali.rohar@gmail.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: alps - Remove unnecessary unlikely
Message-ID: <20191113080542.GN13374@dtor-ws>
References: <1570869407-41262-1-git-send-email-zhengbin13@huawei.com>
 <f9e1bf60-6936-4aea-090f-cc64a1fffa25@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f9e1bf60-6936-4aea-090f-cc64a1fffa25@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 11:11:04AM +0800, zhengbin (A) wrote:
> ping

No, the preference is to keep the code here as is, thank you.

> 
> On 2019/10/12 16:36, zhengbin wrote:
> > IS_ERR_OR_NULL already contains unlikely, there is no need
> > for another one.
> >
> > Signed-off-by: zhengbin <zhengbin13@huawei.com>
> > ---
> >  drivers/input/mouse/alps.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> > index 34700ed..ed16614 100644
> > --- a/drivers/input/mouse/alps.c
> > +++ b/drivers/input/mouse/alps.c
> > @@ -1476,7 +1476,7 @@ static void alps_report_bare_ps2_packet(struct psmouse *psmouse,
> >  		/* On V2 devices the DualPoint Stick reports bare packets */
> >  		dev = priv->dev2;
> >  		dev2 = psmouse->dev;
> > -	} else if (unlikely(IS_ERR_OR_NULL(priv->dev3))) {
> > +	} else if (IS_ERR_OR_NULL(priv->dev3)) {
> >  		/* Register dev3 mouse if we received PS/2 packet first time */
> >  		if (!IS_ERR(priv->dev3))
> >  			psmouse_queue_work(psmouse, &priv->dev3_register_work,
> > --
> > 2.7.4
> >
> >
> > .
> >
> 

-- 
Dmitry
