Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A80D6B8A7
	for <lists+linux-input@lfdr.de>; Wed, 17 Jul 2019 10:56:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbfGQIxo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jul 2019 04:53:44 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34034 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbfGQIxo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jul 2019 04:53:44 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so22828978ljg.1;
        Wed, 17 Jul 2019 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QcbKPxVwtatmJY3AjWYhH7cBiQwwWyAzrWPhCcC06hs=;
        b=mKc7/n9j44bgxhAFUB6RMzVoM7wReNc/CXUxq7NMCHtIOyeRfxN21HqKuoESCXewIe
         qnc5nAsWRLlJffUeCN8NDp6kXJhTTIUA/zoi8wouTsPQOdKoIuciZpt6IE2HpgxNcImK
         +USTvtiwp/KvlciNssCTZGrSWbnIvLWNuM9nEp/3XOKFaTslIEXxHqRlN0GSscLjiJEW
         tHgNq4CV81E3/L3oas1463yagLrBztLQuQ6TGi2ptNcPZI5d1WKLdR/bjVrgiKXm6n8h
         cA0dCs0n0cffiBLGXRQmXXfU6NluJBYGz9t21fenVZaZOX/hcHMH3mxTwaYBD97mc8lV
         opRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QcbKPxVwtatmJY3AjWYhH7cBiQwwWyAzrWPhCcC06hs=;
        b=evEwfk3euPma+nWQt6CGGHkDbguk1B3V7m8zupezWYWgWOPd8awDZgwVn1Oov3yL1t
         ouqKbY1V5ukpoJnnSN2kvO60HYF8ECZ4UqP8IOt4q8n7y5+rMz04P1jzz5NnZmujkrZU
         QLqB+dfHTop7ZglgqopoAlHbYreVcbTXkf7UTY62LOgdJAW08x9aWASnx66768BGT6WO
         O5RKZ54sbNVw2hHaxVr1c8LSyIL4R9yibx+o6nfNQdqfPubHQBFoLEV7+wGdhbGQeLDS
         X+J4RUl0k7nE43zPN9SdC+DgzniJZi2TdVqHdgMN06Ww0wiZE3IOflXeqc8FynAvzXLn
         gZzA==
X-Gm-Message-State: APjAAAVEj5/aVvvDs8WS/3w7wXHP5gJxD4nbazL258j5ea0sxul6w2/i
        8rM6XwAWIgXTsd//Ed0C7ykbv6rn8vQ=
X-Google-Smtp-Source: APXvYqyKL3ejFcIvM1Z95+BRfMICIJyTzccMrtIq+j9NWcL70es2LK6VfpjCcDIb7BtFCwWrZzeL/A==
X-Received: by 2002:a2e:93c8:: with SMTP id p8mr19997872ljh.6.1563353621760;
        Wed, 17 Jul 2019 01:53:41 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id e12sm3287047lfb.66.2019.07.17.01.53.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2019 01:53:41 -0700 (PDT)
Date:   Wed, 17 Jul 2019 11:53:38 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 3/3] input: touchscreen mc13xxx: Add mc34708 support
Message-ID: <20190717085338.GA581@penguin>
References: <20190716221929.3782-1-lukma@denx.de>
 <20190716221929.3782-4-lukma@denx.de>
 <20190717033655.GC621@penguin>
 <20190717101704.2ff4d877@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717101704.2ff4d877@jawa>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lukasz,

On Wed, Jul 17, 2019 at 10:17:04AM +0200, Lukasz Majewski wrote:
> Hi Dmitry,
> 
> > On Wed, Jul 17, 2019 at 12:19:29AM +0200, Lukasz Majewski wrote:
> > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > The mc34708 has a different bit to enable pen detection. This
> > > adds the driver data and devtype necessary to probe the device
> > > and to distinguish between the mc13783 and the mc34708.
> > > 
> > > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > 
> > > ---
> > > Changes for v3:
> > > - Replace forward declaration of mc13xxx_driver_data with
> > >   structure definition
> > > - Rename mc13xxx_driver_data with mc13xxx_chip
> > > - Move static struct mc13xxx_chip mc13783_chip and mc34708_chip
> > >   closer to ID table
> > > - Do not check mc13xxx device type  
> > 
> > You do not even need to define or store the type. Once it is dropped
> > please feel free to add
> 
> Ok. I will remove the type definition.
> 
> > 
> > Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > and merge with the other 2 patches.
> > 
> 
> Ok. I will squash those three patches into a single one, add your
> Acked-by and wait for Lee to pull this single patch to his MFD tree.

Sorry, it looks like there is misunderstanding. I did not ask to squash
together the 3 patches, I meant that they can all go together through
the same tree (MFD). That is what I meant by them being merged together.

Sorry for being unclear.

Thanks.

-- 
Dmitry
