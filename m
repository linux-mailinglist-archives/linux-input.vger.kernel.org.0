Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C683528B20D
	for <lists+linux-input@lfdr.de>; Mon, 12 Oct 2020 12:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387471AbgJLKOI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Oct 2020 06:14:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbgJLKOI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Oct 2020 06:14:08 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63ADEC0613CE;
        Mon, 12 Oct 2020 03:14:08 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id 1so2462158ple.2;
        Mon, 12 Oct 2020 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QhDaEeXzqMVTcLqFDp+35E5HX0YNacZQ8ZAJN/Iw3a8=;
        b=eQRTXT/4Ius2BWvqcRhWh9HINzSr+buOU+8LH/C05qeU4pKtu45P/5zenIdITvog8y
         810d6UU1caBd8Epge0fDoYqtMTXq88EcWlLaIyopkTp4bfsIImNxqC4LhQI2L3uXzmdW
         RLpfnIan6I8jgdkPbXbd9S0PNZAvOkCr9bzgsexFj8AnZIKZ2d+7NXvCsOkxW1F02rOt
         N/OUpkd0sKvdUKLLrN5BEobhsG31/Uo+9CjUPS4zN9GB0z2yPipwqerDmdW+kXhNNXcf
         iMjNr4SB/7VpdRXX1sw3upKRktZZhbMkkPxOidmQjjMU7WkpBSQYL8/NXfEzjo6E6o/h
         c9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QhDaEeXzqMVTcLqFDp+35E5HX0YNacZQ8ZAJN/Iw3a8=;
        b=fGiIqdIDbvhy7h8HYAx4srUCphup2jAnvwbSQJX6oxkz8YTC1ZyGzh6wqZ9/UF8XgR
         9WN8Rq875wnMFitIouYSvS/KiwPJ7ZYlocDfmIt5EslNMEY93RcQeWu+oTgJoPt1Dhr6
         OrkonNJ9CYJaSNJAzfN9o6ptY4+G/QXbXFFtelrQi10tYSo+FwBL/VC/MQKrPyp0bzFJ
         i4J8BGN91hbvFS3TE3UxbacTqII9hCh9UxhjgVTpnKpF/bfFbqAQsFQN/OShwmS4aL9d
         m9230zHkdZK2j6Z/DPD/L3o+Kqde2/0TXHR43+8g8Bn9UeJu2rGV5yM8Qa4bD5kZTZ+2
         BjwQ==
X-Gm-Message-State: AOAM533ln1RnyEBoRzixybfONyRwVbhdY7gwBzemmSRFCBUaA6d3eZbk
        rJ2cE/JDG5XIbwap1NPxLhkH54mEmOwz5lTWMHc=
X-Google-Smtp-Source: ABdhPJzn8EYi2P42gi24ZBwj5mJ8qTi0hHHtMkLnelMvAwPeHrWsfCC5XrIRIIy/w9glbOjlmlUhwijuYQKhaNa21IU=
X-Received: by 2002:a17:902:7896:b029:d3:7768:1eb with SMTP id
 q22-20020a1709027896b02900d3776801ebmr22693133pll.17.1602497647807; Mon, 12
 Oct 2020 03:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200923215633.209724-1-luke@ljones.dev> <119d6a2e-275b-e6b9-0130-edd653ecd4fa@redhat.com>
 <YOZ0IQ.A665YAO5V6WM2@ljones.dev> <4253ebb9-8978-7f31-3931-b2f5bd327f0d@redhat.com>
In-Reply-To: <4253ebb9-8978-7f31-3931-b2f5bd327f0d@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 12 Oct 2020 13:14:57 +0300
Message-ID: <CAHp75VfZ3QmePN2fLmAZPd1rMPzWHB=F8t4fs5s6R9rbQdvDww@mail.gmail.com>
Subject: Re: [PATCH V6 RESEND] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Luke Jones <luke@ljones.dev>, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 12, 2020 at 12:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/11/20 9:05 AM, Luke Jones wrote:
> > On Fri, Oct 9, 2020 at 16:22, Hans de Goede <hdegoede@redhat.com> wrote:

...

> > All the DSL we've dumped are here:
> > https://gitlab.com/asus-linux/reverse-engineering/-/tree/master/dsl
> >
> > I'm not sure where to go from here. Do I resubmit the revised patch in a new thread
> > or should I attach here? (I'll attach for now)
>
> Please submit a new version in a new email thread with [PATCH v2] as prefix to the
> subject, you can do this by passing --subject-prefix="PATCH v2" to git format-patch.

-v<N> will do it for you in a shorter way.

-- 
With Best Regards,
Andy Shevchenko
