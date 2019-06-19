Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C38D14B317
	for <lists+linux-input@lfdr.de>; Wed, 19 Jun 2019 09:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730418AbfFSH3t (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Jun 2019 03:29:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37461 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfFSH3t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Jun 2019 03:29:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id v14so2165441wrr.4
        for <linux-input@vger.kernel.org>; Wed, 19 Jun 2019 00:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=M3i8O+8Ijr6tRGx8LWx0fuRxCP1Q+k5fpaATlZU3qtk=;
        b=jPG7i98Nem1Bh5cktQVB+D/pn3+9T7+HcGULyadM/Ot6xJpPsOTwuqec3+HEsNb/o9
         DMok8ZvUkREnIROoLnD+ghh1elJi+/+7+NtwhgIlmCisENzuy+SM7QK4JR7lc1t3+to7
         HJsqpWaYJMKR7N+uXN0mtENO1gNua7o9CF0LmM8ROElfiS53aSAlyIiQMTBSgLviWOGH
         CbjFCk7qiq0EOygpVPwLSdWJ7NNOHgg/TESyiFSvueEotXSx8Yffrll2CI74U9oGIinG
         JrTn0xsqeDBjhTZIfMnN7R+bpYmwwVTwlROCt903mMfDrhwZH/nMJtHgewF1QTxkHt51
         a7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=M3i8O+8Ijr6tRGx8LWx0fuRxCP1Q+k5fpaATlZU3qtk=;
        b=XxRcom8oxXNsKkDJOGL0GE7ncwpmiKrLgpCY2uLg596+B2Kd9NQd5hS+iCLDvXkwQO
         JUhY1hijxuKlhCJKxuLV8GeMTLtEt98f1NXhSqk23aIVfQ6KUCJ1s00i/SOv9TsoAPw5
         jX/uAoEM5+No7VwUxkk2aEIgE46aaKm4svHJkOWn2LEuWD+pQUPOh92YaSJaneV3L34Y
         fw1Msdua3vnrVMfVc70XRs1fAHaU1RspuwWyItP/7ow6YAWRQrtNyhC5n+Xe8nYDwDyx
         Z25vEEXCOPcyKYChCNQLS+wR7Q9x9akggKGat4BWMcbgl487Bm1ZFOW0AqUiglHzPVFj
         LxJg==
X-Gm-Message-State: APjAAAXaRNxdE18Ikk8olLW88kDePh7mQIekmpmCLA0aIH1yzTuau3nI
        ec8Zcv9moSX5v9qExq8fwD0=
X-Google-Smtp-Source: APXvYqzev/2Jlh8QShcDT4lnpPYcLzApKHi3qUlbMkiYqNSDGIrYme7We+Z6CCaG8H/7ngqkM+LSPg==
X-Received: by 2002:adf:fec9:: with SMTP id q9mr7407990wrs.241.1560929386692;
        Wed, 19 Jun 2019 00:29:46 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id q1sm481780wmq.25.2019.06.19.00.29.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Jun 2019 00:29:45 -0700 (PDT)
Date:   Wed, 19 Jun 2019 09:29:44 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Hui Wang <hui.wang@canonical.com>
Cc:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        xiaoxiao.liu-1@cn.alps.com, sliuuxiaonxiao@gmail.com,
        xiaojian.cao@cn.alps.com, naoki.saito@alpsalpine.com,
        hideo.kawase@alpsalpine.com
Subject: Re: [PATCH v5] Input: alps - Don't handle ALPS cs19 trackpoint-only
 device
Message-ID: <20190619072944.bok36smpg7hphaao@pali>
References: <20190619063756.9714-1-hui.wang@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190619063756.9714-1-hui.wang@canonical.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wednesday 19 June 2019 14:37:56 Hui Wang wrote:
> On a latest Lenovo laptop, the trackpoint and 3 buttons below it
> don't work at all, when we move the trackpoint or press those 3
> buttons, the kernel will print out:
> "Rejected trackstick packet from non DualPoint device"
> 
> This device is identified as an alps touchpad but the packet has
> trackpoint format, so the alps.c drops the packet and prints out
> the message above.
> 
> According to XiaoXiao's explanation, this device is named cs19 and
> is trackpoint-only device, its firmware is only for trackpoint, it
> is independent of touchpad and is a device completely different from
> DualPoint ones.
> 
> To drive this device with mininal changes to the existing driver, we
> just let the alps driver not handle this device, then the trackpoint.c
> will be the driver of this device if the trackpoint driver is enabled.
> (if not, this device will fallback to a bare PS/2 device)
> 
> With the trackpoint.c, this trackpoint and 3 buttons all work well,
> they have all features that the trackpoint should have, like
> scrolling-screen, drag-and-drop and frame-selection.
> 
> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> Signed-off-by: Hui Wang <hui.wang@canonical.com>

Looks good, you can add my:

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Thanks!

> ---
> In the v5:
> change the commit header to add "fallback to a bare PS/2 device if
> trackpont driver is not enabled".
> add comment for checking param[0] and param[1]
> add psmouse_dbg and psmouse_warn respectively for PS2_TRACKPOINT is
> enabled or not enabled.
> 
>  drivers/input/mouse/alps.c | 41 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 0a6f7ca883e7..536b8e531169 100644
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
> @@ -2864,6 +2865,34 @@ static const struct alps_protocol_info *alps_match_table(unsigned char *e7,
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
> +	/*
> +	 * param[0] contains the trackpoint device variant_id while param[1]
> +	 * contains the firmware_id, so far for all alps trackpoint-only
> +	 * devices, their variant_ids equal TP_VARIANT_ALPS and their
> +	 * firmware_ids are 0x20~0x2f, so here we check param[0] as well as
> +	 * param[1] to detect an ALPS trackpoint-only device.
> +	 */
> +	if ((param[0] == TP_VARIANT_ALPS) && (param[1] & 0x20)) {
> +		if (IS_ENABLED(MOUSE_PS2_TRACKPOINT))
> +			psmouse_dbg(psmouse,
> +				    "ALPS CS19 trackpoint-only device detected, not using ALPS touchpad driver\n");
> +		else
> +			psmouse_warn(psmouse,
> +				     "ALPS CS19 trackpoint-only device detected but MOUSE_PS2_TRACKPOINT not enabled, fallback to bare PS/2 mouse\n");
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static int alps_identify(struct psmouse *psmouse, struct alps_data *priv)
>  {
>  	const struct alps_protocol_info *protocol;
> @@ -3164,6 +3193,18 @@ int alps_detect(struct psmouse *psmouse, bool set_properties)
>  	if (error)
>  		return error;
>  
> +	/*
> +	 * ALPS cs19 is a trackpoint-only device, it is completely independent
> +	 * of touchpad. So it is a device different from DualPoint ones, if it
> +	 * is identified as a cs19 trackpoint device, we return -EINVAL here and
> +	 * let trackpoint.c to drive this device, if the trackpoint driver is
> +	 * not enabled, the device will fallback to a bare PS/2 mouse.
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
