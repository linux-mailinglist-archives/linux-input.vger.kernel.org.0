Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79B541FCC4
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 01:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfEOX3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 19:29:40 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37421 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEOX1k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 19:27:40 -0400
Received: by mail-pl1-f195.google.com with SMTP id p15so612950pll.4
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 16:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dqTU/tIImF6xPllRFE7RdZlaBvWAayTrOgTRMUWaZ7A=;
        b=qTU5/RbK4P8mC0sEcGb2S+A7q1NHO9rsHBcxs8La8cX9tBNjYYkG8iiEvJ84E4OcaJ
         B0YsubZW3mCgQ6EWmzeJ6dpE5MXMCGzwig3KlbE2W021AjNgu32ifa/G7fUMVZ9Wy6oJ
         D0Fe6avKRm8J0gJaaaIIt4HjEvYXlPi8mYx+5nUaB5s6HoHPseoOywgFNTHT6nt05MfZ
         BhR9rBGMN6ZrvYwP8X3gIDb3+bR78EFzQRfDl7vEYC76GWxdNnvDlHEiQ4ci4bpm9wSp
         yhowoPfrmuGXLTV6pwyr5QPES9s6/1HoiymIwR4m3yzYRYcRjrv2pbUAXLxaC4Q7+zzN
         wJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dqTU/tIImF6xPllRFE7RdZlaBvWAayTrOgTRMUWaZ7A=;
        b=dwbnKtne05hWPgovy3GSYUJMUYQroX1+kA3ru9p8SX4+XHLtZrcxljGJlMZpSQ0OGp
         29XAJH4Cve9OxpX7sef2cCp/JO16ukOOccY+Y4bhhlOMw88sk80YUqMHSVeectntg9ol
         sMjPI2v6JX5T6G1/6SKHdSiQQLAeCQn9eKyi9EVxjsotgHITPTBiQFyH8hsmDvFfwlnj
         2OwK7d3/+i330HzOV5DpjvuYLWO1rOVwTrLhKBiCSxCbuIIA1AHmeMf0Itc80N8A/Piu
         s9nRjJVnrApN8uXFfSqB0kQc1tb+b4bRR+9/Zg3gFXK56b+LuJI8jtHU0gIOLA3un8AM
         xgrw==
X-Gm-Message-State: APjAAAWWniQskFrCEa97P4jLzT/UAkbFEPQS2572QxqKkfdesG25mBb2
        On2VlUxRaJNlpPwyy0twlkQ=
X-Google-Smtp-Source: APXvYqx64WsB4FQrAOIDsqx67A7W2CjJk67E/BELdGHENxhp6xWaThBhvrxmRxmO/GM83DoUMFXJKg==
X-Received: by 2002:a17:902:7e04:: with SMTP id b4mr46780374plm.211.1557962858652;
        Wed, 15 May 2019 16:27:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u75sm6989346pfa.138.2019.05.15.16.27.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 16:27:37 -0700 (PDT)
Date:   Wed, 15 May 2019 16:27:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Mack <daniel@zonque.org>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v4 1/2] input: touch: eeti: move ISR code to own function
Message-ID: <20190515232735.GB134544@dtor-ws>
References: <20190429152411.12835-1-daniel@zonque.org>
 <3ed15369-f5cc-5ead-9ede-e543eb6ddcc2@zonque.org>
 <20190514031214.GA59902@dtor-ws>
 <04836d4a-53bd-0cd1-f853-3a730952d68c@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04836d4a-53bd-0cd1-f853-3a730952d68c@zonque.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 15, 2019 at 09:54:17PM +0200, Daniel Mack wrote:
> On 14/5/2019 5:12 AM, Dmitry Torokhov wrote:
> > Hi Daniel,
> > 
> > On Mon, May 06, 2019 at 04:52:19PM +0200, Daniel Mack wrote:
> >> Hi Dmitry,
> >>
> >> Is this one good to go in? WDYT?
> > 
> > I wonder if we should combine the 2 and have something like below.
> 
> Sure, looks fine to me, except for one small yet important thing - see
> below.
> 
> 
> 
> > Input: eeti_ts -  read hardware state once after wakeup
> > 
> > From: Daniel Mack <daniel@zonque.org>
> > 
> > For systems in which the touch IRQ is acting as wakeup source, and that do
> > not support level-driven interrupts, the interrupt controller might not
> > latch the GPIO IRQ during sleep. In such cases, the interrupt will never
> > occur again after resume, hence the touch screen appears dead.
> > 
> > To fix this, check for the assertion of the attn gpio, and read form the
> > controller once in the resume path to read the hardware status and
> > to arm the IRQ again.
> > 
> > Introduce a mutex to guard eeti_ts_read() against parallel invocations
> > from different contexts.
> > 
> > Signed-off-by: Daniel Mack <daniel@zonque.org>
> > Reported-by: Sven Neumann <Sven.Neumann@teufel.de>
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/touchscreen/eeti_ts.c |   71 ++++++++++++++++++++++++++++-------
> >  1 file changed, 56 insertions(+), 15 deletions(-)
> 
> [...]
> 
> >  static void eeti_ts_start(struct eeti_ts *eeti)
> >  {
> > +	mutex_lock(&eeti->mutex);
> > +
> >  	eeti->running = true;
> > -	wmb();
> >  	enable_irq(eeti->client->irq);
> > +
> > +	/*
> > +	 * Kick the controller in case we are using edge interrupt and
> > +	 * we missed our edge while interrupt was disabled. We expect
> > +	 * the attention GPIO to be wired in this case.
> > +	 */
> > +	if (eeti->attn_gpio && gpiod_get_value_cansleep(eeti->attn_gpio))
> > +		eeti_ts_read(eeti);
> > +
> > +	mutex_lock(&eeti->mutex);
> 
> If you turn the above into a mutex_unlock(), I'm happy :)

*sigh* I so wanted to save 2 bytes here ;)

Thanks for spotting this.

-- 
Dmitry
