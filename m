Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66D1156C372
	for <lists+linux-input@lfdr.de>; Sat,  9 Jul 2022 01:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240025AbiGHUTd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jul 2022 16:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239177AbiGHUTd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jul 2022 16:19:33 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A3B1C91A
        for <linux-input@vger.kernel.org>; Fri,  8 Jul 2022 13:19:32 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id j3so10715pfb.6
        for <linux-input@vger.kernel.org>; Fri, 08 Jul 2022 13:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Uxctw0BgffzUjgFNz67tSytllGHTCN9T0LSLaW/WDxY=;
        b=DVfb2gCVyFEjekLQfX/hWT8QlEfItiCydJbKQKaaGo4JSU8E7//5TPI/ckcUftFM5x
         be2YWI2i50F4FYdSnQuAtG9uVij94drLkUALm8YLc5nuohry/Ejxvlt6uLidQ1Qi3JBh
         tDYc2OUiuMXPUMWQlVor0fc0MHUYnDmCGPBnlTsJAKRfGh9+BWDKx7gGwvcU6uiZIVsK
         fWgpTKiKQG4FCfmInbtHa0tAi+3FIwaw5tG6QNjQ1LmIB3DtPRNrmtUBy1UciQCYtgTq
         VXJ8K5E2wK5hZYn85gSMMkcxTun0JZMBrzhObcwK9m0KViogn5KmgWI1ZylFBCFyYQtU
         Ml2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Uxctw0BgffzUjgFNz67tSytllGHTCN9T0LSLaW/WDxY=;
        b=QJ0fYv3dMUfd1vTgLzKkx+s+sFwC19U588X0u1U5q0RzP35CWSRJtbTF4L2oS9AGm4
         i/94KTTcWoaTsdQcTWDGuw0jvzXwa8l/jUVkHmiKClPCTmb5s6+iQGBatG+sA8QRK7Xv
         F9nB7yF0SkXzgRV7VPJDsqU3fpj0uKdjT//i8pAhiBRGThP1KTKcAp7t+ktAHFEVm34M
         gTA4CxF3hzDXzqqqHxqFHEB22GR3Du8TO1LXAlV3z1m8LbaJtH9JHRjsVm/tJd2hh4Ve
         QVU4pwOgSTfgUfD+G7vDyAkrjjoMRW76S96cEhjFe5kPWJZ7dMsD4HS0YX3eabEjpfgN
         t5ug==
X-Gm-Message-State: AJIora+KI7bCapFdjBYccqcBhb2V6EZ+pmGPlegI2Z446WrZrRmbC+pu
        YAI8cKbVeeP/ov+L8An9ksENRFEC1FQ=
X-Google-Smtp-Source: AGRyM1voHoX1bHmZsULYPme7a2QZ5tH788Z2RMdCYRsVgjhNCaMPoQLUlZ4IDTx+DP9kdeip7S/gIw==
X-Received: by 2002:a63:6a85:0:b0:3fa:722a:fbdc with SMTP id f127-20020a636a85000000b003fa722afbdcmr4799088pgc.174.1657311571917;
        Fri, 08 Jul 2022 13:19:31 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:9707:b37:49b0:77c2])
        by smtp.gmail.com with ESMTPSA id c9-20020a170902c2c900b0016a091e993dsm30484716pla.42.2022.07.08.13.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:19:31 -0700 (PDT)
Date:   Fri, 8 Jul 2022 13:19:28 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     patches@opensource.cirrus.com, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] Input: wm97xx: Make .remove() obviously always return 0
Message-ID: <YsiRUD8siyhBnbo8@google.com>
References: <20220708062718.240013-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220708062718.240013-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 08, 2022 at 08:27:18AM +0200, Uwe Kleine-König wrote:
> wm97xx_remove() returns zero unconditionally. To prepare changing the
> prototype for platform remove callbacks to return void, make it explicit
> that wm97xx_mfd_remove() always returns zero.
> 
> The prototype for wm97xx_remove cannot be changed, as it's also used as
> a plain device remove callback.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Applied, thank you.

-- 
Dmitry
