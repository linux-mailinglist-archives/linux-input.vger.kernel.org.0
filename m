Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4176953AB7A
	for <lists+linux-input@lfdr.de>; Wed,  1 Jun 2022 19:02:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiFARCn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Jun 2022 13:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344702AbiFARCm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Jun 2022 13:02:42 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD49437035
        for <linux-input@vger.kernel.org>; Wed,  1 Jun 2022 10:02:41 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id q74so300269qke.12
        for <linux-input@vger.kernel.org>; Wed, 01 Jun 2022 10:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=3UpzxzbpelqX21rWPKZ2NBH8LKbF4XAhrf7PpxSZ/80=;
        b=At30LCmBA8W8lYNWbF4NUH+EdAE4qPlUTKzJeverwQA1mKk5nr05pxVpy/Y9xC8iUt
         lzZzuICDVLbjZUNdkPxIf8KLDPQDRuSG2WUFJTAP+iZXs5uG/GsqiieBk8aeD2MaWGhi
         MvYlMhidd1mxoyCMZKPVXstCO9IK+khfS+rBHp6Ui9Xc7jvQkZdC5pyEV4MFyRVUtuvG
         nDRFE4NfrHaNX09PomlLYi92lHR9kcPCmpws0Ao17anwgCjAFDCKms2R+pslEOkWRU+C
         jrv7eWH7du759NinCU2nAis8BRGcuMa7o3HbC9Dk26Nh9kN3gSJLieMt5QQuVd8tR10F
         uG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=3UpzxzbpelqX21rWPKZ2NBH8LKbF4XAhrf7PpxSZ/80=;
        b=NzJx/aKHozs2IJguBY8pgvP3PHffRrdKKfMC3OPSiC5GwDFT2D28E4HDlwrXwftZdZ
         MbnZzTMrWHIfUxeYJoO2ElJBdkRgSqUuWFdxlW6QeTZwymYq2i3fk801VszVzJSIB69r
         NOVImPDVWtLACztqAQFR6RtckZ62Sa5+g2YDqxVCMTfo+/klkp4wtQLPa1zKHF/Opdms
         IqwFwztrcbVPc5x+0NXXUja/tS+0XU/PBKM43wzYs9v7NpDi28JyOnWduqmXVFYf8cm1
         YxOm+l4mOD2bXB1WJK5PednywJtzWh/ZWNnuT5M1ccmMignX7LGqQOUAC2HoVvY/HqEc
         dr3g==
X-Gm-Message-State: AOAM531Rf2jhQ6wHfjItmOSnOtdDj06GmTVuKhj+9PNKs+wUbO2S1rYQ
        0Sp0Nl4cUjeKQOspIDBq/YddPQ==
X-Google-Smtp-Source: ABdhPJzs9zmFccsWBMwtA1q/i34O0lR/gnGwjKBnXuqgWibNaQn5SnabBKzqJmuwpNs6K2mcE+1K7A==
X-Received: by 2002:a05:620a:2416:b0:6a5:80c3:b520 with SMTP id d22-20020a05620a241600b006a580c3b520mr621079qkn.318.1654102960487;
        Wed, 01 Jun 2022 10:02:40 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id bq33-20020a05620a46a100b006a649e42962sm1634973qkb.70.2022.06.01.10.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 10:02:40 -0700 (PDT)
Date:   Wed, 1 Jun 2022 10:02:22 -0700 (PDT)
From:   Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.anvils
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input@vger.kernel.org, Hugh Dickins <hughd@google.com>
Subject: Re: Suspend/Resume (S3) issues with rmi_smbus
In-Reply-To: <7fe43cb4-3643-03ee-0235-d1572d627ed6@linux.intel.com>
Message-ID: <92e2b7eb-dbac-5af9-b971-82362d23879a@google.com>
References: <YpSExunpPdgdjQCz@worktop.programming.kicks-ass.net> <YpUX3EAzpL4+xgu1@google.com> <YpXXu2tbCSCUtUYQ@worktop.programming.kicks-ass.net> <YpY5YU+KTg/Dmaex@google.com> <7fe43cb4-3643-03ee-0235-d1572d627ed6@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 1 Jun 2022, Jarkko Nikula wrote:
> On 5/31/22 18:50, Dmitry Torokhov wrote:
> > On Tue, May 31, 2022 at 10:54:19AM +0200, Peter Zijlstra wrote:
> >> On Mon, May 30, 2022 at 12:15:40PM -0700, Dmitry Torokhov wrote:
> >>
> >>> Can you check the entire list of resume operations to make sure that
> >>> PS/2 device is resumed before RMI one?
> >>
> >> It reports psmouse failure *after* the rmi4 failure. Is there a knob to
> >> make it print more device model details on resume?
> >>
> >>> You can also try overriding devices driven by rmi_smbus as needing
> >>> synchronous resume (see
> >>> https://lore.kernel.org/all/YgHTYrODoo2ou49J@google.com/).
> >>
> >> I can confirm this works.
> > 
> > Let's ask Rafael if he has an idea why adding a link between PS/2 device
> > and its SMbus companion did not seem to affect resume order. Was there a
> > change in 5.18 timeframe (since original reporters said that adding
> > device link helped their case).
> > 
> > Let's also add a couple of more folks who experienced original issue to
> > see if they observe this as well.
> > 
> For me the psmouse keeps working on v5.18 over repeated suspend-resume cycles
> on the same machine that had the regression with the commit 172d931910e1
> ("i2c: enable async suspend/resume on i2c client devices").

Same here for me, no problem with v5.18, thanks -
I'd have complained loudly if I had seen a problem!

Hugh
