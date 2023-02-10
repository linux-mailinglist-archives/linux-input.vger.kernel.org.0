Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 467596915A1
	for <lists+linux-input@lfdr.de>; Fri, 10 Feb 2023 01:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjBJAeQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Feb 2023 19:34:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjBJAdd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Feb 2023 19:33:33 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0688270963;
        Thu,  9 Feb 2023 16:32:46 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so3960526pjb.5;
        Thu, 09 Feb 2023 16:32:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xj7Cyj0NJIK0+AyaYWAEeVxkpZsOvRKhY6rqEfk/eHE=;
        b=MTWROOIKtAIfYIMmZBuQnuwh65n+jhZ3cImzV9SMEiEJWiu/bej7WyEb7LBDfmvMn1
         Nl+lu9fTKgsY01PAHjvUErYqiZnO4mmhT3JIokCtLaD5oAPvtIIEVASXK+yfA4FH74BN
         m/4J/6+167mkt/XafPtcJ/ozpP78PExnmaohz9jZEuFyvNAQlk1Puf9xI0xTVUIk8ws8
         lLoJx5il1C4IhiIn6aLIXuUuzgJnHnbEXoeecFJSqXPZof21xRWPwbgl6K/Y5b8C3cCb
         fTgql+JbslKTto8J+LawHQuhJkWLFEk3TAooZTswa8b9B18i/3nl2gUS90qqjgu+5654
         kayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xj7Cyj0NJIK0+AyaYWAEeVxkpZsOvRKhY6rqEfk/eHE=;
        b=fEcReOKP6Ke08feFywBa+2Y+IsTtMbHKWKYiGlR+YH2zE1ylX957/eYMUsqulyMBn9
         Y8Qp/zKOV9pyyqBQeyj+38bUXVeJNK9RLuFY9xaPRbZiIVi3s73EN88mnHd9bgWnjfex
         wv4X8tSHHfqhw5jBY2JAEKhdOhIIR1/7wXMCABNJ3cvBfLTpPeLf7T1HTTSOA3XPH+tH
         T80HpokTOumGNJYBv3YUI5Ua+PlWHhyVVRoqt8WR4JAPTRrmtvfSkJKYWufx/TMdjK8k
         lBQgjpnmusXABzL2NOlRrq3spExKgl2nUYOAo57TmnxatmsnW2C15C9tOokgvGmlkD6Y
         OHZQ==
X-Gm-Message-State: AO0yUKWG0iUOOCYWEOMLuqlimmSyhUvuNpjm8W2TqaiVt+w9Gvw24fJW
        m9xSr5LIDkuDar3wuwNtmuA=
X-Google-Smtp-Source: AK7set+Y/IbRn0by25SpwW+k2aSyCVY8MzTJTMoyePduUZNEB+HyjUgKm7PzrYpMd/UqVAhQYt3B1g==
X-Received: by 2002:a17:902:da84:b0:196:8c85:8aaa with SMTP id j4-20020a170902da8400b001968c858aaamr15080700plx.6.1675989144936;
        Thu, 09 Feb 2023 16:32:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:4b3d:5db5:694e:89d0])
        by smtp.gmail.com with ESMTPSA id k18-20020a170902761200b001932a9e4f2csm2082114pll.255.2023.02.09.16.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 16:32:24 -0800 (PST)
Date:   Thu, 9 Feb 2023 16:32:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Daniel Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Subject: Re: [PATCH v4 3/4] HID: cp2112: Fix driver not registering GPIO IRQ
 chip as threaded
Message-ID: <Y+WQlf/CjcuPaHf/@google.com>
References: <20230206135016.6737-1-kaehndan@gmail.com>
 <20230206135016.6737-4-kaehndan@gmail.com>
 <Y+GKFlcVA2hB+3rU@google.com>
 <CAP+ZCCfnbMpQX4qQee3QZgOft=vQ0BLBgqQUwzPNH7qYopufAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP+ZCCfnbMpQX4qQee3QZgOft=vQ0BLBgqQUwzPNH7qYopufAQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 07, 2023 at 06:34:32AM -0600, Daniel Kaehn wrote:
> On Mon, Feb 6, 2023 at 5:15 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Mon, Feb 06, 2023 at 07:50:15AM -0600, Danny Kaehn wrote:
> > > The CP2112 generates interrupts from a polling routine on a thread,
> > > and can only support threaded interrupts. This patch configures the
> > > gpiochip irq chip with this flag, disallowing consumers to request
> > > a hard IRQ from this driver, which resulted in a segfault previously.
> >
> > This looks like a bugfix not dependent on anything else in the series
> > and can be applied separately...
> 
> This is correct (though usage of this patchset to instantiate drivers
> which request interrupts will most of the time be broken without this
> patch). Does this mean I should submit this patch independently from
> the rest of the series? Or should I just include a message to the
> maintainer describing what you said (that this can be applied
> separately)?

I'd simply sent it separately and then you do not need to explain ;)

Thanks.

-- 
Dmitry
