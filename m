Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5106569D6F2
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231993AbjBTXO6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Feb 2023 18:14:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjBTXO5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Feb 2023 18:14:57 -0500
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D539D149B5;
        Mon, 20 Feb 2023 15:14:55 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-172129e9cf1so2649481fac.8;
        Mon, 20 Feb 2023 15:14:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fjN/qxKsAOys/WyOvZ7MZbuaJXdobrZBn255f9v/bD8=;
        b=TmCE18hToXpoGmt1Lt+ZKV1rLBMlxrq/wZD3zB7X2AtmxcRJCKVHjGWdZCtsVzH1X9
         GNBUALnlcCHMmIAklaCHdOQazO1jkOXcbfp7jV8Y1cIZOFRatDFojc6GIaL7jEhu08Mb
         VJ9ca8hilbx+7TEuhQrjR7IlshCWMb/HQP9mgLsVNVdVpkcEe3loPIXi6W2OUi/ViihQ
         EzvSjyB27Lm5OcOsT3Z/TKBZ1hs5znbxJJN4rVllFRwasoXcQRgutUR1Cpui1G46H1d4
         oumjQTBA0u0fh3v505xKz3QmpxWN3teOxdbNO+WSMG8TlNoHuelSTttPj2y/OSserp6D
         rROA==
X-Gm-Message-State: AO0yUKUb088xIcGeJzZXZ7V4F4pYTgaUiiSmXXSllFYJ3SaxlFxdynI8
        4AWTT7YpHB/uihjE2aO4bQ==
X-Google-Smtp-Source: AK7set+ZuQ+YjT0UD2NOVFxqHoxa1z9b7IEhcFcBTCuJmVjPnO7t2TPR+FRXPiN4JDZPcYJ2wt/m7A==
X-Received: by 2002:a05:6870:b312:b0:172:1457:64d7 with SMTP id a18-20020a056870b31200b00172145764d7mr1434124oao.0.1676934895040;
        Mon, 20 Feb 2023 15:14:55 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ef5-20020a0568701a8500b00152c52608dbsm3894587oab.34.2023.02.20.15.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 15:14:54 -0800 (PST)
Received: (nullmailer pid 578839 invoked by uid 1000);
        Mon, 20 Feb 2023 23:14:53 -0000
Date:   Mon, 20 Feb 2023 17:14:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Danny Kaehn <kaehndan@gmail.com>
Cc:     robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com,
        krzysztof.kozlowski+dt@linaro.org, ethan.twardy@plexus.com,
        bartosz.golaszewski@linaro.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.torokhov@gmail.com
Subject: Re: [PATCH v6 1/3] dt-bindings: i2c: Add CP2112 HID USB to SMBus
 Bridge
Message-ID: <167693489048.578739.5434769948663222612.robh@kernel.org>
References: <20230217184904.1290-1-kaehndan@gmail.com>
 <20230217184904.1290-2-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217184904.1290-2-kaehndan@gmail.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Fri, 17 Feb 2023 12:49:02 -0600, Danny Kaehn wrote:
> This is a USB HID device which includes an I2C controller and 8 GPIO pins.
> 
> The binding allows describing the chip's gpio and i2c controller in DT
> using the subnodes named "gpio" and "i2c", respectively. This is
> intended to be used in configurations where the CP2112 is permanently
> connected in hardware.
> 
> Signed-off-by: Danny Kaehn <kaehndan@gmail.com>
> ---
>  .../bindings/i2c/silabs,cp2112.yaml           | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/silabs,cp2112.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

