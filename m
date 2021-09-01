Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736D03FE34D
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 21:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344501AbhIATrm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 15:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344440AbhIATrh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 15:47:37 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC5AC061760;
        Wed,  1 Sep 2021 12:46:39 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 586158322F;
        Wed,  1 Sep 2021 21:46:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1630525596;
        bh=tvAsOdRLmbSxiiSSxIJ4TCdwkfaGNgGFlCijIWL22iA=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=IgEOK4Igs1D3NqakG1/qE4Ciw9aII2AdPbFRyo9crHyEGb75EqGqEfgHIgDkR2OKz
         ODfbhD/dj+/lYDEAnBbsfKndY/YIUL+Ao+wGZlwh9o9MbaV4kMxZgjTUj0LJNvQVTx
         OY7xqhLERrl1E/9Az6FqUVRpd8baS/mG8ngQBJQm97HrPkNyX9PZ3eIRt3AlRMLLIf
         2+skC1iGC4Ah9uZLUJNGiyucRsLZ5PO+zNQZrLtOXetY0cUhHqT3fVCNyWLH/FV3BI
         6X6i2xMCPgxGvFUxwhwSxbwhtV38ASa1Te9x2Bwrmntn9PBs1+n8Do8mOIBzHr115K
         s5K3LL4POZO+w==
Subject: Re: [PATCH] Input: ili210x - Set the device name according to the
 device model
To:     Rogerio Pimentel <rpimentel.silva@gmail.com>,
        dmitry.torokhov@gmail.com, hansemro@outlook.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210901192229.29864-1-rpimentel.silva@gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <4e8ad91c-2554-4b8f-94db-aa5add5f524d@denx.de>
Date:   Wed, 1 Sep 2021 21:46:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210901192229.29864-1-rpimentel.silva@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 9/1/21 9:22 PM, Rogerio Pimentel wrote:

[...]

> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 30576a5f2f04..ca7af4a6f588 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -19,6 +19,8 @@
>   #define ILI251X_DATA_SIZE1	31
>   #define ILI251X_DATA_SIZE2	20
>   
> +#define ILI_NAME_LEN		27
> +
>   /* Touchscreen commands */
>   #define REG_TOUCHDATA		0x10
>   #define REG_PANEL_INFO		0x20
> @@ -394,6 +396,7 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>   	struct input_dev *input;
>   	int error;
>   	unsigned int max_xy;
> +	char *model_name;
>   
>   	dev_dbg(dev, "Probing for ILI210X I2C Touschreen driver");
>   
> @@ -440,7 +443,11 @@ static int ili210x_i2c_probe(struct i2c_client *client,
>   	i2c_set_clientdata(client, priv);
>   
>   	/* Setup input device */
> -	input->name = "ILI210x Touchscreen";
> +	input->name = "Ilitek         Touchscreen";
> +	model_name = (char *)input->name;
> +	snprintf(model_name, ILI_NAME_LEN, "Ilitek %s Touchscreen",

Which ilitek devices do you have available exactly ?

There is a firmware interface which does report the device type, but I 
don't know whether it works on all the ilitek touchscreen devices. If it 
does, then it could be used here to pull the type from the firmware and 
then use this instead

snprintf(model_name, ILI_NAME_LEN, "Ilitek ILI%04x Touchscreen", type);

Try this command against the touch controller, it sends it command 0x61 
and reads two bytes of the reply:
i2ctransfer -f -y 1 w1@0x41 0x61 r2
0x10 0x25 # <---- on ILI2510 it reports 0x25 0x10 in reverse
