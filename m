Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A782C3A71CE
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 00:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231499AbhFNWOy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 18:14:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231226AbhFNWOx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 18:14:53 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0CCC061574;
        Mon, 14 Jun 2021 15:12:35 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id c12so11696338pfl.3;
        Mon, 14 Jun 2021 15:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tfaE+ckEfdYiVmVZT4kEyQZOGqZRS3O95UKV5ziD/LM=;
        b=PTUG4iIiYxk8tOELSf72zXlEnMuz60cKGRFeGulxWkr7bWPyJ+V7s6UjKINBryR8UK
         Ij0Mn7Vf6a8bDjCDCEd5lJMOIl8Ei0i8bGGoTv87rjeujjpUOfSjeiARMD4B+gV9fD/o
         Teyf1fiQl3bEYb8PAmZUT8tvTocx8JxYQZlAiB5xLZFbMSyRjutBpJHPAZeZwurQmQIn
         +M/N+/j3XLFCe0jihu5SICEtKivUmct7+7HSs6XnbMy2a++U+4orr1AFQZTGidd+SVQM
         eQKJ9FepQrWxymxTH+BlYecFNXB1aUE1FGTT2JhPHEewlozwLiwGfpFXy5Qe/HfgfGx4
         SkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tfaE+ckEfdYiVmVZT4kEyQZOGqZRS3O95UKV5ziD/LM=;
        b=QCbvlxz6uvXKPR5SWPtBiI+wD2BwVl4dW3N2u3ZvKugZbtVHhgKt6aaScaMUE8kRsX
         QzgIaydYi/WR08xVphVg/Au2/boNaQ7i9Tmh52/pAjJFA8FwCVlGwls9lfdiWOK0zj+w
         JtRXJeyXqrKFw5Dj04Ijs2T4oIGgyj3Ce3qrr8VBUgB18e5vwAFf/dx3T5KVqp5ziym2
         vAqTQG/BI7mNkMsTu0LIyS3O3iBQU+mQF0ZV2vLep07i8VqqhGqjSppeuIYJSuWAbrsk
         6RrkdKzqveIJ42ujvX7xtJ1XWnKRbFZ6Z+dqnhJITUjnKGZ1Xgpm9og6+VpD/BdkzEHY
         sG4w==
X-Gm-Message-State: AOAM5302D1ItDXjxts8t12ST/ZlOHlTDSuk0yXhgfb4YnoWNgFjh2VfW
        m68UO6LSxr5RDVWA9P/sXrQ=
X-Google-Smtp-Source: ABdhPJz99UtJzCwMKEZFhBhS8Wj+/+Sxwia8HuoR2wtMHTOw+5BAJzGB+AJiBLgGsu6FBo3E5TYc5g==
X-Received: by 2002:a62:e21a:0:b029:2ea:26c5:2ec3 with SMTP id a26-20020a62e21a0000b02902ea26c52ec3mr1241436pfi.8.1623708754599;
        Mon, 14 Jun 2021 15:12:34 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id m7sm7872812pgr.62.2021.06.14.15.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:12:33 -0700 (PDT)
Date:   Mon, 14 Jun 2021 15:12:31 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH][next] Input: Fix fall-through warning for Clang
Message-ID: <YMfUT7pvBWreiR1K@google.com>
References: <20210607214852.GA65141@embeddedor>
 <91eef5ab3143ae8fadb8eb2969aecba5f3e7ad98.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91eef5ab3143ae8fadb8eb2969aecba5f3e7ad98.camel@perches.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Joe,

On Mon, Jun 07, 2021 at 03:02:40PM -0700, Joe Perches wrote:
> On Mon, 2021-06-07 at 16:48 -0500, Gustavo A. R. Silva wrote:
> > In preparation to enable -Wimplicit-fallthrough for Clang, fix a
> > warning by explicitly adding a fallthrough; statement.
> []
> > diff --git a/drivers/input/joystick/sidewinder.c b/drivers/input/joystick/sidewinder.c
> []
> > @@ -660,6 +660,7 @@ static int sw_connect(struct gameport *gameport, struct gameport_driver *drv)
> >  					fallthrough;
> >  				case 45:				/* Ambiguous packet length */
> >  					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
> > +					fallthrough;
> >  				case 43:
> >  						sw->type = SW_ID_FSP;
> >  						break;
> 
> Yuck.  Super ugly.  There's no need to play games with indentation.

Yeah, the original code is not pretty :(

> 
> Perhaps the simpler:
> 
> 				case 43:
> 					sw->type = SW_ID_FSP;
> 					break;
> 				case 45:				/* Ambiguous packet length */
> 					if (j <= 40) {			/* ID length less or eq 40 -> FSP */
> 						sw->type = SW_ID_FSP;
> 						break;
> 					}
> 					sw->number++;
> 					fallthrough;
> 
> 

Could you resubmit this version properly formatted?

Thanks.
 
-- 
Dmitry
