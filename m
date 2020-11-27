Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F04B52C600B
	for <lists+linux-input@lfdr.de>; Fri, 27 Nov 2020 07:25:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392571AbgK0GYD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Nov 2020 01:24:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392570AbgK0GYC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Nov 2020 01:24:02 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBEF2C0617A7
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 22:24:02 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id t33so3603314ybd.0
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 22:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jYf2N8/ZVQCxQpjkikDPs3ZyvICDjudkUQ/29ylT6V0=;
        b=xyYrQl6bZ2Slx7d1ZQB/h660xUsTBBuualrc11CKLOtTLNF+KWt+FlTyLYNgEDtYoR
         58Oqkh9mZrI7KDvA9lDl0ACC55TS29I353L76UVn69EdS+oHkoiFjZCCTk6xoTnMx+LK
         hOmF0vtlnbDQtmGLwxzvI1t0HdXK92tQBPfdxzN0qi6cfETq0G03YubgFk1NKQ80O+O0
         gsZ2g1N09vheZ21vEOQTj4KbaH02/CIBwhlZuE4Dyq2edKjW2gKmVju9Iw11cDbKcD0C
         UYv1HPXPUbWm3lSKwAIacjM2TFJCrs+bu/ujV3COqywYDiVCcEPM1bacsfGCy0udpS9i
         8ahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jYf2N8/ZVQCxQpjkikDPs3ZyvICDjudkUQ/29ylT6V0=;
        b=as2I0qSmDNzwAvQZiGgHdSlY3SmVXsp3hM/y9c4MDWMS06miQeZPN+Ak/qsTjVnugH
         mS9pLHg1A5IGX82PlhV2rxRQpcrULpVXzRz6uCSp2+69a0ZSPMx4/14TGnjgREPN5wab
         tU+EijzMB/imPzzFeFNKl7O0aGM2LtpQaWRnyxsQX3sW4VLl5BF6rE3BCTT1G5tNJsPw
         3ZGXaX69DuDbDb+XhnfRY4I8aTIShApqYEzHNjL/OGJJhwO0SsSEjgGsF54EpAM3sIWY
         rAgPLDRYNHHMBoTUFLmvSbWX3NAkJoLCol51L2CI68nMf6LoPYi+JIYc3CKBdFgD1wr7
         38iw==
X-Gm-Message-State: AOAM5313Ld8z59J1Mpy6ZvIMMk71FEg9jhIh10OSDd2M6ymjx+iARAUv
        tdSRcf0Y0HD3zSG6+W1aN+xReBBfBCzrzeDx1SFqow==
X-Google-Smtp-Source: ABdhPJxgKeEzmYJWN/P7AXqmnAfnEv7qlMNwtnwP4zB0FxPR5hP8RbtntlLfY/V83BMvhGieC4OAye+X9KBTl6djQyM=
X-Received: by 2002:a25:d46:: with SMTP id 67mr6676204ybn.155.1606458241278;
 Thu, 26 Nov 2020 22:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20201028221302.66583-1-kholk11@gmail.com>
In-Reply-To: <20201028221302.66583-1-kholk11@gmail.com>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Fri, 27 Nov 2020 11:53:25 +0530
Message-ID: <CAMi1Hd00rPU2nUVxK000F=oP=33EKDKXLDymz9hbZT0XEGQZuw@mail.gmail.com>
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
>

Tested the patch series on Xiaomi Poco F1 (SDM845 Beryllium, Novatek
NT36672A IC).

For the whole series:
Tested-by: Amit Pundir <amit.pundir@linaro.org>

Regards,
Amit Pundir


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
