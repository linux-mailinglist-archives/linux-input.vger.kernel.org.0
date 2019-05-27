Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A14472B1D7
	for <lists+linux-input@lfdr.de>; Mon, 27 May 2019 12:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfE0KJT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 May 2019 06:09:19 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52199 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfE0KJS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 May 2019 06:09:18 -0400
Received: by mail-wm1-f66.google.com with SMTP id f10so8133313wmb.1;
        Mon, 27 May 2019 03:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tuHCdOdb5t1SszRKnD5OprWjKcOYFqQtf31SduQvheI=;
        b=XREMWUw6mPqN28YAXSUmUTn/z14vKm7hmJdzn9yYlnC+36W5k+OBeuLcH22aRRC2Ds
         Mhan+303KUgrM0qzUonkd437pNxzW4Y6RpkmCDl9yyP39F1Nm1yQie5YK/TD1mGDuXg/
         YMRKCc7y+QRErCdR2ijJhP1/f1xQshrRl5qL16x2S91SD9Ud5PTQj65EKhaVq+E+fgpb
         c1l1soEvKIF51dUvhVGWOfN456D3aLDLfDXY69VA/HnR5F8dYPunMs/sf7UVKlAsPaFU
         a5sX/v5RqYYiVPPr6MRs7h08guqX7o5aQAR4mT8GsTfPwA5t58Yz2ymHB+IE+LM9TSns
         7kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tuHCdOdb5t1SszRKnD5OprWjKcOYFqQtf31SduQvheI=;
        b=WNCbMfLB5WiVboqi4+wHINN6rpVTvBsFKn9p486zawssbtySUXygf8BBbUFGYkdLt+
         7Hym3AVXnZeG27qwOfMl6cSbuHRfS2C52v3x2u5pdfgAyDrYVpCNiVKylvynkeM67bxr
         sAGllvzky4dC0OpVkJAr/X8iAaQL6UV7TRW3RUZs+uzim9y1jfTvva/jvdDxR7J9VUbE
         rlbCGbUyfsWYoDK5NYF1wqySCe2hY1Uv7fPnOa1gazUqbTdHFvKlq2wgWeY+ympZQ2td
         y65ionynZgOu4p6ezlgy2QNLrdSEaf1Apo8BBCznVAPvvHN2NoXuG9HFu4n88BoiNiT9
         YClg==
X-Gm-Message-State: APjAAAXBYfc5vPaWlgtTxlugFJ7eXonKvWlChmFyt/kf+qWosn1P2fyj
        N9fsWJPVPrT4vxSklj8IEb8=
X-Google-Smtp-Source: APXvYqxOToQKy/smyD8FAPz5mgyY2fkBWUZZzM2uxWDhliyEIokCqlCLCXW35hp/zbG9/X1OnmaTlQ==
X-Received: by 2002:a1c:ef05:: with SMTP id n5mr9523462wmh.149.1558951756303;
        Mon, 27 May 2019 03:09:16 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id o12sm3944287wmh.12.2019.05.27.03.09.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2019 03:09:15 -0700 (PDT)
Date:   Mon, 27 May 2019 12:09:13 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
Cc:     dmitry.torokhov@gmail.com, peter.hutterer@who-t.net,
        hui.wang@canonical.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, xiaojian.cao@cn.alps.com,
        zhangfp1@lenovo.com, xiaoxiao.liu-1@cn.alps.com
Subject: Re: [PATCH] input: alps-fix the issue alps cs19 trackstick do not
 work.
Message-ID: <20190527100913.sgxrjrmphsjfmcdb@pali>
References: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527094422.7558-1-sliuuxiaonxiao@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Monday 27 May 2019 05:44:22 XiaoXiao Liu wrote:
> The alps devices which detected to use the ALPS_PROTO_V8 procotol contains
> ALPS touchpad and ALPS trackstick.The ALPS_PROTO_V8 procotol do not
> support the trackstick device process by default.

Normally PS/2 device handled by alps.c is touchpad and in some cases
touchpad sends also trackstick data in that one PS/2 channel.

Does it mean that your device (reported to kernel) sends only trackstick
packets and not touchpad?

> When the trackstick was detected to use ALPS_PROTO_V8 procotol,
> the v8 process_packet method alps_process_packet_ss4_v2 will reject to
> report the data when the device using ALPS_PROTO_V8 procotol is not set
> the ALPS_DUALPOINT flag.
> 
> The alps cs19 trackstick is detected to use the ALPS_PROTO_V8 procotol
> but without ALPS_DUALPOINT flag, the alps driver will not report the
> input data. so the trackstick will not work.
> 
> solution: when the alps cs19 device detected, set the device
> ALPS_DUALPOINT flag,then the input data will be processed.
> 
> Signed-off-by: XiaoXiao Liu <sliuuxiaonxiao@gmail.com>
> ---
>  drivers/input/mouse/alps.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/mouse/alps.c b/drivers/input/mouse/alps.c
> index 0a6f7ca883e7..a54677cf7474 100644
> --- a/drivers/input/mouse/alps.c
> +++ b/drivers/input/mouse/alps.c
> @@ -24,7 +24,7 @@
>  
>  #include "psmouse.h"
>  #include "alps.h"
> -
> +#include "trackpoint.h"
>  /*
>   * Definitions for ALPS version 3 and 4 command mode protocol
>   */
> @@ -220,6 +220,23 @@ static bool alps_is_valid_first_byte(struct alps_data *priv,
>  	return (data & priv->mask0) == priv->byte0;
>  }
>  
> +static int alps_check_cs19_trackstick(struct psmouse *psmouse)
> +{
> +	u8 param[2] = { 0 };
> +	int error;
> +
> +	error = ps2_command(&psmouse->ps2dev,
> +			    param, MAKE_PS2_CMD(0, 2, TP_READ_ID));
> +	if (error)
> +		return error;
> +
> +	if (param[0] == TP_VARIANT_ALPS && param[1] & 0x20) {

I guess that you want parenthesis around (param[1] & 0x20). And also
describe what that 0x20 constant means.

> +		psmouse_warn(psmouse, "It is alps cs19 trackstick");

It is not a warning.

> +		return 0;
> +	}
> +	return -1;
> +}
> +
>  static void alps_report_buttons(struct input_dev *dev1, struct input_dev *dev2,
>  				int left, int right, int middle)
>  {
> @@ -2568,8 +2585,12 @@ static int alps_update_dual_info_ss4_v2(unsigned char otp[][4],
>  			alps_exit_command_mode(psmouse);
>  			ps2_command(ps2dev, NULL, PSMOUSE_CMD_ENABLE);
>  
> -			if (reg_val == 0x0C || reg_val == 0x1D)
> +			if (reg_val == 0x0C || reg_val == 0x1D) {

Hm... why your device does not match these constants?

> +				is_dual = true;
> +			} else if (alps_check_cs19_trackstick(psmouse) == 0) {
> +				//For support Thinkpad CS19 TrackStick
>  				is_dual = true;
> +			}
>  		}
>  	}
>  

-- 
Pali Rohár
pali.rohar@gmail.com
