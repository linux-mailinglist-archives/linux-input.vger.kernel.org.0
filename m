Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8697916F4CA
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2020 02:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729777AbgBZBMM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Feb 2020 20:12:12 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46217 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729799AbgBZBML (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Feb 2020 20:12:11 -0500
Received: by mail-pg1-f196.google.com with SMTP id y30so412101pga.13
        for <linux-input@vger.kernel.org>; Tue, 25 Feb 2020 17:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6uX/nJPriJhQm0pTaKBAXAE1KxbsYiYr0UB81o3mu3c=;
        b=ZUieuG1LEZrc+9UMd8Wjg9qwl8Km3LnAYcJc34XaejDqleddc1z6mkrin5d2aNGbnx
         1kxPiDHq3D7QAFjE7Np/pfMOnDRrYe9eREd/gDffXMjTkuFZoxzH96UVdirYAllTyMSD
         Y3xw8W4nd+mMxqiylK+WwywhatDceOMfSLwEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6uX/nJPriJhQm0pTaKBAXAE1KxbsYiYr0UB81o3mu3c=;
        b=YmgS8Fkl609AXClxLJaCxHNAGiQ3WKwVuRUvlrhfTZLhcZ4UHrUzNDkGyj1CqO7/LN
         bp+PBZQExouuFCPkC/xlKIDvQncxRAlNpLgybRF8dp54CzSqiSfRNs0lS1gzkpeJPFti
         wI+154fwDr1WFUxhNmnumdNZfkFAmyTkKy4QRIgHUghA5D4Vzm6MhKSyAFMaF22zygg8
         wB3W6uxFLdNgxX++SaIrNwYu5PUIHQlq26p0km5Wqo2Uv4dYjvDLZzkfFbqoJI34hPPY
         J3naWprUbWfUgv5zmwb1xFoB8qKTDopocsyPwU2v130gvMC2wM3q6uTsgXsIS24O7yw8
         sXYA==
X-Gm-Message-State: APjAAAVmQQ/xlW8/yd2S0xSdic6QYNeZgGXeMd3a9PuWLBgM2wWZqFRf
        EH1W4p7xaYaLsjXveP1fKdZeQw==
X-Google-Smtp-Source: APXvYqzrHVv6NdG4njh41aTPOq431N0eMbjw8Fo1OeFZkv+MOqi4PyYAAAwFt/ENjO4X1RKyvNihRg==
X-Received: by 2002:a62:f94d:: with SMTP id g13mr1537803pfm.60.1582679530660;
        Tue, 25 Feb 2020 17:12:10 -0800 (PST)
Received: from google.com ([2620:15c:202:201:476b:691:abc3:38db])
        by smtp.gmail.com with ESMTPSA id w21sm209079pgc.87.2020.02.25.17.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 17:12:10 -0800 (PST)
Date:   Tue, 25 Feb 2020 17:12:08 -0800
From:   Prashant Malani <pmalani@chromium.org>
To:     Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc:     linux-kernel@vger.kernel.org,
        Collabora Kernel ML <kernel@collabora.com>,
        groeck@chromium.org, bleung@chromium.org, dtor@chromium.org,
        gwendal@chromium.org, Enrico Granata <egranata@chromium.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Ting Shen <phoenixshen@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Fei Shao <fshao@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Evan Green <evgreen@chromium.org>, linux-input@vger.kernel.org
Subject: Re: [PATCH 0/8] Migrate all cros_ec_cmd_xfer() calls to
 cros_ec_cmd_xfer_status()
Message-ID: <20200226011208.GD197302@google.com>
References: <20200220155859.906647-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220155859.906647-1-enric.balletbo@collabora.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 20, 2020 at 04:58:51PM +0100, Enric Balletbo i Serra wrote:
> Dear all,
> 
> The purpose of this series is get rid of the remaining places where the
> cros_ec_cmd_xfer() function is used in favour of the
> cros_ec_cmd_xfer_status() helper. This allows us to make the
> cros_ec_cmd_xfer() function private and only expose to the users a
> single way to send commands to the Embedded Controller.
> 
> With these changes we also want to help future improvements in the
> interface, like the Prashant's series (i.e [1]) to introduce a
> cros_ec_cmd() that will allow us to remove more duplicated code in
> different places.
> 
> Best regards,
>  Enric
> 
> Note: Prashant, looks like you should fix your sendmail as the patches
>       are not threaded.
> 
> [1] https://lkml.org/lkml/2020/2/5/614
> 
> Enric Balletbo i Serra (8):
>   platform/chrome: cros_ec_proto: Report command not supported
>   Input: cros_ec_keyb: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec_vbc: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec_chardev: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec_sysfs: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec_lightbar: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec: Use cros_ec_cmd_xfer_status helper
>   platform/chrome: cros_ec_proto: Do not export cros_ec_cmd_xfer()

I picked this series on a device running 4.19 and didn't see any
unusual behaviour or dmesg logs, so for the entire series:

Tested-by: Prashant Malani <pmalani@chromium.org>
> 
>  drivers/input/keyboard/cros_ec_keyb.c       | 14 +++---
>  drivers/platform/chrome/cros_ec.c           |  2 +-
>  drivers/platform/chrome/cros_ec_chardev.c   |  2 +-
>  drivers/platform/chrome/cros_ec_lightbar.c  | 50 ++++++---------------
>  drivers/platform/chrome/cros_ec_proto.c     | 14 ++++--
>  drivers/platform/chrome/cros_ec_sysfs.c     | 36 +++++++--------
>  drivers/platform/chrome/cros_ec_vbc.c       |  4 +-
>  include/linux/platform_data/cros_ec_proto.h |  3 --
>  8 files changed, 50 insertions(+), 75 deletions(-)
> 
> -- 
> 2.25.0
> 
