Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7E6D2C030A
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 11:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgKWKNJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 05:13:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728182AbgKWKNI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 05:13:08 -0500
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 978D1C061A4E
        for <linux-input@vger.kernel.org>; Mon, 23 Nov 2020 02:13:08 -0800 (PST)
Received: by mail-yb1-xb42.google.com with SMTP id o144so15430865ybg.7
        for <linux-input@vger.kernel.org>; Mon, 23 Nov 2020 02:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Lvn4+bjYbxxCbS7L/QCzyvRpE+ItUgyiLMioWuZNw0g=;
        b=zPiVI/dQ12Jth9bMBDSqmQOmWkH5ziZh0ycmMbl3yW9lANMDaBW/jc0DiVo/+1Mvtb
         QnWJWQ+IrlF4J6L3qvAPtw8EmiuOa2Ez2vx43FJeiIdL1dA4qnGHNPVCJ9xsHsSmEpMT
         eOiWC6867AktKIRRe+Rns4P22awgSl5t4FXtbH6TP98D/wiGPePxRw4JaqzwcV3j3onf
         xqEmszGQRlsBMTY6yBsxwzDLcXoIe8LD7oMWL2hAy+++ltg/x8aCBlQ3CqMJTa3cJJ6Z
         bK6O8vuUGEK5Pe7SgoSYTH44sHS1ABxvw2L0O1pMymtEOTzYttpkEA2wd6TZ8+B4xN0q
         jX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lvn4+bjYbxxCbS7L/QCzyvRpE+ItUgyiLMioWuZNw0g=;
        b=NAFicSOpQVmNF//WmjVfQ5+H6XSFZt2H/EeObSKqBlLRrLpfLRbLyCActHqzH8hN38
         8pGKCqRDpdxIpYpfxM3PbxVsx2l0CGffzlVUyhlCNr8osqRSP3qH4izsXtXs6CK0sjFO
         2Sn2nwL2ItaQ3iIYFNDrC2fN74vu/LEQJdqLS2rkEW5Vo8JLoRHmBdIxSZ4AgfPxfIQj
         RebR1PNd43q/l7stV1HGuUnx7O1nVLY0RawwuVWvnRIP8sE8NlW0QT6Tr/e19cBKHO7k
         79rmXkNEdSyzB6GcO1zl7yxLOUQL/XWMQdp2fgCEay1PlpVJFUboWZgoi+TEXfqzsB8w
         iCXg==
X-Gm-Message-State: AOAM532pevPNAwKggZwhQudf0Ga51+YBcGm2fbU16u/BBD93y1OrIDZ6
        UMhNG7wuvP132xRrHuzo3JxMcpLYhVyQrtTjaGnm/g==
X-Google-Smtp-Source: ABdhPJzIY/SaDA417dFn6lslJn7PBUUzQ1eYf5tPZpZKaIjf/lLLOk3BgqB+rXma5/8S4sS9JW8vit8t9UbXTS5zfrU=
X-Received: by 2002:a25:c7c6:: with SMTP id w189mr32070799ybe.403.1606126387667;
 Mon, 23 Nov 2020 02:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20201028221302.66583-1-kholk11@gmail.com>
In-Reply-To: <20201028221302.66583-1-kholk11@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Mon, 23 Nov 2020 15:42:32 +0530
Message-ID: <CAMi1Hd1hh3NYuFTs3C39ha1Jy_0LxQ4Akg36sm0x1+uicWYRjQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] Add Novatek NT36xxx touchscreen driver
To:     kholk11@gmail.com
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, rydberg@bitmath.org,
        priv.luk@gmail.com, linux-input@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>, marijns95@gmail.com,
        Konrad Dybcio <konradybcio@gmail.com>, martin.botka1@gmail.com,
        phone-devel@vger.kernel.org, dt <devicetree@vger.kernel.org>,
        krzk@kernel.org, andy.shevchenko@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, 29 Oct 2020 at 06:32, <kholk11@gmail.com> wrote:
>
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
>
> This patch series adds support for the Novatek NT36xxx Series' In-Cell
> touchscreen (integrated into the DriverIC).
>
> This patch series has been tested against the following devices:
>  - Sony Xperia 10        (SDM630 Ganges Kirin)
>  - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

Tested the patch series on Xiaomi Poco F1 (SDM845 Beryllium) using
Novatek NT36672A IC. May I suggest adding "novatek,nt36672a" in the
list of compatible of_device_id{} as well.

Regards,
Amit Pundir


>
> Changes in v2:
> - Fixed sparse warnings from lkp kernel test robot
>
> Changes in v3 (as requested by Dmitry Torokhov):
> - Using shorthand u16/u32 (sorry for the overlook!)
> - Now using more input and touchscreen APIs
> - Fixed useless workqueue involvements
> - Removed useless locking
> - Switched reads and writes to use regmap
> - Moved header contents to nt36xxx.c
> - Fixed reset gpio handling
> - Other cleanups
> - P.S.: Thanks, Dmitry!
>
> Changes in v4:
> - Fixed regmap read length for CRC_ERR_FLAG final check
> - Fixed YAML binding, as requested by Krzysztof Kozlowski
>
> Changes in v5:
> - Replaced subsystem maintainer's name with .. mine,
>   usage of additionalProperties to unevaluatedProperties
>   and a typo fix for reset-gpios as per Rob Herring's review
> - Changed compatible string as per Krzysztof K. request
> - Renamed the novatek,nt36xxx.yaml file to just nt36xxx.yaml
>   in order to now reflect the driver name instead of the DT
>   compatible
> - Fixed blank line at EOF
>
> Changes in v6:
> - Removed include of_gpio.h, added mod_devicetable.h and
>   gpio/consumer.h
> - Added kerneldoc to relevant functions/enum
> - Used traditional patterns for error checking where possible
> - Documented calls to usleep/msleep
> - Using be16_to_cpu / get_unaligned_be16 where possible
> - Added helper for CRC error check on retrieved buffer
> - Decreased indentation in the CRC reboot recovery function
> - Removed instances of error code sum
> - Dropped all likely/unlikely optimization as per request
> - Removed redundant reset_gpio checks
> - Dropped of_match_ptr and ifdefs for CONFIG_OF
>
> Changes in v7:
> - Fixed typo in nt36xxx.c
>
> Changes in v8:
> - Fixed typo reset-gpio -> reset-gpios in dt-bindings
>
> Changes in v9:
> - Includes are now sorted
> - Used proposed sizeof variable instead of sizeof type
> - Fixed a return value check for common pattern
> - Added NULL check to devm_kasprintf call
> - Returning ret on probe function to be consistent
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
>   Input: Add Novatek NT36xxx touchscreen driver
>   dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
>     driver
>
>  .../bindings/input/touchscreen/nt36xxx.yaml   |  59 ++
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  drivers/input/touchscreen/Kconfig             |  12 +
>  drivers/input/touchscreen/Makefile            |   1 +
>  drivers/input/touchscreen/nt36xxx.c           | 894 ++++++++++++++++++
>  drivers/input/touchscreen/nt36xxx.h           | 122 +++
>  6 files changed, 1090 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nt36xxx.yaml
>  create mode 100644 drivers/input/touchscreen/nt36xxx.c
>  create mode 100644 drivers/input/touchscreen/nt36xxx.h
>
> --
> 2.28.0
>
