Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 311CC1DBBE6
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 19:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgETRt6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 13:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgETRt6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 13:49:58 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D506C061A0E;
        Wed, 20 May 2020 10:49:56 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so1774741pgv.8;
        Wed, 20 May 2020 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8ZGBHFBSzwVrG6yTNBrD2pYfYDTmVVPDAobOgJbT9nE=;
        b=inyVIMrOtixf2Vfvomt7sPVGC/6mpVEhawpL/ddkpgdc3CInLV/oE2o5eyJlcQklZ5
         u63rlz/vA/sCwkUE2y9J66HMt40Gff6s8ZyOipWYtS7ClQgFi1b2bBeHF/50Sr1cG7hy
         zFqY/CEQFpQskdb7iw2sTNxlXdt1sLxAR1aUR4o6ZniP0D/hWNf/mtd2eJOSSw7XLl1O
         TXVe5F6IpwYENGY8vnH4U2p7cBOyV38xoGJ1XjaFldbjeqqXVDDlhZAyvgsplHmZXS2n
         +QINKNALtALFSt4cO/jtg5VeCE3UqCDlt1KatgIzA2cRBOWrM2fCCDJpJKXX4rOz8Oqh
         4sYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8ZGBHFBSzwVrG6yTNBrD2pYfYDTmVVPDAobOgJbT9nE=;
        b=teKFiF72C289jLrtsyEgE9X6oqTEOEHJkLdNlDVG0MuhOPfjra1Vb0rNtaBiuRH+u1
         1XG5JevJ7e0yoy5Qe1ouJiwZNFhr8PBMRHoyjF2qZqPPeHZLf+6PEvw/P5N3a+eeE6VZ
         zX7WsEj/AQDE2nZzw25uFoll/waHGMJS5kQiYgEd5YnYguqtOvkqIEb/KSGVF6udcaLI
         PLOIkF4ImXgVZGQq7XUeIA/7DsNvhpIOKDqvg7kR9CrxFsX4+kkdMClzOxp6me5eN1ZC
         tPbyCW1WmmKnkcnscHjewIe5PbKQ0ms5T3ost5F6Y9wmgfyVfrTNm7ilnSoZcPLs3iKb
         8UHg==
X-Gm-Message-State: AOAM532Puy+V29XjVJBTBJ0uSJVFBWO2bUPUAsv2Ii5x3CEU5yn1oJ+2
        /ix6nJWSy8HSrRbXk5TlHKs=
X-Google-Smtp-Source: ABdhPJw8b85fNCq5hP35cgegplCVk1mGMQSO1GRMXkjss0HG47An1MtBBU7o1W3Qkt66T6UPyaELIA==
X-Received: by 2002:a65:4903:: with SMTP id p3mr5026027pgs.318.1589996995818;
        Wed, 20 May 2020 10:49:55 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id s199sm2624861pfs.124.2020.05.20.10.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 10:49:55 -0700 (PDT)
Date:   Wed, 20 May 2020 10:49:52 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 4/5] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200520174952.GW89269@dtor-ws>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-5-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520153936.46869-5-sebastian.reichel@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On Wed, May 20, 2020 at 05:39:35PM +0200, Sebastian Reichel wrote:
> Expose model and fw_version via sysfs. Also query the model
> in probe to make sure, that the I2C communication with the
> device works before successfully probing the driver.
> 
> This is a bit complicated, since EETI devices do not have
> a sync interface. Sending the commands and directly reading
> does not work. Sending the command and waiting for some time
> is also not an option, since there might be touch events in
> the mean time.
> 
> Last but not least we do not cache the results, since this
> interface can be used to check the I2C communication is still
> working as expected.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../ABI/testing/sysfs-driver-input-exc3000    |  15 ++
>  drivers/input/touchscreen/exc3000.c           | 145 +++++++++++++++++-
>  2 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> new file mode 100644
> index 000000000000..d79da4f869af
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> @@ -0,0 +1,15 @@
> +What:		/sys/class/input/inputX/fw_version
> +Date:		May 2020
> +Contact:	linux-input@vger.kernel.org
> +Description:	Reports the firmware version provided by the touchscreen, for example "00_T6" on a EXC80H60
> +
> +		Access: Read
> +		Valid values: Represented as string
> +
> +What:		/sys/class/input/inputX/model
> +Date:		May 2020
> +Contact:	linux-input@vger.kernel.org
> +Description:	Reports the model identification provided by the touchscreen, for example "Orion_1320" on a EXC80H60
> +
> +		Access: Read
> +		Valid values: Represented as string

These are properties of the controller (i2c device), not input
abstraction class on top of it, so the attributes should be attached to
i2c_client instance.

Please use devm_device_add_group() in probe to instantiate them at the
proper level.

Thanks.

-- 
Dmitry
