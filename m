Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953ED4DFC3
	for <lists+linux-input@lfdr.de>; Fri, 21 Jun 2019 06:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725956AbfFUEeY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jun 2019 00:34:24 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43233 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfFUEeX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jun 2019 00:34:23 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so75954ios.10;
        Thu, 20 Jun 2019 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ica3ySUaR522yE/ZMxZYijSnhD1xDLlEp+v8Cx/mej0=;
        b=Mxa9wvtP/UVcehlG+S94/uUMn1COAyoRZ2nTdlBsJ3zad9huyWhwYg/cSWnwOFXbOz
         lrmnwE1Ha/V1irJ03HR0I9WNPsv0kaCxzt4z8cy0KJMIgB49TKsVhNqNBUoxVLIZ/zWc
         mVha4mE8S1zpx44V9n5k/ORXV9M4TCZjXUtYknxYbCu2JI+SGYniuPlW84Z19kN7IjUT
         cQoHtsbVqvxzOBherxXPhGvK137Jsm/Om0hvM5zNbsl3vpkuiDvvCSDVqYnWxfeKm1xT
         SBoOj7gPBq2khCIR1k3yR+m/yZHVdHpRmC0oOGLT1nM/t0+UWtqP4VY2Lrk1MNKwAm/e
         7QpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ica3ySUaR522yE/ZMxZYijSnhD1xDLlEp+v8Cx/mej0=;
        b=WHQK/toU5lubVf5UhB5peFInL4xyfo8JwNE0iGHo3zqrU9AC+sceCsKwfOiNJk8WAN
         2u98GGRHkjIRFHq7iVrmqGcylIPuRRLqM3JzVlI74/fhbA5uSXYS+h0wFSBlJ6MmT90O
         mA/D+8YrkKP/H4ssK/x5Gxn7Q2WU+HLr+q0Rm5aD713L+56xaUuOH45YWvnGjxUXkpX2
         CjCxZOH2k7dmcKqnQXfjQQc1hhotuMPSgRSKX2bjjDFRFN73qoLrqv5Lp4Xv960IAOWB
         lKQyy2pWfC0hcA0oikjurQZQtKOJKV3ZMEG3Vn+XdUFE0XtN9MYQYdULjQKmqQ216YXK
         RQIA==
X-Gm-Message-State: APjAAAVePo1DPVbtqHqDo/G9uLNl+cEfHkHEdy+3T55J9sIisdp4luYj
        SfIxRfsM3F3I99vwQrxvwmFpU805p9IVM+O2hVI=
X-Google-Smtp-Source: APXvYqypTQWp8EcBhntIVc2vxfGSjLvBmtNgQYl5tub6+s8/UsvK5TV6Kcvr1YAq20lnIcw9L9ct7MBwgyUvalDzaD0=
X-Received: by 2002:a5e:de4d:: with SMTP id e13mr20647673ioq.272.1561091662310;
 Thu, 20 Jun 2019 21:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190620142801.11827-1-jeffrey.l.hugo@gmail.com> <20190620143318.11880-1-jeffrey.l.hugo@gmail.com>
In-Reply-To: <20190620143318.11880-1-jeffrey.l.hugo@gmail.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Thu, 20 Jun 2019 21:34:10 -0700
Message-ID: <CAKdAkRRstvEWXtwnLCMKoW6PcCz0W3+M9iYqVFshJpw6y_=9bA@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] Input: elan_i2c: Export the device id whitelist
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org, Lee Jones <lee.jones@linaro.org>,
        xnox@ubuntu.com, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeffrey,

On Thu, Jun 20, 2019 at 7:33 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>  #ifdef CONFIG_OF
> -static const struct of_device_id elan_of_match[] = {
> -       { .compatible = "elan,ekth3000" },
> -       { /* sentinel */ }
> -};

I think OF IDs should stay in this file since we agreed HID will not
be checking them.

>  MODULE_DEVICE_TABLE(of, elan_of_match);
>  #endif
>
> diff --git a/include/linux/input/elan-i2c-ids.h b/include/linux/input/elan-i2c-ids.h
> new file mode 100644
> index 000000000000..8130bbebbdda
> --- /dev/null
> +++ b/include/linux/input/elan-i2c-ids.h
> @@ -0,0 +1,68 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Elan I2C Touchpad devide whitelist

s/devide/device/

> + *
> + * Copyright (C) 2019 Jeffrey Hugo.  All rights reserved.

This just moves the code around. If anything I'd say it should keep
the original Elan copyright.

Thanks.

-- 
Dmitry
