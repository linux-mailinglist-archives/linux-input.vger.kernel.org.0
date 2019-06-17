Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 919F2482A3
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2019 14:38:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbfFQMiT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jun 2019 08:38:19 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40127 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFQMiS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jun 2019 08:38:18 -0400
Received: by mail-pl1-f194.google.com with SMTP id a93so4054241pla.7;
        Mon, 17 Jun 2019 05:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7HWS4OashOxAu0e1Juzv8tlFO0zblpeid6xA2lhMlp4=;
        b=J6S3J1f84Zwu6Y3ZzFFPM7DpYB486MjmnZBP/sqOf33QXpzFgPuCQSQp4ZU5FZFnEo
         S6VhLSmehHb65I9XEe8Z6erpru496cFjymfaJ0i2lPD3zE9DDoT+ynQaah/gazY+2wpp
         55iLn6sMJ9l1y1vTbC9JQqKHcimU9DG/jJfgPuugSeeUQxKttVnkXaiKgVfxI6Y8jonq
         FRpEMtrSMl1kPmafLdReQ1YkquOZsMK+skETn0R3v3zG0Bc4QmToQisIZF5UgU+xkeaO
         AAvP8v3ld61VeHzfvtdC7eMFxE1cxyEwUy2Uk7wr+bWXmS9qy4tkx4XT2kfDVM/ZJUAe
         BlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7HWS4OashOxAu0e1Juzv8tlFO0zblpeid6xA2lhMlp4=;
        b=o/T6/mwElWFQUmu4Lz2WEdu4sCa+0v6yUbm8/ZSBSlcd1PE/fQChrrplsFJrdGPAcX
         H2tKaSRK87X2+7XGVMKZ4YNzkf3VwYjYzneHTJZgAsm13BzZxHIcH/cdj56wcmzqXvGW
         CkofjM70Gt6VYs8JP6uSBr+1qiZkQKKMrSFKi0dQCoanV6bZejs3Ph+KTTj6aOMA3N3T
         5xIpIaAHsaHMtLRS1OfmRbhgsXT5aZTZHgxG1r4C/Cfk8TzL83ONLCKhGpGHgN17va4l
         X67JInidTcIcuy4B2S++4MpUfo71EirQEbqud9QNyPqBVxnvEVtByOXiRpfwVj9/+mAo
         6rlQ==
X-Gm-Message-State: APjAAAXlIjWPj9mVIUmtIGblA4qtpqanv+FLBIg7Z98QI6gaDkcNViWi
        KNOhpqzv3Z5++xyhoR/fagu3AXoDmHLg0klfZSs=
X-Google-Smtp-Source: APXvYqx+yy63ODmg/F64jxbPLOKpMrfSxgN8vbV93mC8Nz62YF97HAjvgU+PCq0F3nowgVzCM8859Vh72huTJmX06Mg=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr34059666plt.255.1560775097738;
 Mon, 17 Jun 2019 05:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190612124053.119182-1-me@myself5.de> <736848fd-1c45-0bd9-bfd1-747c716bd953@redhat.com>
 <CAHp75Vdzf7bMQq2WP59Pux6QXD4GTcPLjryEecAsHJiAEewjcA@mail.gmail.com>
In-Reply-To: <CAHp75Vdzf7bMQq2WP59Pux6QXD4GTcPLjryEecAsHJiAEewjcA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 17 Jun 2019 15:38:07 +0300
Message-ID: <CAHp75VeSPYakPF-xUcaVOmnMEpv-UZFSrERMSCBi53ov5oA=0g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: touchscreen_dmi: Update Hi10 Air filter
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Christian Oder <me@myself5.de>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 17, 2019 at 3:37 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Jun 12, 2019 at 3:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > Hi,
> >
> > On 12-06-19 14:40, Christian Oder wrote:
> > > Turns out the Hi10 Air is built by multiple companies so using Hampoo
> > > as a filter is not enough to cover all variants.
> > >
> > > This has been verified as working on the Hampoo and Morshow version.
> > >
> > > Signed-off-by: Christian Oder <me@myself5.de>
> >
> > Patch looks good to me:
> >
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>

> By some reason patchwork doesn't have a trace of this.

I meant, Hans, your message, the patch itself is there.

-- 
With Best Regards,
Andy Shevchenko
