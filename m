Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F24A51A0FBD
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 16:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgDGO41 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 10:56:27 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37634 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728855AbgDGO41 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 10:56:27 -0400
Received: by mail-lf1-f65.google.com with SMTP id t11so2631148lfe.4;
        Tue, 07 Apr 2020 07:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nRvaZx0CW/m/jWE2uVOD/eMgFMwO805CIg6iMnzrwfQ=;
        b=Rh5ZIXJ4BX4A7nfqy6jJldrDXLrwYgycJ/H8JLJWXCvAnXodELRZ53RFkm3+Z2xHbJ
         +fc7dcYqOpaccDSskefX0R8SR+7kgNP0e/WcCD0m+uSJuyoDTBupMrxxiIE6Xg91UPZJ
         In2jU3YBFxtRnMXmd9taBho56WrB9B+YkfrtAKmG9uvfdr98S6nPAQFtVuGuwhGbWxgZ
         b9ppQzm8pAZ+ziRGQ9ykxstpzeQsZo+q5NQE0TZ75vkJl4JgsURr5d34oIWtkZw7exDe
         SFsNWrGYN7V5KJTCOYTiQZ0+g37mbSy1fc2F3ak3X0qePEU3Pd1TqcT7tKJzFL++5J3F
         zJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nRvaZx0CW/m/jWE2uVOD/eMgFMwO805CIg6iMnzrwfQ=;
        b=gEir9mjeJuRcgvH8SFiFtqNEWM9yBF1HQz4L8qSCvD7Y0ZGT58b0byPZMLfw6Y9qCm
         LM6zK1aGfb4Ct2uBHYCtAT6v+fFBAGxlDFirtde8sfHfuxGkvqRXCAB9bEq36oSpDWGf
         eB7iggNrW3PXgnQS/Z5znF9LBC4OvA66GpU2+Jh1SLUp1l/fH85yue/W9e8BqZ7YlLjj
         icA9W6G1ql8n+9kOmfKElBmVFgztMjcl1OTcou6vlaT7de6Mr6TI2000mLteYj8OxLZW
         tnmpEbh3n46AC5C+/5AflZ9OuALibKpB5HgApbk763fcDKabZxdj70Rpsp0PcLdN9pqx
         6+zA==
X-Gm-Message-State: AGi0PuZtNq9XD/Oaa1iaK7snIRLrHnabP5HRCYTjRllWc92aNni78rwA
        tNKAV9TtcmqlYWs38VgegfTt4QzR
X-Google-Smtp-Source: APiQypL6B8kp5TQs+FJdHUEYk9FXX4Z/oe5sNVyJwhksdok7qiY1iCawCoZgHR01tr1EVXCvQvZqeg==
X-Received: by 2002:ac2:4d07:: with SMTP id r7mr736918lfi.14.1586271384280;
        Tue, 07 Apr 2020 07:56:24 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id x29sm10512013lfn.64.2020.04.07.07.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 07:56:23 -0700 (PDT)
Subject: Re: [PATCH v10 20/55] Input: atmel_mxt_ts - handle cfg filename via
 pdata/sysfs
To:     Jiada Wang <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-21-jiada_wang@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d926e4be-84ee-24f3-3523-776e763e6d4e@gmail.com>
Date:   Tue, 7 Apr 2020 17:56:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200331105051.58896-21-jiada_wang@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

31.03.2020 13:50, Jiada Wang пишет:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> There may be multiple maXTouch chips on a single device which will require
> different configuration files. Add a platform data value for the
> configuration filename.
> 
> Add sysfs entry to write configuration file if the platform data is not
> set.
> 
> Split out the object initialisation code from mxt_initialize() into
> mxt_configure_objects() to allow this.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 71a2a4d1954460b949a16b607f72bafab294ca79)
> [gdavis: Resolve forward port conflicts due to applying upstream
> 	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
> 	 data support").]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [gdavis: Squash fix from Vladimir Zapolskiy:
> 	 - Input: atmel_mxt_ts - fix error paths in mxt_configure_objects()]
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> [jiada: Separate Documentation/ portion change to another commit
> 	Rename mxt_update_cfg_store to update_cfg_store
> 	Replace DEVICE_ATTR with DEVICE_ATTR_WO]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 109 +++++++++++++++++++----
>  1 file changed, 94 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 720574417219..d1865250f492 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -34,7 +34,6 @@
>  #include <dt-bindings/input/atmel_mxt_ts.h>
>  
>  /* Configuration file */
> -#define MXT_CFG_NAME		"maxtouch.cfg"
>  #define MXT_CFG_MAGIC		"OBP_RAW V1"
...

>  static void mxt_input_sync(struct mxt_data *data)
>  {
> -	input_mt_report_pointer_emulation(data->input_dev,
> -					  data->t19_num_keys);
> -	input_sync(data->input_dev);
> +	if (data->input_dev) {
> +		input_mt_report_pointer_emulation(data->input_dev,
> +						  data->t19_num_keys);
> +		input_sync(data->input_dev);
> +	}
>  }

Looks like this hunk shouldn't belong to this patch.

...
> +	if (data->pcfg_name)
> +		mxt_update_file_name(&data->client->dev,
> +				     &data->cfg_name,
> +				     data->pcfg_name,
> +				     strlen(data->pcfg_name));

This looks wrong to me because I think the cfg_name should fall back to
"maxtouch.cfg" if atmel,cfg_name isn't specified in device-tree,
otherwise this commit may break devices that use an older device-tree.
