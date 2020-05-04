Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B4F51C326E
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 08:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgEDGI6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 02:08:58 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42849 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgEDGI6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 May 2020 02:08:58 -0400
Received: by mail-lf1-f67.google.com with SMTP id j14so8664893lfg.9
        for <linux-input@vger.kernel.org>; Sun, 03 May 2020 23:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qBDJZxfpyYLDrWcCiBrn3kUqdj2bZdWmZiPtdvNhGEs=;
        b=oToCPewqf37whJIUfjG1ZhgB3+7DO39TyCBU4JMG3kR/YGgDH5ycwBO+EDfExbjM21
         C0iOstA8h1dYLoFHfT/wJ3EWszwjb5TUzOEI6tlEz71BgnzwIAx6X4y7pHApDSATPhrj
         YKClexLQ/Yi9kZYRGGGjHreG9h3TWJDh+0njmCjh/EMr6KgqYH2ojEg6yNpwrCe8m399
         9ZYcVHd37IqE6C0B2cG6Qt1JUdiscw4I6Xb34vFeH+HiTBDu2+l1JzlWL/5CufBzGLSb
         ulopGUfC6PuhRaDJQmyAe+ZhE0WSaWBGyFAYcYDsZuuhBYLiSqdAOBlY3Ondw1D/kkDJ
         DvnA==
X-Gm-Message-State: AGi0PuYe3cUTYxyvgOKiEfynwD78GMMulKQ/i5ImmGh8IKlbJQWfrQQt
        F2mMjOjnEFBmEsm+hVVd7s6qMhkxL6s=
X-Google-Smtp-Source: APiQypJ13Y2JAzPUD0N0Pew4C1CL2P6kz2yGmaLMG3mC+pPQrv8Bx3hhzMOeo/VqvpJ/QR5g5fbZkQ==
X-Received: by 2002:a19:ad45:: with SMTP id s5mr10629384lfd.106.1588572536090;
        Sun, 03 May 2020 23:08:56 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id v4sm7284053ljj.104.2020.05.03.23.08.55
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2020 23:08:55 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id y4so8438245ljn.7
        for <linux-input@vger.kernel.org>; Sun, 03 May 2020 23:08:55 -0700 (PDT)
X-Received: by 2002:a2e:2a82:: with SMTP id q124mr9677149ljq.155.1588572535617;
 Sun, 03 May 2020 23:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200426155757.297087-1-hdegoede@redhat.com>
In-Reply-To: <20200426155757.297087-1-hdegoede@redhat.com>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Mon, 4 May 2020 14:08:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v64GYawG7=a3WF=7D3RJjzzXA=GPExq6Ec9PoN_vmyKGkw@mail.gmail.com>
Message-ID: <CAGb2v64GYawG7=a3WF=7D3RJjzzXA=GPExq6Ec9PoN_vmyKGkw@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - Always register interrupt handlers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 11:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> On some X86 devices we do not register an input-device, because the
> power-button is also handled by the soc_button_array (GPIO) input driver,
> and we want to avoid reporting power-button presses to userspace twice.
>
> Sofar when we did this we also did not register our interrupt handlers,
> since those were only necessary to report input events.
>
> But on at least 2 device models the Medion Akoya E1239T and the GPD win,
> the GPIO pin used by the soc_button_array driver for the power-button
> cannot wakeup the system from suspend. Why this does not work is not clear,
> I've tried comparing the value of all relevant registers on the Cherry
> Trail SoC, with those from models where this does work. I've checked:
> PMC registers: FUNC_DIS, FUNC_DIS2, SOIX_WAKE_EN, D3_STS_0, D3_STS_1,
> D3_STDBY_STS_0, D3_STDBY_STS_1; PMC ACPI I/O regs: PM1_STS_EN, GPE0a_EN
> and they all have identical contents in the working and non working cases.
> I suspect that the firmware either sets some unknown register to a value
> causing this, or that it turns off a power-plane which is necessary for
> GPIO wakeups to work during suspend.
>
> What does work on the Medion Akoya E1239T is letting the AXP288 wakeup
> the system on a power-button press (the GPD win has a different PMIC).
>
> Move the registering of the power-button press/release interrupt-handler
> from axp20x_pek_probe_input_device() to axp20x_pek_probe() so that the
> PMIC will wakeup the system on a power-button press, even if we do not
> register an input device.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good to me.

Acked-by: Chen-Yu Tsai <wens@csie.org>
