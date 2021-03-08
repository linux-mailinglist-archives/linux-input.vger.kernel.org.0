Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507F13307B7
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 06:48:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232529AbhCHFsP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 00:48:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhCHFrs (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 00:47:48 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F568C06174A
        for <linux-input@vger.kernel.org>; Sun,  7 Mar 2021 21:47:48 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id w18so6353055pfu.9
        for <linux-input@vger.kernel.org>; Sun, 07 Mar 2021 21:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7j+iXBsu/DPzJd68jhAtpkrBD/7PjxmtUvYg7qsi5Ik=;
        b=sy8IgT7tQGejDTohoxjajn6wN/o0r113/c9TxWtDyACNFAZ0EI/ckXauXurwoLiifw
         ZR2pD0jhqfhQZ6HDy5zPSPj980/5vzt0PzA0I99HxpCh806alVY8Gl8AlaXfYXNlFO8W
         PnJfFh9NXG1p1IR6W9yDg286TPygF9SFS0Q/R3CkVZm65nm/1b7F1ny99N950kzTlC8M
         lcAlliyLq7juPuTZKRB9YuuP5KO3lnZAyqI2mbNAHiqPe4fW/TEquaqMHGfm96juLb8p
         qac76JfIq/e2XezVIIThKEGiIYTYPGiAL3SUUUQbBTkjsWZxAgp0W+kAHRV7uf9/XyG+
         s4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7j+iXBsu/DPzJd68jhAtpkrBD/7PjxmtUvYg7qsi5Ik=;
        b=rQQ2Pmoc6kDhjXjJNtzl/5jUJw61MNJ7sAw9RobA85YdoBk28JV5Twezn55RbvZBG6
         7rcQ2EifLDbZfv8OtIDAFsI2EuuVSzrJJ53EDCaqyvZlAJ1wQCucke7T+OnGmSfSC5Xx
         eFeMC3Hr5J3kg1+oUcVCoVqf8/w2aNLnRkfff5d9sVw8H6n72tSX7CODkL9iQXObEv1f
         8P90bAYk1JtgsI56c+Q1ln/P2RTprF7EvePQiCL0rGUfoV55FKDE41vt9oFgvqf6Z6QA
         UzuA/udanrGZh4QHcql4cDyELMkLzD04qdtRqGr17GK4rf5wi5eYbI391ppMV5BeTreO
         L0Ug==
X-Gm-Message-State: AOAM530fnelI5hjhHVBEaQjCVHQIBH+6knTp+GlqFxxFBxoUXX/ZVXs5
        ZM/fcSE1/8HhaWtat8WxOG0=
X-Google-Smtp-Source: ABdhPJzxg5PUpuq3aE0M6dV7t4UXAFiMeTNjV24400tLLpIRxFpA3cicvKgBqeJxRCGUVDxdmR83CQ==
X-Received: by 2002:a65:6a48:: with SMTP id o8mr18826139pgu.424.1615182467614;
        Sun, 07 Mar 2021 21:47:47 -0800 (PST)
Received: from google.com ([2620:15c:202:201:39e0:7b5c:9fa7:f6e0])
        by smtp.gmail.com with ESMTPSA id r4sm9082875pjl.15.2021.03.07.21.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Mar 2021 21:47:46 -0800 (PST)
Date:   Sun, 7 Mar 2021 21:47:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-input@vger.kernel.org, kernel@pengutronix.de,
        patchwork-lst@pengutronix.de
Subject: Re: [PATCH v3 5/5] Input: exc3000 - add firmware update support
Message-ID: <YEW6gGUmlYFI4T0+@google.com>
References: <20210125182527.1225245-1-l.stach@pengutronix.de>
 <20210125182527.1225245-6-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125182527.1225245-6-l.stach@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

On Mon, Jan 25, 2021 at 07:25:27PM +0100, Lucas Stach wrote:
> This change allows the device firmware to be updated by putting a firmware
> file in /lib/firmware and providing the name of the file via the update_fw
> sysfs property. The driver will then flash the firmware image into the
> controller internal storage and restart the controller to activate the new
> firmware.
> 
> The implementation was done by looking at the the messages passed between
> the controller and proprietary vendor update tool. Not every detail of the
> protocol is totally well understood, so the implementation still has some
> "monkey see, monkey do" parts, as far as they have been found to be required
> for the update to succeed.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../ABI/testing/sysfs-driver-input-exc3000    |  20 ++
>  drivers/input/touchscreen/exc3000.c           | 240 +++++++++++++++++-
>  2 files changed, 258 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> index 704434b277b0..123a00ccee8b 100644
> --- a/Documentation/ABI/testing/sysfs-driver-input-exc3000
> +++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> @@ -24,3 +24,23 @@ Description:	Reports the type identification provided by the touchscreen, for ex
>  		Access: Read
>  
>  		Valid values: Represented as string
> +
> +What:		/sys/bus/i2c/devices/xxx/update_fw
> +Date:		Jan 2021
> +Contact:	linux-input@vger.kernel.org
> +Description:	Allows to specify a firlename of a firmware file located in /lib/firmware/ that will be
> +		used to update the application firmware on the touchscreen controller. For example
> +		"eeti/eeti_27_0_EDipper_0735.fw"

I believe the current idiomatic way is to have statically defined
firmware name (it can still encode vid/pid/model info etc) and do not
re-implement variable firmware name in every driver.

I think if this really is required we need to add this feature of
overriding default firmware name to firmware loader maybe?

Thanks.

-- 
Dmitry
