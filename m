Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED11E5F0
	for <lists+linux-input@lfdr.de>; Mon, 29 Apr 2019 17:17:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728449AbfD2PRB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Apr 2019 11:17:01 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38312 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbfD2PRB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Apr 2019 11:17:01 -0400
Received: by mail-io1-f65.google.com with SMTP id y6so9274547ior.5;
        Mon, 29 Apr 2019 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eG/LJFcnFIeMvEc4NiVulsT3hs2bq4D8LBXeVGHg9Vc=;
        b=PEOpD+Y6h802ikNpfNFdgVMVgFdb32ihBGzQ2h9+IatXRt4/Bp69TuK984AhPSepGD
         XTrHjYObJOC2wY3Pbbmhw4oLdAXAPx16MtYrIHpJH6BijcMLGVEqNE5qPvC2Jd0Z/hSo
         xXaFfTGu5Xgg22kx1+vD2fDBac0+VkVK2QG7C71kKzUBXi4KzRWlkl5JoyFPNnLDZ1dQ
         DtKZ4/b++Sprpqw/1w9NaEblZHNd+1EQZKigkmOqL7cjwurAv+Zoswoo9w3bjQH/rB6Y
         n+J3eUdj7R6cG6ux3gp1y51ZHomejr8KvwW3A1ikmeaQFYLx4um/OYWQo297yGEBDXCh
         cBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eG/LJFcnFIeMvEc4NiVulsT3hs2bq4D8LBXeVGHg9Vc=;
        b=U83QXW5Ih7j2v3MeEhq8eY+nTKVbXZcpncHBk2FTyNMNLEOdxbfXLQDCtJ31Y7pb0U
         t8Dy4FlsXBDuVqHbSjq4oESMY0AwWUNlCGW8RyfehQAaEN1s2+AngVzaFXnzgYNIUqd8
         rD1eV5fOlhMO19yDtXhNUM6P4yl2TMxNWfDeWuEd7SlLg7MLP4PowL4GuO/QSisd9yAk
         Pcj0o3/Rp94+hWavC7cB/vcQkpy2gItAlqvUaU4nkg6jml3zpd90WR6xaEfGV/nS8GIY
         GXSI9NzMCzZxS5JDAC6z0ASfxsYholjBFJ4leHYDEEzcsU2BR6npnrh/A7k7WA1QGXiF
         Xvgw==
X-Gm-Message-State: APjAAAXG04R9bAeHxqpBYxg11sdIycr8c+rRto6gewbk+lEb+wA/MQ9T
        3Qmfp0kBIgUv9qWNeLd/7aDaxpme8F5M9vzmqJRy5w==
X-Google-Smtp-Source: APXvYqy5cYf6zFE2DLDGSznIaowj/24wI72Tmg6kzBejCH9QUEgxmz+ekdIHkQAcq0KLCUUZMj5cfM/u7zhQHyZsjCI=
X-Received: by 2002:a5e:d611:: with SMTP id w17mr27273404iom.277.1556551020433;
 Mon, 29 Apr 2019 08:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190415160915.16324-1-jeffrey.l.hugo@gmail.com>
 <20190415161115.16466-1-jeffrey.l.hugo@gmail.com> <20190427044245.GD3137@builder>
In-Reply-To: <20190427044245.GD3137@builder>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Mon, 29 Apr 2019 09:16:49 -0600
Message-ID: <CAOCk7Nqa_nXkOJeoOg2n2UMrkdYfT6jEBpVcPh2zTE+NJLe8FA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add Lenovo Miix 630
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 26, 2019 at 10:42 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 15 Apr 09:11 PDT 2019, Jeffrey Hugo wrote:
> > diff --git a/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi b/arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
> [..]
> > +     thermal-zones {
> > +             battery-thermal {
> > +                     polling-delay-passive = <250>;
> > +                     polling-delay = <1000>;
> > +
> > +                     thermal-sensors = <&tsens0 0>;
>
> I guess you inherited the battery and skin thermal nodes from my MTP
> dts. Unfortunately after talking to Amit I think I got these wrong, and
> they should be &pmi8998_adc 0 and 5 instead.
>
> Can you confirm this?

Yeah, I pulled thermal from the MTP.  Someone pointed this out on the
v4 series.  I haven't circled back to it yet.

>
> > +
> > +                     trips {
> > +                             battery_crit: trip0 {
> > +                                     temperature = <60000>;
> > +                                     hysteresis = <2000>;
> > +                                     type = "critical";
> > +                             };
> > +                     };
> > +             };
>
> Regards,
> Bjorn
