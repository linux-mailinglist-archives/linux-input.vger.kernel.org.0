Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE56447A43
	for <lists+linux-input@lfdr.de>; Mon,  8 Nov 2021 06:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237003AbhKHF72 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Nov 2021 00:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235773AbhKHF71 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Nov 2021 00:59:27 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81BF4C061570
        for <linux-input@vger.kernel.org>; Sun,  7 Nov 2021 21:56:42 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id y1so15033097plk.10
        for <linux-input@vger.kernel.org>; Sun, 07 Nov 2021 21:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SesjmWqdWc07/ZgsBolgAfFT74XppWxMGGaIaQamhAw=;
        b=Cr9AR48RWdSimVvvKdORLTN9WU9gnO6BOg2n9hs3tj3l7zSNT2g0tPG71CbkR6zIS5
         o7tLCOlK9X8bxSnOQzoLRpnhtJpahYEbmhbrVNCphGB5kVn73VzXI3daDYSF+0vtR0Qp
         Ru++OVcgxkn3Amtoo+pQR4NlCWNllX0Do9328/mOWqXKO01E/uI/HZ3Y4wGPBIqzvSHc
         eJ6zfftR6hSwXX9+U57fiQRMEzrf5xCuXlRhv9uuAcdCw4jq55hiDZfKPWRzvqmZ+xGw
         wtg6pvxpC7lJP/f1RwJkKOMdZmXXEasyhQ0487EUjajRvyStV4WdTDSxGGusJEOJJL3M
         NgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SesjmWqdWc07/ZgsBolgAfFT74XppWxMGGaIaQamhAw=;
        b=KCd6S0JjsKNS5SXqHyeHL+cMK74CmZsmWX77LWmFtgsrxHQDlp+t7GdX2iAY7VfMvM
         DIgieZeA4wsu7jaldv49ySC1QW2YdxERLwD4ZBaP4bWdzzG9Fbw6zzF+8usJMb4vrzpY
         SaxaCJeT5uLNhlKGBT04NXfkelGiK3y7WZhPpBCszp72rb36o/PyGtMfob2i4lk5tVaE
         akDmRXts+qiq+TNi7ICZmS5X8ZieGzENPci/sgbMa26M3dX3Taarei85AvCaWYIKTc/y
         mW4Znb9gqy3RkqNMa5WJ15JB14CGihDlaKTa95Q/j27Uh/L0vwvvMGUmlrA62ow08YVV
         Kj4Q==
X-Gm-Message-State: AOAM5329vIDSH8IlyrAtfW8opDp2pRYN6OA0ocB6Z6uoNwrC7SvIcBtR
        FCQ4FA9nBsJwq+G8q+KpAHHsvZhz0Lw=
X-Google-Smtp-Source: ABdhPJxQQRw1LUs/0GhhJti1IuI4o68U5eaZRtY+Kewueb/WU2mFb56MrwSJlT8HUytybgm4KiFLnw==
X-Received: by 2002:a17:902:bcc4:b0:141:bfc4:ada with SMTP id o4-20020a170902bcc400b00141bfc40adamr57420431pls.20.1636351001954;
        Sun, 07 Nov 2021 21:56:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:ebb6:b39e:7da6:955f])
        by smtp.gmail.com with ESMTPSA id t8sm11633860pgk.66.2021.11.07.21.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 21:56:40 -0800 (PST)
Date:   Sun, 7 Nov 2021 21:56:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Gareth Randall <gareth.randall@virgin.net>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND 1/1] Add support for touch screens using the
 General Touch ST6001S controller.
Message-ID: <YYi8FvXkV5i9baoN@google.com>
References: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7687459-1665-eb1c-b8ad-2bb37b7136ac@virgin.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Gareth,

On Sun, Oct 03, 2021 at 10:54:21PM +0100, Gareth Randall wrote:
> Add support for touch screens using the General Touch ST6001S
> controller, as found in the GPEG model AOD22WZ-ST monitor.
> This controller can output the ELO 10-byte protocol,
> but requires different initialisation.
> 
> Signed-off-by: Gareth Randall <gareth@garethrandall.com>
> ---
>  drivers/input/touchscreen/elo.c | 58 +++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/elo.c
> b/drivers/input/touchscreen/elo.c
> index 96173232e53f..8c15e0eea6b4 100644
> --- a/drivers/input/touchscreen/elo.c
> +++ b/drivers/input/touchscreen/elo.c
> @@ -44,6 +44,8 @@ MODULE_LICENSE("GPL");
>  #define ELO10_ACK_PACKET	'A'
>  #define ELI10_ID_PACKET		'I'
> 
> +#define ELO_GT_INIT_PACKET	"\001XfE\r"
> +
>  /*
>   * Per-touchscreen data.
>   */
> @@ -201,6 +203,7 @@ static irqreturn_t elo_interrupt(struct serio *serio,
> 
>  	switch (elo->id) {
>  	case 0:
> +	case 4:
>  		elo_process_data_10(elo, data);
>  		break;
> 
> @@ -255,6 +258,54 @@ static int elo_command_10(struct elo *elo, unsigned
> char *packet)
>  	return rc;
>  }
> 
> +/*
> + * Initialise the General Touch ST6001S controller.
> + */
> +static int elo_command_10_gt(struct elo *elo)
> +{
> +	int rc = -1;
> +	int i;
> +	unsigned char *packet = ELO_GT_INIT_PACKET;
> +
> +	mutex_lock(&elo->cmd_mutex);
> +
> +	serio_pause_rx(elo->serio);
> +	init_completion(&elo->cmd_done);
> +	serio_continue_rx(elo->serio);
> +
> +	for (i = 0; i < (int)strlen(packet); i++) {
> +		if (serio_write(elo->serio, packet[i]))
> +			goto out;
> +	}
> +
> +	wait_for_completion_timeout(&elo->cmd_done, HZ);
> +	rc = 0;
> +
> + out:
> +	mutex_unlock(&elo->cmd_mutex);
> +	return rc;
> +}
> +
> +static int elo_setup_10_gt(struct elo *elo)
> +{
> +	struct input_dev *dev = elo->dev;
> +
> +	if (elo_command_10_gt(elo))
> +		return -1;

		return -EIO;

> +
> +	__set_bit(INPUT_PROP_DIRECT, dev->propbit);

Please make this a separate patch that would set this property for all
variants of ELO touchscreens (i.e. move it into elo_connect()).

> +
> +	// Values taken from a GPEG model AOD22WZ-ST monitor
> +	input_set_abs_params(dev, ABS_X, 1365, 5828, 0, 0);

I believe the datasheet says that the touch resolution is 4096 x 4096:
http://www.boardcon.com/download/LCD_datasheet/15inch_SAW_LCD/Serial%20Controller%20ST6001S%20SPEC.pdf



> +	// max and min inverted because screen axis is inverted
> +	input_set_abs_params(dev, ABS_Y, 5013, 2260, 0, 0);

I dont think this changes anything for reported coordinates by the
driver.

> +
> +	dev_info(&elo->serio->dev,
> +		 "GeneralTouch ST6001S touchscreen");
> +
> +	return 0;
> +}
> +
>  static int elo_setup_10(struct elo *elo)
>  {
>  	static const char *elo_types[] = { "Accu", "Dura", "Intelli", "Carroll" };
> @@ -361,6 +412,13 @@ static int elo_connect(struct serio *serio, struct
> serio_driver *drv)
>  		input_set_abs_params(input_dev, ABS_X, 0, 255, 0, 0);
>  		input_set_abs_params(input_dev, ABS_Y, 0, 255, 0, 0);
>  		break;
> +
> +	case 4: /* 10-byte protocol with General Touch initialisation */
> +		if (elo_setup_10_gt(elo)) {
> +			err = -EIO;
> +			goto fail3;
> +		}
> +		break;
>  	}
> 
>  	err = input_register_device(elo->dev);
> -- 
> 2.27.0

Thanks.

-- 
Dmitry
