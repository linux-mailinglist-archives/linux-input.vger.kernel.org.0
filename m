Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 208CD2EC175
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 17:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbhAFQuh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 11:50:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbhAFQuh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 11:50:37 -0500
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53769C06134D
        for <linux-input@vger.kernel.org>; Wed,  6 Jan 2021 08:49:57 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id j21so886423oou.11
        for <linux-input@vger.kernel.org>; Wed, 06 Jan 2021 08:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tTDfLxUkFhfwS50KBXMNM9ZHcsAJTAU0wgDhHJKxUrw=;
        b=kAT4LDRfAvqRTBm/OHK9G1+UWr19HsI1gTt5otkoJU/K+hCsNF1IoD7GgTBAbAeQdS
         mEJHHroEq4QT8jXtCXGSk0sBwPFw4Owu4zC2VXQCGubIIqm/2f0V8wp5LL898Whyo4I0
         +XPwKOGT/wT2x5VhAwFJ593EkO/BQWenH/Uq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tTDfLxUkFhfwS50KBXMNM9ZHcsAJTAU0wgDhHJKxUrw=;
        b=sjexKdR2xCxxzVeMte3iswG0JTHPsKa8l1gBcXQTZxJF3b95R9BMIu/NIbo8VDnEFB
         vfuQj+pVAKlBNjtZ9qTaaAMVVehxWgzpJ3sX8dL6JPMccqF8rTBt5torV7Z7fcoQK7B2
         QD4k9Quzmd+ME6cIu/lm1VbiMBORmfx2Rs6qfLjX5Uo74QyzyU4bNE2EvDI63ZMDpPKf
         oLinxHg4Ap/DHHqqrdJAAslQmCldWYAxuNxiQPInKWlPdLWMiU5btaPebg0vT2jyFIVe
         SFc6/6b4ITrgqBXXJUcI4S/D6MjaksVkIEHXJbCmmZr3DlFSgx2Ho9bj2QGN/g8DqGDW
         8wKA==
X-Gm-Message-State: AOAM5329I4A+6AwmVJg1dpBCbdRXGMKxTSbpI4PRu41eX51p9RUvYGVc
        SHv4w7P75AuLb+txi7Jm0S2cAiLHFSoXpA==
X-Google-Smtp-Source: ABdhPJwvGEDRXkNoWjh41zEMc9t0Z/4KE2bEdNTUZJgS5j9jgqR0/e2FbXgVBRF90hioLLPZ5428bA==
X-Received: by 2002:a4a:bd19:: with SMTP id n25mr3393517oop.56.1609951796617;
        Wed, 06 Jan 2021 08:49:56 -0800 (PST)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com. [209.85.210.54])
        by smtp.gmail.com with ESMTPSA id p28sm591554ota.14.2021.01.06.08.49.56
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 08:49:56 -0800 (PST)
Received: by mail-ot1-f54.google.com with SMTP id o11so3567353ote.4
        for <linux-input@vger.kernel.org>; Wed, 06 Jan 2021 08:49:56 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr4254458uaa.104.1609951456419;
 Wed, 06 Jan 2021 08:44:16 -0800 (PST)
MIME-Version: 1.0
References: <20201211222448.2115188-1-dianders@chromium.org> <20201211142412.v8.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
In-Reply-To: <20201211142412.v8.4.If41b7d621633b94d56653c6d53f5f89c5274de7b@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jan 2021 08:44:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wn2kBP-jL9g52ZQ_nHRi-BWwuW_oxs8CUv-k=6QcBFDA@mail.gmail.com>
Message-ID: <CAD=FV=Wn2kBP-jL9g52ZQ_nHRi-BWwuW_oxs8CUv-k=6QcBFDA@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] HID: i2c-hid: Introduce goodix-i2c-hid using
 i2c-hid core
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Dec 11, 2020 at 2:25 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> +static const struct goodix_i2c_hid_timing_data goodix_gt7375p_timing_data = {
> +       .post_power_delay_ms = 10,
> +       .post_gpio_reset_delay_ms = 120,

As I've been going through my holiday email I found that Goodix has
released a new datasheet (datasheet rev 0.6 from 2020-12-11) where
this moves from 120 ms to 180 ms.  Sigh.

I'm hoping that we can just land it with the 120 though and then I'll
send a follow-up patch to change to 180.  This will avoid spamming
everyone with a v9 of the patch series.  Please yell if there are any
objections to that plan.  I'd also be fine if you wanted to just
change it to 180 when landing it.

Thanks much!

-Doug
