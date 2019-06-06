Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76E9C36B78
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 07:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbfFFFUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 01:20:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36587 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbfFFFUd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 01:20:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so951719wrs.3
        for <linux-input@vger.kernel.org>; Wed, 05 Jun 2019 22:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=MtXzwtsPXMZuGm5S7Wt5QqtWB5p6F/HX65Y8+M45wGE=;
        b=p4C6n5EJHuI9vL+mnsfJhnxJhd2W6xHIE6RgPzS8Kin29QH0SWW8SrHd+/MkNiNgIx
         c0Q61roJTynhbgtXMouySryytcLFvX8mD0RvO7tBbZ6zj3O2/T6QqZULHJ9/8HwEun4j
         3kbwkoCMb3e8jKORTTf45GJTbW+PxWYrwGogre9RZ1n+1cU+2J+MphYPrJgC1uUrYHSH
         Zj4k1TnWRYS4wOgNTPOx3GQXY6Fz3oHlq8cAT7DZxUdrUfhnH1hu8MeiOAlLw2dHvSDy
         Kr20iC+BWnkx1UoaMTkzd5Ebaxo8Ny1nl89ECFnbsbmjOdYtwdGVgWizjSMGmrblF16Z
         yp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=MtXzwtsPXMZuGm5S7Wt5QqtWB5p6F/HX65Y8+M45wGE=;
        b=kM2rbvYfwRXS2qF9ArWBA1knaVDlJMDtbp1f6gHwCIMv8iofLmMM0jOlukfO1pwBC0
         ESGOJ1ebdtQOgFrhlKWSoSnQ9vcMzagNLeMoDyc0fNLcp3x/RwUZYXI9d5qHUasEjTmZ
         2F5gMRNyUDdMg3xKTF9DVXCjzczy08cNcDYI2n8QsazszqiIXXP9gfX4uu3nUBj8cnFF
         GN98DIhi0IcoJUfRiit+ayLYBKw38VLbnnxN/YO3qSYx0urO6TTQjK2jDLHr8emgLxiv
         wROlnDRROwbxFf/gxO0lYLCCJqCMMVu9uCdvpPfPucNiyDsEIt3FdbgfWGJBFEUYXa5w
         39JA==
X-Gm-Message-State: APjAAAU1klgFd1Bjoo9fCq/2t47fnRHKpngH5z63hQbBPUELTptOaKAz
        h9xk1N6VSwEvNlEXfozEc5F2Xg==
X-Google-Smtp-Source: APXvYqyO8Cc5NUJHvSF2a5vtpvToysuHvLAYz5b06+CRZQGvcWsO4Er19RBs9HCmzQT1bhXinH8ngw==
X-Received: by 2002:a5d:4e50:: with SMTP id r16mr1392999wrt.197.1559798431594;
        Wed, 05 Jun 2019 22:20:31 -0700 (PDT)
Received: from dell ([2.31.167.229])
        by smtp.gmail.com with ESMTPSA id k10sm600470wmj.37.2019.06.05.22.20.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 22:20:30 -0700 (PDT)
Date:   Thu, 6 Jun 2019 06:20:28 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] HID: quirks: Refactor ELAN 400 and 401 handling
Message-ID: <20190606052028.GY4797@dell>
References: <20190423160543.9922-1-jeffrey.l.hugo@gmail.com>
 <20190423160605.9970-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190423160605.9970-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 23 Apr 2019, Jeffrey Hugo wrote:

> There needs to be coordination between hid-quirks and the elan_i2c driver
> about which devices are handled by what drivers.  Currently, both use
> whitelists, which results in valid devices being unhandled by default,
> when they should not be rejected by hid-quirks.  This is quickly becoming
> an issue.
> 
> Since elan_i2c has a maintained whitelist of what devices it will handle,
> use that to implement a blacklist in hid-quirks so that only the devices
> that need to be handled by elan_i2c get rejected by hid-quirks, and
> everything else is handled by default.  The downside is the whitelist and
> blacklist need to be kept in sync.
> 
> Suggested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> ---
>  drivers/hid/hid-quirks.c            | 64 ++++++++++++++++++++++++-----
>  drivers/input/mouse/elan_i2c_core.c |  4 ++
>  2 files changed, 58 insertions(+), 10 deletions(-)

Reviewed-by: Lee Jones <lee.jones@linaro.org>
Tested-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
