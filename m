Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B8E1C65C5
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 04:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728717AbgEFCIC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 May 2020 22:08:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728069AbgEFCIC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 May 2020 22:08:02 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0E3DC061A0F
        for <linux-input@vger.kernel.org>; Tue,  5 May 2020 19:08:01 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a7so109861pju.2
        for <linux-input@vger.kernel.org>; Tue, 05 May 2020 19:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4wh6Jlotv5fRLd8xB551fucBIIQR0QXbWamxXAPgAPY=;
        b=GZ2FwZk8WGeAh/y1k+ltbtxUgrOhFl6vSqtyPzicAtEIibLKeAh+aT7CNTs9Gj64AJ
         4O+iQjo4zRLHh4WNLssBTpn1Nm9Ku3bWeukjN/ZfPyJIitxX/7191upMsOIxbUg6SyQR
         BNa935Q02eS0WHC7syYQWJfxpJYcsNHFi2Jbf2Hi1m95jxcQh1A8vNpPq481Ytk4OYpC
         MVdX5Z7/ZMlZTFFSNEKsh2iLCth69sBnXHlUmQ9KSAfUMQzywktOFJCjXLxP+O+dqZam
         fwchwLD0yiOLbjuv+FuKHT1BRMycdET9XxYDMrDAlpQSN/RR1Z2elLpkOeClfBwwJtan
         VqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4wh6Jlotv5fRLd8xB551fucBIIQR0QXbWamxXAPgAPY=;
        b=nndH90GG7UQmQnVasSu+PWy2Gk+z3LmcrccLk/R17Ppxt6jNXi/KzxOsMlYZxytHWA
         juLV5VRRoiAfV+C1NgkX+3uUuitjVy2K3K6d6mgwXCPzBGRWJdg2tRonV7sWak3dZ9iU
         HDcvWCOe1LtOJfwGJy/RNWFVLzFdSo/ii8GZphzYvR+T9NmRgiptHRoGeU1p3qaism5K
         2YBmyBYXkxQmB41205BUcC+8vUBuBPFdAP7tpMtrXni3/CYPK/ay8SbaQx77XQhdLqjD
         0r42EdrEiQn5w4Sl6csXDh7XeYYE63TcbLYJSDGJ3cnBsJOQRpoqE+yadQ6a1ISLXlgf
         J5FA==
X-Gm-Message-State: AGi0PubNmiOcEkVok/F/azSGDXYI3OlrQkuu9RIPfWhg1aT4mRQ334Wr
        NQ2ohQYZqENiFXf0jHrBhcw=
X-Google-Smtp-Source: APiQypJZB+wteBFJbOCiy8VTo9QaHcgHr2UyKPhzwsJmJ2ruz11b4WDBe96QB2V6XlOXGrx5gEh3vA==
X-Received: by 2002:a17:90a:8994:: with SMTP id v20mr6879100pjn.76.1588730881239;
        Tue, 05 May 2020 19:08:01 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x7sm149946pfj.122.2020.05.05.19.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 19:08:00 -0700 (PDT)
Date:   Tue, 5 May 2020 19:07:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chen-Yu Tsai <wens@csie.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: axp20x-pek - Always register interrupt handlers
Message-ID: <20200506020758.GC89269@dtor-ws>
References: <20200426155757.297087-1-hdegoede@redhat.com>
 <CAGb2v64GYawG7=a3WF=7D3RJjzzXA=GPExq6Ec9PoN_vmyKGkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v64GYawG7=a3WF=7D3RJjzzXA=GPExq6Ec9PoN_vmyKGkw@mail.gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 04, 2020 at 02:08:42PM +0800, Chen-Yu Tsai wrote:
> On Sun, Apr 26, 2020 at 11:58 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >
> > On some X86 devices we do not register an input-device, because the
> > power-button is also handled by the soc_button_array (GPIO) input driver,
> > and we want to avoid reporting power-button presses to userspace twice.
> >
> > Sofar when we did this we also did not register our interrupt handlers,
> > since those were only necessary to report input events.
> >
> > But on at least 2 device models the Medion Akoya E1239T and the GPD win,
> > the GPIO pin used by the soc_button_array driver for the power-button
> > cannot wakeup the system from suspend. Why this does not work is not clear,
> > I've tried comparing the value of all relevant registers on the Cherry
> > Trail SoC, with those from models where this does work. I've checked:
> > PMC registers: FUNC_DIS, FUNC_DIS2, SOIX_WAKE_EN, D3_STS_0, D3_STS_1,
> > D3_STDBY_STS_0, D3_STDBY_STS_1; PMC ACPI I/O regs: PM1_STS_EN, GPE0a_EN
> > and they all have identical contents in the working and non working cases.
> > I suspect that the firmware either sets some unknown register to a value
> > causing this, or that it turns off a power-plane which is necessary for
> > GPIO wakeups to work during suspend.
> >
> > What does work on the Medion Akoya E1239T is letting the AXP288 wakeup
> > the system on a power-button press (the GPD win has a different PMIC).
> >
> > Move the registering of the power-button press/release interrupt-handler
> > from axp20x_pek_probe_input_device() to axp20x_pek_probe() so that the
> > PMIC will wakeup the system on a power-button press, even if we do not
> > register an input device.
> >
> > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Looks good to me.
> 
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied, thank you.

-- 
Dmitry
