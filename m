Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71812AC941
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 00:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730951AbgKIXXz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 18:23:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730947AbgKIXXy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 18:23:54 -0500
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD10C0613CF
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 15:23:54 -0800 (PST)
Received: by mail-vs1-xe42.google.com with SMTP id f7so5973721vsh.10
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 15:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Hy7TKyZHJ9No+mZr0hZGFgrb+eb/SGeHukhYIRcpwYY=;
        b=C8uFCOCzFxzBNdhRn2r0/WGEaDr91GKtja37pCqNfRzs7gofDM8nLziq7NcH6XJEdK
         Z0XpCRpRfgNrcTRcRItT7T+T0Y1+3eyHQnRZotb0nqCFPzxdX7dARuwD7pD7obkBx/AJ
         Y6fPPiUgJILhKaBMArkw81gVYyYF4TanXNUlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Hy7TKyZHJ9No+mZr0hZGFgrb+eb/SGeHukhYIRcpwYY=;
        b=nsBwDUYLBFPDdqOvCcDgE6O5+re2xaGpM7WowxDACBkHPztJbyRWw7IJcGqp2OngMl
         DS5jV/SuG+IBjaa/dFmM8gdE41H874jBJgYeFnECSNn0h9ApxLb5l9IRZ2J7cFVEeFYG
         O8GmJr4bHIKSJ3cjTkohF3H+nZTwTdgt5/9agqcqWHklyhtY1JI+iy8E1CLnBdJXbVaK
         +FLPVoUR1VHTAgImIrf1zfni1UR5YnW90L2hoDSkhJrOUWHyxBPC813aStaeyTOS4DpP
         jRQp18w8IOZsGrCIE5Ppo5QqTkKa1Mnoh4anH9hoTxG71CtVS2SxpwrcSkC4Qcd4+YJr
         vyjQ==
X-Gm-Message-State: AOAM532NLC36hJm0XzAMXon4tBr/J58cMXxlNkyFIQvx72pop9g51aDV
        bylmGQIKd9qpUYXoS7HOzbqIPU4uyYiQYA==
X-Google-Smtp-Source: ABdhPJxGQ0E49hX8oFRS/+k30aFJCmgm272dvPLZ/MoaHX/YtrLnmHPTkETXgVmMt8L1LyQVaqdyBw==
X-Received: by 2002:a05:6102:ce:: with SMTP id u14mr10272298vsp.10.1604964233597;
        Mon, 09 Nov 2020 15:23:53 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id x4sm1393893vka.31.2020.11.09.15.23.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 15:23:52 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id b190so527482vka.0
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 15:23:51 -0800 (PST)
X-Received: by 2002:ac5:cd58:: with SMTP id n24mr6279742vkm.17.1604964231319;
 Mon, 09 Nov 2020 15:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20201109213636.1267536-1-dianders@chromium.org> <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
In-Reply-To: <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Nov 2020 15:23:39 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UUS1U5YmOFjioU12o3ayb8W2rFh9bPTfaeGiBxZ0cXHg@mail.gmail.com>
Message-ID: <CAD=FV=UUS1U5YmOFjioU12o3ayb8W2rFh9bPTfaeGiBxZ0cXHg@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Mon, Nov 9, 2020 at 1:37 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> +int i2c_hid_acpi_probe(struct i2c_client *client,
> +                      const struct i2c_device_id *dev_id)
> +{
> +       struct device *dev = &client->dev;
> +       struct i2c_hid_acpi *ihid_acpi;
> +       u16 hid_descriptor_address;
> +       int ret;
> +
> +       ihid_acpi = devm_kzalloc(&client->dev, sizeof(*ihid_acpi), GFP_KERNEL);
> +       if (!ihid_acpi)
> +               return -ENOMEM;
> +

Turns out one way to find some folks to help me test this code is to
break them.  Maybe not a good way, but a way.  :(

There should have been a:

ihid_acpi->client = client;

...here.  If you're willing to look at Chrome OS gerrit pages, you can
find the fix at <https://crrev.com/c/2527946>.

If everything about this patch looks good, I'm OK w/ a maintainer
fixing this when applying.  I'm also happy to send out a v6, but I'll
wait a little bit in case there are other comments.


-Doug
