Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47BC343CEED
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 18:46:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242927AbhJ0QtM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 12:49:12 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:44743 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237657AbhJ0QtJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 12:49:09 -0400
Received: by mail-oo1-f46.google.com with SMTP id w10-20020a4a274a000000b002b6e972caa1so1113847oow.11;
        Wed, 27 Oct 2021 09:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=viizohHp65Ko8chst0M70ML0grbLG1AUnGTjZwZ4hvA=;
        b=MOrtUHI3ELT53mK6L2Fds+SNiujFc0ZPzHF7jBprz5FBS3QFea8bbuveCPveTUAeio
         Y6FlIb9M7oaBmx/z7zzdcFNlSYn1ZZpmPTFeEF9kpz6VcZVvf5ZgLehmbk4uTOdIbdLp
         5JAlqsgByE+DDdKwohhbXO24xyiBS/BNd2wFM/Q0tVEqVhcu8ONZPwrBHTo1DN4Ole3s
         q8AZbxJiVT+QumMABlY5LtpeU8VQDCPdBwyYFqbRwKD1f1fVGFCx35k2AvncJDC244vE
         loC4LTeRnZqlwNYcZWvmWOxfD+11jCWwaOsucAzrX7fVARkYjw8CShNC1TPp3pQmG0FX
         j2Bg==
X-Gm-Message-State: AOAM530BxAp6Hjuqq8p8bEAa6Brk9bc5VrJ2NDgvAl/nynd7k4Ulk2tc
        vggtX2pwjFQvXOoCAVXpFQ==
X-Google-Smtp-Source: ABdhPJzjMsMIryaqgvXa7F/AAD604FsFKkyTK1MsoWYdYAJGdhnDUsV4p8MLWM/ardODANWpQ11QUg==
X-Received: by 2002:a4a:c883:: with SMTP id t3mr23046525ooq.58.1635353203170;
        Wed, 27 Oct 2021 09:46:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m34sm156556ooi.16.2021.10.27.09.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 09:46:42 -0700 (PDT)
Received: (nullmailer pid 1475077 invoked by uid 1000);
        Wed, 27 Oct 2021 16:46:41 -0000
Date:   Wed, 27 Oct 2021 11:46:41 -0500
From:   Rob Herring <robh@kernel.org>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     s.hauer@pengutronix.de, benjamin.tissoires@redhat.com,
        dmitry.torokhov@gmail.com, shawnguo@kernel.org,
        alistair23@gmail.com, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, linux-imx@nxp.com,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        jikos@kernel.org
Subject: Re: [PATCH v13 2/3] HID: i2c-hid-of: Expose the touchscreen-inverted
 properties
Message-ID: <YXmCcXfY9GZzyZAN@robh.at.kernel.org>
References: <20211025104605.36364-1-alistair@alistair23.me>
 <20211025104605.36364-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025104605.36364-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Oct 25, 2021 at 08:46:04PM +1000, Alistair Francis wrote:
> Allow the touchscreen-inverted-x/y device tree properties to control the
> HID_QUIRK_X_INVERT/HID_QUIRK_Y_INVERT quirks for the hid-input device.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  .../devicetree/bindings/input/hid-over-i2c.txt        |  2 ++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/hid/i2c-hid/i2c-hid-acpi.c                    |  2 +-
>  drivers/hid/i2c-hid/i2c-hid-core.c                    |  4 +++-
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c               |  2 +-
>  drivers/hid/i2c-hid/i2c-hid-of.c                      | 11 ++++++++++-
>  drivers/hid/i2c-hid/i2c-hid.h                         |  2 +-
>  6 files changed, 18 insertions(+), 5 deletions(-)
