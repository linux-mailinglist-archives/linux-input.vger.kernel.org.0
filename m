Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B22366AF64E
	for <lists+linux-input@lfdr.de>; Tue,  7 Mar 2023 21:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231918AbjCGUAv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Mar 2023 15:00:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbjCGUA2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Mar 2023 15:00:28 -0500
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E671ADDF;
        Tue,  7 Mar 2023 11:57:40 -0800 (PST)
Received: by mail-vs1-xe34.google.com with SMTP id d7so13416175vsj.2;
        Tue, 07 Mar 2023 11:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678219058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Coz1Ept+oTL6DJoVxPr0XCDM/DsjkaueRu0Xzo9vK2s=;
        b=GJcHkqIsvwCo0S5PIOX6oKQc9z35CEQnFt6pDVvXrOAZ5plnPbxjLFTastWmhOyTG0
         XYfsUe6pKDr63w6qERWAqCSh4Sbb93y7P4ESYwsJ57UhpJEgiXVJ8Cx27Ymegi9J3fsC
         KUACxeaNYNcWsFE/JOftKjvV8kPEtGoXQJ6iEsd9s3TwDMmRT2qgb3MDmqseKU+MOqL2
         dKAIROZGXqv/HQelM806qlAELN1DBLy8ziEHNF2m8tjZvhdTOU2XyUUVevMVxmXqyG34
         DP4bEtoK2bhJBQZXU3LXQm24jngThO0B1k+YyxoSV4+i85+rxOtj4qmGnLXtAMxg1rFn
         b9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678219058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Coz1Ept+oTL6DJoVxPr0XCDM/DsjkaueRu0Xzo9vK2s=;
        b=L7T8kERykRAY5PU1nLe3TAWNlANnom59BzW99K/FgBduRe8ShSQGW32NOYvk0N06Dc
         uLNtEfnqXefy3C4nBCYrD3zgmY8WBEHnQdOUNGqka0XeIfAWI8lSSbRSAi+WsLMiQgvM
         /Gd2s/+oe9W0MVgfBo3EyS75vHJGQCsj1LIbPMgRnMdGP9foYSTHFI0DKqFWiU45dOrE
         f5ZaTzemfMONUjQejLI7sa/EuBAClsinRm8y2j2GeUhTavyfVzJTnsBu5jsh3yQktfrw
         /RLjv+nUSr0OGGK45yEBsVY5Vgi15osjnEA+D4/ZDurhpes6FKfYmgtjFFTXz1qHcsJt
         Hwog==
X-Gm-Message-State: AO0yUKWWQEBtXjOLpJb1nnOsDflgwMtpbtGHyvMTArF/2s7wbDBZo2Lh
        nQgnGxi7n6Z5Tb/y1sWrUNMFQEp4SOYPQb4umbE=
X-Google-Smtp-Source: AK7set8v5+iAed+VoX1ySqrjhXWYrSuH3bm0ByTFEhQ4a7Zi2TAVn3RYSxm2TjeQ02lBYUtHMjInlAdGB+SwUWyvei4=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr10583641vsl.7.1678219058185; Tue, 07 Mar
 2023 11:57:38 -0800 (PST)
MIME-Version: 1.0
References: <Y/9oO1AE6GK6CQmp@smile.fi.intel.com> <20230302170554.q3426ii255735rzw@mail.corp.redhat.com>
 <ZAXFNRuALYpXgL6F@smile.fi.intel.com> <b8423b0b-4f63-d598-6c8b-7c7e73549032@redhat.com>
 <ZAXlh9ZVjGJh0l7n@smile.fi.intel.com> <1cab1439-77f3-6739-d4cd-5862ce8512d8@redhat.com>
 <ZAYca0ADk0Uk1sK1@smile.fi.intel.com> <CAP+ZCCfsKdOyy5vzPh5OjpZjNQrYWDRzrqa_QxvG+kZDPYa+3A@mail.gmail.com>
 <ZAZOvEvqNDq6jZNB@smile.fi.intel.com> <20230307131706.olnb4qzo4ynu7gce@mail.corp.redhat.com>
 <ZAd+/fHeQ3zuvoTN@smile.fi.intel.com>
In-Reply-To: <ZAd+/fHeQ3zuvoTN@smile.fi.intel.com>
From:   Daniel Kaehn <kaehndan@gmail.com>
Date:   Tue, 7 Mar 2023 13:57:27 -0600
Message-ID: <CAP+ZCCe6mdtNmg0QEtQKFCKMyhM9xRffFoMHtxHEGnjNOEAedg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] HID: cp2112: Fwnode Support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jikos@kernel.org,
        bartosz.golaszewski@linaro.org, dmitry.torokhov@gmail.com,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ethan.twardy@plexus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 7, 2023 at 12:14=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Mar 07, 2023 at 02:17:06PM +0100, Benjamin Tissoires wrote:
> > On Mar 06 2023, Andy Shevchenko wrote:
> > It is commonly accepted in the ACPI world that the names do not carry
> > meaning AFAICT, and so I think I agree with Andy's initial comment
> > regarding using indexes, not names to also fetch the I2C and GPIO nodes=
.
> > You can probably have a fallback mechanism for when "i2c" is not
> > present, or simply check if you are in DT or not and use the names only
> > if we are in DT.
>
> The solution is to provide in the main node the list of cell names, that =
way
> you will always know the indices:
>
>   Device (DEV) {
>           _DSD
>                   "cell-names" { "i2c", "gpio" } // index of the name is =
the
>                                                  // index of the cell
>
>         Device (I2C0) {
>         }
>
>         Device (GPI0) {
>         }
>   }
>
> Problem solved.
>

Just to make sure I'm understanding you correctly:

Are you proposing that specifically this driver directly reads "cell-names"
from the ACPI DSD to implement this indexing? Or are you proposing a
kernel-wide mechanism of "overriding" a fwnode name with ACPI?
(assuming this doesn't exist already, and I'm not just missing it in
the kernel source)

Or are you proposing something else entirely?
(apologies if this should be obvious -- throwing up the ACPI newbie
card again here :) )

In any case, would this be something I should post to the email chain
with DT and ACPI
folks for opinions before I start to implement it?

Thanks,

Danny Kaehn
