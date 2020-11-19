Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A59A2B8C09
	for <lists+linux-input@lfdr.de>; Thu, 19 Nov 2020 08:14:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgKSHKd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 02:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbgKSHKc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 02:10:32 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC34C0613CF;
        Wed, 18 Nov 2020 23:10:32 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t21so3403039pgl.3;
        Wed, 18 Nov 2020 23:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e7/fxenuTWV+ZHejBXYF2Wy3/oCdLqMaDLU9pE4Z8hs=;
        b=CE1wsKvPy/0fCr3uTcXsGDwrKPZ/MRn7d6nzFipNXN9B+sjT8ybFvqX64HllkymK1b
         XhE/ZplTLY8v3L3TQ0NpFhLfn5GsAtNys7HWre3Dj+kzBmnSrdShau1oNiB70AXdXO5g
         boZH9PEsLuVWwhwAJUyG35r5alhEq+E5k5QZjLpwA3dfgPmWUoMIQippx3flTRyrv4b2
         trKilY8hMgi2io/6LAsyekKnFislp7Yo7rAGmEIBqOixQrolTgJfmx5OCAPw09OKbXoa
         dPZjs4iDOxUrXAOWmw6X23DyhnR5GYZLbR13o/jxY9fW6zR/hPVv2ml/pJbOQnQY5Exa
         Nrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e7/fxenuTWV+ZHejBXYF2Wy3/oCdLqMaDLU9pE4Z8hs=;
        b=gCKuhLYED7pP6GgYXTYOwL+voMCjaVd/i/X2c2XOFqmULI8HqB7prEzD92mQkeQmMV
         Q5qojUzTmldYu4h3+O4juORxvxK+xw31Idq06FRKMS2TucVi+T0IPZNlcsy2chde4Bum
         dyemVWqFXuZMQ87ZHQpKFRnt4GbGHmR6kYj6xcaKX3LlHyA+24683dUxwM7EtKAyaCzc
         60bWSixBM6Q7TAGXj0/Tu50XJrBXU11wt05b6EcWM02gNJgdkXAJ85WTkCll5idnv6QJ
         I2q+jLaIWp12YjMb8ZIDHvUbG8Fq5LwiVZ1I2va67GDF/NZnpPGDV9J6FDeZZtenO8cb
         Vh0Q==
X-Gm-Message-State: AOAM530kV4ZO6QIktZhHD3tlbmFHg1NXmI3S20lp2A68pnhxfNKdU0Jx
        zmhAYq/feMv+I5BuvBscSe0O+fpJdWw=
X-Google-Smtp-Source: ABdhPJwWF99cI0S+FYdJ7L6l3JOPNh/tdBF6oPQEyIo5ffi07v/7ypZYIjjW/fqrO297VIr/tsPPTw==
X-Received: by 2002:a63:ba1d:: with SMTP id k29mr11491095pgf.179.1605769832219;
        Wed, 18 Nov 2020 23:10:32 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 26sm24963649pgm.92.2020.11.18.23.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:10:31 -0800 (PST)
Date:   Wed, 18 Nov 2020 23:10:29 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] Input: adp5589: use devm_gpiochip_add_data() for
 gpios
Message-ID: <20201119071029.GF2034289@dtor-ws>
References: <20201112074308.71351-1-alexandru.ardelean@analog.com>
 <20201112074308.71351-5-alexandru.ardelean@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112074308.71351-5-alexandru.ardelean@analog.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 09:43:07AM +0200, Alexandru Ardelean wrote:
> This change makes use of the devm_gpiochip_add_data() function. With this
> the gpiochip_remove() function can be removed, and the
> adp5589_gpio_remove() function as well.
> 
> The kpad->export_gpio variable is also redundant now, and has been removed.
> 
> Signed-off-by: Alexandru Ardelean <alexandru.ardelean@analog.com>

Applied, thank you.

-- 
Dmitry
