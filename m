Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E67F756C04
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 20:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjGQS2h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 14:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbjGQS2R (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 14:28:17 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB9B0B3;
        Mon, 17 Jul 2023 11:28:15 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55ba5fae2e6so3712447a12.0;
        Mon, 17 Jul 2023 11:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689618495; x=1692210495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Af3GMYKJiWaSzIXaVgbf/KU/uHJZTb0thNQwG5yHzSU=;
        b=GwlBSuka1YxtL1krqV5meSO3DpphuHGuoA6yw91Dpoq9u9SoCo5H12W6bABkcXVD3T
         BBD1cZGn2sPRe37qbeKLfyFdMo7z83coy9KGLALnjSlSQCv4OTIT2rENLF41oAx4F+71
         7QhtlGzamPOeo3vy5T63ID/yFFdubb7HfJRDrVxSKMK3SKyx7vh8b2ACHUzjjKhVOLnj
         7VSxd45oHspiBqQjlEYAQ2y3JNN6p2tVKsORUNhIlEq4EDH9bDt85gxQI5lRTPfpOHvD
         4ETpM0sQOmK43+i7EZkEqbmzjgrcDKwYwdIaurfnFIJFwngrjukqL+bLqFDmZ+YovHel
         5wCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689618495; x=1692210495;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Af3GMYKJiWaSzIXaVgbf/KU/uHJZTb0thNQwG5yHzSU=;
        b=WfB2UhML6ywQCI7ZwVaoDsD5MADDGibj2VI2HVv6+G/meJCkUyjRaQAvkRm8hSqaqh
         33/oi5n8x2RmukaPBBDuLhbEXUBOwDsNsAYzhR1XW1Im2FLr7ra64AQ0RdaGDkOm37mU
         O5EaRUODgzO18Rc3ehfOv5tcj42dvvvQI/4vccUtT2DdhE1X9y5OYTCw/K19G1Q4Zo56
         HZ6lrw39iB56q7G0PbVEOq0bmgmdUT7LsdqgXcd55vyBACoII4w6hypQLV7MVspL5TgB
         gZ9BHcM0ZKOERiHLhkGZxaVBdf3Cd8fvoXw9nfpltcDZaqZ1RkHJBKFZyAFErVcyfjyF
         PUsQ==
X-Gm-Message-State: ABy/qLbll42i/mAkrEPPyD3baoRc+dCaz82GNvsvJZC+mEhHzlspy60j
        7EM/gKh78XmqJmO60+aMI3DelCeJEmA=
X-Google-Smtp-Source: APBJJlERVyxCi8rxbDjbNqRttWcjgWYx2273RrIaZNjM9oTZphmGETPjlCfvcXw+ndUDHrwtGe4lOQ==
X-Received: by 2002:a17:90a:f683:b0:262:ffc4:be7 with SMTP id cl3-20020a17090af68300b00262ffc40be7mr12214267pjb.37.1689618495273;
        Mon, 17 Jul 2023 11:28:15 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1e30:2510:1b57:a9cd])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a19c400b00263e4dc33aasm5668146pjj.11.2023.07.17.11.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 11:28:15 -0700 (PDT)
Date:   Mon, 17 Jul 2023 11:28:12 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Andreas Helbech Kleist <andreaskleist@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 1/2] Input: exc3000 - Simplify probe()
Message-ID: <ZLWIPPAfeR1+KbeH@google.com>
References: <20230717131756.240645-1-biju.das.jz@bp.renesas.com>
 <20230717131756.240645-2-biju.das.jz@bp.renesas.com>
 <ZLVlIPHdmEGdG5D1@google.com>
 <OS0PR01MB592264ADC86061AB003048DD863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66228ad3-c087-418c-925f-b9fd4a60fb16@sirena.org.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 17, 2023 at 07:15:50PM +0100, Mark Brown wrote:
> On Mon, Jul 17, 2023 at 04:35:02PM +0000, Biju Das wrote:
> 
> > The .device_get_match_data callbacks are missing for I2C and SPI bus subsystems.
> > Can you please throw some lights on this? 
> 
> It's the first time I've ever heard of that callback, I don't know why
> whoever added it wouldn't have done those buses in particular or if it
> just didn't happen.  Try adding it and if it works send the patches?

I think there is a disconnect. Right now device_get_match_data callbacks
are part of fwnode_operations. I was proposing to add another optional
device_get_match_data callback to 'struct bus_type' to allow individual
buses control how match data is handled, before (or after) jumping into
the fwnode-backed device_get_match_data callbacks.

Thanks.

-- 
Dmitry
