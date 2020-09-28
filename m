Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A6827B8D1
	for <lists+linux-input@lfdr.de>; Tue, 29 Sep 2020 02:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727136AbgI2ASm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 20:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727041AbgI2ASm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 20:18:42 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3A1C0613CF;
        Mon, 28 Sep 2020 14:51:23 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so1482404pjb.2;
        Mon, 28 Sep 2020 14:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0zcKXkjr+0WW7s5I933AoHmUfCo7GOg25DnlE1wAEnc=;
        b=j7KoV1sH0gyPAAZxDitobFESpxddpo52tCXiKgjnF559nA+AXW5T5BxRFMGqxJ92JF
         T2rFKkx2yV9iPDnrRg+KY8oQlFen/xxlBWl+RDo5CBpN5F1lInb6ddujhFLsZ8klctx/
         IuYOvpYvqsJLGKPzqSKS+DDltNpqrVcRdjioxn1+t4qVozYpR7lXgVhtpTZCyjttlVjl
         /23aAmkTvnGnn2VZMrhEDavPMDkFV8s25FJV7xTey7jD6sY078QmjbDgia5dciYyXSxP
         TxlFub2eRSfnKGyWSiNP3gC4QGhrhWDC7FOQnxuhyWLNwQCOhCWWmWFaBQeBHS2Wv1gk
         rnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0zcKXkjr+0WW7s5I933AoHmUfCo7GOg25DnlE1wAEnc=;
        b=oVX1TupVDMkzvksZJpNHaQg0VSQ9PzfMsIMsiGFNF9yQD7tMaYxPjeAiqq+k1pKMxy
         mDhSLO6DD5G2jCwk2/F3TFhJKTS3pkXbVt1iiDg/qvxqEfqBPnhpakiFqS6/LX/pSkMr
         iLg+C92OibvtSkO23kUQRAdUJ8E/LYXnV3mhW/NVpKu1O+h02KoprjyxLMyKNmBwSbN3
         oDSYBMOem/SBRzGpl/8TQ5g61zErWd8kBpM5VZjh6aPQYPfhYfw4nMqz1NIvUgMg9fa8
         gSes1DDPtY8yU74/tA/ZvDQmphgGdel7KOoAxEX4ADya58MLbBHAGNgFWrxRp7gYM512
         MXdQ==
X-Gm-Message-State: AOAM5318oglMMEjm3PfSuLn8Z3lt8Hl57TgGiy3ICwJ2EarAP3HeXDy3
        XcDqR2GT3SuwMTgZS8LFaqE=
X-Google-Smtp-Source: ABdhPJy5HI18HNciJWrmjDoa+x5aBmymslOxhXQdDyVjUo4bs7shggi4YeGVijgiqjd/PrvBxMYo6w==
X-Received: by 2002:a17:90a:ca03:: with SMTP id x3mr1101033pjt.92.1601329883155;
        Mon, 28 Sep 2020 14:51:23 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id x3sm2492248pjf.42.2020.09.28.14.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 14:51:22 -0700 (PDT)
Date:   Mon, 28 Sep 2020 14:51:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     kholk11@gmail.com, Rob Herring <robh+dt@kernel.org>,
        rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        marijns95@gmail.com, Konrad Dybcio <konradybcio@gmail.com>,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: Add Novatek NT36xxx touchscreen driver
Message-ID: <20200928215120.GP1681290@dtor-ws>
References: <20200927123542.553852-1-kholk11@gmail.com>
 <20200927123542.553852-3-kholk11@gmail.com>
 <CAMi1Hd1A-nRD57ETMnCbtKTFpQZ1f9-3D1SPx===BRx0f1FX7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMi1Hd1A-nRD57ETMnCbtKTFpQZ1f9-3D1SPx===BRx0f1FX7A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 28, 2020 at 03:18:18PM +0530, Amit Pundir wrote:
> On Sun, 27 Sep 2020 at 18:06, <kholk11@gmail.com> wrote:
> >
> > From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> >
> > This is a driver for the Novatek in-cell touch controller and
> > supports various chips from the NT36xxx family, currently
> > including NT36525, NT36672A, NT36676F, NT36772 and NT36870.
> >
> > Functionality like wake gestures and firmware flashing is not
> > included: I am not aware of any of these DrIC+Touch combo
> > chips not including a non-volatile memory and it should be
> > highly unlikely to find one, since the touch firmware is
> > embedded into the DriverIC one, which is obviously necessary
> > to drive the display unit.
> >
> > However, the necessary address for the firmware update
> > procedure was included into the address table in this driver
> > so, in the event that someone finds the need to implement it
> > for a reason or another, it will be pretty straightforward to.
> >
> > This driver is lightly based on the downstream implementation [1].
> > [1] https://github.com/Rasenkai/caf-tsoft-Novatek-nt36xxx
> >
> 
> This is so cool!
> 
> Xiaomi PocoF1 phone uses same family touchscreen IC and I could
> test this series on that phone as well.
> 
> However I do have to make a minor change to get it working. The
> downstream driver and even the github code you linked above use
> GPIO mapped IRQ, and I had to switch to that to get touchscreen
> working with your driver
> https://github.com/pundiramit/linux/commit/0a73eb656c1e80787dc195641ce7b0076fddb38e.
> I wonder if I'm missing any devicetree property other than interrupts?

Simply specifying GPIO controller/pin as interrupt property should work,
there should be no need to parse custom GPIO property and convert it to
IRQ in the driver.

Thanks.

-- 
Dmitry
