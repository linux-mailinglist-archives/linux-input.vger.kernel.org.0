Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72EBE380A25
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 15:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233905AbhENNIS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 09:08:18 -0400
Received: from mail-oo1-f51.google.com ([209.85.161.51]:39704 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbhENNIR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 09:08:17 -0400
Received: by mail-oo1-f51.google.com with SMTP id t17-20020a4a3e110000b02901fab2f46a48so6331720oot.6;
        Fri, 14 May 2021 06:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=aVOxjdMoF9+jhRJs5g+p3xxM7Lf372wZ6ETciUaN028=;
        b=qB47UQ+cUNWeEpkjLTWh8YetER2YZkyiZNZmHBg1ddonXx7tOS2+xjzpAE5WEGPZF3
         fmNUm4ACWwJOslpKliVQTzBblsPsXzqLLoRUHvBLRP1rC2pMIZtY1ugxcwSSjuntOBlr
         0vZ//RclX3z2EGEUo/y3rHRVM7rDCuhCgSWHVEceP83znDg2cTdff1x9cKws9VYKQo6m
         oP2JPSh7/a9fYqLG/9z1K8TzXVcfA5Gcx42g9MM9Zv0/im8GsF83O7tis/aZeYnx7CVc
         rqYk83jIKl/oIALxmAHbjIjQFqTU58bpgv4AhsPcuah0GIo1RwUiaQ5jaNdwWmwvWYc9
         zdBw==
X-Gm-Message-State: AOAM531juirDJKKzDQkgwVLNo1gpjxjkQeapissFHLbaaMdFrh2CSP9S
        CHCwj9vlq9Rc4mjsZGm5xGjXySgnxQ==
X-Google-Smtp-Source: ABdhPJyzYe54S934zzOhG/HeXLYOdXqkh+TBKMY8D8LrYM+74ZVh+lZsa//jQq+E/fS+KZkFNaKP0Q==
X-Received: by 2002:a4a:952b:: with SMTP id m40mr36525883ooi.69.1620997624247;
        Fri, 14 May 2021 06:07:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c95sm1257702otb.80.2021.05.14.06.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:07:03 -0700 (PDT)
Received: (nullmailer pid 3936694 invoked by uid 1000);
        Fri, 14 May 2021 13:06:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        kernel@pengutronix.de, David Jander <david@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20210514102120.24596-1-o.rempel@pengutronix.de>
References: <20210514102120.24596-1-o.rempel@pengutronix.de>
Subject: Re: [PATCH v1] dt-bindings: touchscreen: Convert resistive-adc-touch binding to json schema
Date:   Fri, 14 May 2021 08:06:56 -0500
Message-Id: <1620997616.604873.3936693.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 May 2021 12:21:20 +0200, Oleksij Rempel wrote:
> Convert the resistive-adc-touch binding to DT schema format using json-schema.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../input/touchscreen/resistive-adc-touch.txt | 33 ------------
>  .../touchscreen/resistive-adc-touch.yaml      | 52 +++++++++++++++++++
>  2 files changed, 52 insertions(+), 33 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.example.dt.yaml: resistive_touch: 'touchscreen-min-pressure' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/touchscreen/resistive-adc-touch.yaml

See https://patchwork.ozlabs.org/patch/1478389

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

