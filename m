Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDE712A0BA0
	for <lists+linux-input@lfdr.de>; Fri, 30 Oct 2020 17:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725943AbgJ3Qrq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 30 Oct 2020 12:47:46 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:36315 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725808AbgJ3Qrq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 30 Oct 2020 12:47:46 -0400
Received: by mail-oi1-f193.google.com with SMTP id d9so1287379oib.3;
        Fri, 30 Oct 2020 09:47:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qbBstdJF6lGYUkgMfbYRnDBzY8X2ICeJU7MFuE1dEQk=;
        b=LTrfBF11vAxV9dwVMW2xJPWVxrIzBvykfBtny9VTQgZXq3qia61z1iZ5sO/cB3QQKW
         0wW6TdivNx5eRk1TlRA9tQL/baii5emUMbS+F7eGntgpOfk0DAG1pTwQJ4UiQINCtJzY
         pOZhQIBOUCdV/ZfRXizbQV0x4bFbfW8tTRHpR2I+H44xOyD2lxKL3xrkP84+fcEjM0EQ
         SvwQcmlPBDCTbAFyCN/Z7bXA46SIpm+SarEofbM4l1EzbkK3ar39kk4XiLZ1M8teIBPl
         YmR2FgtVEaUAOwWLL8RZL8E0C1CYHLU/XLMnGePvTUpe4WAHLJaqO7fLWKBlADq3QCWk
         QOHw==
X-Gm-Message-State: AOAM530XbUKDDEFfq1iv82tVZKgB193BwkNN/+ZMGKNLhxNFJyseTFdH
        oVAFLakfLslHjvIE3Y3jJQ==
X-Google-Smtp-Source: ABdhPJzdcsQqAHak2T12Li0TXyhwHSilYrAQGNK76OohNpykaBDznTKvLv+Xg1UpohlJ9Q/gE8hUlQ==
X-Received: by 2002:aca:4cd6:: with SMTP id z205mr2190199oia.32.1604076465380;
        Fri, 30 Oct 2020 09:47:45 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id i12sm1557959oon.26.2020.10.30.09.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2020 09:47:44 -0700 (PDT)
Received: (nullmailer pid 3974942 invoked by uid 1000);
        Fri, 30 Oct 2020 16:47:43 -0000
Date:   Fri, 30 Oct 2020 11:47:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org, andrea@borgia.bo.it,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        swboyd@chromium.org, hdegoede@redhat.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as
 deprecated
Message-ID: <20201030164743.GA3967106@bogus>
References: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 23, 2020 at 04:22:52PM -0700, Douglas Anderson wrote:
> As pointed out by Rob Herring [1], we should have a device-specific
> compatible string.  This means people shouldn't be using the
> "i2c-over-hid" compatible string anymore, or at least not without a
> more specific compatible string before it.  Specifically:
> 
> 1. For newly added devices we should just have the device-specific
>    device string (no "hid-over-i2c" fallback) and infer the timings
>    and hid-descr-addr from there.

I wouldn't go that far. Having a fallback is perfectly acceptible. And 
hopefully there are at least some devices where that's good enough for 
drivers to use.

If we have cases of only 'i2c-over-hid' being used (in DT), then the 
solution is making this a schema so we can enforce that as not valid.

> 
> 2. If there's a need for a device tree to be backward compatible, we
>    should list the device-specific compatible string and add the
>    "hid-over-i2c" fallback and the various timings.
> 
> [1] https://lore.kernel.org/r/20201019211036.GA3595039@bogus
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
> Changes in v2:
> - ("dt-bindings: HID: i2c-hid: Label this binding as deprecated") new in v2.
> 
>  Documentation/devicetree/bindings/input/hid-over-i2c.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> index c76bafaf98d2..733a5f053280 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
> @@ -1,5 +1,8 @@
>  * HID over I2C Device-Tree bindings
>  
> +WARNING: this binding is deprecated.  Instead of using this, create specific
> +bindings for each hid-over-i2c device.
> +
>  HID over I2C provides support for various Human Interface Devices over the
>  I2C bus. These devices can be for example touchpads, keyboards, touch screens
>  or sensors.
> -- 
> 2.29.0.rc1.297.gfa9743e501-goog
> 
