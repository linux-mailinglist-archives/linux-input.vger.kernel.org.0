Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69D3648340B
	for <lists+linux-input@lfdr.de>; Mon,  3 Jan 2022 16:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbiACPRi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 10:17:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35403 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229995AbiACPRh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Jan 2022 10:17:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641223057;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Sa67bLYJGuxmlt3eznf3WpRaoKWTwM+IEw1O0Dm2ufI=;
        b=ArWc+en3f4Gy1/JTIN1ogFrLsSrIE/Q8rdMSfqu/jK0XcY4fMORZoK5FIXvRcP8kruxgj3
        mRI7aUrp6HmlR2rX4V0NxcgdYgVj+rnAVxiRQuIA3O1pWv86/fwUv7rsOmwwECqwmMWHck
        MtUrVaCzjLibfMJDIJP7LreU6qxNaAg=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-218-vt158gnbO-eHhxmIArAzJw-1; Mon, 03 Jan 2022 10:17:34 -0500
X-MC-Unique: vt158gnbO-eHhxmIArAzJw-1
Received: by mail-pf1-f199.google.com with SMTP id j69-20020a628048000000b004bc8aaa6f1aso2634243pfd.12
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 07:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sa67bLYJGuxmlt3eznf3WpRaoKWTwM+IEw1O0Dm2ufI=;
        b=hx2u2Rca+BKL9b7N9StvXdXlZor3qqtvU+8wmne7JtgmBG0H02evsXeQsLmKj7XzxS
         igB+SpYICBGzf3RJDtjNqMKN6GaGWCyhC2U53E6pI7A9eFjNGOMA5Ouub7EWIUynmqpO
         KD8badvYemHJSHJ/uc/reTetpL3wFAzDKxBeQraf6fFxNcuVVRqCDswOp6aDmYtaq5r4
         XQu7MlbgxBAj6wDzEiqbbgrc8zZuKCAyfjlaXDyU6juWWVCjF6Wpi0WoNF9GWCzVVU8V
         2oC29guP1Y7MGG29WgAr8bzxcQI6wLiqShgSZeYuo/JTg4mq5lbq9FnbQl09UWgfA61m
         bsmQ==
X-Gm-Message-State: AOAM5306MQR0XLTXDU8XJcRYH75U6rrxIZ393hmojvnlbAeF5qazJTO6
        QWfmF5XSOhsqXHHi8tdZkIJScuN6+B6GceyBT2CHD1SSoO3dJIpvpt0knm/0Z5X5Cww2//B5mzQ
        ffHqqYQy/D3uy341v+ATFjl9SwC4PMHSh4uXLTEw=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id f12-20020a170902860c00b00149101725f0mr45147686plo.116.1641223052998;
        Mon, 03 Jan 2022 07:17:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLTvB/UV7dZX6G3dzLK2M020c2mx4O021ok3n9dXUL6GgiimAaEH8SV/ynpTHpEweL2tutZTjTShObzxh0g/M=
X-Received: by 2002:a17:902:860c:b0:149:1017:25f0 with SMTP id
 f12-20020a170902860c00b00149101725f0mr45147661plo.116.1641223052709; Mon, 03
 Jan 2022 07:17:32 -0800 (PST)
MIME-Version: 1.0
References: <20211229231141.303919-1-dmanti@microsoft.com>
In-Reply-To: <20211229231141.303919-1-dmanti@microsoft.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Jan 2022 16:17:21 +0100
Message-ID: <CAO-hwJ+TsdBK25aMMKwUEzajhZtRChayA2WeR9FR2=TMiG8dRQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add spi-hid, transport for HID over SPI bus
To:     Dmitry Antipov <daantipov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Antipov <dmanti@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thanks a lot for the submission. It is in a much better form than the
previous version.

I do have a few general comments and then will comment on each commit.

On Thu, Dec 30, 2021 at 12:11 AM Dmitry Antipov <daantipov@gmail.com> wrote:
>
> Surface Duo devices use a touch digitizer that communicates to the main
> SoC via SPI and presents itself as a HID device. This patch's goal is to
> add the spi-hid transport driver to drivers/hid. The driver follows the
> publically available HID Over SPI Protocol Specification version 1.0.

I managed to find the spec on the website, but ideally could you add a
link here and in your 5/5 patch so we keep a trace of it?

>
> In the initial commits there are some HID core changes to support a SPI
> device, followed by extensions to hid_driver and hid_ll_driver structs
> to allow for some error-handling logic delegation from the transport
> layer to the device driver, and finally the SPI HID transport driver.

The 2 other comments I have are:

- your patches need to have the same Signed-off-by: line than the
From: line. If you can't use your email from your SoB line, just add
in the commit description the from line.
For example, the formatted patch would be:
---
From: Submitter <submitter@gmail.com>
Subject: This is patch one

From: Author Name <author@company.com>

This is the description

Signed-off-by: Author Name <author@company.com>
---

This should allow checkpatch to not complain about it too (tip: use
(and fix) `./scripts/checkpatch.pl -g ...HEAD~5` on your tree before
submitting)

- Please use a version numbering when submitting patches (well, at
least use v2 here).
We already saw a first submission, and adding a v2 and the changes is
nicer for the reviewers to know what we can assume that have been
fixed.

More onto each patch.

Cheers,
Benjamin

>
> Dmitry Antipov (5):
>   HID: Add BUS_SPI support when printing out device info in
>     hid_connect()
>   HID: define HID_SPI_DEVICE macro in hid.h
>   HID: add on_transport_error() field to struct hid_driver
>   HID: add reset() field to struct hid_ll_driver
>   HID: add spi-hid, transport driver for HID over SPI bus
>
>  arch/arm64/configs/defconfig        |    1 +
>  drivers/hid/Kconfig                 |    2 +
>  drivers/hid/Makefile                |    1 +
>  drivers/hid/hid-core.c              |    3 +
>  drivers/hid/spi-hid/Kconfig         |   25 +
>  drivers/hid/spi-hid/Makefile        |   12 +
>  drivers/hid/spi-hid/spi-hid-core.c  | 1487 +++++++++++++++++++++++++++
>  drivers/hid/spi-hid/spi-hid-core.h  |  201 ++++
>  drivers/hid/spi-hid/spi-hid_trace.h |  197 ++++
>  drivers/hid/spi-hid/trace.c         |   11 +
>  include/linux/hid.h                 |   24 +
>  11 files changed, 1964 insertions(+)
>  create mode 100644 drivers/hid/spi-hid/Kconfig
>  create mode 100644 drivers/hid/spi-hid/Makefile
>  create mode 100644 drivers/hid/spi-hid/spi-hid-core.c
>  create mode 100644 drivers/hid/spi-hid/spi-hid-core.h
>  create mode 100644 drivers/hid/spi-hid/spi-hid_trace.h
>  create mode 100644 drivers/hid/spi-hid/trace.c
>
> --
> 2.25.1
>

