Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54114185E6A
	for <lists+linux-input@lfdr.de>; Sun, 15 Mar 2020 17:12:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728836AbgCOQMm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Mar 2020 12:12:42 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35079 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728695AbgCOQMm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Mar 2020 12:12:42 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so15866991ljo.2
        for <linux-input@vger.kernel.org>; Sun, 15 Mar 2020 09:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CsYJyfMnnRrNgdGCwLmBJHUXTp3SG5YXdc4lDPn6bnk=;
        b=uMoDZ7R3/H5mxhnCEothcoJyDpHDEHaO0pWui5pDfI14Ut4g3y5rbc+slJYEltLiNq
         pRrhd/kIoUc165oPYRGsjEB/q8BehKqO1hGkgsiZDMFFq2ZMdeNUNIU5097gw6eY7/78
         jO1CkuFYQ9rYUz3MfcUuM5XmGJePhB8M/v4q5yE6znM+aSkfx0UFt1PhXNkr+3/PWkRE
         iJ1dVhZclU30E6fTFW61TIekE/ghw5/ccJBq5iDwbcAPcMwQ5XxORE5268Oxlqs+Wqup
         arBeNJbpJh87UU8wXTpMc49efpGzuXwmSVeNgweeyxAZwjB0K5WCbNYmIE/L2vlIiQMx
         Wmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CsYJyfMnnRrNgdGCwLmBJHUXTp3SG5YXdc4lDPn6bnk=;
        b=mOPQ/2KAEw1w8VVZSd34EUobCA36D6PRqLKlrRhYAeMpsQl7zZQcPpGG2UX9nLMZw2
         TDH27gLEMa6L0Cl4r7oD8GJZ/aY6bFoqRcUo50y52KaWqS2bZXShelwXdpGfIO1pXA/i
         AyBfKsfTlXqfhUxE29Hy+2klpDxhnDSgXBW3FDOeZ7ryiibL6j1o3OyyEIXCfZPbisWo
         /u/Y1JlkTuUsWu6BDT+rut/BrY7ED+GyuTHg++tD7M6L+2wxCtBqMe/0uA1MhohJ7rOv
         lCmI6ucyz4DWeIsjn4JdCcL/nx8I4yXESYSVnTtNntNTkFPWQCzNM7D/myT/XEkbPhG1
         gquA==
X-Gm-Message-State: ANhLgQ01Iepz9z+jKhYsFZru5t4VUyatZmEVkuOkjf9h7QjFVFFJ1YyE
        X1HtxhVDd/2V8m80H2etJ7GQn0Dg8STEFKwopDcgMQ==
X-Google-Smtp-Source: ADFU+vv9a5PBZeKPBgGzhQPGSLQN1j/RPxcxdCN7uJ1SLMvioax6RmzN6f46X0K34fE2U9q3fvSYltgUlbZ6ln9RiOo=
X-Received: by 2002:a05:651c:1026:: with SMTP id w6mr13428031ljm.168.1584288760266;
 Sun, 15 Mar 2020 09:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200310142818.15415-1-linus.walleij@linaro.org>
 <20200310142818.15415-2-linus.walleij@linaro.org> <20200310170809.GC192640@dtor-ws>
In-Reply-To: <20200310170809.GC192640@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 15 Mar 2020 17:12:29 +0100
Message-ID: <CACRpkdZYU0zvjRC-2L-Ra=td0iUSPLhP3BFQKUTkh4POYHTNNg@mail.gmail.com>
Subject: Re: [PATCH 2/2 v1] Input: cy8ctma140 - add driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

thanks for the quick review!

I fixed most stuff, just one minor comment:

On Tue, Mar 10, 2020 at 6:08 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > +     /* According to datasheet this should be in the 2.7-3.6 V range */
> > +     ret = regulator_set_voltage(ts->vcpin, 2700000, 3600000);
> > +     if (ret) {
> > +             dev_err(dev, "failed to set VCPIN voltage\n");
> > +             return ret;
> > +     }
>
> Shouldn't this already be in DT? We typically do not configure voltage
> on various rail unless in very specific circumstances.

Certainly the DT defines the voltage range on the regulator
on the producer side.

This is the consumer range, and DT has no facility to put
restrictions on the consumer voltage window.

I think it is pretty natural to do in the code.

The typical usecase is when two components share the
same line, and in this case two voltage consumer inputs
*may* be connected to the same producer regulator.

The regulator framework will the infer that the producer
can produce a voltage that fulfil the constraints on all the
consumers.

The fact that few devices issue regulator_set_voltage()
is a combination of "good enough" and general sloppiness,
I think it should reflect the operation voltages of the component
and stop people from shooting themselves in the foot.

But I CC Mark on this and see what he says. (I might be wrong.)

Yours,
Linus Walleij
