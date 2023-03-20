Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B696C09A9
	for <lists+linux-input@lfdr.de>; Mon, 20 Mar 2023 05:29:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCTE3I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Mar 2023 00:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229871AbjCTE26 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Mar 2023 00:28:58 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C83C1F91D
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 21:28:57 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z19so772338plo.2
        for <linux-input@vger.kernel.org>; Sun, 19 Mar 2023 21:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679286537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x65PnXga/IL0tZsauQho1fwk4bBQrymyPv6NK3PuAnY=;
        b=g3MTmNp/g5w1EDwJsPE5s9ALj8qHN3ghRrkTZs9+phWh/KLjOL/2Ov+YsH23TvLkzL
         NehBlZckziH3UAb9Pbo/Qx+IR3wTuDVfOTEqpxQl+QFlL6AfqVE6srHviqDkfx8GHASM
         4tNSsPfSSyjssvL8peTSDLyBFm3QaXYKX0orx5u7wz9dabcjtaZ07YGayid9TYErtC+9
         Gks/eKx4QRRZhR0KGBTbERJTL8Ystu1BjS7rkccyWVZ+pcLiOQ6sSxajh1OGLZqmEi4w
         sH3g4QL4e+oiTurOmglrcJ+f8i1VuStrXEopegeWYHJWhIwcEr8rQcGJPFn1kN8FJ1j5
         Wb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679286537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x65PnXga/IL0tZsauQho1fwk4bBQrymyPv6NK3PuAnY=;
        b=XvNsDHDTnI7XU+fSlf5+tw8+K5JEYCDODLHVn/GUwu/CtEQdkupWFDpz1Bp+4e347h
         1bhsl8RDIzdR7A9eESnCfV+icKJc42qlSzNRnc9LpRF4wcVp9EXGKjHZszEwIr4E0THO
         h2b+//Xp6Amk4IRwfn6D5T397SlJtACLhXpkug0KEwBO3Kg9e0V14Sdb6rGqiLdmuBe3
         YzTg6T+NvO9IRCs2TAubX6A0UpNK/4fLk4HrLKxnEN97ARSkSA20A18w5zRq9XHnL22d
         BJRTXtfsrsXU6pwTsOz75siX/UoQr2lJIFWtSuj5bwf8EaxFUWo9flOFnXKpW2q4M2rv
         A+ug==
X-Gm-Message-State: AO0yUKUIZq+EtySy9utwOVAf0ynP9i9LCc4cqJ79Cx41NPOgLClL5pao
        pdBvj18iCfxFZ+ItoVp6o2Y=
X-Google-Smtp-Source: AK7set9NmwZSI/5zdRrjXm7v7bZ6CB+0oRKqJHUc15L5tJ0c3lwEyAeuYLsxXH5fQleuTzl2GTsmBA==
X-Received: by 2002:a17:902:e888:b0:199:10d2:b9da with SMTP id w8-20020a170902e88800b0019910d2b9damr17892783plg.58.1679286536752;
        Sun, 19 Mar 2023 21:28:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:687c:5175:b0b1:a145])
        by smtp.gmail.com with ESMTPSA id a5-20020a1709027d8500b001a1c2ee06e0sm2245734plm.15.2023.03.19.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 21:28:56 -0700 (PDT)
Date:   Sun, 19 Mar 2023 21:28:53 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Mattijs Korpershoek <mkorpershoek@baylibre.com>,
        Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] Input: iqs62x-keys - Suppress duplicated error message
 in .remove()
Message-ID: <ZBfhBUzU0THfTT3I@google.com>
References: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230318225110.261439-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 18, 2023 at 11:51:10PM +0100, Uwe Kleine-König wrote:
> If a platform driver's remove callback returns non-zero the driver core
> emits an error message. In such a case however iqs62x_keys_remove()
> already issued a (better) message. So return zero to suppress the
> generic message.
> 
> This patch has no other side effects as platform_remove() ignores the
> return value of .remove() after the warning.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry
