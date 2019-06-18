Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBA549C01
	for <lists+linux-input@lfdr.de>; Tue, 18 Jun 2019 10:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728525AbfFRI2E (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Jun 2019 04:28:04 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53767 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFRI2E (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Jun 2019 04:28:04 -0400
Received: by mail-wm1-f66.google.com with SMTP id x15so2185649wmj.3
        for <linux-input@vger.kernel.org>; Tue, 18 Jun 2019 01:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7Wo8tKIfXD9Ux0nvpmT/aVqdJ/XKVbecRK+bm7vZ3C0=;
        b=V776LBSHSqSd8M/bjKQ+zsW5zt+JvD0wryDVZieXXrYqVPCu8Rq0nrjf+oB/SMMrQn
         DVjbiIghjc6Nkp4qBSEvhUyKtIw6zWotgAXRJBM22vAk67XNB5ScPLlmn0gJ2CKGn4k3
         iDlPGK0oDo3K8mG6Mtd4XLh/34U96rKeU+0jnS3zvxDj7hBcVfbrk1XNv+EwR9yWWxh2
         dtxJLScnY3vHeiEivR6hZXeACqVHfKQWP3Gbn/XaaxT6oWpHL7GTsY1ii6ZBpr1pdI4p
         VFMWU1lSYTizxQIN6MnWT10n4uswBYx8k3pUZQtYjyAKfe3XGBoOEqzjuwDJEtPX8WNh
         TANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7Wo8tKIfXD9Ux0nvpmT/aVqdJ/XKVbecRK+bm7vZ3C0=;
        b=hUuOUcq1gIKDcpkMzPo9j5mBf43e64fFheXrfZYBUROSU6oAhIX4jIKVIngryzn8BQ
         NtA3jB3sl/Loet4uxnLKug9FT53sFyYBqo8b42RgfltQYuwFPTo1QOtKZsFEvlynE/6u
         IQcc4G7YsGCTIOsr04GJbnsV+i1NyoJbOoFwUd52ljU+qbaWevGVGU//CTGJGvEj5chg
         Dv8o4SYbqOES38aJmKMHTOXHKgfIv5MKqwkYS1gyHBri0KQ/LxFRD9kAGudjLtUn60YY
         y2yF0IzeFMo3S5D4j0e7jTg6d8fGmIzc/5u6dJH9QHyV4JrHgycYFp/xYgTxd3CiBmN6
         7gmw==
X-Gm-Message-State: APjAAAWtbDCmIAFBZG/R5Vc6B9DaZWdFBwGs2n3HLj2Vy+T5sUKqG7b9
        6UaPHh5QZCYDTJCA6M6LG7g=
X-Google-Smtp-Source: APXvYqx6f+jK33yhyWJgvDRQorSFcxYJQ6vUhaAAYGW8mz/C4ySr2h61lGItrNoFzkF786ffZ8gB8w==
X-Received: by 2002:a1c:5546:: with SMTP id j67mr2514063wmb.80.1560846481063;
        Tue, 18 Jun 2019 01:28:01 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id a7sm13053995wrs.94.2019.06.18.01.27.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 01:28:00 -0700 (PDT)
Date:   Tue, 18 Jun 2019 10:27:59 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH v4] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190618082759.aaq4jndhfbe7lqt7@pali>
References: <20190617120555.8750-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190617120555.8750-1-hui.wang@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Monday 17 June 2019 20:05:55 Hui Wang wrote:
> On a latest Lenovo laptop, the trackpoint and 3 buttons below it
> don't work at all, when we move the trackpoint or press those 3
> buttons, the kernel will print out:
> "Rejected trackstick packet from non DualPoint device"
> 
> This device is identified as alps touchpad but the packet has
> trackpoint format, so the alps.c drops the packet and prints out
> the message above.
> 
> According to XiaoXiao's explanation, this device is named cs19 and
> is trackpoint-only device, its firmware is only for trackpoint, it
> is independent of touchpad and is a completely different device from
> DualPoint ones.
> 
> To drive this device with mininal changes to the existing driver, we
> just let the alps driver not handle this device, then the trackpoint.c
> will be the driver of this device.
> 
> With the trackpoint.c, this trackpoint and 3 buttons all work well,
> they have all features that the trackpoint should have, like
> scrolling-screen, drag-and-drop and frame-selection.
> 
> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> ---
> Sorry, forgot to add "param[1] & 0x20" checking in the v3, please
> ignore the v3 patch.
>  drivers/input/mouse/alps.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 0a6f7ca883e7..6bed9eb16c2c 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -24,6 +24,7 @@
>  
>  #include "psmouse.h"
>  #include "alps.h"
> +#include "trackpoint.h"
>  
>  /*
>   * Definitions for ALPS version 3 and 4 command mode protocol
> @@ -2864,6 +2865,23 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>  	return NULL;
>  }
>  
> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
> +{
> +	u8 param[2] = { 0 };
> +
> +	if (ps2_command(&psmouse->ps2dev,
> +			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
> +		return false;
> +
> +	if ((param[0] == TP_VARIANT_ALPS) && (param[1] & 0x20)) {

You should describe what does magic (param[1] & 0x20) check is doing.
Reading trakcpoint.c gives us assumption that param[1] is firmware id,
but why mask 0x20 is not explained.

> +		psmouse_warn(psmouse,
> +			     "It is an ALPS trackpoint-only device (CS19), make sure the MOUSE_PS2_TRACKPOINT is enabled to drive it\n");

This will throw a warning for every CS19 device independently of kernel
configuration. You should not throw warning and spam users who compiled
kernel with trackpoint support.

Rather use something like this:

  if (param[0] ...) {
    if (IS_ENABLED(CONFIG_MOUSE_PS2_TRACKPOINT))
      psmouse_dbg(psmouse, "ALPS CS19 trackpoint-only device detected, not using ALPS touchpad driver\n");
    else
      psmouse_warn(psmouse, "ALPS CS19 trackpoint-only device detected, but CONFIG_MOUSE_PS2_TRACKPOINT is not enabled, fallback to bare PS/2 mouse\n");
    return true;
  }

Just rephrase messages to not be too long and useful for user.

> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>  {
>  	const struct alps_protocol_info *protocol;
> @@ -3164,6 +3182,17 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
>  	if (error)
>  		return error;
>  
> +	/*
> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> +	 * of touchpad. So it is a different device from DualPoint ones, if it
> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> +	 * let trackpoint.c to drive this device.
> +	 * If ps2_command() fails here, we depend on the immediate followed
> +	 * psmouse_reset() to reset the device to normal state.
> +	 */
> +	if (alps_is_cs19_trackpoint(psmouse))
> +		return -EINVAL;
> +
>  	/*
>  	 * Reset the device to make sure it is fully operational:
>  	 * on some laptops, like certain Dell Latitudes, we may

-- 
Pali Rohár
pali.rohar@gmail.com
