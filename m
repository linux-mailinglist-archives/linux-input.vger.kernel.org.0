Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCFF877789
	for <lists+linux-input@lfdr.de>; Sat, 27 Jul 2019 10:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727624AbfG0IB7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Jul 2019 04:01:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45390 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG0IB7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Jul 2019 04:01:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so53586640lje.12;
        Sat, 27 Jul 2019 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=DZuSQOs3k+A8iZ0Th3QCScF8T/FNqRHuvkaRAFfzCjQ=;
        b=J4WwLXz0LZtHeNNm+zdpdsx6I7sBZ0PdZJay9gcTUXbWdMbrfOIm41Ys3osdjg2Gvq
         sNTFALR2bnvakIlmyTK3ItLx1juacv4j/4QOeFfLATguhE85FcpSq5SzWHoVu12oTz1U
         vC2C3+MSujfaazA8qdzMTBN/oKxVRb2KA/AEufzKAKP5iv4lLg/dnRepVogMPt6kGk57
         ChMs2auDA7APL80KJH20d01FkQhaXcFnZFSk5BTZhq4/EPW2CT3X+Br1TJ0+/Uhh3l1l
         gTOQ3ou1VDzR3eNct5N4bxlUp56L/zdQym6QDCTqyVrR9tRipvC9QymP/O3S/5oUAiYR
         Db2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=DZuSQOs3k+A8iZ0Th3QCScF8T/FNqRHuvkaRAFfzCjQ=;
        b=HJjNVFaYShyXd0fZ5iBTiGb4Z/kpdLEJw/5DqT5tBbSuCTXU2fE7NssnFNJtsPyO/Z
         JlqRSrvUnNFFH8X4g9Z19cYMcm/mRPelU3zgCVgeUdSIV7DLG8Pzk/y4B8saVg944Tvl
         jm4hiWDYNfH8IwAuZcf8wjoN92HaA3Mr3FZirEL9IY65YRipsQdyXdN55jwAYhQpdDY2
         KpDhnEvaZleFIp07LM2CDNhf/Ju+rl3pOK2pLDUUaw6mujl9FdfXrxmF4Car3FsIR7sH
         0kfDniLl5aKYyifb6GfrH+2U46W93N0FiN5CKuIUOGABMSFQ13Y+iZqcFRavURg7nDIn
         IXlA==
X-Gm-Message-State: APjAAAXgsWh8Xb3I3xbU5DbFouoJPIdKssyK9LaqHU5Oo5gp5BmYlj1l
        fPfQqBSnNTfmU3V3dAVzuAZVhGSRzoA=
X-Google-Smtp-Source: APXvYqwwtc2SvQedMjkrDVrz3wum5JVvlUZoBzcjO0kJwDjXy7TW1e+8jQaOl1ck55kr6K94NtEoEw==
X-Received: by 2002:a05:651c:1105:: with SMTP id d5mr8223817ljo.161.1564214516765;
        Sat, 27 Jul 2019 01:01:56 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id n1sm9092825lfk.19.2019.07.27.01.01.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Jul 2019 01:01:55 -0700 (PDT)
Date:   Sat, 27 Jul 2019 11:01:54 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: input: Add support for the
 MPR121 without interrupt line
Message-ID: <20190727080154.GB795@penguin>
References: <1558098773-47416-1-git-send-email-michal.vokac@ysoft.com>
 <1558098773-47416-2-git-send-email-michal.vokac@ysoft.com>
 <20190613223945.GA938@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190613223945.GA938@bogus>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 13, 2019 at 04:39:45PM -0600, Rob Herring wrote:
> On Fri, May 17, 2019 at 03:12:50PM +0200, Michal Vokáč wrote:
> > Normally, the MPR121 controller uses separate interrupt line to notify
> > the I2C host that a key was touched/released. To support platforms that
> > can not use the interrupt line, polling of the MPR121 registers can be
> > used.
> 
> 'separate' from what?
> 
> > 
> > Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> > ---
> > Changes since v1:
> > - Document the polled binding in the original file, do not create a new one.
> >   (Rob)
> > 
> >  Documentation/devicetree/bindings/input/mpr121-touchkey.txt | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> > index b7c61ee5841b..97f55273d473 100644
> > --- a/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> > +++ b/Documentation/devicetree/bindings/input/mpr121-touchkey.txt
> > @@ -1,9 +1,14 @@
> > -* Freescale MPR121 Controllor
> > +* Freescale MPR121 Controller
> >  
> >  Required Properties:
> > -- compatible:		Should be "fsl,mpr121-touchkey"
> > +- compatible:		Should be one of:
> > +			- "fsl,mpr121-touchkey" - MPR121 with interrupt line
> > +			- "fsl,mpr121-touchkey-polled" - MPR121 with polling
> >  - reg:			The I2C slave address of the device.
> >  - interrupts:		The interrupt number to the cpu.
> > +			In case of "fsl,mpr121-touchkey-polled" the interrupt
> > +			line is not used and hence the interrupts property is
> > +			not required.
> 
> Absence of the interrupts property is enough to determine polled mode 
> and you don't need a separate compatible string.

I would prefer if we could distinguish between chip working in polled
mode intentionally vs DT writer simply forgetting to specify interrupt
property. Should we key the polling mode off "linux,poll-interval"
property? We probably going to need it anyway as not everyone needs the
same polling frequency.

Thanks.

-- 
Dmitry
