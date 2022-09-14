Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12BB5B8EC6
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 20:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiINSRy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 14:17:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229627AbiINSRx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 14:17:53 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3458304F
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 11:17:52 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q63so15048707pga.9
        for <linux-input@vger.kernel.org>; Wed, 14 Sep 2022 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=TSxJrzZOQJ9SILFhPXhiEudHuW20hP4Ux4OJIH5QalQ=;
        b=bUXRDfzm4YA+gWEJi0CHV97vUn4/dLBKqtTuOs/yzz4IDwTUkeOMHVsr77fyaE+BB+
         +0AvQeQs75ydEXzTidpWbL/5c5zSuH4BKwQOzClB/vWEy0J/tY8nSP5dpH721NeCgMlG
         40X9WzcLxtMWBGq7zXA3SygbtQ0iL5bmct9Owj/ZLac5aWlEBD175GEMXUi3yrYezvR1
         7bGF+rDKcZjtdkBHrpr435uNYhlidCl+XKqoppRaV2BL6dSVbNkyO7ZDJ0xmP+GOeHcw
         FXnpi2QryX5ql2ayLT42Tz7y80bhtC7u/pN0xGzpXUUPGJaPRVmiidBkT5ZQAo+LCUF6
         w6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=TSxJrzZOQJ9SILFhPXhiEudHuW20hP4Ux4OJIH5QalQ=;
        b=Xp8S/f+AM9gXbnlIzL89tI2xcfsFVs+Mt5e0BPOo3O5z19BKfPWs8435iCqkERZzdv
         ZTtEJd8p4vFodGQYcUTOEjNMjq8PqnvbbGv/D8GXNpvBrPmJIinn0+rDR8/XTz+wdls3
         e2UjaVRC6979DTap6oavbLRg7wKYIKzp4IZZBHbtamJLKH/O1rmN8Qki4VWEkyxmT26Z
         8jp1TMdOKKk5Q//Bv9rBzym8hULU2+mzwvWkV8u6uG2HdFqC0TMPRlzxI7tS3ItJ3zVX
         QIIrWRxBM6D+IN+mvykZ7zBa7zOTVPcE2QO11gbPPgVpXcDPuP0JvaGhC+r1OFOJPZUm
         JvAQ==
X-Gm-Message-State: ACgBeo2g7F+Beq1dtAwk6x4R6sNnzpTtIBtZYGNCKN5tPQLMZKAC7zW2
        z8DHR3etj5MXrsNVoNAGBhs=
X-Google-Smtp-Source: AA6agR4QrJIdJvJ4nj3tLa1L097PWROMJD5LbsxoL1A+0vD9GQruxs9EIdOQuc3jgsLmNrOiJpnkWA==
X-Received: by 2002:a05:6a00:d4b:b0:53f:4690:d31 with SMTP id n11-20020a056a000d4b00b0053f46900d31mr33800470pfv.73.1663179471391;
        Wed, 14 Sep 2022 11:17:51 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2f68:fe7:a2e6:7595])
        by smtp.gmail.com with ESMTPSA id o22-20020a17090a5b1600b001fd77933fb3sm9668023pji.17.2022.09.14.11.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 11:17:50 -0700 (PDT)
Date:   Wed, 14 Sep 2022 11:17:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kernel test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        linux-input@vger.kernel.org
Subject: Re: [dtor-input:next 9/36]
 drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration
 of function 'gpiod_count'; did you mean 'of_gpio_count'?
Message-ID: <YyIazH63csh0OR/i@google.com>
References: <202209142319.3cDIFi8V-lkp@intel.com>
 <YyIEWiEQSDFc+Qs3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyIEWiEQSDFc+Qs3@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Sep 14, 2022 at 07:42:02PM +0300, Andy Shevchenko wrote:
> On Wed, Sep 14, 2022 at 11:14:12PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
> > head:   d56111ed58482de0045e1e1201122e6e71516945
> > commit: f8f7f47d576f7f5d44ef9237f356bd6d42002614 [9/36] Input: matrix_keypad - replace of_gpio_named_count() by gpiod_count()
> > config: microblaze-randconfig-m041-20220914 (https://download.01.org/0day-ci/archive/20220914/202209142319.3cDIFi8V-lkp@intel.com/config)
> > compiler: microblaze-linux-gcc (GCC) 12.1.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git/commit/?id=f8f7f47d576f7f5d44ef9237f356bd6d42002614
> >         git remote add dtor-input https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
> >         git fetch --no-tags dtor-input next
> >         git checkout f8f7f47d576f7f5d44ef9237f356bd6d42002614
> >         # save the config file
> >         mkdir build_dir && cp config build_dir/.config
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=microblaze SHELL=/bin/bash
> > 
> > If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    drivers/input/keyboard/matrix_keypad.c: In function 'matrix_keypad_parse_dt':
> > >> drivers/input/keyboard/matrix_keypad.c:419:39: error: implicit declaration of function 'gpiod_count'; did you mean 'of_gpio_count'? [-Werror=implicit-function-declaration]
> >      419 |         pdata->num_row_gpios = nrow = gpiod_count(dev, "row");
> >          |                                       ^~~~~~~~~~~
> >          |                                       of_gpio_count
> >    cc1: some warnings being treated as errors
> 
> Heh... Seems on some architectures this needs an explicit include of linux/gpio/consumer.h.
> Dmitry, do you want me to send a fixup, or would you squash the change yourself?

The patch is too deep in the tree to squash, so please just send a
fixup.

Thanks.

-- 
Dmitry
