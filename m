Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1CC68D6B1
	for <lists+linux-input@lfdr.de>; Tue,  7 Feb 2023 13:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbjBGM27 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Feb 2023 07:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbjBGM25 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Feb 2023 07:28:57 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7311A65A9;
        Tue,  7 Feb 2023 04:28:56 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id k4so16068739vsc.4;
        Tue, 07 Feb 2023 04:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fr1nRNymEVHaG3zo06OF84XvEiAPBTrVbfRlQ0TZbio=;
        b=MVV2OHsxfpOOQjoQ5R8zn+LJrsUqCRJrOiRF2lo1X6E6bkqwk9P/e7j6yXbth3hd8b
         RaYlBCUvPZXvT5qg6cYRsxn1UFiVwhaxx/UukVMQA2ChZAsIp23dftDG9SlNh33f+ndh
         VUYjTRExYq1UiffB2KqBYjILtlKDEJ55KzJzEbJTT/3dEPjSGtqpI0cPdrc3hmBC9Slv
         LuYWGKIHxWSPiwzptlJnSmig93iKq4BDTs47IoFepAcMrZoAE01MNQhI4DycBajDqCw/
         tOCumBGn5VwjoIeMX+/idVUtXygSXsn3UlcSb/5IAfljE+RNCgrAGe1tVURZ2Q/90rRh
         0lPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fr1nRNymEVHaG3zo06OF84XvEiAPBTrVbfRlQ0TZbio=;
        b=JxJFKMGnW6leEZ8hmAVJWy3xpAMqkivfqqs9t+brJoKZiSD2tDGY4n8nk6Dnggbk8J
         VA2C+00wWx61TWXtyldgxV0eD3UiP9FOORjrxsbF9Me+d/xthTBnawz2/cos6+RFIVtD
         bc3oHq/4D/usRucpwtLQrkvhpG7bWOw5fQDBCkOqO61NlNHRjs5v/oy+2tCpSMCSrTu0
         i3zUPj4O2MilI9ijSU0UN1aYNzu5Y2vtkea9BD8pboAR4oHuJqS9goanQlBUEMPw6CF4
         Y29xsF1e0BnaJ8owSJxkAdQfFgJxK6oTMOJ5JgqUgEFsFluub2JWN6qxfltCvQ4LAWho
         vRzw==
X-Gm-Message-State: AO0yUKVuVCXjD6OM04TIhzZgkSiQYXfjNi8voyBKEF76QBm0SGAg3Rud
        NJOc6kITxJ+X0QqAUJPQh3l3cgLxOHeoiecZvvw=
X-Google-Smtp-Source: AK7set/fLPaUt9vIunr/CGf8xdWp6WCyM+aV/W9xuB7kpHwK4Eb8TRn+boQph7dJbUbcWTqdyqzzgnkx9cBEgbtNRII=
X-Received: by 2002:a67:d60d:0:b0:411:a8fb:4f41 with SMTP id
 n13-20020a67d60d000000b00411a8fb4f41mr112238vsj.67.1675772935307; Tue, 07 Feb
 2023 04:28:55 -0800 (PST)
MIME-Version: 1.0
References: <20230206135016.6737-1-kaehndan@gmail.com> <20230206135016.6737-5-kaehndan@gmail.com>
 <Y+GKwhkW29Bk26S+@google.com> <Y+Ikq+ow/Z8fTRGm@smile.fi.intel.com>
In-Reply-To: <Y+Ikq+ow/Z8fTRGm@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Tue, 7 Feb 2023 06:28:42 -0600
Message-ID: <CAP+ZCCcCNEWy+tSwZQ_szObju8vZuvzQF8RpprwTSP6vRGRF3Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] HID: cp2112: Devicetree Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 7, 2023 at 4:15 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 06, 2023 at 03:18:26PM -0800, Dmitry Torokhov wrote:
> > On Mon, Feb 06, 2023 at 07:50:16AM -0600, Danny Kaehn wrote:
>
> ...
>
> > > +#if IS_ENABLED(CONFIG_OF_GPIO)
> > > +   dev->gc.of_node                 = of_get_child_by_name(hdev->dev.of_node, "gpio");
> >
> >
> > I believe Andy is actively trying to get rid of of_node from GPIO chips.
> > And in general, we should be using fwnode and generic device properties
> > as much as possible.
> >
> > > +#endif
>
> Correct. And looking into the code of this patch I don't see any obstacles
> to use fwnode APIs. You can Cc a v5 (which is supposed to be fwnode API based)
> to me.
>

Sounds great, will do. I looked into doing this with the fwnode
initially, but thought since the capability to describe usb devices in
ACPI doesn't seem to be there, that I should be explicit that this
only works for devicetree--but makes sense that it's better to be
generic at the driver level if possible (especially if of_node is
being removed from gpio chips), so will do!

Thanks,

Danny Kaehn
