Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1AF2F4641
	for <lists+linux-input@lfdr.de>; Wed, 13 Jan 2021 09:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727120AbhAMIPd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 03:15:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36568 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726918AbhAMIPc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 03:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610525646;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/1vAmJrhkq2OfagK3P6iEhed/uMIynZjuQhF3qxhH8o=;
        b=Yo+IX3PAvj134ldCL90Fgk0mR0gEqF6wzHuXbjX161G0ZHWFipEIhPZhpTSFGOiYa/0cWb
        dpSDoV7WUfiq2mrvimOuuWfLF8lFW+G3eALDdCEzPk/bdW56R/vQdamesFxtW2rTy43fi0
        Js/6SB54xR2C9wfnxzn8H+vyMrsHBnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-xVKfgK-aPB6YJ2lO8Y1Y6g-1; Wed, 13 Jan 2021 03:14:04 -0500
X-MC-Unique: xVKfgK-aPB6YJ2lO8Y1Y6g-1
Received: by mail-ed1-f72.google.com with SMTP id p17so497935edx.22
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 00:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/1vAmJrhkq2OfagK3P6iEhed/uMIynZjuQhF3qxhH8o=;
        b=laic54QMvq3IdPXqO1RrJDQTASa8EKGSrHwafg4Nl0rJ517o+Tkd7qSoP4c+eamQNh
         UuaAHmRo5Xc4LTbfGIr8FJ/ZUG9b+Qm4IED07Z2Jyl9+igmrRcvQPF4hlQ56JudhjzWN
         QYhUAJdMa5LaL5L2gRHQtD1V/lXnItSCGlUQgd7WhAsUUgrd58AfTeP3UXlfKuDRnWJL
         fvD610C0eOGjJfFMRvV0k46dVKZGGWWPt9+hQZ73o0EBOVKUfmSr7U+aS6oPii25NAKY
         PmibDNLH/gM3TYMVeR/d2I8CNUi+rDWNg5T1fDgH/hcY+xgE+ewkw9JtxvWsWhReAwMW
         A6QA==
X-Gm-Message-State: AOAM5321vrqMBU0gY4luiGC7lSlPlpik7KA5zVQAqqRNFlNk9HHmKjKJ
        dask1mNHGjE981qV8Zi/mNr8tOkO1VaZDHnlrpa2SocjeJD8WEV4smvblXiS/zYZiTPbzfu46oE
        sF19VeEmTU747eNpur0nZuHk=
X-Received: by 2002:a17:906:59a:: with SMTP id 26mr685055ejn.309.1610525643081;
        Wed, 13 Jan 2021 00:14:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpBbPK2it/e3/DMPj561v1NJDrZUmv4OrQR0EDu4qwYEu5NzUyBMJt5+9U1Ocwv7e2f0fGdA==
X-Received: by 2002:a17:906:59a:: with SMTP id 26mr685045ejn.309.1610525642945;
        Wed, 13 Jan 2021 00:14:02 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id x17sm482923edq.77.2021.01.13.00.14.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jan 2021 00:14:02 -0800 (PST)
Subject: Re: [PATCH v2 0/3] PinePhone volume key (LRADC) wakeup support
To:     Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
References: <20210113040542.34247-1-samuel@sholland.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <45344b30-b784-c3d3-e8dc-d2a562c5cb83@redhat.com>
Date:   Wed, 13 Jan 2021 09:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210113040542.34247-1-samuel@sholland.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/13/21 5:05 AM, Samuel Holland wrote:
> This series allows the volume keys on the PinePhone to wake up the
> device. As pointed out for v1, wakeup should only be enabled when a
> "wakeup-source" property is present, so v2 requires DT and binding
> changes in addition to the driver change.
> 
> Changes since v1:
>   - Add requisite DT binding change
>   - Only add wakeup capability if "wakeup-source" is present
>   - Warn but do not error out if setting the wake IRQ fails
>   - Add "wakeup-source" property to PinePhone device tree
> 
> Ondrej Jirman (1):
>   input: sun4i-lradc-keys -  Add wakup support
> 
> Samuel Holland (2):
>   dt-bindings: sun4i-a10-lradc-keys: Accept wakeup-source property
>   arm64: dts: allwinner: pinephone: Support volume key wakeup

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

