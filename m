Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9DADEA78E
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2019 00:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfJ3XMJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Oct 2019 19:12:09 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:44699 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfJ3XMJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Oct 2019 19:12:09 -0400
Received: by mail-pg1-f194.google.com with SMTP id e10so2560613pgd.11;
        Wed, 30 Oct 2019 16:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=885nbPg6jGyxC22i6djzkMtMUJgUk22kfQ1KMF5dCF4=;
        b=oLRbvfDJm8VrWgYQ6QhhHNuvFg0HWFeMlx6uraE9cHEIEbD8Y1oHlM+S7uMR89ykig
         BfnUSMWbX5wXD6M1Luqc9OvqhZCIF6SP5AJBqS5JclOKquwXOCvDsPXkqnE01c+5FPp3
         UE67elkNz3DkQ2pUbtKXhNOQQ3mOta+UP73RbCv1nErNEX6a+3mjlG44qBG2gPZLXqat
         gZswl4CcAZgj7NiEFz8QmrQEttmSAeNdYh0DtpI3YkTRDdLmPzQ4AiXauoif2iJOqtwe
         u9VlEXoki011PG3H38z5ruJcH44K4kv4CvDQ9vm2frP71hTvnG1h/yE0nunVg8VfNv2G
         daFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=885nbPg6jGyxC22i6djzkMtMUJgUk22kfQ1KMF5dCF4=;
        b=faNfDdAIjZDaru17AUrcq1wG4DJwrbb/H8wyWxKwSsSasmZJAqeBB9o1FjezKSsDRU
         zDR+bq3QzBB3Y/uc6qxYHsZK9pr87aqUjoBFr0e+R0fAoXriIzloUKNbNc4J7CUG57EA
         S6qHQ7nfa3V/r1NAv37QCtuO0VYtfQ1qIlJeUFT4tU+CmbaiY5AvhF6tfWNjkbnWAEj+
         7wOz65DlD0FY0tNXPWXs1RVy6fBH2O3EhmXv+2HPRgJqiDn9Wc4h3nsMdRyOufQ6n2bN
         F7qWjpALE1xJxU7uGoPTF5s5j62v/d1F73453SlSaF75R0YvxoioI1MsLJ4sFqn5afYY
         i3Qg==
X-Gm-Message-State: APjAAAVC0fmFaLlL7lay7X3SLJYtyePJ1RNjgT56N5mNumNJMbS0wq3p
        KxKXJWozflGfeyZzNPTp3IQ=
X-Google-Smtp-Source: APXvYqxbfiwz4ogo5Kw8lSy4iUdkk8hpOLAZPedWTkyCs30wo0LDOGX1RlN+6AjnPZgj+BoIq0bmnQ==
X-Received: by 2002:a17:90a:a504:: with SMTP id a4mr2279687pjq.61.1572477128315;
        Wed, 30 Oct 2019 16:12:08 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r21sm1079774pfc.27.2019.10.30.16.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 16:12:07 -0700 (PDT)
Date:   Wed, 30 Oct 2019 16:12:05 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-kernel@vger.kernel.org,
        Philippe Schenker <philippe.schenker@toradex.com>,
        linux-imx@nxp.com, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/5] dt-bindings: input: tochscreen: ad7879: generic
 node names in example
Message-ID: <20191030231205.GI57214@dtor-ws>
References: <20191026090403.3057-1-marcel@ziswiler.com>
 <20191026090403.3057-3-marcel@ziswiler.com>
 <20191030140455.GA4544@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030140455.GA4544@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 30, 2019 at 09:04:55AM -0500, Rob Herring wrote:
> On Sat, Oct 26, 2019 at 11:04:01AM +0200, Marcel Ziswiler wrote:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> There's a typo in the subject.

I fixed it up file applying, thank you for noticing.

> 
> > 
> > Update example in ad7879 devicetree documentation to use generic touch
> > controller node names.
> > 
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > ---
> > 
> > Changes in v2: New patch.
> > 
> >  .../devicetree/bindings/input/touchscreen/ad7879.txt          | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Dmitry
