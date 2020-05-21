Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022D31DC6B8
	for <lists+linux-input@lfdr.de>; Thu, 21 May 2020 07:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgEUFyG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 May 2020 01:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbgEUFyG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 May 2020 01:54:06 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FA32C061A0E;
        Wed, 20 May 2020 22:54:04 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id k22so2404450pls.10;
        Wed, 20 May 2020 22:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6Oeo04aTJBdyCnGTe09rB/DvCqMAciCkvUQT6JZbeb4=;
        b=DSbC0EFu1huz4rcDvKDOM7Lpzeqhbo3a2IBCi1LTvErsuA3dYcYFK+mJYCBL7Rdhob
         90yR/UxHH8GiMSbM8R2NjIqyapcB7kiBwGY9Mw4IDBCjygPml2jJJjk3z/gHzB8Ut7un
         atVKHUYDdTplSSEuDGNIa74hBXf3py5yurS97vNNkNsXQ3e9kmojs8PBGnG0MtDSxoUn
         FhKmBBLBT/KMHIqR0IoVZwQ6JeCsV0wggt8vhkHmdHN8Dn595M9ednWE8AQkiyCGefK7
         JSBR7xSRdEuamWZ6MOxSEkPJ9jQU2fDFABHzapph/2jFY94FHR7RXI6dLLaYLsjlzRTn
         W1Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6Oeo04aTJBdyCnGTe09rB/DvCqMAciCkvUQT6JZbeb4=;
        b=o3PvaOO94sMJq+Kzk6zwhdX8UT/AQg2PyqKCK7WrlF/zRMyY2O/iaEBWyXkIA5SmYm
         0a9t7W09M5+KFo+16o/ZlvW8a6nDZF96Y6YOz913qTFX977qz/O8x3Jc4AYJ/4o4cT1t
         aPV5LwddV8rc2Hzg9mcYL4r9VeAJilRRln/FzeX+Exvm/ioYRpWUJLjYdVwUaxJxU1Ah
         7KkXJHfV38RYzFfX0FH7EaHss8oDJrbvJn6XPsB1KFQEz9JUN58dq05hi8nVAiG5N5YT
         M3QE1HLJuq8Fc5Yda7TtpDtcnTn8UTwyiUgHIxI7x6N/lPSbDE1QB6jXPKlUZBUVfhyc
         VIxQ==
X-Gm-Message-State: AOAM532juGeZ+8y/pljTmlUUaL1qUEL1LDTNbukjt9q+r0oFnwETOZCr
        xd8gjTbtsZkRnOCNK2dL6+Q=
X-Google-Smtp-Source: ABdhPJyMY+B3CPz5d5jIg9bcJobY7IzTiEHxVGOfM+ZOrkaaRqelFFFz0a6NTZAXYAiV7vc4z40/Mg==
X-Received: by 2002:a17:90a:6283:: with SMTP id d3mr9827318pjj.18.1590040443477;
        Wed, 20 May 2020 22:54:03 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id 14sm3524776pjm.49.2020.05.20.22.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 22:54:02 -0700 (PDT)
Date:   Wed, 20 May 2020 22:54:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
Subject: Re: [PATCHv3 4/5] Input: EXC3000: Add support to query model and
 fw_version
Message-ID: <20200521055400.GX89269@dtor-ws>
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-5-sebastian.reichel@collabora.com>
 <20200520174952.GW89269@dtor-ws>
 <20200520212540.t73my7ireicuwbrs@earth.universe>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520212540.t73my7ireicuwbrs@earth.universe>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 20, 2020 at 11:25:40PM +0200, Sebastian Reichel wrote:
> Hi,
> 
> On Wed, May 20, 2020 at 10:49:52AM -0700, Dmitry Torokhov wrote:
> > Hi Sebastian,
> > 
> > On Wed, May 20, 2020 at 05:39:35PM +0200, Sebastian Reichel wrote:
> > > Expose model and fw_version via sysfs. Also query the model
> > > in probe to make sure, that the I2C communication with the
> > > device works before successfully probing the driver.
> > > 
> > > This is a bit complicated, since EETI devices do not have
> > > a sync interface. Sending the commands and directly reading
> > > does not work. Sending the command and waiting for some time
> > > is also not an option, since there might be touch events in
> > > the mean time.
> > > 
> > > Last but not least we do not cache the results, since this
> > > interface can be used to check the I2C communication is still
> > > working as expected.
> > > 
> > > Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> > > ---
> > >  .../ABI/testing/sysfs-driver-input-exc3000    |  15 ++
> > >  drivers/input/touchscreen/exc3000.c           | 145 +++++++++++++++++-
> > >  2 files changed, 159 insertions(+), 1 deletion(-)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-driver-input-exc3000
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-driver-input-exc3000 b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > > new file mode 100644
> > > index 000000000000..d79da4f869af
> > > --- /dev/null
> > > +++ b/Documentation/ABI/testing/sysfs-driver-input-exc3000
> > > @@ -0,0 +1,15 @@
> > > +What:		/sys/class/input/inputX/fw_version
> > > +Date:		May 2020
> > > +Contact:	linux-input@vger.kernel.org
> > > +Description:	Reports the firmware version provided by the touchscreen, for example "00_T6" on a EXC80H60
> > > +
> > > +		Access: Read
> > > +		Valid values: Represented as string
> > > +
> > > +What:		/sys/class/input/inputX/model
> > > +Date:		May 2020
> > > +Contact:	linux-input@vger.kernel.org
> > > +Description:	Reports the model identification provided by the touchscreen, for example "Orion_1320" on a EXC80H60
> > > +
> > > +		Access: Read
> > > +		Valid values: Represented as string
> > 
> > These are properties of the controller (i2c device), not input
> > abstraction class on top of it, so the attributes should be attached to
> > i2c_client instance.
> > 
> > Please use devm_device_add_group() in probe to instantiate them at the
> > proper level.
> 
> As written in the cover letter using devm_device_add_group() in
> probe routine results in a udev race condition:
> 
> http://kroah.com/log/blog/2013/06/26/how-to-create-a-sysfs-file-correctly/

This race has been solved with the addition of KOBJ_BIND/KOBJ_UNBIND
uevents that signal when driver is bound or unbound from the device.
Granted, current systemd/udev drops them as it does not know how to
"add" to the device state, but this is on systemd to solve.

Thanks.

-- 
Dmitry
