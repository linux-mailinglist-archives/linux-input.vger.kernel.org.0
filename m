Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE582D546D
	for <lists+linux-input@lfdr.de>; Thu, 10 Dec 2020 08:21:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732723AbgLJHVF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Dec 2020 02:21:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728616AbgLJHVF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Dec 2020 02:21:05 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7AEC0613CF;
        Wed,  9 Dec 2020 23:20:25 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id t37so3382157pga.7;
        Wed, 09 Dec 2020 23:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kEqav4MUonxV0ffD0QL2dUPuC2s6cmYw6vjXnLqhnqo=;
        b=D6p4SqjPoSiqokLbMfElp5JYlxWx8o2NPktgBI9reZ7QLkA1NMsrCwBTjGJt2pm0jo
         B81sApqMq7Z8WPGJubctHCVtqKyGh+WzY4p/B1ej9yB7uBExwMKgEffHrhdL4AVf6RuC
         0FfAj2PXQqDJvFrv22aWK+B0JsR6hMoZAPGvAOFmxNY6PqnkbMPWLngrkTR8wgAgsCAE
         f12PmwHdehxMgrHpE2H6Oa/Wd9+ho+ZeIIXIdSY+SOgZ50S588JsAcpx0cqs8kFKqWDY
         axhirdjuR7jMjRHtPGg2pKm2rEZ/l0qWbeVR6D95xzqStNNlVx65KTSUCBF7SYp9KnU/
         p02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kEqav4MUonxV0ffD0QL2dUPuC2s6cmYw6vjXnLqhnqo=;
        b=gTeZ6ubmc2jnbav1mhCXyjGezERl7O/o3Pha24sexw1Qtnsis7Bk2qAJzO91rIkq5+
         t3LErd9k7YqoffWly1u4ztFIJe6eQAHSKh9r82nqow4N70W/Ma3QGc15habangbm+m0v
         gJ/ydItviDQLJWEyzL8/7iZgaAH4+5PP5drHqRTifTK/hOPxveH6AehZh0BR3DAer7aS
         WXrF3r6HahuiD2ZfI4jh6fCbVIjbEKHTo+WWYN5lZ+B+dvJgP0TTF/NeKZyjEPdO7QrP
         yZOItDF140TPZuCmBBnWPjrKzI0S6QocfmjmZQG6kGY67L4BRK/nbbZLwCkt0mTNM6VJ
         CesA==
X-Gm-Message-State: AOAM532oUwk1w9/kv/PZOF0P4hD+1bUI/wg7PbeeEVIIGJ8pzVehBjuL
        bJLqWbtT+2oNXqhF0nvfFyEjHkrRXFQ=
X-Google-Smtp-Source: ABdhPJzjFadVP3w5IjcE92yG6HaZZDTOTNseP/K9HFNV9SlVSwkrNvLZsOfaCSYq1FdzEGPi8ZupZw==
X-Received: by 2002:a17:90a:578f:: with SMTP id g15mr6163613pji.3.1607584824741;
        Wed, 09 Dec 2020 23:20:24 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id mj5sm4891165pjb.20.2020.12.09.23.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 23:20:23 -0800 (PST)
Date:   Wed, 9 Dec 2020 23:20:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lars@metafoo.de, robh+dt@kernel.org
Subject: Re: [PATCH v3 1/4] Input: adp5589-keys - add default platform data
Message-ID: <X9HMNWziPToVHKnU@google.com>
References: <20201127111420.96500-1-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127111420.96500-1-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alexandru, Lars-Peter,

On Fri, Nov 27, 2020 at 01:14:17PM +0200, Alexandru Ardelean wrote:
> From: Lars-Peter Clausen <lars@metafoo.de>
> 
> If no platform data is supplied use a dummy platform data that configures
> the device in GPIO only mode. This change adds a adp5589_kpad_pdata_get()
> helper that returns the default platform-data. This can be later extended
> to load configuration from device-trees or ACPI.

I was looking at this and I do not think it is a good idea, as later we
will need to add negation if someone does nor want use GPIO mode. We
should use the standard "gpio-controller" property from the beginning.

Thanks.

-- 
Dmitry
