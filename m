Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FFA0C8FF4
	for <lists+linux-input@lfdr.de>; Wed,  2 Oct 2019 19:30:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbfJBRaM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Oct 2019 13:30:12 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43407 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727751AbfJBRaM (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 2 Oct 2019 13:30:12 -0400
Received: by mail-pg1-f195.google.com with SMTP id v27so12205725pgk.10;
        Wed, 02 Oct 2019 10:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dD7LlVVkjL4mW1qTKA1cs6coFqWpKMl6b+eHXZuUZxg=;
        b=WsBKFgTkvvcvJrsRQxVCu99NRM1DedTmOwmFuelXbJmlFsE09XCjOaVhezuV18rzmu
         p2IjKGr1mb4jfZXVADqYGX4aPnDpAKavVVCjx8RQAY1Bgo5eJf4HWJBGt58rUlAXWRzJ
         lWwh8zo39ZZWJgvofsN23zqvbEFigM2Nrjf19pbXzudKJYT00pMIY5bziOmMjvHE/WZ8
         ej76hSoIyEewaJLJZUOt7zzqrwQPGc56tcBeDQGzvFUlxhE3yej2tdlZiBuL1Dyq4H5A
         tXqiJWO+BwO/FsKBJXcjNsJjcpR5tYOamRlGHWy5eZRfR89Pb5wbFVYp8tH11AEYkDc0
         gtUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dD7LlVVkjL4mW1qTKA1cs6coFqWpKMl6b+eHXZuUZxg=;
        b=ezBmZ21D/8VTJ5nG2RSLnFlJUy3lMsSJ2fB2icx5IR83AxR0c/rHZhEJjWpiu4YuVG
         Bk8afr0PGKl4+z4wCBuuc568X+dZ/XV7VLMxXokqMVHhISX/uXyDlP9iqXcCMzxFDYmF
         Qwo3/3pynZHNd8XVamqepIpC22W4K2nL7kqm471lBisjCe4am8L6f/Ua1FBsNWKkhGV6
         R8uAub9A7B5fCaLDn7H+aeTqHD488Fj9VgBLw2BcEiyEx52fX/ZheYyUcQIxSIm5Vesn
         ndPm7tAl0UwsslC9i+w1B0O9cnikXehoJxP75vyP39hG7aGX1omrtztBC5BYHm+K7Kn2
         uWrg==
X-Gm-Message-State: APjAAAVrhZ12WWOhVsmi+EXPw2R99tIAGyJT29CzYn1Ry72Cf9gN+/0F
        EmyMvm57x/cYGbbLcdlJ4dg=
X-Google-Smtp-Source: APXvYqyQ0wWZY6zmIhMjDZAleQyT7tsDpDVjj443C1kRik1Feb74sY/vqLX4q/o8ROz/SKWxf78t5Q==
X-Received: by 2002:a62:c141:: with SMTP id i62mr5951606pfg.64.1570037411093;
        Wed, 02 Oct 2019 10:30:11 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w2sm59056pfn.57.2019.10.02.10.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 10:30:10 -0700 (PDT)
Date:   Wed, 2 Oct 2019 10:30:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        andriy.shevchenko@linux.intel.com, andy.shevchenko@gmail.com,
        simon.budig@kernelconcepts.de, hdegoede@redhat.com, fcooper@ti.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, bcousson@baylibre.com, tony@atomide.com,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, shawnguo@kernel.org,
        mripard@kernel.org, wens@csie.org
Subject: Re: [PATCH 2/6] dt-bindings: Input: edt-ft5x06 - add disable
 wakeup-source documentation
Message-ID: <20191002173007.GA20549@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-3-m.felsch@pengutronix.de>
 <20190917170743.GO237523@dtor-ws>
 <20190917171814.owcttekv56xgmsts@pengutronix.de>
 <20190917172658.GQ237523@dtor-ws>
 <20190930231146.GA30010@bogus>
 <20191002130018.pvgipl6bkcv3dexj@pengutronix.de>
 <20191002152003.ag36lrragazsdn5j@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191002152003.ag36lrragazsdn5j@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 02, 2019 at 10:20:03AM -0500, Benoit Parrot wrote:
> Marco Felsch <m.felsch@pengutronix.de> wrote on Wed [2019-Oct-02 15:00:18 +0200]:
> > Hi,
> > 
> > all of you using a edt,* touchscreen and currently the driver marks
> > the touchscreen as wakeup source. To keep backward compatibility I added
> > a workaround binding (see below) but Dmitry prefer to use the normal
> > "wakeup-source" binding and change the affected device-tree's
> > (discussion below). Can you give me your ack/nack for Dmitry's solution?
> 
> So, if I understand this correctly, currently the driver always assume it
> is a wakeup source regardless if the "wakeup-source" DT property being
> present or not. And the proposed change now is to fix the driver so that it
> will assume a wakeup source role only if the DT property is present?

Yes, that is correct.

> 
> If that is the case then ACK from my side for the AM43x devices.

Thanks.

-- 
Dmitry
