Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87AC20AF25
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 11:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgFZJkK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 05:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725821AbgFZJkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 05:40:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ED37C08C5DB
        for <linux-input@vger.kernel.org>; Fri, 26 Jun 2020 02:40:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id o11so8818143wrv.9
        for <linux-input@vger.kernel.org>; Fri, 26 Jun 2020 02:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IJPYmFQ5PUZFd/hsuCewfegAqJ04XYM4/xT+2m8jgiY=;
        b=vwkcskJVh+L2Xpf1FviJZSKSkJLqYR6xk/pX4JNAhMBewx2yQaQft983xXe7VZ3dca
         lEgPv5xvUx4mRGQRcfniAphVtbSlP9EkLlTGd7bf8YuPoM0pQIoKsCZ7DbUrbdGfZMne
         QfNCXgwvmUXqaDps2UKbyt+ZRbHag99DxnS+NbWOW5J/gHaWxRLuaIF/mfiXri3dbmNq
         vsbGFCBZWHSAss/biYQPAdmBkwGnCHGJRHw3dOUJ/RU4d6AwiI7wxYVMfZMhu1RVEkeo
         UPt1PTtNB7/SE+vA3BCcgOwTgHDX23EMfZWBC3Ne0bMbmc922qad+li8Uqng9+nbXl2b
         rjCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IJPYmFQ5PUZFd/hsuCewfegAqJ04XYM4/xT+2m8jgiY=;
        b=BykY+gvqTRODbS5rYPRdv/D0xv148j7AvqVTk3MdVnxNu11GAOTsbUhkLwOcOzmJwc
         kTCGqSTtfUpjsV0YR2DUTjtLyRu4xNlor9VMZdeIsEebZ4K4+06+Wqg0rqASXESiknWt
         2/97HqczaSSgsoF7BInIMJ+Q8IV9W5u2qCE1HRtrdgbExuT9eCFMQOQs1Rj0YLZ8hPwo
         V59rMNMq+o2F4C9Dak9JG8//TV3zI5bipEMUJFU6rGWoV2YadMvIcasmTYHFOK6yUYPp
         hYqiiWdjjxkCXVZWnZPd9yr8XKrUM0WKULpSpNYbCzJObv3SXYdClzZDIFW19KJdHClT
         jKgg==
X-Gm-Message-State: AOAM531CPKp9vY50EFD2tr6MlfPbDJiSYLNlzEJjR5kPBIfDt3jqd1hF
        1OVMfV1PEYIM9BMlHdM4gybikw==
X-Google-Smtp-Source: ABdhPJwPIIuvYVlW7mNotwj3Hv4mO83srghyGHP5ErgWEB6RxsGtQBjhSqDXG/2cvVM7LX6aGeIc7A==
X-Received: by 2002:a5d:498f:: with SMTP id r15mr2935735wrq.175.1593164408186;
        Fri, 26 Jun 2020 02:40:08 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id w12sm26985624wrm.79.2020.06.26.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 02:40:07 -0700 (PDT)
Date:   Fri, 26 Jun 2020 10:40:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200626094005.GA177734@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
 <20200417101333.GA3737@dell>
 <ab5adcd1-18f2-9b1c-8c5d-744f7a0e5579@collabora.com>
 <20200625134620.GS954398@dell>
 <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b2f27cee-327e-c96c-aa12-5e1ef1f352aa@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 26 Jun 2020, Enric Balletbo i Serra wrote:

> Hi Lee,
> 
> On 25/6/20 15:46, Lee Jones wrote:
> > On Thu, 25 Jun 2020, Enric Balletbo i Serra wrote:
> > 
> >> Hi Lee,
> >>
> >> On 17/4/20 12:13, Lee Jones wrote:
> >>> On Fri, 06 Mar 2020, Ikjoon Jang wrote:
> >>>
> >>>> Convert the ChromeOS EC bindings to json-schema.
> >>>>
> >>>> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> >>>> ---
> >>>>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
> >>>>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
> >>>>  2 files changed, 129 insertions(+), 76 deletions(-)
> >>>>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
> >>>>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> >>>
> >>> Applied, thanks.
> >>
> >> I don't see this patch applied, I am missing something?
> > 
> > It should be there.  Not sure when the MFD repo was last pushed.
> > 
> > I'll try pushing it again (there are a couple of new patches from
> > today).  Maybe that will spur a fetch from -next.  If it's still not
> > there tomorrow, let me know and I'll investigate further.
> > 
> 
> Still not there, just to make sure I am looking at the right branch, I am checking
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next

Oh, I see what's happened.

Looks like this patch wasn't sent to LKML, so my apply script failed.

Any reason not to send it to LKML?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
