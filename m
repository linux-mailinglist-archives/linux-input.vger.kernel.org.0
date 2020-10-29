Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A725329ED74
	for <lists+linux-input@lfdr.de>; Thu, 29 Oct 2020 14:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbgJ2Nrt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Oct 2020 09:47:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727665AbgJ2Nrt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Oct 2020 09:47:49 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F8AC0613D4
        for <linux-input@vger.kernel.org>; Thu, 29 Oct 2020 06:47:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id b1so3340132lfp.11
        for <linux-input@vger.kernel.org>; Thu, 29 Oct 2020 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vjcd1OV9Y0S9DwlYOFgg/Kh06MES3AzU2FbFRN2RRP4=;
        b=dSjbcybeZExd28dnLExWVk1Jg9NHOWOxxQ6YIA2JeQADkS8OB09iubCJMmDwICtG0o
         qigP0V34Xc42zBqGLXAFVm3ix0IeOQOP6hStzoblUlK7YqW/yjRxQYTVOXw6U7/hVOXt
         cNlSoLuXgpqYLzrfD9SCDbS/l+3nm9Zr944uHb+p4Irtlz+Je0x//H9AAMw/wtNyZk4I
         WQ83Nb2jv+SkzWTTRe6WwuIgq6HLdR0Cl34M3FGowb6aPFOKpKmwfiZNRbOu59b89Fge
         G53tan79AqcLgSk+On/b5k/Kmpnhkv3IoxvwRmH6OepefotxVTYhs9l85r+YL6besnwp
         ZrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vjcd1OV9Y0S9DwlYOFgg/Kh06MES3AzU2FbFRN2RRP4=;
        b=kdgtFV84DfteI46MXiY3X91NF1GXwvaRdLxC+xkl1/BQAv3PgNVqcJwV2SA3efLzd/
         cv5Mc+qPJvTpqkrMYY3AsvMnAUFlFmaK3vXQhRwEGLGj2+6IBpJUx+M14sp9TU8DTUol
         TCTi3tzqCEEz4IFc9amVGCRPejMe6ECHqtoS5jiTaxNsn7etYsjMMfCWt3c5pf5zrqGM
         LRCeYqC6ETCcyJwO7TtKArK6OamDpLRaGODC6PQ1yLlQDyN0qdd8Vj5OMjwBFoLgYCZF
         M/+YlSFYtPO/k8oLkiMlv9CMYnZldXVt1jk/HN3zC4+c5Q/fqU0gzAi9ZWLp5RGSZ6QH
         sGgg==
X-Gm-Message-State: AOAM530Y932l7+NhSAmNKDQR/+JNZSwG4nzyPME0cB0hAWQcU16ynPOq
        kng+lCdfhUl8CTwohJIzA52OOO67F5WHQQ6wuqxnpQ==
X-Google-Smtp-Source: ABdhPJwN6ha67xO+M6aynkxzVWIiI07fZNMj/i+esayqEzztW1AbyS5iRHs9qjUg/c7Nd8/tWcgHnMxheiOVj3XDS+w=
X-Received: by 2002:a19:824f:: with SMTP id e76mr1539958lfd.572.1603979267424;
 Thu, 29 Oct 2020 06:47:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201028101711.696423-1-linus.walleij@linaro.org> <20201028180059.GA2547185@dtor-ws>
In-Reply-To: <20201028180059.GA2547185@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Oct 2020 14:47:36 +0100
Message-ID: <CACRpkdaieExkEyjE=+GbQTVKsk21ifH9mm+q4vengqgbQ=Jd_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: atmel_mxt_ts: Convert bindings to YAML and extend
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 28, 2020 at 7:01 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Wed, Oct 28, 2020 at 11:17:10AM +0100, Linus Walleij wrote:

> > This converts the Armel MXT touchscreen bindings to YAML
> > format and extends them with the following two properties:
> >
> > - vdda-supply: the optional analog supply voltage
> > - vdd-supply: the optional digital supply voltage
> >
> > I also explained about the reset-gpios property that this
> > better be flagged as active high (0) despite actually
> > being active low, because all current device trees and
> > drivers assume that this is the case and will actively
> > drive the line low to assert RESET.
>
> I wonder if we should fix that in driver and in DTs instead of doing
> this cludge...

Unfortunately I think there are deployed systems with flashed-in
system descriptions depending on this bug in the system
description already.

I am not thinking about device trees now, but instead ACPI
chromebooks, that have their reset line flagged as whatever
ACPI or DT-to-ACPI use to indicate an active high line.
Despite being active low.

I could fix all the in-tree devicetrees and do it the natural way
(I have certainly done so before) and then add a quirk if used
with ACPI. But it's really risky. I'm afraid of regressions here.

Yours,
Linus Walleij
