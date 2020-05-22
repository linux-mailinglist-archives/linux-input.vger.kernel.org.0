Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2B3C1DF176
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 23:49:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731149AbgEVVtk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 17:49:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731029AbgEVVtj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 17:49:39 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 716FAC061A0E;
        Fri, 22 May 2020 14:49:39 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so5628311pgg.2;
        Fri, 22 May 2020 14:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S0Uzq9mqq+tWip8RdyrRyyQ3hbA1jkIS41+a492a2tI=;
        b=hYsWwZiSOVrzwJzZ6pAQA1DAFHSzHL7s/is5UbjgAkoFRFIENvPLD9VIUoR1TWfkAz
         e7IomIOkQTMPvOjIY0uTt1bWEIwC3kCcVDQ22T+wmO48ZmOHGPHyAP35fbG8vffqxKmq
         +z52yL20CA0QMjjNwb1ZNtlP194amp7Q/RJ61WGZxS8K2Vm633RgI9Y+rAVJT4nw1GDg
         rcaek0qLyI2fVBkUL3w2LwsxswbfTKkvtzmF3iPROmE9Du51m95U8SYo2E1+0uDiBp6D
         saYyoU37RkqzYsfB51YMk66v5hchaOrqELx85M/NySL7eIbrpW9igqLrOTPU4wNdmDC/
         Ts+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S0Uzq9mqq+tWip8RdyrRyyQ3hbA1jkIS41+a492a2tI=;
        b=CikFcosuhcqyhrVt8RQTKHfnCK9R1I6gXjkps3xw8xOE+BhUPoalYTtH/w1ZANJAmV
         Zj9ENfTC7WrMQVUa2QwU4eMr873lQGuvciOT226FUjnCwfPO9+zIk1/I4Ag4Wt3b561Z
         QiP1MfhkIdEG73rRm8HO1a3CTDUUSock1Uym8zfP1KC+d256KkY7NfpH3iczmtgbNhpL
         DdAdbVg+9+eGyspBl5eKcGV5gLggr4NfB9WYpHxFQJIGC3SFKKokgY1d8HThyabibCd/
         mk8pBHKDDNvUhSThZarKIA3u6aqnf9w/a18bqmtFxJZLRC3SKgO0Z/QN7eiDs3LfYibI
         MXIA==
X-Gm-Message-State: AOAM530r4kDQJhl2c0uFpWpTcMgDsdk4KbbEdMdbY4gshNszu3jc09JK
        yzBoVVvVoXd+UeNmN5qGco4=
X-Google-Smtp-Source: ABdhPJxhMx5CxUULMsQDx3J4AHclpvzQl++Sk3lrZR3l1vQoCgTwCVPRcEDKgI9iHrLM9d+BelDMig==
X-Received: by 2002:a63:1c50:: with SMTP id c16mr15230321pgm.255.1590184178621;
        Fri, 22 May 2020 14:49:38 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id m13sm7652299pff.9.2020.05.22.14.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2020 14:49:38 -0700 (PDT)
Date:   Fri, 22 May 2020 14:49:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jeff LaBundy <jeff@labundy.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: Re: linux-next: Tree for May 18 (input/misc/iqs269a.c & regmap)
Message-ID: <20200522214935.GB89269@dtor-ws>
References: <20200518205725.72eb3148@canb.auug.org.au>
 <60dadc36-daec-2c48-a317-843ce52ae4f5@infradead.org>
 <20200518162058.GA18713@labundy.com>
 <e6a56505-b99c-6b22-c35a-3596857fa421@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6a56505-b99c-6b22-c35a-3596857fa421@infradead.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 22, 2020 at 11:22:39AM -0700, Randy Dunlap wrote:
> On 5/18/20 9:20 AM, Jeff LaBundy wrote:
> > Hi Randy et al,
> > 
> > On Mon, May 18, 2020 at 08:42:43AM -0700, Randy Dunlap wrote:
> >> On 5/18/20 3:57 AM, Stephen Rothwell wrote:
> >>> Hi all,
> >>>
> >>> Changes since 20200515:
> >>>
> >>
> >> on i386:
> >>
> >>
> >> CONFIG_REGMAP_I2C=y
> >> CONFIG_I2C=m
> >>
> >> WARNING: unmet direct dependencies detected for REGMAP_I2C
> >>   Depends on [m]: I2C [=m]
> >>   Selected by [y]:
> >>   - INPUT_IQS269A [=y] && !UML && INPUT [=y] && INPUT_MISC [=y]
> >>
> >>
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
> >> regmap-i2c.c:(.text+0x192): undefined reference to `i2c_smbus_read_byte_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
> >> regmap-i2c.c:(.text+0x1d7): undefined reference to `i2c_smbus_write_byte_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
> >> regmap-i2c.c:(.text+0x202): undefined reference to `i2c_smbus_read_word_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_read_swapped':
> >> regmap-i2c.c:(.text+0x242): undefined reference to `i2c_smbus_read_word_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_write_swapped':
> >> regmap-i2c.c:(.text+0x2a1): undefined reference to `i2c_smbus_write_word_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
> >> regmap-i2c.c:(.text+0x2d7): undefined reference to `i2c_smbus_write_word_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read_reg16':
> >> regmap-i2c.c:(.text+0x310): undefined reference to `i2c_smbus_write_byte_data'
> >> ld: regmap-i2c.c:(.text+0x323): undefined reference to `i2c_smbus_read_byte'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write_reg16':
> >> regmap-i2c.c:(.text+0x39c): undefined reference to `i2c_smbus_write_i2c_block_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
> >> regmap-i2c.c:(.text+0x3db): undefined reference to `i2c_smbus_write_i2c_block_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
> >> regmap-i2c.c:(.text+0x427): undefined reference to `i2c_smbus_read_i2c_block_data'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
> >> regmap-i2c.c:(.text+0x49f): undefined reference to `i2c_transfer'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
> >> regmap-i2c.c:(.text+0x524): undefined reference to `i2c_transfer'
> >> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_write':
> >> regmap-i2c.c:(.text+0x56c): undefined reference to `i2c_transfer_buffer_flags'
> >> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_init':
> >> iqs269a.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
> >> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_exit':
> >> iqs269a.c:(.exit.text+0x9): undefined reference to `i2c_del_driver'
> >>
> >>
> >>
> >> Full randconfig file is attached.
> > 
> > A complete oversight on my part; during my testing I did not realize
> > another module was selecting I2C for me. Valuable lesson learned :)
> > 
> > The kbuild test robot set off the alarm bells earlier today and I've
> > sent a patch [1] already. Many apologies for all of the noise.
> > 
> >>
> >> -- 
> >> ~Randy
> >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > 
> > [1] https://patchwork.kernel.org/patch/11555469/
> > 
> > Kind regards,
> > Jeff LaBundy
> 
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> 
> 
> This build error still happens in linux-next 20200522.
> Perhaps we can have this patch merged & pushed out so that
> linux-next can pick it up, please?

Sorry, I applied it when Jeff posted it, but forgot to push out.

Thanks.

-- 
Dmitry
