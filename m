Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D39209A51
	for <lists+linux-input@lfdr.de>; Thu, 25 Jun 2020 09:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390063AbgFYHJ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Jun 2020 03:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390047AbgFYHJ6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Jun 2020 03:09:58 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6DC3C061573;
        Thu, 25 Jun 2020 00:09:58 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id q8so4932727iow.7;
        Thu, 25 Jun 2020 00:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ILGl2P6gAZNjvhIqpYbpGLfnEmwTXhI5fPAT7cUr8bM=;
        b=ro4o+vRFomBYL8c/AGXuhWfstMGZK/MDst51OfQu3CR55C5NL7DV0mkkxyOlLHleB2
         D5spbjwJYiiYT+aB1Rrmbt4hdFo3rNQnbND4uAhT2fcSscdFvb3D8NMDShe3v9YmUsqP
         +j3/0JmWFpTgFHnyYx9mRKkZaTAC6eScMR9xT7pcEM4bhp1D60+w/J98IWdBm1u6uA7f
         xxYyCpr6U0ONVsSWrmIMwHld7sr1lza8SAoSPWxGrtq1oes4kyDD/RR8I5P3AlWSvM4c
         wIvrL/b2S+hN6F/sR4sbZ8ozBAJB2vthBqm9btDHT7yYY8YVehsNK+tN8glciCkPmFvr
         6YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ILGl2P6gAZNjvhIqpYbpGLfnEmwTXhI5fPAT7cUr8bM=;
        b=tvo45+yfUdOPcoNjNgwulFpnq845D2CyJMvIJhcfqY95u3z5CiRHan54PhtFl+UH/3
         F4AvFMdiR6/lCIXD4SG8V97xAcGqgH81VamC6Bg8Smqj1nnkul1HXHBgwQf6+R5nXqOp
         rzoa93oqss9/KkUglA4d39XDuR1jjwdcnRgrbvxmIP7VYBq/xHCG9eN+nqM4ztczkmy8
         WcgsLbp3cOc4hBqPQbWUlazCFsKePxgeafcjo23oaCS3VTXuMznYhSOQsw5fEaesCukY
         PSIazWIuqIHD27ZAi/buvhT8KbC3DPkH5kWXrlnPm6i+Odz19XBtXifpQOgPkV4Ykos7
         K5tA==
X-Gm-Message-State: AOAM533g7yPR7la/6YvuOXQEripzvAHOgSZdZphk4KmbS8FwoUwCThjt
        NCh8gH/JZ+VCL+3Mh5TQ+Iys6p8L3fRYU52ClO4=
X-Google-Smtp-Source: ABdhPJx+2pEPWZ0Fu1tups2ClfzQZQDXkhcbNDTKmvwtxL5cCnxdnjteu6Yb7ISA8mRm3DAXaIM1/L2fIbzucL0myTE=
X-Received: by 2002:a05:6602:14d0:: with SMTP id b16mr35701728iow.5.1593068998044;
 Thu, 25 Jun 2020 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200622225728.330-1-gerbilsoft@gerbilsoft.com>
 <CANq1E4T_SNUrewDQ59bonr7tTKFa=wRYwXLWHMCiNA0KN0H9Aw@mail.gmail.com> <2498150.lGaqSPkdTl@dek-x230>
In-Reply-To: <2498150.lGaqSPkdTl@dek-x230>
From:   David Rheinsberg <david.rheinsberg@gmail.com>
Date:   Thu, 25 Jun 2020 09:09:46 +0200
Message-ID: <CADyDSO7HKNP8ihsW2-qouG5SYpOJ1LfD2sAbDfRkJ3iSkHvGNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: wiimote: Initialize the controller LEDs with a
 device ID value
To:     David Korth <gerbilsoft@gerbilsoft.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi

On Thu, 25 Jun 2020 at 00:09, David Korth <gerbilsoft@gerbilsoft.com> wrote:
> I've been manually setting the player IDs on Wii controllers when running
> multiplayer games by writing to the /sys/class/leds/ directory. Having the
> hid-wiimote driver do this itself significantly reduces setup time.

What do you mean with "reduces setup time significantly"? Why would it
take that long to set the LEDs?

Thanks
David
