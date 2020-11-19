Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E6C2B8C7E
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725843AbgKSHoG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:44:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725816AbgKSHoG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:44:06 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF3BC0613CF;
        Wed, 18 Nov 2020 23:44:06 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 81so3488045pgf.0;
        Wed, 18 Nov 2020 23:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ec1xITJXJPHsK4WsglFJaBFNQfiW4GmeuzD+V4XJvcQ=;
        b=AYnLZxyf5HHWAIr8Lfop48ELkUoCsCG3au63ad/vaD9yMcMXy4TPuI1CkNzLQd+ocp
         pcepIOLmFhV08dMYRbB6fs2DpOs/LyFa5Nj1hgbRyKLqkWLWv45hzCQmRiaTjDrfdMyV
         kcKu8P7LEUTDE5V2JVNAmzSjckoLqBRBIb906id0RPQxb07nvmPpaF7lfab7iPd+Ekrb
         Vmy5JSklZ7yPo7UF6oR7JlEKVRCkM+tneytPX1JEAEE+pYB/dqg37h37w3a098ogFSa0
         46zJx+BJ1lrqjQWhWFM3dwzDOiwD2a7F4SMQw0QSGLNsYJsO1ykqvuPO1bzO81R7SWTl
         Tu9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ec1xITJXJPHsK4WsglFJaBFNQfiW4GmeuzD+V4XJvcQ=;
        b=TLo7OCOsMxraXN04+qzsIq2FYizThRhkZO7yl3csf9Oc60v6dbPxBVZu30ePoxx7WS
         C/UxbBnVXiWx/xESb1r+OEEVtOrUKnTDduVEV2YMu5v3RSx+zSnogoj2/bZeub2Fr3iW
         hWLGO2vMHZp3Pz4v3e0hQwmk6eHoWZRFqlD5Gs3frQYboL730nwOIEqJarut81I5k8ut
         6ebOpmtfTvTvdewkRF4u8wyQVBXnei6j+gD59glMJ3rvtBEgQwHkRsGok6aLNcnfwfU/
         agUJgV44mDzMgIBfHyNJiZF6twmWrPcBJEQIuOsBoQ12+M8L4SX/SEKrEtxiQLFug3gA
         TVwA==
X-Gm-Message-State: AOAM533XSec2C6z5DwjdLPMTfLP68TRdBQSfgsPqsEAFmeiSWZ6lW4jN
        Wc2UbV2EJF59QkIcAKujLukwBQHJemg=
X-Google-Smtp-Source: ABdhPJx5QZcgv0zxlKyXaRhck9HZo8tQrcRiMlZ+WmkWmZ2kaakZ5Lc3RZiVYIJkdKadXlZeCr18ew==
X-Received: by 2002:a63:ff5d:: with SMTP id s29mr11980445pgk.290.1605771845603;
        Wed, 18 Nov 2020 23:44:05 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m2sm4122127pgv.0.2020.11.18.23.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:44:05 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:44:02 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Joe Perches <joe@perches.com>
Cc:     linux-input@vger.kernel.org,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: adp5589-keys - use BIT()
Message-ID: <20201119074402.GH2034289@dtor-ws>
References: <20201119072440.GA116840@dtor-ws>
 <9100d801f26e0a068462f9582b7ce193be813966.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9100d801f26e0a068462f9582b7ce193be813966.camel@perches.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 18, 2020 at 11:34:28PM -0800, Joe Perches wrote:
> On Wed, 2020-11-18 at 23:24 -0800, Dmitry Torokhov wrote:
> > Let's use BIT() macro instead of explicitly shifting '1'.
> []
> > diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
> 
> > @@ -651,13 +652,13 @@ static int adp5589_setup(struct adp5589_kpad *kpad)
> >  		unsigned short pin = pdata->gpimap[i].pin;
> >  
> 
> trivia:
> 
> Perhaps nicer to create and use a temporary
> 
> 	unsigned int bit = BIT(pin - kpad->var->gpi_pin_col_base);
> 
> so in these places below:
> 
> >  		if (pin <= kpad->var->gpi_pin_row_end) {
> > -			evt_mode1 |= (1 << (pin - kpad->var->gpi_pin_row_base));
> > +			evt_mode1 |= BIT(pin - kpad->var->gpi_pin_row_base);
> 
> 			evt_mode1 |= bit;
> 
> >  		} else {
> >  			evt_mode2 |=
> > -			    ((1 << (pin - kpad->var->gpi_pin_col_base)) & 0xFF);
> > +			    BIT(pin - kpad->var->gpi_pin_col_base) & 0xFF;
> 
> 			evt_mode2 |= bit & 0xff;

Different "bit" tough - row vs column.

> 
> >  			if (!kpad->is_adp5585)
> > -				evt_mode3 |= ((1 << (pin -
> > -					kpad->var->gpi_pin_col_base)) >> 8);
> > +				evt_mode3 |=
> > +				    BIT(pin - kpad->var->gpi_pin_col_base) >> 8;
> 
> 				evt_mode3 |= bit >> 8;
> 
> 

Thanks.

-- 
Dmitry
