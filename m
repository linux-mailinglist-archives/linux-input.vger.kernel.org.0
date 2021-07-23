Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367863D415A
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 22:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhGWTc1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 15:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231201AbhGWTc1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 15:32:27 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9BDC061757
        for <linux-input@vger.kernel.org>; Fri, 23 Jul 2021 13:12:59 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id t14so3161717oiw.0
        for <linux-input@vger.kernel.org>; Fri, 23 Jul 2021 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=iWKsxqaLuKKt7r1ybco35OuqISL9Q6eRrAXI7L+rDDo=;
        b=PPzW/qAs5wuxrT5U0bkozRW2HaxMAaUGE3JwrNMv8MPBBWl9h1FmY7g4/+it3cHcar
         UQxysCb003ez8WPNpFgmkTNQTcxzGwl3BYhl7dhr6jJG8b1RthNcgdl9xqckEJ6hcnsG
         09Gkppkoi2B2IF9te3kllT2T00TY+Akg6DoHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=iWKsxqaLuKKt7r1ybco35OuqISL9Q6eRrAXI7L+rDDo=;
        b=Lrnrj7bzTEIFr4uLzfJliEf+wgvA/QVT7QJF3zRRXH930sP/+cw7kat8lQmrBhVVmr
         HY8I1Mubx8UYfAvL0XinNRvUjVSlfO456E0cvduplaPCA4jpofWUxjwJ4uFJcGIQxYjL
         7D1RcYjLtvbSaqhEmB153FhSmHF6P38MRRSvpFKMWjUFGKen2ls4S1o4Cm4Sp/kj9TLY
         a8otzCmbdm3i5Ih8XEL77R+GBEg9G03k8zk9DYqwuSkLeiDI+RWYoyZNKaN7sTmhpfpe
         km5+KcU6VB8ZDjRBBfvOvhk2d9BCk1tiFaaPFZYSp2xHXcP2tpHqJvJyttOXDNZKtaIP
         iv/w==
X-Gm-Message-State: AOAM530qiKBafBB8gGfDxdD2gCaV7Roxs+ckye16CyeLaDjNDHpXPLZ7
        pvaJOMdJAK/tBJVp4NH/pcEsr+S0c4ug1BwfibnAfQ==
X-Google-Smtp-Source: ABdhPJychER1jemf23dOU3zqarRWN2XH+0UzO49bwOXeyzNfynn0OHwpFypLFF9y16OeQTr1wy7vpfKtK5Ue9RNQPcM=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr10234216oib.166.1627071178884;
 Fri, 23 Jul 2021 13:12:58 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jul 2021 20:12:58 +0000
MIME-Version: 1.0
In-Reply-To: <YPsd74LoRtB9tTKK@google.com>
References: <YPsa1qCBn/SAmE5x@google.com> <CAE-0n51y=o+8SZTL_==GPXrDa2OP8fhh98Amv+L4M63rLQVGZg@mail.gmail.com>
 <YPsd74LoRtB9tTKK@google.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 23 Jul 2021 20:12:58 +0000
Message-ID: <CAE-0n52ZFNWLhwis4UT9vWuCyzy=u4QkeeuZdygFFwvLJiq1Eg@mail.gmail.com>
Subject: Re: [PATCH] Input: pm8941-pwrkey - fix comma vs semicolon issue
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Collins <collinsd@codeaurora.org>,
        satya priya <skakit@codeaurora.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Dmitry Torokhov (2021-07-23 12:52:15)
> On Fri, Jul 23, 2021 at 07:43:52PM +0000, Stephen Boyd wrote:
> > Quoting Dmitry Torokhov (2021-07-23 12:39:02)
> > > There is absolutely no reason to use comma operator in this code, 2
> > > separate statements make much more sense.
> > >
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> >
> > Fixes: 2fcbda9a822d ("Input: pm8941-pwrkey - add support for PMK8350
> > PON_HLOS PMIC peripheral")
>
> It actually predates this patch and also not really a fix as the
> original code ends up working properly, but looks weird.

Alright.
