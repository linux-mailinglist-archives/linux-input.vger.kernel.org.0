Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6844442A8C
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 17:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2501911AbfFLPOB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 11:14:01 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43480 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2501887AbfFLPOA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 11:14:00 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so13226287ios.10;
        Wed, 12 Jun 2019 08:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vI+MjupPN0bdSLC0d4n9EKY3NhMFE/hPF7Qke//MIZg=;
        b=FMNMZ5l/AMgRbC8NwAe+xwcMBIahtFMP/TeDWBxDwkaeY9lWLrRo/zIdPjWjzXGFtb
         Tdxo2nt9ZqRQ2e3mT6RWTA+gsI1ZO8yllh9Utv6BPqo9fSyKFw8iwdAq7nST/Jl5aqGa
         W7MDM7oTdJvy4cT6mshiFIljSfoM9pwrfIqTE0jKCXDtvG5NZ8+UNJ/VYTa9aqTZjvm2
         vk78kFLYP618peEMo0ZEmiEab3aV1uO5NSQ6sbuE5hRNVHdY41xFflNoMflKGXui5lX5
         vP0FQvZ0Z1rm1f7V02gWlj4DFCefbox2yDTCY++MP8HQsxKBekf7VVVMr2Rp4wh/kZZ5
         GOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vI+MjupPN0bdSLC0d4n9EKY3NhMFE/hPF7Qke//MIZg=;
        b=Xd7PDEdt7eRevVzZkg5xovLO6QOO177xdW0jauptSVBEWZziMRJGuMgOH8+RdO1/mI
         1ZRlrXWG753txr+03hr4AazX4JQ+DJq4DSJY5V2H83PDhV6NuGOH+uSaWmdHF7rkk8gd
         A7wxV7oMQY4zl8ywVay7lhRJu+z/74GGp64FILbwuRlsFA9xiL9VSNJcYgYtYqY3Em0W
         hGe1hMHKQFSFEZe2trlmzL1FyMm3Q9qYDm4eV8dl3TgbwyDtOxEqtC5wst5+VqTCvSNs
         5dN5opyD8/cpl/4KkZmhbjWmulCTQg2Ci7Jj5a5oRxko/0gpMc2GFbAhGKgIC+juCj28
         cYCg==
X-Gm-Message-State: APjAAAVqVeS1tsE8lU3s7po5LO4rxS9haLlv6xFBiiQsjHWnM4ALTTc5
        OkLGXeQtQDPiKDaChC+65iCXOR/twc2abxKqEWs=
X-Google-Smtp-Source: APXvYqwJX3V/w2R1ujedyKrrjjM7vESmcNboL72M6UunCkoDmGIflaIXdl27ygYhJwTlO8YNS6zNuOylrvb7qqsjOx8=
X-Received: by 2002:a6b:f90f:: with SMTP id j15mr25554922iog.43.1560352439357;
 Wed, 12 Jun 2019 08:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
 <20190606161322.47192-1-jeffrey.l.hugo@gmail.com> <20190612003507.GG143729@dtor-ws>
 <nycvar.YFH.7.76.1906121644160.27227@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.1906121644160.27227@cbobk.fhfr.pm>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 12 Jun 2019 08:13:47 -0700
Message-ID: <CAKdAkRQOxTX51rhodoFyYpwi85pk8apvWjCLLX5Sw6NTH=j1kA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] HID: quirks: Refactor ELAN 400 and 401 handling
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, agross@kernel.org,
        David Brown <david.brown@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Jun 12, 2019 at 7:45 AM Jiri Kosina <jikos@kernel.org> wrote:
>
> On Tue, 11 Jun 2019, Dmitry Torokhov wrote:
>
> > > +static const char *hid_elan_i2c_ignore[] = {
> >
> > If this is a copy of elan whitelist, then, if we do not want to bother
> > with sharing it in object form (as a elan-i2c-ids module), can we at
> > least move it into include/linux/input/elan-i2c-ids.h and consume from
> > hid-quirks.c?
>
> Let's just not duplicate it in both objects. Why not properly export it
> from hid_quirks?

Strictly speaking Elan does not depend on HID; exporting it from
quirks would mean adding this dependency. This also mean that you
can't make Elan built-in while keeping HID as a module (I think this
at least used to be config on some Chromebooks).

Thanks.

-- 
Dmitry
