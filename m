Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DCCE5A53E3
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 20:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiH2SVj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 14:21:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiH2SVj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 14:21:39 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DE77E32A
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 11:21:38 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id p185so8976803pfb.13
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 11:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=HsQfjVEzXj19AFxyocmblevDkYk5auwvBNTZ+Cg31tM=;
        b=dy3hXyZGfWi+a1YAlBDkwLUvaJuAnmIyT5A3vQY9wgAjwjIw4aw15hRRHnjmECXWVX
         8xhPPv5wgd8D9dQ88QQtBXRVa/KwuvktLQRFWWgGSAE9Ep4FgTBEnk1tDe9Ku0odzcX6
         +cVgmm3X21Psd/Zunr6Fe2o+9qSP48yQ9xgXxM6Ucnoan4GYSIbG1pDVZPp0utFZ2Kup
         V56Izf6Z1MAdQQXhN3N0NqFZveaUOP8H6Nsg1QxkjTrGy9c7YhkYJY9nIgRT+psGOcm8
         vpYnXtualSB1yuwk/EKeVHhOCKn7kBmpeYVX0g/8J+Jvab0yWyIuNgbRnHYT0R9B8XoJ
         h+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=HsQfjVEzXj19AFxyocmblevDkYk5auwvBNTZ+Cg31tM=;
        b=XIQkQfOPVZN3KjrQz1N8b3yyai5r8rGLvOtyVwKT9e+rEWiACRzTeoqoH4nx567uEY
         tkCAy5rADta16xtCUyOeF97mcxOcezz14jI5QFtWE+0hHGvJMWd9gs/TG/jVJ4IKH8d/
         m+XwVqlXGP+YsvxO5Ck0U8H8WsirtjvJpRhKnJ+CI4DpTrwiASOPVg25rsWfHze+vqB3
         R7acRqnoRz6Kv5WwlCP7+/+8sXhcjV+FMxylj14smVs+sDhqCkq21z7Ql2T4FGdlqPdz
         7w7g9n+4V+66aCAHXUvMdNAdiPySTEAuVBUaSHWir7gr8+D5+FQ/B+ZDDXxk7CKMauJG
         O91w==
X-Gm-Message-State: ACgBeo3/pJp39OwrnndIARfF4QlaYp+uCoBN4jhOPNtdUPxqQiEMMJGV
        JnOka9hWpK7sbttT7CWwfYKYK+Vh2Qw=
X-Google-Smtp-Source: AA6agR5k5domyvbhnbBPhpLK+yFGLCQChBIXmDvTk5ElEFFJxzkHGT/DHb2XFvVDZoVFY/yOPZZEzA==
X-Received: by 2002:a62:b504:0:b0:538:20ae:bbf2 with SMTP id y4-20020a62b504000000b0053820aebbf2mr7962451pfe.79.1661797297971;
        Mon, 29 Aug 2022 11:21:37 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a95a:58fc:2b39:1c99])
        by smtp.gmail.com with ESMTPSA id im23-20020a170902bb1700b00172bd84c8b4sm7850193plb.98.2022.08.29.11.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:21:37 -0700 (PDT)
Date:   Mon, 29 Aug 2022 11:21:35 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Tulli <greg.iforce@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH v2] Input: iforce - add support for Boeder Force Feedback
 Wheel
Message-ID: <Yw0Dr2H1KG/WyA93@google.com>
References: <CAKEH-67dv9PC41v7wZXJEopEnMQjwbPvQz01sFbndinpZvbrGQ@mail.gmail.com>
 <3256420-c8ac-31b-8499-3c488a9880fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3256420-c8ac-31b-8499-3c488a9880fd@gmail.com>
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Aug 29, 2022 at 12:11:16PM +0200, Greg Tulli wrote:
> Add a new iforce_device entry to support the Boeder Force Feedback Wheel device.
> 
> Signed-off-by: Greg Tulli <greg.iforce@gmail.com>

Applied, thank you.

-- 
Dmitry
