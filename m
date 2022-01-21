Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03A2F4963B4
	for <lists+linux-input@lfdr.de>; Fri, 21 Jan 2022 18:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379503AbiAURYi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 Jan 2022 12:24:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379502AbiAURY0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 Jan 2022 12:24:26 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B269C06173B
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 09:24:26 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id pf13so9891260pjb.0
        for <linux-input@vger.kernel.org>; Fri, 21 Jan 2022 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=O7Sb8E6DceJOcbBFaMrKVfeTv5l1u+z4k+rnKP7OXSA=;
        b=WWuJfMcspU3xmDwqq4WvhSXfJJVjE7G/l4UrQn71/xN8RmR+YM8T0RQJL3wNUiM5wP
         /0DqBmAQav6UKwamFKrJu2AuYMNulX7RpsG5Wce4J6/hx6rlx3zgOVpMZ25hup8izjwa
         SZLEVllcOLM8JH9k5FTIidzumtpm6gxDW8ysJg5CweUhuM/URQVDghV+0Jx0CVdIo8es
         97aUiYdSqcm9wXoZV8Iq8G+bELL7GrTiSLJ5yO9OBX4hDUq2x8sKMdF7UVNYDhPPyDqI
         fFHjlWQx/rMJmEj71gYtckfUNYZumntjg4524qPWRD81PoExoAZ3BvJ804CKFKe0L+pD
         aIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=O7Sb8E6DceJOcbBFaMrKVfeTv5l1u+z4k+rnKP7OXSA=;
        b=CA2CX7jvclnPqemrwnkf9BqK/zNNgJwUwS8/zKjHXvEJD/F24VVIRtHrGO5jGqPcWI
         YM+nNzhmCqhMvbmcftAHZU1/oHZI0bTaCUl3cDq7qw5635pZd1HV203YRnv4mep7jA1o
         IpoGQKUNZRHjjFHQrdEFGY2cVhj687AuctHE99T3X/F2J6kHCyAC/2c9DaqDknhg5eYZ
         /v9NoeHeHYhFPZtb84nR9+dRZDZ9DrStWvay7pbwrAy3phifkjkfu3Nh0ssNjXyzDf3d
         Yk5iYtCYeqTy1Z5dxiwCfZpZftQWftRfpZa42ZOlxRc7AfSR8JIdY8LNOk5YaO4TsgCu
         sRug==
X-Gm-Message-State: AOAM533GxZuFCQK1EF+bEWo50tPR8wxbjfTIaf51aSp9gNYUChhpOVGz
        /ePGR+EEW70eh//uNu67nrVhQ21BR3jElzss4JNnvGYwWzs3fA==
X-Google-Smtp-Source: ABdhPJw8nhoj3FQEuiXpQgxCE63krjR0YT7t4Wk4bu+Hg7UaC8BPkvRBEinh5fF9sh2Xa5WdpVoUTtf8nTt98u1csyU=
X-Received: by 2002:a17:902:ceca:b0:14a:3eba:41ed with SMTP id
 d10-20020a170902ceca00b0014a3eba41edmr4507957plg.118.1642785864774; Fri, 21
 Jan 2022 09:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20211216233041.1220-1-tharvey@gateworks.com>
In-Reply-To: <20211216233041.1220-1-tharvey@gateworks.com>
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Fri, 21 Jan 2022 09:24:12 -0800
Message-ID: <CAJ+vNU341Qg_YDWR=0O2Ne4VF=W5kh3+WHuy8OGT+CfrmKiBgw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] input: edt-ft5x06: add support for DFROBOT touch
 controller to
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Dec 16, 2021 at 3:30 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> The DFROBOT DFR0678 [1] and DFR0550 [2] touchscreen displays are meant
> to be compatible with the official RaspberryPi 7in display. However
> instead of directly conntecting the FT5x06 touch controller to the I2C
> bus going to the host processor they route it through an MCU and emulate
> a virtual FT5x06 controller but don't do a very good job at it. The
> method the RaspberryPi firmware used to read the touch data is supported
> (which consists of reading R2 to get the number of touch points, then
> reading 4 bytes of data for each point in discrete I2C transactions. If
> you try to use the FT5x06 driver which reads all registers starting at
> R0 at once you will get invalid point data.
>
> Additionally the RaspberryPi displays like these do not have a touch
> controller IRQ so polling mode has to be added.
>
> Also additionally these controllers do not appear to send UP events so
> an additional patch slightly modified from the raspberry-pi kernel is used
> to  track ID's and report up events.
>
> I'm sending this series as an RFC as I'm not really clear if this is the
> best approach vs just adding a new touchscreen driver (which I have
> prepared and will probably send in another RFC).
>
> Tim
> [1] - https://www.dfrobot.com/product-2193.html
> [2] - https://www.dfrobot.com/product-1784.html
>
> Tim Harvey (4):
>   dt-bindings: input: touchscreen: edt-ft5x06: add poll-interval
>   input: edt-ft5x06 - add polled input support
>   input: edt-ft5x06 - add support for DFROBOT touch controllers
>   input: edt-ft5x06 - Handle unreliable TOUCH_UP events
>
>  .../input/touchscreen/edt-ft5x06.yaml         |   7 +-
>  drivers/input/touchscreen/edt-ft5x06.c        | 144 ++++++++++++++----
>  2 files changed, 123 insertions(+), 28 deletions(-)
>
> --

Any feedback on this?

The other approach I posted an RFC series for was to add a completely
new driver [1]

Best regards,

Tim
[1] https://patchwork.kernel.org/project/linux-input/list/?series=596975
