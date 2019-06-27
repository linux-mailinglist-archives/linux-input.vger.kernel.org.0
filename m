Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C743558473
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2019 16:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbfF0O3l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Jun 2019 10:29:41 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:45566 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfF0O3l (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Jun 2019 10:29:41 -0400
Received: by mail-qt1-f193.google.com with SMTP id j19so2594643qtr.12
        for <linux-input@vger.kernel.org>; Thu, 27 Jun 2019 07:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W1pvYoORZqnP8xoBxNR1BOMT3ARKFroxHWTKv5wzgOM=;
        b=T0Vh1doSYVjqYGIFEIRw0LbRaTp2Y++tS8c+w2G2Z8BL1vGyJy6qhKJWJ/Q9JjFzeH
         R2NeJj+nCeXrYHw150touYyHGu+fPPShqkmOu92+DpWOhe/xs+805dIS71CvRqYO4mp2
         PH87oRzaU0ArZTiXvzZ1PjSaJb+d2ybDnHa8drBFSWIXP3S3fCmjGOmL41ymyM5osP1j
         4aUZ3SojKB5xb+oZc9rgtyjHUEP7xxWxI0y2V4X3cq4gd+ZuyX/tJaHupaa6n0IkJ+oq
         tZvWbBBT/bnglzbdqeZyPx4clWJwfpZQZpKPg/7RexvBbt8+MZnsxl9kG/K7WF5ceFKS
         UeWQ==
X-Gm-Message-State: APjAAAVmJixn2hybOaZCqsuwtnDHGhvC+WEPIzr+ikIpDzT7D09v6wzm
        cCQ1TwtWsvb46PrWygrYSTJm+V9/mZTcbd1fbbvL2Q==
X-Google-Smtp-Source: APXvYqw4Nu9aKVOvhSyI6nwbZb88GsVpgfbBupkwLNZCD+lEsmbsGQhxPM8V0t9uTwLCqXNVc4fw9xbP+qvO1l5esoc=
X-Received: by 2002:ac8:220a:: with SMTP id o10mr3296213qto.31.1561645780791;
 Thu, 27 Jun 2019 07:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190621144854.38568-1-jeffrey.l.hugo@gmail.com>
 <20190621145042.38637-1-jeffrey.l.hugo@gmail.com> <20190623062000.GB204275@dtor-ws>
 <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
In-Reply-To: <CAOCk7Nr4+Sj9U=qAZTEhPGgZNrZ1VVvNtuUg-9vQzp15xFdCUw@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 27 Jun 2019 16:29:29 +0200
Message-ID: <CAO-hwJLEDCbMud6dCfvXzwDfauAgfOZmQwkmELEF2e6-4Oe6=g@mail.gmail.com>
Subject: Re: [PATCH v8 1/5] Input: elan_i2c: Export the device id whitelist
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, xnox@ubuntu.com,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 27, 2019 at 4:02 PM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Sun, Jun 23, 2019 at 12:20 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Fri, Jun 21, 2019 at 07:50:42AM -0700, Jeffrey Hugo wrote:
> > > Elan_i2c and hid-quirks work in conjunction to decide which devices each
> > > driver will handle.  Elan_i2c has a whitelist of devices that should be
> > > consumed by hid-quirks so that there is one master list of devices to
> > > handoff between the drivers.  Put the ids in a header file so that
> > > hid-quirks can consume it instead of duplicating the list.
> > >
> > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> >
> > Benjamin, are you happy with this version?
>
> Benjamin, ping?
> Sorry to be a bother, but I'm still anxious to get this queued for 5.3.

Ooops, yeah, sorry I missed Dmitry's email.

Fine by me:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin
