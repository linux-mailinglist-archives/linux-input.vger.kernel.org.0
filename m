Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0454F41DE7
	for <lists+linux-input@lfdr.de>; Wed, 12 Jun 2019 09:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731536AbfFLHiV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Jun 2019 03:38:21 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37448 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731538AbfFLHiV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 03:38:21 -0400
Received: by mail-wr1-f67.google.com with SMTP id v14so15697823wrr.4
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ahijxNg+tm6jlJIc5taCvWvXRwBWZqm5rK7X9UBbuXU=;
        b=HQLv3m+jOk4C5klPuz3CJHKBbZ4fJeVsEcT7L+Gm11i7WvzLr6Rwbmf6ZsHMr5D5Xa
         3paeUW+3eShKX4qu4AcgjcktHe58WvycJDQKsGZ0ovASYt3Hmb8qvA8OEse8cgqkjb09
         +yTdEAuf8HeYG/hvsb31Utp/STs2RqBejRsnyLluMzf8Lue5zbkmgHloyWk7dFt8Vuy8
         oCKSydgLCz7ZaHChSVlKPB0Z9ZGid6R/v9AkdsVEu2IstTj30yU1FheIdNRLlSoxvORJ
         XpFmlj29zTxhc7Z/DIUFrg7KqJdGgdsa4SmXb7HTborQwKjyHvO5wpkKPflRSuKCIrua
         o2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ahijxNg+tm6jlJIc5taCvWvXRwBWZqm5rK7X9UBbuXU=;
        b=Mi7KbtM3tMunNIXpxn28oBs14tjafl6WoMqNMK7ytfKKkPKjk1fydZft4UcIURxSL2
         Cqk/vH9Y6OVO0J5gvw34bpeRqPkMQnRm415U6WEOYQrNLr1YV9c8UKccNXHn+3WC3Cti
         P/h900qI4G6jDoLISXG/7RlI3iQmhsW0pmLfI7kPnNucqiDUJncwm0S8E7NsFBVuzAPK
         pBwlmf9ubSv4uUj9WVLAk1TGYmSyxgUvcuveqZkdsxDP9KV5+X4micbOEAgftxtdmLiF
         YM2k4TN1LQGvuF50LY3kjFmACwmkh3ba24aNeT5XtYsPd8hErXLGS/WBUMpTVXZDpC5X
         JD0w==
X-Gm-Message-State: APjAAAXLkCa5bA96kFAs/61jnAt+GSTDtCzC4AtenhRUdJz6tBCzMTAy
        nMFXeVXDaH9CFwSm7oy1gPUFjFg63iw=
X-Google-Smtp-Source: APXvYqyt/bFtfN+FYRKsha+cbiAeOnD559EYKo8PVajWCWFGkASriMCjkdxwblRY7SObEOwcXha37A==
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr29814168wrx.247.1560325098741;
        Wed, 12 Jun 2019 00:38:18 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id s10sm10314020wrw.45.2019.06.12.00.38.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2019 00:38:18 -0700 (PDT)
Date:   Wed, 12 Jun 2019 09:38:17 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190612073817.ju2skswtatl2fxjn@pali>
References: <20190612070517.20810-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190612070517.20810-1-hui.wang@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday 12 June 2019 15:05:17 Hui Wang wrote:
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
>  drivers/input/mouse/alps.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 0a6f7ca883e7..ff522cd980a0 100644
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
> @@ -2864,6 +2865,24 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
>  	return NULL;
>  }
>  
> +static bool alps_is_cs19_trackpoint(struct psmouse *psmouse)
> +{
> +	u8 param[2] = { 0 };
> +	int error;
> +
> +	error = ps2_command(&psmouse->ps2dev,
> +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> +	if (error)
> +		return false;
> +
> +	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {

Hi!

Do we need to check firmware id? Is not check for "any alps trackpoint"
enough? If in future there would be more alps trackpoint-only devices it
probably have different firmware id.

Also you need to put param[1] & 0x20 into parenthesis due to priority of
& and && operators.

Also, what about making trackpoint_start_protocol() function non-static
and use it in alps_is_c19_trackpoint implementation? It is doing exactly
same thing.

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
> @@ -2883,6 +2902,15 @@ static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>  	if ((e6[0] & 0xf8) != 0 || e6[1] != 0 || (e6[2] != 10 && e6[2] != 100))
>  		return -EINVAL;
>  
> +	/*
> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> +	 * of touchpad. So it is a different device from DualPoint ones, if it
> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> +	 * let trackpoint.c drive this device.
> +	 */
> +	if (alps_is_cs19_trackpoint(psmouse))
> +		return -EINVAL;
> +

This change is not ideal as this function would be called two times, see
alps_detect(). I would suggest to think more about detection and come up
with better solution so above trackpoint check would called only once
during PS/2 device detection.

Calling that trackpoint check two times is useless and just increase
detection time of PS/2 devices.

>  	/*
>  	 * Now get the "E7" and "EC" reports.  These will uniquely identify
>  	 * most ALPS touchpads.

-- 
Pali Rohár
pali.rohar@gmail.com
