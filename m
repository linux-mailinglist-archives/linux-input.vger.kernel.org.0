Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB0240AEDE
	for <lists+linux-input@lfdr.de>; Tue, 14 Sep 2021 15:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhINN2I (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Sep 2021 09:28:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:48278 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233095AbhINN1p (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Sep 2021 09:27:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71C34606A5;
        Tue, 14 Sep 2021 13:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631625988;
        bh=pdIe6cl93gaj/S2gh6Qq47/E89/tN9snXF7fd72R2g4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=l4Rf15uqJJvH+to01mbPA9Ai3ooxwQSA2BTTSxQAJwxyg6eoYXg9mkhjlyxSEJLlY
         9AEAY38modsuYgGQeGsM3f1qnT5QX6kkSVJO7ZDAEzD3Pz06ap1vorqS/IJpT+ovG1
         DWEK6fqY0gk57nKRqqgn0FudkxuD/nEaNzkkU6MgcmJhTso5FwgiwVbv4hzqV6/CL+
         fc+84+SA4accswBhyPPANCxARZLifd6unccrMc/WRZk3j0yXZUltuZ2dFfLgzpUpY2
         f8wCDnXsxYEHO1Ll3zo/rnOi++DjyAAzUbHvhd2AEjTgiDHOkuXdkTGMVFQoLFT28w
         MNQhLmH9b4Eig==
Date:   Tue, 14 Sep 2021 15:26:23 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net, pobrn@protonmail.com, lee.jones@linaro.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v16 13/16] HID: nintendo: add IMU support
In-Reply-To: <20210911173639.5688-14-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.2109141525170.15944@cbobk.fhfr.pm>
References: <20210911173639.5688-1-djogorchock@gmail.com> <20210911173639.5688-14-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 11 Sep 2021, Daniel J. Ogorchock wrote:

[ CCing Dmitry ]

> This patch adds support for the controller's IMU. The accelerometer and
> gyro data are both provided to userspace using a second input device.
> The devices can be associated using their uniq value (set to the
> controller's MAC address).
> 
> A large part of this patch's functionality was provided by Carl Mueller.
> 
> The IMU device is blacklisted from the joydev input handler.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
[ ... snip ... ]
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index 947d440a3be63..b45ddb4570028 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -758,6 +758,12 @@ static void joydev_cleanup(struct joydev *joydev)
>  #define USB_VENDOR_ID_THQ			0x20d6
>  #define USB_DEVICE_ID_THQ_PS3_UDRAW			0xcb17
>  
> +#define USB_VENDOR_ID_NINTENDO		0x057e
> +#define USB_DEVICE_ID_NINTENDO_JOYCONL	0x2006
> +#define USB_DEVICE_ID_NINTENDO_JOYCONR	0x2007
> +#define USB_DEVICE_ID_NINTENDO_PROCON	0x2009
> +#define USB_DEVICE_ID_NINTENDO_CHRGGRIP	0x200E
> +
>  #define ACCEL_DEV(vnd, prd)						\
>  	{								\
>  		.flags = INPUT_DEVICE_ID_MATCH_VENDOR |			\
> @@ -789,6 +795,10 @@ static const struct input_device_id joydev_blacklist[] = {
>  	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_2),
>  	ACCEL_DEV(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS4_CONTROLLER_DONGLE),
>  	ACCEL_DEV(USB_VENDOR_ID_THQ, USB_DEVICE_ID_THQ_PS3_UDRAW),
> +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_PROCON),
> +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_CHRGGRIP),
> +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONL),
> +	ACCEL_DEV(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_JOYCONR),
>  	{ /* sentinel */ }

Dmitry, could you please Ack the joydev.c part so that I could take it 
through HID tree with the rest of the patchset?

Thanks,

-- 
Jiri Kosina
SUSE Labs

