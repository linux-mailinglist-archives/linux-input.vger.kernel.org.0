Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 770545B85FD
	for <lists+linux-input@lfdr.de>; Wed, 14 Sep 2022 12:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiINKLS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Sep 2022 06:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiINKLB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Sep 2022 06:11:01 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E2427CE9;
        Wed, 14 Sep 2022 03:10:53 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id q9so4750543pgq.8;
        Wed, 14 Sep 2022 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=JiXzFao2IXE51u6P2eepNq4pCQEWFKf+k65/k79eqvc=;
        b=ikDi6LLBbbYK1nnIT1Ou8BfEK76v6fQhkiOXMHLw3p+/ijkuPKbdTVdrbZsafS37N1
         EyCt8n+nFCQo8XFEbVDemcwryO2XY01rEonCd2P1XOcXjnhlkjQFQOQcksN2EzmkipOj
         1flfuxGL5zMqibMR7/f2CYVjy9t+dHcvmqUntN96x0MQKhzbJJGKdtOw9ajkETEi//hf
         aGAzUoUkvmU/g57pz7yAErvLOrRtwOAbYK6uOXsCB9eQ6zXjrBTn8ZT0wlAu+x0vL+9x
         DK6uF3h0LV4kxhAfEgQydIEwwjysH4UcDgjjiiiRrbl3kbcXU/+ATLaAwnnrwxM4xRhN
         IQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JiXzFao2IXE51u6P2eepNq4pCQEWFKf+k65/k79eqvc=;
        b=pMAESNjRz1ubCELa3x1+3fr2Yjj21+gRQ+NHvsd3KWUGGMpX4swGqVI53mZVyVJNe/
         zZsqvKerOuiXK4ArmRyytKtll2dMr2wgMikGTw53zfD//v/jokVQfMoOQEPRJFzlWbDY
         zbCwysGPvqHUsZe7JNihxPbFrAnJEPbC6iNmZngsCwjIZiUTwMysBVEKOyXgqZeQbyXk
         g74jW2bcWOe/QUQLydiRK7UkZ5dU1vU5sDvJWrFznTImlK0rjOMr/y8W2lbtwN7/r0XO
         C5MReg2qwFoY0ksRYd2OqTrBbsnn9z+8aECddCmSuSeCJy4/E3xPJ5VEPUFZR6BPddX2
         3igw==
X-Gm-Message-State: ACgBeo3MUtE2ROG4/xh7yhuG4j4f7w2flJn+neXqe/puGCl20SySUjL/
        Qo/AM+IhzLB5+eD7YPE8twI=
X-Google-Smtp-Source: AA6agR6w9UOk+8+u3Q3O3QDSvcoRdevs+VLAWiIaZfwqEmlFuQ2DIAZvmrGw8MdBImY9OqxWqeBvkA==
X-Received: by 2002:a63:de58:0:b0:439:41e9:dda2 with SMTP id y24-20020a63de58000000b0043941e9dda2mr6207728pgi.331.1663150253131;
        Wed, 14 Sep 2022 03:10:53 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2f68:fe7:a2e6:7595])
        by smtp.gmail.com with ESMTPSA id b6-20020a1709027e0600b00176dee43e0dsm10143840plm.285.2022.09.14.03.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 03:10:52 -0700 (PDT)
Date:   Wed, 14 Sep 2022 03:10:50 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 05/11] Input: iqs7222 - trim force communication command
Message-ID: <YyGoqqGbY2YczV2E@google.com>
References: <20220908131548.48120-1-jeff@labundy.com>
 <20220908131548.48120-6-jeff@labundy.com>
 <YxpdeuPAYiSVjmO7@google.com>
 <YyD1JmuC6UH+DDHG@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YyD1JmuC6UH+DDHG@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 13, 2022 at 04:24:54PM -0500, Jeff LaBundy wrote:
> Hi Dmitry,
> 
> On Thu, Sep 08, 2022 at 02:24:10PM -0700, Dmitry Torokhov wrote:
> > On Thu, Sep 08, 2022 at 08:15:42AM -0500, Jeff LaBundy wrote:
> > > According to the datasheets, writing only 0xFF is sufficient to
> > > elicit a communication window. Remove the superfluous 0x00 from
> > > the force communication command.
> > > 
> > > Fixes: e505edaedcb9 ("Input: add support for Azoteq IQS7222A/B/C")
> > > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > 
> > Applied, thank you.
> 
> I didn't happen to see this one hit your tree, so I can simply include
> it in v2 coming soon. In case I have misunderstood, please let me know.

Should be there now.

Thanks.

-- 
Dmitry
