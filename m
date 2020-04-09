Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6842D1A369E
	for <lists+linux-input@lfdr.de>; Thu,  9 Apr 2020 17:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727826AbgDIPK1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 11:10:27 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36977 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgDIPK1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 11:10:27 -0400
Received: by mail-lf1-f67.google.com with SMTP id t11so8175818lfe.4;
        Thu, 09 Apr 2020 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AWu7ly8ItGyDOeD0JQxt2JEqPPHgsfp9FAGvOUGryC0=;
        b=bHJ7fjU2KKm/uLVeVULQQO8yluAf/ZBYOIeESREXwzQ7ENmXgpIgP2E/mdosCcVgNl
         YHOVjLinnf0vNl7UcZO3cfLASbNCoYcg4WNauMDNRiN2sWFmx8spWp+xoWXa32ZIn38e
         y/DRc2TtqirXpiodV/UrfTtqm7G/ZyxgnXDTA6H4cW9TF4CEjXYqqhtsLcsz4X7DD8Fh
         KWsE9/bjHDFgnwKgI+7cd14NHq64sxA/FEI3ixHsX6PqAZX5hLqkicOxa0MSptX9fzzP
         ns3naKQ4RjPEGoiPzBWwI4b99+219kHMCbkX77VR1ULmWuOFDi10KqXYUQQF1t5RGqHv
         lPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AWu7ly8ItGyDOeD0JQxt2JEqPPHgsfp9FAGvOUGryC0=;
        b=hJPoZ505KqbjmSttTJQmhnyeU9EZs4MEOpzVlL6+bCls5QwkVcadq3tmmdD6204ZLN
         qbjXicikDhfNlIWRn7BRJzdREOGddYEudC/rynSP1FwHmTgUKwOh0av1A80P9O2c7wTb
         7UMJcv/OPWlv0cPsgl2DcFYOQSpENVpr9mSDVba60hlTy7EaTLdjIz2QtzB86wiSm8rL
         VJZnM2UmVr24PZHR6kp89lSyOIQ5MchYxSdO1Q0mRFEaphOsC34GvxEQs5KzMhWYbVVF
         SdoKfCgznMIRTWO0buHlfZhCUFKA5z1s2nfIl6JB6YDE3tmkxDX/JGYNyijlL89qoptD
         4ppQ==
X-Gm-Message-State: AGi0Pub4KjZtle+Xu/q1R++zIziVKCg0hZ/Hv4687AhcTLdMB0art3tC
        nRxDzaZ0OpZKZb++AKRMy3A=
X-Google-Smtp-Source: APiQypLDC47vIOGr8lVid8MI2cb6itX013nqPaJKnLp50YsozlgcbkCfk6N4psyBu/80FEnGvBPbVQ==
X-Received: by 2002:a19:c385:: with SMTP id t127mr8034817lff.117.1586445025848;
        Thu, 09 Apr 2020 08:10:25 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u10sm3707849ljd.24.2020.04.09.08.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2020 08:10:25 -0700 (PDT)
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com,
        Balasubramani_Vivekanandan@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
 <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
 <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
 <008d019c-2de7-4fe4-0c22-2668312f808b@gmail.com>
 <5abe310f-094c-9355-d533-fb64efcbf726@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <270812bc-8c2c-c564-be8e-4cc18de8670f@gmail.com>
Date:   Thu, 9 Apr 2020 18:10:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5abe310f-094c-9355-d533-fb64efcbf726@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

09.04.2020 09:25, Wang, Jiada пишет:
> Hi Dmitry
> 
> On 2020/04/07 23:47, Dmitry Osipenko wrote:
>> 07.04.2020 12:27, Wang, Jiada пишет:
>> ..
>>>> Is this a software (firmware) limitation which varies from version to
>>>> version?
>>>>
>>>
>>> the timeout issue trying to be addressed in this patch is from software,
>>> one of our board a Serializer/Deserializer bridge exists between the SoC
>>> (imx6) and the Atmel touch controller.
>>> imx6 i2c controller driver has a timeout value(100ms) for each i2c
>>> transaction,
>>> Large i2c read transaction failed to complete within this timeout value
>>> and therefore imx6 i2c controller driver aborts the transaction
>>> and returns failure.
>>>
>>> Therefore this patch was created to split the large i2c transaction into
>>> smaller chunks which can complete
>>> within the timeout defined by i2c controller driver.
>>
>> Isn't it possible to use the max_read/write_len of the generic struct
>> i2c_adapter_quirks for limiting the transfer size?
>>
>> BTW, it looks like the i.MX I2C driver doesn't specify the
>> i2c_adapter_quirks, which probably needs to be fixed.
>>
> yes, i.MX I2C driver can specify i2c_adapter_quirks to limit the size be
> transferred in one transaction.
> 
> But even in this case, mxt_process_messages_t44() fails when it tries to
> transfer data count larger than max_read/write_len set in i.MX I2C
> driver, which we would like to avoid.

IIUC, the transfer's limitation is a part of I2C controller hardware and
not the touch controller, so it should be wrong to describe that
limitation in the maxtouch's DT node.

I meant that we probably could set the data->mtu based on
i2c_client->adapter->quirks->max_read and then the DT property shouldn't
be needed, couldn't this be done?

The I2C core only rejects transfers that don't fit into the
max_read/write_len and nothing more.
