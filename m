Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41E056F3950
	for <lists+linux-input@lfdr.de>; Mon,  1 May 2023 22:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbjEAUln (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 16:41:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbjEAUln (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 16:41:43 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46BE22693
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 13:41:34 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a7ff4a454eso3325ad.0
        for <linux-input@vger.kernel.org>; Mon, 01 May 2023 13:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682973694; x=1685565694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ziCnKuYqeOl2NCFKJUUS5lgf4aMefH+Fgr4tFUXp5Wg=;
        b=bBX3a//pUzBS4aVaNHqiPSrN7kuP83QdCntCr3A4kiEYLkLk8Ew01Pq8sLiVWin44U
         L/MkyrMZdSgBfOznjp1dyTfI9xvIa6ZirCTyCZzU0DRM5nym7pTDDdzwE8W6V1mM9xVF
         5xHsAVSf+FiKW/ahrpVu8JUTg7q0PxVNvaiv+3Pf0aoZXnEUeMpCN4/OHNNaEtsUYrum
         hRkovjIDnowWqF2HS/Hkr4i0MFecjsG2ZFDQ3x91Zi4+P9brurMi4MeEF/yTomMrBjgl
         WMrFS+0N/5Ym9bhbtIIChCrt5qcpYrJk8uzmZ4eDf3w964mFgRVJ0q4WmGu6Xrb6vxpU
         HtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973694; x=1685565694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ziCnKuYqeOl2NCFKJUUS5lgf4aMefH+Fgr4tFUXp5Wg=;
        b=jvUsce1RBylC1xbScdGoWk6Bky2NQUpS4ZA1oO+ZRZ3HFDFtfiGK4RNXtXPgS2cf1P
         I8djZxuxK9HPQNQOwWHjXGll04kl6Yfl7G0YwIgQoZEq1LrJthCOfcAdE2t1tHqd4BCH
         B2wNEUyvFkdwFowpS5DTYIjwTsFtokNWipUvHiaWTi27bNHBKPcNbD72G+GoG1kQ0/zq
         a+zuP7xSzFi/F0+tJdrPlXgTrpnHI4BFIwzMWYKSY5aR81iB0QavoCY044p0gyZ0jETC
         m3tll/9GcmL+sa8Jnj7G0lbK0ZYPph9jzQ3rcEMnC3Ogj34/Vk7WAV2mL2soQVYhIz4V
         mr7g==
X-Gm-Message-State: AC+VfDwfXO+LQXFwm/cP7fWv7JOHxMG73MJ0Tn34/8GwyOGuZzM9pfJ/
        ZrriO7Tnh2FOv4fLqOBnDT/K35qW4dyG9+eF4QuKug==
X-Google-Smtp-Source: ACHHUZ6IKLc+g70dNW+KI6+qhxcDBVV9UVB4Ycvtp4A/jBSJFxqWKGS+740EzDu+0Gjx81mlfGWPUeAfUgUfUG6Y860=
X-Received: by 2002:a17:903:230d:b0:198:af50:e4de with SMTP id
 d13-20020a170903230d00b00198af50e4demr65434plh.4.1682973693596; Mon, 01 May
 2023 13:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230427221625.116050-1-opendmb@gmail.com>
In-Reply-To: <20230427221625.116050-1-opendmb@gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 1 May 2023 13:40:57 -0700
Message-ID: <CAGETcx-gDcqY7-_Ud0_rOtgvk7NbzevSa4UCV=NcqiV9zjAv7w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] input: gpio-keys - fix pm ordering
To:     Doug Berger <opendmb@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Gergo Koteles <soyer@irl.hu>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 27, 2023 at 3:18=E2=80=AFPM Doug Berger <opendmb@gmail.com> wro=
te:
>
> Commit 52cdbdd49853 ("driver core: correct device's shutdown
> order") allowed for proper sequencing of the gpio-keys device
> shutdown callbacks by moving the device to the end of the
> devices_kset list at probe which was delayed by child
> dependencies.
>
> However, commit 722e5f2b1eec ("driver core: Partially revert
> "driver core: correct device's shutdown order"") removed this
> portion of that commit causing a reversion in the gpio-keys
> behavior which can prevent waking from shutdown.
>
> This RFC is an attempt to find a better solution for properly
> creating gpio-keys device links to ensure its suspend/resume and
> shutdown services are invoked before those of its suppliers.
>
> The first patch here is pretty brute force but simple and has
> the advantage that it should be easily backportable to the
> versions where the regression first occurred.

We really shouldn't be calling device_pm_move_to_tail() in drivers
because device link uses device_pm_move_to_tail() for ordering too.
And it becomes a "race" between device links and when the driver calls
device_pm_move_to_tail() and I'm not sure we'll get the same ordering
every time.

>
> The second patch is perhaps better in spirit though still a bit
> inelegant, but it can only be backported to versions of the
> kernel that contain the commit in its 'Fixes:' tag. That isn't
> really a valid 'Fixes:' tag since that commit did not cause the
> regression, but it does represent how far the patch could be
> backported.
>
> Both commits shouldn't really exist in the same kernel so the
> third patch reverts the first in an attempt to make that clear
> (though it may be a source of confusion for some).
>
> Hopefully someone with a better understanding of device links
> will see a less intrusive way to automatically capture these
> dependencies for parent device drivers that implement the
> functions of child node devices.

Can you give a summary of the issue on a real system? I took a look at
the two commits you've referenced above and it's not clear what's
still broken in the 6.3+

But I'd think that just teaching fw_devlink about some property should
be sufficient. If you are facing a real issue, have you made sure you
have fw_devlink=3Don (this is the default unless you turned it off in
the commandline when it had issues in the past).

-Saravana

>
> Doug Berger (3):
>   input: gpio-keys - use device_pm_move_to_tail
>   input: gpio-keys - add device links of children
>   Revert "input: gpio-keys - use device_pm_move_to_tail"
>
>  drivers/input/keyboard/gpio_keys.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> --
> 2.34.1
>
