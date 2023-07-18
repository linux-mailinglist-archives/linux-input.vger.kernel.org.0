Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270A67584E8
	for <lists+linux-input@lfdr.de>; Tue, 18 Jul 2023 20:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjGRSgm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jul 2023 14:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbjGRSgl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jul 2023 14:36:41 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 168FFE8;
        Tue, 18 Jul 2023 11:36:39 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1bb119be881so41282465ad.3;
        Tue, 18 Jul 2023 11:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689705398; x=1692297398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ngs6NxqbbvKL5FGt10bZTML0qOvGXRNhOAXTfCZSuew=;
        b=q9m1OtZKhN3VSqPbAApc76mgUM5Y/Bu3h9znBFqRO+gH9FL3aSv9ukyCf8SRaLoVPe
         Nj3NcP3IAFCHYZz31ruYkH6UPrt7pO03cNHppaa3aOuZZOkaN6KqKQ1w2TNC4AfFks0b
         nGD+0MpkWrbps0UNGbyHpwtvKqrOvBIlLJ1K++MJdk+//8X5RsxKO/3v4LNfdYSUMjgF
         sbHEieXZOldT9tmTg7Zsb7VXS7GoR0VLknnE2YTnPXobF+Le3tqW+ufwoj0JzkKjF0+j
         Kh79kHyqIHfQvZ/aAByD9wwqMOywgcPcMamQZHkMUx4dAyjV8CqUBbJw86CcxNnq9mKc
         pJ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689705398; x=1692297398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngs6NxqbbvKL5FGt10bZTML0qOvGXRNhOAXTfCZSuew=;
        b=IgRjJyQ36KkfFvhyEmgxfbvQhrR+Wh0fAQaTGtNxU0fYDkN37GiE58ruip5CdqECJN
         XuZECZ6ON7jVRGZsB34g3yL3RxEFNFDlklfK2C25Hp59IFK3npmiDy+3YA3M4rvOeyWM
         3ykqjRE2ks6h11gGxnfV1tNFvYJ8xBB1iND8YUAVnwoIKHosDowCINGM1dyPyij563Gx
         Hc7faxODGCYOTiFEl78Uzkle3IPXyRpsuUWV1xxdKoUFxPt7ulGCI5El2vXrX2hQ+l5a
         Z9epcTNdPwVcN+tbrw+bPHxGGn8pcNC9wCmDQCwBG2zy4TXZwOpFXUiaOvKGVMOuaUjd
         sIow==
X-Gm-Message-State: ABy/qLZstU3UMVIFT1mvCgPH5tkrBpiq9WjkoD4vcynJIxbJ2pHCErih
        0SUEv1p6t5Gio9tCY3lDN9c=
X-Google-Smtp-Source: APBJJlHjzkwqorRZXPAnihurwm3BMbvKE5lTP2uD0GkPBdxUx1Ujb6AY6SEEWQ9pbWtVvOyNWXcD1Q==
X-Received: by 2002:a17:903:230e:b0:1b9:e97f:3846 with SMTP id d14-20020a170903230e00b001b9e97f3846mr20970670plh.15.1689705398201;
        Tue, 18 Jul 2023 11:36:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:798:b6f:a67a:7ac1])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902c14400b001b9bebb7a9dsm2210659plj.90.2023.07.18.11.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jul 2023 11:36:37 -0700 (PDT)
Date:   Tue, 18 Jul 2023 11:36:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Message-ID: <ZLbbslBiIQXFWpmN@google.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
 <ZLWIPPAfeR1+KbeH@google.com>
 <OS0PR01MB59225D8CF3E96808DD776A8E863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59225D8CF3E96808DD776A8E863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 17, 2023 at 06:45:27PM +0000, Biju Das wrote:
> Hi Dmitry,
> 
> > Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
> > 
> > On Mon, Jul 17, 2023 at 07:15:50PM +0100, Mark Brown wrote:
> > > On Mon, Jul 17, 2023 at 04:35:02PM +0000, Biju Das wrote:
> > >
> > > > The .device_get_match_data callbacks are missing for I2C and SPI bus
> > subsystems.
> > > > Can you please throw some lights on this?
> > >
> > > It's the first time I've ever heard of that callback, I don't know why
> > > whoever added it wouldn't have done those buses in particular or if it
> > > just didn't happen.  Try adding it and if it works send the patches?
> > 
> > I think there is a disconnect. Right now device_get_match_data callbacks
> > are part of fwnode_operations. I was proposing to add another optional
> > device_get_match_data callback to 'struct bus_type' to allow individual
> > buses control how match data is handled, before (or after) jumping into
> > the fwnode-backed device_get_match_data callbacks.
> 
> That is what implemented here [1] and [2] right?
> 
> [1] https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/i2c/i2c-core-base.c#L117
> [2] https://elixir.bootlin.com/linux/v6.5-rc2/source/drivers/spi/spi.c#L364
> 
> First it check for fwnode-backed device_get_match_data callbacks and
> Fallback is bus-type based match.
> 
> Looks like you are proposing to unify [1] and [2] and you want the
> logic to be other way around. ie, first bus-type match, then
> fwnode-backed callbacks?
> 

I do not have a strong preference for the ordering, i.e. I think it is
perfectly fine to do the generic fwnode-based lookup and if there is no
match have bus method called as a fallback, but I do not want driver
writers to learn about multiple <bus-prefix>_get_match_data()
implementations, I would prefer if they could call
device_get_match_data() and the right thing happened in all cases.

Thanks.

-- 
Dmitry
