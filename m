Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2657512AC
	for <lists+linux-input@lfdr.de>; Wed, 12 Jul 2023 23:34:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231602AbjGLVeN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jul 2023 17:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjGLVeM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jul 2023 17:34:12 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E870CF;
        Wed, 12 Jul 2023 14:34:11 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6687466137bso51301b3a.0;
        Wed, 12 Jul 2023 14:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689197651; x=1691789651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hObg29JRk6/1LQWWBeEfqotC31ErNS5bG8ya2MZm260=;
        b=TgutQI7GQHwPQKQth/3mIvwVQQaZmsBB7iAovc7JiEPnC9SQzb9QvRkJoGKijLCTnt
         nhBrTBY/2aBsFJBV0rBaKbE4OH95nMgw7E2xUSRXcwpq6Ubnhyo0sAq4h6mMklzwCcnT
         Av6vsZlMUZ8ZqE4JOBxFpFksugVzm3UIf0oCOq+xchqRN7fNsrM3cR15oQw/3PMUmm3G
         ttLZSxwqqlVBbcbamFR3gv6ml6sIypzJY6w0uykaG/48TsnCI+/IEc1RMD9I1P/qlmpZ
         WCE7Bnn2No5SEYjqxM6texZmnoqL0G2oH+dE8qeWl88NDyoHNDPpA4UuefuogSzxBjUu
         oyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689197651; x=1691789651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hObg29JRk6/1LQWWBeEfqotC31ErNS5bG8ya2MZm260=;
        b=Bug6p4HaWdKAed+edbuWj66AUBAae5bbE2lKhv4pokLWJcCvQNzBcVuFTp3EqDlnLR
         y6oNBFw9JD5kZhuZ1YQWbzdr9RGeg0C/rH0XstfyKJPwxqGAV3cTvxPYf3jUeUY8rn7S
         zCMji9fFLZUCe2hriCS9VzoGJzzWSCcoiKbYfryHtmsS+yU1Hso2yCvyo5UfTo0gYF0N
         lH/fNIxFtkMkCu8R+N3+z+sRvLZh1p4VcQuCf/gpPa+PEdq9besaRcEQErHsYk6lpDaX
         9uLLnIXn0iVocCEz2K8K3Ji9dT8gSFI2N9tQea9gVswQvq0VLntYMnAZ2mjdrj3VD624
         yW5w==
X-Gm-Message-State: ABy/qLbYORoMBAwmm8oJZbYd5CCAhVq17M10MqDDor5ZRx+L5rtVF32x
        oa1yrPiHEpp42PyKeY00hOQ=
X-Google-Smtp-Source: APBJJlETIhDpKPGCF9zzWcHeSRWFk338EvTpHf2ZGQsz70E5L94yFU/bzDHUP52lVdoayW1KEYGoTg==
X-Received: by 2002:a05:6a21:3814:b0:126:9081:2156 with SMTP id yi20-20020a056a21381400b0012690812156mr13201145pzb.4.1689197650792;
        Wed, 12 Jul 2023 14:34:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:a606:1b1e:7f66:3ee0])
        by smtp.gmail.com with ESMTPSA id r13-20020a62e40d000000b00666912d8a52sm4011483pfh.197.2023.07.12.14.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 14:34:10 -0700 (PDT)
Date:   Wed, 12 Jul 2023 14:34:07 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add support for Azoteq IQS7210A/7211A/E
Message-ID: <ZK8cT9imYrEwBqdn@google.com>
References: <ZHVD/9OgRTAwBhqx@nixie71>
 <ZK8aoiVOoZgWSCDc@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZK8aoiVOoZgWSCDc@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jul 12, 2023 at 04:26:58PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Mon, May 29, 2023 at 07:31:59PM -0500, Jeff LaBundy wrote:
> > This series introduces support for the Azoteq IQS7210A, IQS7211A and
> > IQS7211E trackpad/touchscreen controllers. Optimized for wearable
> > applications, these devices track up to two contacts and are capable
> > of reporting an array of gestures.
> > 
> > The IQS7210A includes an additional channel to support an inductive
> > or capacitive button, while the IQS7211E adds an advanced assortment
> > of gestures. All three devices are demonstrated in [1].
> > 
> > These devices can be configured during production using OTP memory,
> > or over I2C using the device tree. For the latter case, the binding
> > covers all major parameters called out by the vendor in [2].
> > 
> > [1] https://youtu.be/RjB8rNkzQJQ
> > [2] https://www.azoteq.com/images/stories/pdf/azd123_iqs721xy_trackpad_userguide.pdf
> > 
> > Jeff LaBundy (2):
> >   dt-bindings: input: Add bindings for Azoteq IQS7210A/7211A/E
> >   Input: add support for Azoteq IQS7210A/7211A/E
> > 
> >  .../input/touchscreen/azoteq,iqs7211.yaml     |  769 +++++
> >  drivers/input/touchscreen/Kconfig             |   10 +
> >  drivers/input/touchscreen/Makefile            |    1 +
> >  drivers/input/touchscreen/iqs7211.c           | 2569 +++++++++++++++++
> >  4 files changed, 3349 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
> >  create mode 100644 drivers/input/touchscreen/iqs7211.c
> > 
> > -- 
> > 2.34.1
> > 
> 
> Just bumping this one; any interest in taking it?

Ah, sorry, I missed Rob's reviewed-by for the bindings. Applied, thank
you.

-- 
Dmitry
