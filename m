Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14592376A0
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 16:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbfFFO1h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 10:27:37 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:42810 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727133AbfFFO1h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 10:27:37 -0400
Received: by mail-io1-f66.google.com with SMTP id u19so328850ior.9;
        Thu, 06 Jun 2019 07:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kqRYhMLHdJKsiR7IXq7x/aBj9J6gbazdWxFz4rly5JY=;
        b=Afuf3vVl1Yw3e3iWFdNmwdMG1bgYu9ugpciggz7kqvbNCHscejJQA+BSvukD1dz59p
         x46sHTym/8ElPPfrxO/wsVPavjfyzxFHWfZMpP2RgDQiXNJLaBCTkNwJxxm7vGg6EZrR
         8QY0Uo4XwZwAu1K4esgr25Oz48AgBHGK0j/I+tgDlhFQE5TIv0yBaR5U889KRFMfvamq
         Kl79A8VH81bmJgY54TPnNgq6K5HbduQw9rI3At3xrG2cQ2d7pvAYvdeXkkXPitUeS1U0
         WIuyhVTZfvN5E5JHNMc5C1Qj9Yz0gP24eaitbc10fjtLuRe/NrxBIvg6bDT/cKGoi6D+
         c6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kqRYhMLHdJKsiR7IXq7x/aBj9J6gbazdWxFz4rly5JY=;
        b=mDh31a+z3f4HEj4OMkBMvkoFzvYV8wmfy0n6EYulJtlrAVBo7/sPfovPhqEafQZ8t0
         LWo9ioAnM63urjCjlIRD7Rrzs2hr3TaqRKU1IwY1kFSWYrMyVdqZHmIA4CgDw5TRdcma
         vBEuPOydlv8TcT3DeIrq4lzlai/reN1kbmK7IusoJsGgoELRo+RGOYhY1xCwEN9vha/9
         8lz41Qk9lbW1kmlINgaOnfHV6LzJkrZREyQjMsz9o0r+M3MxXAx3FwagEBZi+uaHwOo1
         Myb0uQ0L1htwvaMdVvMWEivlT9pg7Dn+1/kAk6T4kr0qnnFdikmb16wLBcemaqwNt/io
         xyOg==
X-Gm-Message-State: APjAAAVIBXshrkUzvzHo6W4tppcKhQLZxncbrzpAQiiLOsXtGU3tjm1F
        RRnwNPrbNMgtqAxJyUOnih+4v0N/73uG39Qh3dE=
X-Google-Smtp-Source: APXvYqztIhXnUUpmSDCiWqF1d+JigmC8q5yzRd2tPYEIqnZ4z+ovWDJeyvStPeBRdVheDOeHPBukjv5tcLECRleDV9E=
X-Received: by 2002:a05:6602:2001:: with SMTP id y1mr11874863iod.166.1559831256203;
 Thu, 06 Jun 2019 07:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160616.10017-1-jeffrey.l.hugo@gmail.com> <20190606055034.GA4797@dell>
 <20190606072601.GT22737@tuxbook-pro> <20190606081348.GB4797@dell>
In-Reply-To: <20190606081348.GB4797@dell>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 6 Jun 2019 08:27:24 -0600
Message-ID: <CAOCk7Nrt+vWG6c9uYWunbKdUN4XcukbvyKDO1NdmYvFMfOYNhA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: Add Lenovo Miix 630
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org, MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 6, 2019 at 2:13 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> On Thu, 06 Jun 2019, Bjorn Andersson wrote:
>
> > On Wed 05 Jun 22:50 PDT 2019, Lee Jones wrote:
> >
> > > On Tue, 23 Apr 2019, Jeffrey Hugo wrote:
> > >
> > > > This adds the initial DT for the Lenovo Miix 630 laptop.  Supported
> > > > functionality includes USB (host), microSD-card, keyboard, and trackpad.
> > > >
> > > > Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/Makefile             |   1 +
> > > >  .../boot/dts/qcom/msm8998-clamshell.dtsi      | 278 ++++++++++++++++++
> > > >  .../boot/dts/qcom/msm8998-lenovo-miix-630.dts |  30 ++
> > >
> > > What's happening with this patch?
> > >
> >
> > The thermal-zones are wrong, but I'm okay with an incremental patch for
> > that...
>
> I guess it would take you about 10 seconds to whip those out when
> merging?
>
> > > It's been on the list a while now.  I'm waiting for it to be accepted,
> > > since there are patches I wish to submit which are based on it.
> > >
> > > Who is responsible for merging these?
> >
> > ...so I've just been waiting for a conclusion on the HID patch before I
> > could pick this up.
>
> Aren't they orthogonal?

Eh, if the HID stuff changes, we'll probably have to change the DT.
Which isn't great.

I guess we could also merge this, and fix it up as necessary if there
is fall out from the HID stuff.
