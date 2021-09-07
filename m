Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EDD40233E
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 08:08:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhIGGG5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 02:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhIGGG5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 02:06:57 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C15C061575;
        Mon,  6 Sep 2021 23:05:51 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c5so5158608plz.2;
        Mon, 06 Sep 2021 23:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FrE6YQ09ogSINskU7ONunY+k1UG3iqRKMd5RjSfEArs=;
        b=UTmewFuK3dbT4ehWvbSIcqjMBsB+6JBZXingRydBOAB7ykdrp671Y44++1J0WXx61X
         6KSfQ1Ou/xk4g4eMaEfNtOTbOoKyk6zQC0rfIhODC5nnCglCkwNS0Gks6f447tD1rL7C
         pofl3eUuopqBVS8hxyAkRiRN+KvhSP8l0mhPTV3Np4s3+N7cwE4P30VincnHkFf3wSw4
         zF/7P/nMyWDp0amNoYG6wX/lY8Bb2QPxfJdsAnuEjopV3ruXG9+GpvMmeCvTFKr3nwnQ
         I2DcqazGAWiXO+6au55b4LuXhJAQAgxZWJLvWLOl08e6h5n1EChLjbKWYQGto5bBEvdg
         XPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FrE6YQ09ogSINskU7ONunY+k1UG3iqRKMd5RjSfEArs=;
        b=DKArgphSzHiiAV5AAouX5C3NXK5TVFUVA1x69oazUXxLzTVSrK9qpopFQOS9CWn/qA
         bQOH8mgq+GTNn8kxIu72hhir7ZAjE7weCdhGVxmDon0+TPUDuQAoJDdKxp1Q+I8nOWHn
         34CHg6mMwko9BZS6tl0tgIhPAhbTqf5u9yK6kgBYAzMjnvBk2y1koYWEJZKme9f/KHMg
         IpRQsXEFiNwqlcXx8sHl1JfJ+zzrH/wK1CpKaMMUnQtQUaUjE2awbhOCu4K8Pa1KhLuk
         eD4rVEqhQCJte6IxtbWUKzcmTgTZoPPT639s4cdkcy9Wjn78RSVfV6FU2FE9e40CYqx0
         M+QQ==
X-Gm-Message-State: AOAM531IhYIvoVtFb6l8FWU8xfgq34l7xqR3d/JZd0aSyFusov5en6WX
        4v1lS7bZ5TxIoU0F40N5BBE=
X-Google-Smtp-Source: ABdhPJya+Fg+Wopyy7i8Tnnr1s98maH9nWAV3d9p/i/IZIKA9y+YKsQOVLYF9oJuK8Km2Z/CjKlUJg==
X-Received: by 2002:a17:90a:73c9:: with SMTP id n9mr2893166pjk.105.1630994750479;
        Mon, 06 Sep 2021 23:05:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:668f:8a8e:5bc5:fb2d])
        by smtp.gmail.com with ESMTPSA id p9sm9686231pfq.15.2021.09.06.23.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 23:05:49 -0700 (PDT)
Date:   Mon, 6 Sep 2021 23:05:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "pinglinux@gmail.com" <pinglinux@gmail.com>,
        "junkpainting@gmail.com" <junkpainting@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alistair23@gmail.com" <alistair23@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v10 05/12] Input: wacom_i2c - Read the descriptor values
Message-ID: <YTcBOskPYjbv4q61@google.com>
References: <20210829091925.190-1-alistair@alistair23.me>
 <20210829091925.190-7-alistair@alistair23.me>
 <YS1DGuTTAEKAd2Yr@google.com>
 <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PA4PR07MB7407FE9FE271191AC52F7EA387CE9@PA4PR07MB7407.eurprd07.prod.outlook.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Tatsunosuke,

On Thu, Sep 02, 2021 at 07:33:49AM +0000, Tobita, Tatsunosuke wrote:
> Hi Dmitry,
> 
> Yes, our firmware supports HID over I2C.  However, some of our
> customers often do not want to use HID to handle our hardware; even
> they don't install the generic HID driver neither.  In such case, we
> need to distinguish what generation of our device customer's has. And
> to do so, we check I2C HID descriptor even though the driver is not
> working with HID driver components, but this one.  That is why I2C HID
> descriptor is used there. It is called, but the situation with this
> driver is not supposed to work as a HID device.

I would like to understand better why the customers do not want to use
HID. There needs to be a _very_ strong reason to essentially duplicate
HID layer in a vendor driver and I inclined to say that such customers
would need to patch their kernels themselves.

Thanks.

-- 
Dmitry
