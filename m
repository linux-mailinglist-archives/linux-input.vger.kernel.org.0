Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411681AFD31
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 20:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgDSS2Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 14:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgDSS2Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 14:28:24 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86844C061A0C
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:28:23 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id ay1so3095430plb.0
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DQrHhgPvHXmSwfvumksYRKaNlzXcpzMYVnlY19x/WRo=;
        b=Pu8n2CSNuHRXpcY5QQpl9EeeQ7E+vnAMm4QMFhF8md5De9QT3Wm+7mQ9h+nTuA78r7
         lFrNquw5+WaGDX6eHHnvxCF61WMDuDaTYKnIKanV7xeLv+M8MVrVf372aGsJQTxRef0e
         GI9Nh5bsuuQ63Kz6MLqfKqAsBKgp0KQj/EQOLZhYYIwEDGxSECac84w9u7i9t8MgYzQ/
         y4CyeFZ6R+xFBNHGV9Xg52TESvDbx/s9ZuQobgizG0WpWUDl46zSCad41MKHl3EhbOnv
         c91GiTucaYMiuyGXKeyL04bU2GL34LH8MYs8YgYg28Vve6o1Tguw3WeXG5B2dNdwuIBT
         0a8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DQrHhgPvHXmSwfvumksYRKaNlzXcpzMYVnlY19x/WRo=;
        b=OljIscMesHqVobuYPTENL7RFQ5+TNEv2nbCIRKWXyU3lgaDFFczRImfBmqu52LZvnm
         rpaUJWGrsWe7wEy7maYukOxxItGB45tAOPWICn+WOgoXkd+MJUwlDNWmB0fpRegP95EY
         GRtf7k2GXKbprwM4+hE+vN5qfZlBZ6XBpgJKmulBossuK6gwtQAAihNBC3Dc3p7pVA+k
         mhe6tqPKGXfb74s3P3RoZQZPJiu1keMIbiiKmmyf422Cva7r2B2Ke5nNsO8p3WsetZMt
         JNtBK4Vtlch/nKRoC9mqXT6og3xx90rRDGjonnAPYiB/ZxdqnhSV/UgLQx5/OzkAHq7y
         syaw==
X-Gm-Message-State: AGi0Pub26vupm00gyCUifHF8v6jGejJbQqRakLeD1hV1NfZuWKtD9+yJ
        RdelP0ekiJTcMVXIS98MKbPIKtKK
X-Google-Smtp-Source: APiQypLwpdSE7x/8k9c2GBd16WmX68vw/kOiL4qL4c3rJhklEZHtqbnhlG39oZ0/aqByn+UeW7xKCw==
X-Received: by 2002:a17:90a:9386:: with SMTP id q6mr16935775pjo.196.1587320902837;
        Sun, 19 Apr 2020 11:28:22 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id h16sm25111974pfk.38.2020.04.19.11.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 11:28:22 -0700 (PDT)
Date:   Sun, 19 Apr 2020 11:28:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     haibo.chen@nxp.com
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH V3 2/2] input: egalax_ts: fix the get_firmware_command
Message-ID: <20200419182820.GM166864@dtor-ws>
References: <1586937663-13342-1-git-send-email-haibo.chen@nxp.com>
 <1586937663-13342-2-git-send-email-haibo.chen@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586937663-13342-2-git-send-email-haibo.chen@nxp.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Haibo,

On Wed, Apr 15, 2020 at 04:01:03PM +0800, haibo.chen@nxp.com wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
> 
> According to the User Guide, the get firmware command is
> { 0x03, 0x03, 0xa, 0x01, 'D' }, ASCII value of 'D' is 0x44.
> 
> This patch fix that.

You are absolutely right that 0x03 0x03 0x0a 0x01 0x44 is the proper
sequence for the "get firmware version" command, however, despite the function
name, we are not fetching firmware here, but rather try to check if
device operates normally via the "check active" command. So if anything
we should rename the function to egalax_check_active(). We should also
try reading the data sent back by the device and verify that it is what
we expect.

And if you indeed want to retrieve firmware version and controller type,
that should be separate functions.

> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---
>  drivers/input/touchscreen/egalax_ts.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/egalax_ts.c b/drivers/input/touchscreen/egalax_ts.c
> index d3dc6d14bb78..1da6ddb9b4ee 100644
> --- a/drivers/input/touchscreen/egalax_ts.c
> +++ b/drivers/input/touchscreen/egalax_ts.c
> @@ -171,7 +171,7 @@ static int egalax_wake_up_device(struct i2c_client *client)
>  
>  static int egalax_firmware_version(struct i2c_client *client)
>  {
> -	static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x41 };
> +	static const u8 cmd[MAX_I2C_DATA_LEN] = { 0x03, 0x03, 0xa, 0x01, 0x44 };
>  	int ret;
>  
>  	ret = i2c_master_send(client, cmd, MAX_I2C_DATA_LEN);
> -- 
> 2.17.1
> 

Thanks.

-- 
Dmitry


