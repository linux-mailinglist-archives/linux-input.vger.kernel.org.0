Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C641B32B4D4
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:39:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354237AbhCCF3W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235240AbhCCB11 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 20:27:27 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D8C061788
        for <linux-input@vger.kernel.org>; Tue,  2 Mar 2021 17:26:42 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id e9so3138145pjs.2
        for <linux-input@vger.kernel.org>; Tue, 02 Mar 2021 17:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PUQjqFDH1bMaHbWyDGO24JQyxHhohlIX9em1uTvZ43Q=;
        b=M8irt/6WzBDIgrCSep1fslauUpttS7+KoNFwa7FhHEqbMTCb8E2yy/483XSV1LfYvf
         36YvDHnC1FU/PCwLK3QGDD6ipnSYPWWgEOir/mzyIis93vO3eTafzLAY0rAAjR4iQnH0
         whYlXH3buF9AfJ5qxXV7BE0/RP1rMoPF8Um2DtU7YEekalyZIpCM0UcAxLE1nx9LLLq5
         idEBaEJUdUqJzXX5tkkfom7+9WXJWrloxC2CWJoiyLmDVG5N3ovXzo9G6CSG+pzk3gz9
         kKmf9a+gqqmLSaRR4W06CqXSHdSr+pBiwk6xHDK7welXhUllHtMoGbbxfb3NWhdf9+sE
         8w8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PUQjqFDH1bMaHbWyDGO24JQyxHhohlIX9em1uTvZ43Q=;
        b=o5CWafp4RzkoiD4mwxeCD/L7IbI0GWYNBu42cRmpIl191WItHi2AQFtuQxG14ZqDmO
         RZ5/gVeGFmjwKhxjrcEy6SdkTejlK+3G0QSksjDzQQ22lKWvdp9Vo/CLsgKDtRBEJgqK
         jBNKBWxYxaqlt4w6KoUwdP2KN996FpO3/icjtAD5AB5TNS9of82ZHns9n466ppG4qDlR
         a4KpT6AfA3u6DZ5rCFKNQ+p2m2mMn74A3kn2RGczrx9M4fCYhnYamiqUiDUPE4EL8nzM
         zzMyiI91xuTBYQLxJqBcFb3FUNEGkNQU2NDRnv6edhK6WvjlK7uDX+nb1dIWveBql2U+
         iidg==
X-Gm-Message-State: AOAM530yiNld0AnxXTiLtCzJ6o+MaBt5t4xxBsMWpT/p5yOdSjA4Sw/C
        7OqMUaqxK7VFrsc7y3kh2Vq2MM8wwaM=
X-Google-Smtp-Source: ABdhPJxVkgJ5K0oKFV1A8refEGifAHDCZidFPsr4Vts+a/gBqxpWirNE/aBglMhjv8K97PJ8WRe32Q==
X-Received: by 2002:a17:902:bf06:b029:e4:951e:150b with SMTP id bi6-20020a170902bf06b02900e4951e150bmr740159plb.42.1614734802397;
        Tue, 02 Mar 2021 17:26:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:2074:dba8:1918:3417])
        by smtp.gmail.com with ESMTPSA id z2sm21769122pfa.121.2021.03.02.17.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 17:26:41 -0800 (PST)
Date:   Tue, 2 Mar 2021 17:26:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jingle Wu <jingle.wu@emc.com.tw>, kernel@pengutronix.de,
        linux-input@vger.kernel.org, nickel@basealt.ru,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: elan_i2c: failed to read report data: -71
Message-ID: <YD7lzrUm4iU5C+Q+@google.com>
References: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210302210934.iro3a6chigx72r4n@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Uwe,

On Tue, Mar 02, 2021 at 10:09:34PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> I just installed Linux on a new Thinkpad E15 and I experience a
> non-working touchpad. I can move the mouse just fine, but when I press
> one of the three buttons or move the trackpoint the kernel log gets
> flooded with:
> 
> 	elan_i2c 0-0015: failed to read report data: -71
> 
> and nothing happens in the GUI.
> 
> This is a kernel from Debian testing, i.e. 5.10.13, during probe of the
> device the following is reported:
> 
> 	elan_i2c 0-0015: supply vcc not found, using dummy regulator
> 	elan_i2c 0-0015: Elan Touchpad: Module ID: 0x000e, Firmware: 0x0001, Sample: 0x0000, IAP: 0x0000
> 	input: Elan Touchpad as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input21
> 	input: Elan TrackPoint as /devices/pci0000:00/0000:00:1f.4/i2c-0/0-0015/input/input22
> 
> I backported commits
> 
> 	056115daede8 Input: elan_i2c - add new trackpoint report type 0x5F
> 	c7f0169e3bd2 Input: elan_i2c_core - move header inclusion inside
> 
> to this kernel, but this didn't help.
> 
> When enabling smbus tracing the matching events are:
> 
>  irq/159-elan_i2-2207    [003] ....   963.625641: smbus_read: i2c-0 a=015 f=0040 c=a8 BLOCK_DATA
>  irq/159-elan_i2-2207    [003] ....   963.629247: smbus_result: i2c-0 a=015 f=0000 c=a8 BLOCK_DATA rd res=-71
> 
> The relevant code is:
> 
>         len = i2c_smbus_read_block_data(client,
>                                         ETP_SMBUS_PACKET_QUERY,
>                                         &report[ETP_SMBUS_REPORT_OFFSET]);
>         if (len < 0) {
>                 dev_err(&client->dev, "failed to read report data: %d\n", len);
>                 return len;
>         }
> 
> I think the failing location in the i2c driver is
> 
>         if (read_write == I2C_SMBUS_READ ||
>             command == I2C_SMBUS_BLOCK_PROC_CALL) {
>                 len = inb_p(SMBHSTDAT0(priv));
>                 if (len < 1 || len > I2C_SMBUS_BLOCK_MAX)
>                         return -EPROTO;
> 
>                 data->block[0] = len;
>                 for (i = 0; i < len; i++)
>                         data->block[i + 1] = inb_p(SMBBLKDAT(priv));
>         }
> 
> in i801_block_transaction_by_block().
> 
> Does this ring a bell? Does someone know if there is documentation
> available?

I believe Nikolai also run into this issue and is saying that

	modprobe i2c_i801 disable_features=0x2

cures the touchpad.

Thanks.

-- 
Dmitry
