Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1B0544422
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 18:36:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730741AbfFMQfE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 12:35:04 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45723 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730737AbfFMHpW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 03:45:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id f9so19558286wre.12
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zICwNVRcPSA1tlZJ753PMYmmlni1ar7oNojwOjTbPic=;
        b=UFaim43iGREGabczaEr0BDTV90nNSldGTDZnYiiD4bkY8l+RspILXnAgaca4eEFnRh
         fzWxmK6JXYh4nsPf4MIKMKohV1z3qsB1aiei9nZDfvVu/pH+z43j6k9eOk0JHcSMGY/B
         YWFbAswDFeaRZYHhrKIYeb7NlSY46vsAG/mZ+juI6L4rFkVlImLyLJ0YRR+1WXpsbSnv
         RLE1Y1w11vkKvecDK+NqIa/BglbCRNiAzRzMU7oF9aySoYMzbUc9jyH4xiD9+cE3OpIq
         jSnExpUQxt7MhGlkraaHCygBaxngue7TToZwxJumOF1kqdCFY3N4eUC0m0JKZ2ZN6FXl
         /NnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zICwNVRcPSA1tlZJ753PMYmmlni1ar7oNojwOjTbPic=;
        b=ridfjBgmlu5LUXwkU/1yliupJVgrs6gdPiKGEO07gNXKJC0aE1OEY9f8Zm3WERpybK
         gVD3MaVuQSORir/olOVqXd4FQydaz4qhZb91iPOqMPNB2svYeA4MIP3TVnEAnKikxF0p
         9Gb8o5AQjCNc7Z4Ezg4WvlZ5FPL8muDAFyHX8xnlybemfkhKLOWVZemg73VNhkV/RgBv
         aPgdOt/rioLihb4tl0fyK8PREeV+K13F0/gr+ebE98j9ZMK5EOcbmatAJwJyQexO5p6M
         JVT4lK3Cewiwyic09X+lBnOoKDTxjbHBHLGNMv8G3QoSUt8CajOQXZiPNwW0v4QEQBG2
         gndg==
X-Gm-Message-State: APjAAAXOBQaxprzTH6goHTqGdRPK221hoDizEen2VJ1DigmW99CPG2Ap
        1IeVLbCIlPqXzc4U+VC4CCU=
X-Google-Smtp-Source: APXvYqyDSmAehcvC+ggHpfzDJ7fO08aOyoxOwUXevHsJttdfi49GCrsAK1B4F5nVzkvFcc9i2pXTRA==
X-Received: by 2002:a5d:5152:: with SMTP id u18mr4148480wrt.319.1560411919607;
        Thu, 13 Jun 2019 00:45:19 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id w23sm1851592wmc.38.2019.06.13.00.45.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 00:45:18 -0700 (PDT)
Date:   Thu, 13 Jun 2019 09:45:18 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH v2] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190613074518.jf55wmug5njddzn4@pali>
References: <20190613033249.20307-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190613033249.20307-1-hui.wang@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thursday 13 June 2019 11:32:49 Hui Wang wrote:
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
> In the v2, I move the cs19 checking to alsp_detect(), and
> drop the param[1] checking. And because after executing
> alps_indetify(), the device is not in the command mode,
> i rewrite teh alsp_is_cs19_trackpoint() to add enter/exit_command_mode().
> 
>  drivers/input/mouse/alps.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 0a6f7ca883e7..6f227e8ddd7e 100644
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
> @@ -2864,6 +2865,28 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>  	return NULL;
>  }
>  
> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
> +{
> +	u8 param[2] = { 0 };
> +
> +	if (alps_enter_command_mode(psmouse))
> +		return false;

Ufff... is this correct? Entering to command mode e.g. on rushmore
devices put ALPS touchpad into passthrough mode, when touchpad forwards
all packets from trackstick (connected to touchpad) directly to the
host.

I understood that ALPS trackpoint-only device do not have any touchpad,
so how is command mode suppose to work? What passthrough mean there?

Also does not it break e.g. ALPS rushmore devices?

I would suggest if you can provide architecture how this trackpoint-only
device is connected and which protocols it understand. Seems that there
are missing for us important details, like why is passthrough mode
needed and where it passthrough (there is a second device? which?).

> +	if (ps2_command(&psmouse->ps2dev,
> +			param, MAKE_PS2_CMD(0, 2, TP_READ_ID)))
> +		return false;

So if ps2_command fails then device stay in passthrough mode forever.
And in past I was told by ALPS people that some ALPS rushmore devices
have a firmware bug that PS/2 reset command does not exit from
passthrough mode. So this code put some ALPS devices into fully
unusable and unresetable mode. And full machine power off is needed.

> +	if (alps_exit_command_mode(psmouse))
> +		return false;
> +
> +	if (param[0] == TP_VARIANT_ALPS) {
> +		psmouse_dbg(psmouse, "It is an ALPS trackpoint-only device (CS19)\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>  {
>  	const struct alps_protocol_info *protocol;
> @@ -3164,6 +3187,15 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
>  	if (error)
>  		return error;
>  
> +	/*
> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> +	 * of touchpad. So it is a different device from DualPoint ones, if it
> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> +	 * let trackpoint.c to drive this device.
> +	 */
> +	if (alps_is_cs19_trackpoint(psmouse))
> +		return -EINVAL;
> +
>  	/*
>  	 * Reset the device to make sure it is fully operational:
>  	 * on some laptops, like certain Dell Latitudes, we may
> -- 
> 2.17.1
> 

-- 
Pali Rohár
pali.rohar@gmail.com
