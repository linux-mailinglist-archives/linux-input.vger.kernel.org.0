Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DE83467D3
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 19:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbhCWShY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 14:37:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232010AbhCWShS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 14:37:18 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B810C061574;
        Tue, 23 Mar 2021 11:37:18 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id w8so10485853pjf.4;
        Tue, 23 Mar 2021 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jx4+GF9ZZYPHMBptUp0vl+dag26ugWpIG2FLz4oA2Bc=;
        b=ZGz1LBB/+Tl/ImvaogRRM+N2fjdxA4mEM6IJCryB1pptDKCa8I+M2/NgvbangQMuml
         ZS9CAh8HDMzPpxMGpmmwesij9DnnRjqLgxrN06Kctx/fF2amLJkPFr4+c3Jn1XDzqbAU
         Z+1vTfSr7RuNEKAWcAUv/qP6FKj/E2khDfdf1njgwL+UAyxkqnFC/R3v+zsEKYHp4t0s
         AXDewHumbobz2+XGRbQmyHtcPRWGZ2g16KJ0shjHCY3h+H82DkC4PCDIrLWAtoo2FPZH
         BPwWJXs1ouJTlHtDuRNJn3hzajss/dQgjdpAf/p51liaTTsvGEE60+uIQjXQg7xP7j8u
         AMTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jx4+GF9ZZYPHMBptUp0vl+dag26ugWpIG2FLz4oA2Bc=;
        b=XBzIo/gtxeT+sxSZXB3Cx3zA0nf6suwOKyWaf/WcYVDFLtN60OajrsCwS/HrjvH3WC
         sj5SDmefwLVZpvqt/pLYNz0G5/IVaj4V9QlnrQxuqA1D5B07VRcJyg4+6/Xq0xCMqVC/
         5YgdQPJG9o9AFr6E9D5fVXe2ZNbrqxYG1w6B+38F2g6Czh3akzE8vWJInmbeOwvJ+mY+
         HUUOzvlV0+tyqcJTdsihMfv9mnMPaQ1rzz7XqOVOnPbUt2UlRU5mGdrfSA2Sv0I6+HeA
         l53ITLf5sBNa+vy2FLV4dvV2jp/vBygYktOty7Ff9xzytCQ+0ibJv6P+C8j+57kNLwv5
         u63Q==
X-Gm-Message-State: AOAM530wim9fh9S/WUyi+juS2ogqleSBygqpU5MXtrH2xFBeRum4TtPG
        NMafUJZ9SMEE1SVN5AZeJ4g=
X-Google-Smtp-Source: ABdhPJzOy6PpC6Md4Mg16vgdEAPmxpVxGglR04sZFMTuBVNZEfItRWOysPkmHR+yZo9X5itOdKjMng==
X-Received: by 2002:a17:90b:4d05:: with SMTP id mw5mr5774207pjb.236.1616524637632;
        Tue, 23 Mar 2021 11:37:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id q25sm17516273pfh.34.2021.03.23.11.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:37:16 -0700 (PDT)
Date:   Tue, 23 Mar 2021 11:37:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: analog - fix invalid snprintf() call
Message-ID: <YFo1WgbYqYdlwxV0@google.com>
References: <20210323131456.2600132-1-arnd@kernel.org>
 <a87d99c0-4527-1430-996b-b30826ecc752@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a87d99c0-4527-1430-996b-b30826ecc752@prevas.dk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 23, 2021 at 02:29:15PM +0100, Rasmus Villemoes wrote:
> On 23/03/2021 14.14, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > overlapping input and output arguments to snprintf() are
> > undefined behavior in C99:
> > 
> 
> Good luck:
> https://lore.kernel.org/lkml/1457469654-17059-1-git-send-email-linux@rasmusvillemoes.dk/
> 
> At least 5 years ago the consensus from old-timers was that "the
> kernel's snprintf supports this use case, just keep it working that way".
> 
> > diff --git a/drivers/input/joystick/analog.c b/drivers/input/joystick/analog.c
> > index f798922a4598..8c9fed3f13e2 100644
> > --- a/drivers/input/joystick/analog.c
> > +++ b/drivers/input/joystick/analog.c
> > @@ -419,14 +419,16 @@ static void analog_calibrate_timer(struct analog_port *port)
> >  
> >  static void analog_name(struct analog *analog)
> >  {
> > -	snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
> > +	int len;
> > +
> > +	len = snprintf(analog->name, sizeof(analog->name), "Analog %d-axis %d-button",
> >  		 hweight8(analog->mask & ANALOG_AXES_STD),
> >  		 hweight8(analog->mask & ANALOG_BTNS_STD) + !!(analog->mask & ANALOG_BTNS_CHF) * 2 +
> >  		 hweight16(analog->mask & ANALOG_BTNS_GAMEPAD) + !!(analog->mask & ANALOG_HBTN_CHF) * 4);
> >  
> >  	if (analog->mask & ANALOG_HATS_ALL)
> > -		snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
> > -			 analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
> > +		len += snprintf(analog->name + len, sizeof(analog->name) - len, "%d-hat",
> > +			 hweight16(analog->mask & ANALOG_HATS_ALL));
> 
> Use scnprintf, this is too fragile and hard to verify. If the first
> snprintf overflows, the second passes a huge size_t to snprintf which
> will WARN.

Also the format needs to be " %d-hat" (note the leading space).

Thanks.

-- 
Dmitry
