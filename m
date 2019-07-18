Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 981446CE29
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2019 14:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727742AbfGRMe1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 18 Jul 2019 08:34:27 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43912 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727692AbfGRMe1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Jul 2019 08:34:27 -0400
Received: by mail-qt1-f195.google.com with SMTP id w17so26913575qto.10;
        Thu, 18 Jul 2019 05:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YgDPxY1huva0NBQK8HCG0oQDr7LxpI+h7zIUm7eJfoE=;
        b=XVEpPCf9gWpce3B7VSyzxQONG0+GXtgb5NCdA8zfSgiMDK/RvwlzJibBuhhyxG6pUW
         Ei+e/V4CcVOq4Z3vMKTMdAgaRYo0usq+wZKimuXG55TGOyYsyeAvNA9aOGKLOglmmSOc
         qOodX+TFjQAqso2KsUDjcr4iiiWcjVnwxscSeh2aDgB4hMyaDrhIG+0vWpdyQ8S0gAwa
         UZWO5nJ7qVJAdMuyGyhhqtCGKr38bc3eLLWjJvsmTFYSLFM2YtmrEGe1e2SO27rVUjPh
         fKSE9VYdAQAmT151KdRKWqeEec49+y98Zt7glWG/GtRdhwOabc8uiaTeptmPoeWz4C1S
         SM7g==
X-Gm-Message-State: APjAAAUdQjRe3L+PlOS9oC/X5XVACKfQNlN6NV3d52M07z/GidUHQzS4
        gTzy9e0TZ00DU7zkqopVRkEtpEq3aySMbxi8shenI/HSs/E=
X-Google-Smtp-Source: APXvYqzg5939ggftWax9rA8+LigDbV1C/i0RooF5/1N++M5M083sFjZXh/MKlbsUanzpLd4BZx56GxaBopTP8IPqhYY=
X-Received: by 2002:aed:3e7c:: with SMTP id m57mr32163623qtf.204.1563453266382;
 Thu, 18 Jul 2019 05:34:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190718020654.39860-1-yuehaibing@huawei.com> <CAK8P3a2H0o+_3Y_J3r=D5_hGCArTYeHPfPPjY3dJ+ArmqYrOfQ@mail.gmail.com>
 <20190718115827.GB2872@innovation.ch>
In-Reply-To: <20190718115827.GB2872@innovation.ch>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 18 Jul 2019 14:34:09 +0200
Message-ID: <CAK8P3a2Bi4xChuQH+buFtw+ODeDHPiPX=KqOuRNb9L2Koy8yYA@mail.gmail.com>
Subject: Re: [PATCH] Input: applespi: Fix build error without CONFIG_PCI
To:     "Life is hard, and then you die" <ronald@innovation.ch>
Cc:     YueHaibing <yuehaibing@huawei.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Rob Herring <robh@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 18, 2019 at 1:58 PM Life is hard, and then you die
<ronald@innovation.ch> wrote:
> On Thu, Jul 18, 2019 at 09:15:59AM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 18, 2019 at 4:07 AM YueHaibing <yuehaibing@huawei.com> wrote:
> > Your patch correctly solves the spi_pxa2xx issue, but I'd prefer to instead
> > drop the three 'imply' statements altogether, they seem to do more harm
> > than good.
> >
> > (the circular dependency I saw might only happen when applying the
> > arm32 KASAN patches, but I expect to see them merged for linux-5.4)
>
> Isn't there more generally a problem here that this is selecting
> MFD_INTEL_LPSS_PCI even though that depends on X86? I.e. are both ARM
> and X86 selected at the same time? (sorry if I'm being naïve, but I
> assumed only one arch can be selected at a time)

You can't have ARM and X86 defined at the same time, but Kconfig does
not know that, it just sees X86 as an undefined symbol, and ARM as
as always-enabled symbol when building for ARM.

In theory, 'imply' should deal with that and have no effect when there
are missing dependencies, but it appears that this only works for
deciding whether to turn on MFD_INTEL_LPSS_PCI, not for figuring
out loops in the dependency chain.

       Arnd
