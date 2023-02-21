Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E16D269E950
	for <lists+linux-input@lfdr.de>; Tue, 21 Feb 2023 22:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbjBUVPX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Feb 2023 16:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjBUVPW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Feb 2023 16:15:22 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6959D31E09
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 13:14:38 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id g14so6539678pjb.2
        for <linux-input@vger.kernel.org>; Tue, 21 Feb 2023 13:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyM57K3teYXqOG4+WVSnqD13Viq0dWCF3ZnkMw4Ax9s=;
        b=g3HqyNynW14q8JX4gyQhuHdfWUamOpjhu63XBgppKqgISFFYQMZQMOZdAW6UtSVvcS
         ud8PJQpHmYbklpgWqC3aYOPPMsLNM2lKClMoOmZyiKBPJ11yfVcyzn7FhRWZWV5WuH54
         V0h29NbfINw/rSWwzkIgcm3MWezcsRNqKjVarLqNLTUzXnEQFkM0HUgJcnZw8AABGMpR
         vcT4VPSphTihF+EoaBEsdmeb0v3yD4U0KCJln0oYHQcPZyWQiXCj1FiMlkjCXKudw2fe
         PRom3/waXWInbXmVdzsOLt78zr0vozgkgKfKuD1NhIRqxOi55d/smniuZyQYnopS+sEc
         +82g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyM57K3teYXqOG4+WVSnqD13Viq0dWCF3ZnkMw4Ax9s=;
        b=kwO6BEpVHxNSssruK9OZxt048To1jiB/voi1EDYqUfv5gsClzwcqtZGalmo+Wib4IT
         VK69usSkEjC4O8F6kaF4n8x2pNS/r2CQYFj8un870cUgXGejbUBHC9PB+uurna06kROP
         Zdq+xsrtP2KNG9jluVrpHr88+9XQewczRHgv9bFn9t4r3X1lBbFkSgRceb02Z3EtUhmV
         5BiFcXvpZ/Aj2mAw4/kaEGVUa7oXTblxRd/iZhZrY/c5+DjSaQQ7EhBiepHIOtx/UrFX
         c+GOX79AolTGfU1swLUycacKb9CVg+P/Ai2uPEUVYWyzGmEO+urk08xpPfW4IwMslK8J
         5Zag==
X-Gm-Message-State: AO0yUKWQc1bOkNgZqQ1M1tQjJjbEQ8WspUu+cX3ogGvXCpv519/0BeZ1
        0b7nL894X/5joIOfJnCth/U=
X-Google-Smtp-Source: AK7set+ohcT6F2A2uIjz0flYNWekI2rpbRcCk6Cia+yHfKiP5GOry/WYx5TNOFmmNNyvN3ap5Qbhiw==
X-Received: by 2002:a17:902:f685:b0:19a:d7b0:5472 with SMTP id l5-20020a170902f68500b0019ad7b05472mr6315388plg.5.1677014064849;
        Tue, 21 Feb 2023 13:14:24 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:30ba:90e9:a2f2:4b50])
        by smtp.gmail.com with ESMTPSA id g19-20020a170902869300b0019c91d7532asm1962982plo.94.2023.02.21.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 13:14:24 -0800 (PST)
Date:   Tue, 21 Feb 2023 13:14:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org, Joe Hung <joe_hung@ilitek.com>,
        Luca Hsu <luca_hsu@ilitek.com>
Subject: Re: [PATCH v2] Input: ili210x - Probe even if no resolution
 information
Message-ID: <Y/U0LTx2O2bVsUKY@google.com>
References: <20230217025200.203833-1-marex@denx.de>
 <Y/UeFbZaMtHLuljN@google.com>
 <bb6ad0b1-dc51-6002-a179-bbe59ff4d701@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb6ad0b1-dc51-6002-a179-bbe59ff4d701@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 21, 2023 at 09:12:29PM +0100, Marek Vasut wrote:
> On 2/21/23 20:40, Dmitry Torokhov wrote:
> > Hi Marek,
> > 
> > On Fri, Feb 17, 2023 at 03:52:00AM +0100, Marek Vasut wrote:
> > > Probe the touch controller driver even if resolution information is not
> > > available. This can happen e.g. in case the touch controller suffered a
> > > failed firmware update and is stuck in bootloader mode.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Joe Hung <joe_hung@ilitek.com>
> > > Cc: Luca Hsu <luca_hsu@ilitek.com>
> > > ---
> > > V2: Add dev_warn() in case resolution is invalid
> > > ---
> > >   drivers/input/touchscreen/ili210x.c | 28 +++++++++++++++++++---------
> > >   1 file changed, 19 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> > > index 4897fafa4204d..d64b6d77d2e08 100644
> > > --- a/drivers/input/touchscreen/ili210x.c
> > > +++ b/drivers/input/touchscreen/ili210x.c
> > > @@ -370,22 +370,33 @@ static int ili251x_firmware_update_resolution(struct device *dev)
> > >   	/* The firmware update blob might have changed the resolution. */
> > >   	error = priv->chip->read_reg(client, REG_PANEL_INFO, &rs, sizeof(rs));
> > > -	if (error)
> > > -		return error;
> > > +	if (!error) {
> > > +		resx = le16_to_cpup((__le16 *)rs);
> > > +		resy = le16_to_cpup((__le16 *)(rs + 2));
> > > -	resx = le16_to_cpup((__le16 *)rs);
> > > -	resy = le16_to_cpup((__le16 *)(rs + 2));
> > > +		/* The value reported by the firmware is invalid. */
> > > +		if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> > > +			error = -EINVAL;
> > > +	}
> > > -	/* The value reported by the firmware is invalid. */
> > > -	if (!resx || resx == 0xffff || !resy || resy == 0xffff)
> > > -		return -EINVAL;
> > > +	/*
> > > +	 * In case of error, the firmware might be stuck in bootloader mode,
> > > +	 * e.g. after a failed firmware update. Set maximum resolution, but
> > > +	 * do not fail to probe, so the user can re-trigger the firmware
> > > +	 * update and recover the touch controller.
> > > +	 */
> > > +	if (error) {
> > > +		dev_warn(dev, "Invalid resolution reported by controller.\n");
> > > +		resx = 16384;
> > > +		resy = 16384;
> > > +	}
> > >   	input_abs_set_max(priv->input, ABS_X, resx - 1);
> > >   	input_abs_set_max(priv->input, ABS_Y, resy - 1);
> > >   	input_abs_set_max(priv->input, ABS_MT_POSITION_X, resx - 1);
> > >   	input_abs_set_max(priv->input, ABS_MT_POSITION_Y, resy - 1);
> > > -	return 0;
> > > +	return error;
> > 
> > I think this will make ili251x_firmware_update_cached_state() continue
> > failing when it reports invalid coordinates. Was this intended?
> 
> This is actually correct, ili251x_firmware_update_cached_state() will fail,
> but ili210x_i2c_probe() won't stop there anymore, see the second hunk of
> this patch. The driver will instantiate the controller, so user can load
> correct firmware into it and recover the hardware.

I was concerned about call from ili210x_firmware_update_store() which
will continue returning error.

Thanks.

-- 
Dmitry
