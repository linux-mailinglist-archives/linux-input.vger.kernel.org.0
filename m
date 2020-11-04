Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148182A6923
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729555AbgKDQKd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728975AbgKDQKa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:10:30 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB80C0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:10:30 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id f7so5981904vsh.10
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZxzOqduUYzwvnrUy0MC50kzmOowSz7+UtE84Vf6ljUs=;
        b=PbbWOaZCvhRZDbt1SOuz+UJoiPkJF0zdSXb1IdmAqZIxLlzNiHAHGg3wIgxxL6Xhm8
         syvl57ovBPS0+mEEucFfXW5S2LlQ0eAJv2wVgcFptouSJl62p7YnI+rZP+0EDnZd/Nwo
         WZjiys0DyB3OEIWEns4GW001u78Jc9NDGdhNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZxzOqduUYzwvnrUy0MC50kzmOowSz7+UtE84Vf6ljUs=;
        b=nts0CfFTA8VFGQ4bxYcE//uiPxUkV3jcP4lDhFEmkuJqERqP2SrE/UAaHERno/lEnk
         Um7mvICl/MF8WtAx6rrHA97cPVtcMzHRc+55V5ZgdR5wulzw6HEugvUkPvfRi5+OlWmt
         7q8bGdo8IPbF2DGh6B5PkhENPA4o+vOUeMMKYH72rXH7A4Q2qINkpvx/eExb5UjCSf6F
         C36bBIbSTJDyWBN/ossmpl38h73YSjYDQzkTPa0sTIOYsDmyaqDInnhJSep+sxwUr/ct
         Zk+6VGn1gWfOGZS2Pz5w7Pkb0bPHqcRWUTusLLELrFxnn4VMJpqAGAd2hAePzoJLhBzG
         8crQ==
X-Gm-Message-State: AOAM532NlyPrBKoynSgGdRBeYNbE6IdPrhyg3HdgfwiIuRohje+QPgl0
        U5QyTQ1tpo7vHyDyofqdc7HW6ux3gJh6Qg==
X-Google-Smtp-Source: ABdhPJyei//w9JElIz1RvWmki7KjTifaDAm/EenAVbEzLL8McuX9G4n8YnGbQCYP4MssA+Z1t+w0Fw==
X-Received: by 2002:a67:f908:: with SMTP id t8mr11763142vsq.32.1604506229065;
        Wed, 04 Nov 2020 08:10:29 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 190sm318784vsz.13.2020.11.04.08.10.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2020 08:10:28 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id m16so2518807vsl.8
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:10:27 -0800 (PST)
X-Received: by 2002:a05:6102:309a:: with SMTP id l26mr9856008vsb.4.1604506227383;
 Wed, 04 Nov 2020 08:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20201104012929.3850691-1-dianders@chromium.org>
 <20201103172824.v4.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid> <f1350d40-53b9-82b0-f463-88ac3c8a6f89@redhat.com>
In-Reply-To: <f1350d40-53b9-82b0-f463-88ac3c8a6f89@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 4 Nov 2020 08:10:15 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XUVLqS2kSjJSdPTpZbDdFX4cXOrqS1x3oxGFsOcbXEow@mail.gmail.com>
Message-ID: <CAD=FV=XUVLqS2kSjJSdPTpZbDdFX4cXOrqS1x3oxGFsOcbXEow@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] HID: i2c-hid: Introduce goodix-i2c-hid as a
 subclass of i2c-hid
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Nov 4, 2020 at 4:09 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/4/20 2:29 AM, Douglas Anderson wrote:
> > Goodix i2c-hid touchscreens are mostly i2c-hid compliant but have some
> > special power sequencing requirements, including the need to drive a
> > reset line during the sequencing.
> >
> > Let's use the new ability of i2c-hid to have subclasses for power
> > sequencing to support the first Goodix i2c-hid touchscreen: GT7375P
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v4:
> > - Totally redid based on the new subclass system.
>
> Again just my 2 cents, but I'm not sure if this should be an
> entirely separate driver, or just something added to the
> generic drivers/hid/i2c-hid/i2c-hid-of.c code.
>
> I have no real preference either way, just asking the
> question to make sure both options are considered.

Yeah, I thought about it.  ...but at the moment I'm not convinced it's
really any cleaner and I think there's very little shared code.  In
the goodix case, I don't want to specify the extra regulator or the
timings or even the hid descriptor address.  In the non-goodix case I
don't want the goodix properties.  It also sounded as if Benjamin's
preferred solutions involved having two separate files.  I'll wait for
Benjamin's feedback here, though, and if he wants me to combine them
then I'll give it a shot for v5.

-Doug

-Doug
