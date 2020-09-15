Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF7426B1A7
	for <lists+linux-input@lfdr.de>; Wed, 16 Sep 2020 00:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727557AbgIOWdw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Sep 2020 18:33:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:58874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727595AbgIOQQy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Sep 2020 12:16:54 -0400
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 08923206DC;
        Tue, 15 Sep 2020 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600185936;
        bh=apJ6xfFPLtD/enGKVD+ouYf+3+tRbBMfKdo0DKHobW4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MU0rdIL/zQpDofx458SsRkTlNDwMo4m/+GQWxJr4Qsy37eo4yaHLC6MR5kms1oJfj
         TIuBFkzG5hvz3cynKiIl0Utl0ADUTfn310aslizOqhbTWpSPCstAlpPU4WSAVahPsM
         lyj7Q05o5tOCgxVjkxk8BMt2gePSCi0RhYD1jP88=
Received: by mail-ej1-f49.google.com with SMTP id nw23so5867196ejb.4;
        Tue, 15 Sep 2020 09:05:35 -0700 (PDT)
X-Gm-Message-State: AOAM531yPTMfRW2PthYRHdariDC1StPeZ0iDS/uvvTAcCPTBU9yKD0am
        Phf7Wd8CbvSQ0o5VGGXVah99RVvi9edewdyVObE=
X-Google-Smtp-Source: ABdhPJzA1QDOacTeudZOMLy8RzFmbPdLzCUxEPDmd+44fc9VCCRNW4MzBgx+PB8CdPflH1EkJZk+VxDpKenD4lRZUg8=
X-Received: by 2002:a17:906:af53:: with SMTP id ly19mr20249111ejb.503.1600185934597;
 Tue, 15 Sep 2020 09:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200828145744.3636-1-krzk@kernel.org> <20200914065120.GR1665100@dtor-ws>
In-Reply-To: <20200914065120.GR1665100@dtor-ws>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 15 Sep 2020 18:05:22 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd0=oe0vZyxTJ0sF7U4THk3B=UPofKdKdXm_4s3td13Uw@mail.gmail.com>
Message-ID: <CAJKOXPd0=oe0vZyxTJ0sF7U4THk3B=UPofKdKdXm_4s3td13Uw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] Input: ep93xx_keypad - Fix handling of
 platform_get_irq() error
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 14 Sep 2020 at 08:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
>
> Hi Krzysztof,
>
> On Fri, Aug 28, 2020 at 04:57:41PM +0200, Krzysztof Kozlowski wrote:
> > platform_get_irq() returns -ERRNO on error.  In such case comparison
> > to 0 would pass the check.
>
> platform_get_irq() is a bit of a mess. Historically we allowed defining
> interrupt resource with r->start == 0 and for such cases non-OF non-ACPI
> code will return 0 from platform_get_irq() to indicate that IRQ is not
> assigned.
>
> We either need to stop doing this in platform_get_irq(), or the
> conditions in this patch and followups should be "irq <= 0" and we need
> to make sure we do not accidentally return 0 from probe ...

Hi,

It's then contradictory to platform_get_irq documentation which
explicitly says - zero will not be returned on error. This was also
clarified in commit e330b9a6bb35 ("platform: don't return 0 from
platform_get_irq[_byname]() on error").

As I understood the input drivers code, they check for errors so the
coe in my patch is correct. Any "<=0" is not correct with current
documentation and implementation.

Best regards,
Krzysztof
