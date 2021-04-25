Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B9836A4F0
	for <lists+linux-input@lfdr.de>; Sun, 25 Apr 2021 07:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229466AbhDYFbM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Apr 2021 01:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhDYFbM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Apr 2021 01:31:12 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43C9C061574;
        Sat, 24 Apr 2021 22:30:32 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id 10so1383340pfl.1;
        Sat, 24 Apr 2021 22:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=a3+ipCY9vk70vioGW8dxqD6cTHuZgEM4qMQTJ6iWkys=;
        b=aRjs6dvjkj6kZGGmsSfu/rZ8k1tKxua8TnAnHe3CJaC9bj8fi/J2kdwrcWIc9+ZM89
         mIpz9qnvIKSNJzHL0Mc4o72f7pJtkIEstLWidgCRyqWsTAyHVfkv7NB5ku5H0nfD90WX
         bek/xBNUM7XfnZjDoMIKSdpKk5qp9HAM3ecGllyz2XAejqrC0iOPo/ZUf9f/GwSKhqUH
         QqTFyjKrLCW+OijOaXNiYsaWyAvKCx0DrwjJrhmq1RJL/HwIC2bmUomOEv/xH96LYRX7
         rDwGSMaCHQ9ThY64wDBIeO9C0+hHNi3ok3x/bq5c4QRv4gLW8pYYAkoZ42UnuitTPDR4
         +wEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a3+ipCY9vk70vioGW8dxqD6cTHuZgEM4qMQTJ6iWkys=;
        b=cC/QaZL/TM50SXkrjp3M2RYQ39P0wNQLpOH7F8MUOxQZ6llByNvSsSSdHvlpCDMVNP
         51QnTruM24O00+NKVKF4ZezI4teQLO6DLeTbJTtg0g0k6yg7dpw9VcTpmnFNEkFUi0ng
         r/zNeQFsQ99kWNMoZIR4J0oWjxXX3dESMVTHj9oIVKY6V1BJhyz9bXvmE8uurvWWyOXi
         3jL/jB6CuckrhPHyAjPN9UkhhvrCaxNlIybax/XYoXZ+DhywBMQwJoZsSWGsDYwgqctn
         fUoCobVlvC3XaxPXnJmfZIZkqj2Kj944GkqsH/RjR4dqBarm/N0L9454LRbuOvcEPNuT
         Jp0w==
X-Gm-Message-State: AOAM531Q4z32L45cdfJrQD47dPX9s/yCEtnR867lcEbY/PUBjo2Anph3
        Qf00pbMSQ8UTTDklBjs6ScQ=
X-Google-Smtp-Source: ABdhPJxUixRvy3pXd2mOtVWJRCF1AyuQ/tqm8NRWs+OY2VLn2+PQjLic6j4gjWPiM2nbNLXvQ8JNOw==
X-Received: by 2002:a63:175c:: with SMTP id 28mr10914775pgx.376.1619328632129;
        Sat, 24 Apr 2021 22:30:32 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:28b7:b656:4f0d:6473])
        by smtp.gmail.com with ESMTPSA id b21sm7356492pfl.82.2021.04.24.22.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 22:30:31 -0700 (PDT)
Date:   Sat, 24 Apr 2021 22:30:29 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     zhuguangqing83@gmail.com, Bastien Nocera <hadess@hadess.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Input: goodix - Fix missing IRQF_ONESHOT as only
 threaded handler
Message-ID: <YIT+da7/ZXr5Uj33@google.com>
References: <20210416031747.28504-1-zhuguangqing83@gmail.com>
 <CAJKOXPeEHRZboCJs+eScjsLDybDzXSaP3jBLkAYiQt_7Ft2nog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJKOXPeEHRZboCJs+eScjsLDybDzXSaP3jBLkAYiQt_7Ft2nog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 16, 2021 at 10:47:11AM +0200, Krzysztof Kozlowski wrote:
> On Fri, 16 Apr 2021 at 05:18, <zhuguangqing83@gmail.com> wrote:
> >
> > From: Guangqing Zhu <zhuguangqing83@gmail.com>
> >
> > Coccinelle noticed:
> > drivers/input/touchscreen/goodix.c:497:8-33: ERROR: Threaded IRQ with no
> > primary handler requested without IRQF_ONESHOT
> >
> > Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
> > ---
> >  drivers/input/touchscreen/goodix.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> 
> Did you test it? There are several patches like this all over the tree
> so it looks like "let's fix everything from Coccinelle" because you
> ignored at least in some of the cases that the handler is not the
> default primary one. I am not saying that the change is bad, but
> rather it looks automated and needs more consideration.

At least the subject is bad because IRQF_ONESHOT is not missing, it is
simply set up elsewhere, the patch itself is a noop. I do not see a
reason to take this.

Thanks.

-- 
Dmitry
