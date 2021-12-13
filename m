Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950F9472040
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 06:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhLMFLU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 00:11:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbhLMFLU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 00:11:20 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89756C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 21:11:19 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id np3so11018947pjb.4
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 21:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vd9aeojU9uOqVQ7w6C78+FSP1mEFyC+/dC9B3fKC2/E=;
        b=TZPHAeFOs53//nBIGT3+ijsIGIivIKwbVK/1KVhLUOTCzNYVbQfNaLWmV4eKzpv8Fr
         gxlCRh127MYJdNjPkaRNugqaKltOnEudSWXMRtv8JYvTbNiuL3D/WKpCMu/ZJG9mZRsb
         bhM0+ZVNzeS2Pa5oq/OfYXzGkEttvnPwgvWSoRAjF8bsH3dUeHw3WjAwCIE/SV7rXQOZ
         TSuJl0R95OCbBFZBypERk1KAOk0ICS+xsIxVF0NBUExqcs1/Bjp1OZYndZ0r3GeIWRLb
         /YjFEyIjxSd4EfyEBnGVlxJfJUoRKJNy+fXJDS53/hgwL115C0OzuIPtKKw78pxgtpdJ
         2VWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Vd9aeojU9uOqVQ7w6C78+FSP1mEFyC+/dC9B3fKC2/E=;
        b=wkr2yDDdW7yYM+dxP+eAPvQ/Uuhw8kDjU53CyYPXPo4ZW1Wsit541OtalceHsfidEP
         7v7lx+KHfEU2Y/BziRmSNW4bw4uvBpalVLRtVFTRb2VhgrOri3FVPuXq3fQueS+frGM0
         eArFOjxp+SHipqQSCkOLyI5bZS1+45TSiCZQPpFmCSyzE7RQdnXxPSn1sCnBPMTzJoPg
         MjL6HSQ3lM594nkPFNiBMyfVTougUv+lncPsWIHY0U9jadRQnyYWXRmNp+Ws/K/Azcks
         eJXCmGRRUHeQ14jMqOowWxISAFC7J00oRH2YnPk3VUhlut5BasPD6qDwUdxAm/vIHY+m
         Eq+Q==
X-Gm-Message-State: AOAM531t3IIuj34r+9YIZVq8BeH5K8H7qXEwo15zcsl790NBWyg5ixT3
        lnlPrwWg1JN30BLgnmIP6+U=
X-Google-Smtp-Source: ABdhPJzjSzo/rnRq1d6mKKfNOKWq/NTpUfI6mf5IslrnR9k1JQBpBROvbV2zY12pu3JjKht+S6xiGQ==
X-Received: by 2002:a17:90b:1947:: with SMTP id nk7mr42457565pjb.227.1639372278734;
        Sun, 12 Dec 2021 21:11:18 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id o62sm10000963pfb.211.2021.12.12.21.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 21:11:17 -0800 (PST)
Date:   Sun, 12 Dec 2021 21:11:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH resend 1/2] Input: silead - Add support for EFI-embedded
 fw using different min/max coordinates
Message-ID: <YbbV8+jbRZfzngiK@google.com>
References: <20211122220637.11386-1-hdegoede@redhat.com>
 <20211122220637.11386-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122220637.11386-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 22, 2021 at 11:06:36PM +0100, Hans de Goede wrote:
> Unfortunately, at the time of writing this commit message, we have been
> unable to get permission from Silead, or from device OEMs, to distribute
> the necessary Silead firmware files in linux-firmware.
> 
> On a whole bunch of devices the UEFI BIOS code contains a touchscreen
> driver, which contains an embedded copy of the firmware. The fw-loader
> code has a "platform" fallback mechanism, which together with info on the
> firmware from drivers/platform/x86/touchscreen_dmi.c will use the firmware
> from the UEFI driver when the firmware is missing from /lib/firmware. This
> makes the touchscreen work OOTB without users needing to manually download
> the firmware.
> 
> The firmware bundled with the original Windows/Android is usually newer
> then the firmware in the UEFI driver and it is better calibrated. This
> better calibration can lead to significant differences in the reported
> min/max coordinates.
> 
> Add support for a new (optional) "silead,efi-fw-min-max" property which
> provides a set of alternative min/max values to use for the x/y axis when
> the EFI embedded firmware is used.
> 
> The new property is only used on (x86) devices which do not use devicetree,
> IOW it is not used in actual devicetree files. The devicetree-bindings
> maintainers have requested properties like these to not be added to the
> devicetree-bindings, so the new property is deliberately not added to the
> existing silead devicetree-bindings documentation.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
