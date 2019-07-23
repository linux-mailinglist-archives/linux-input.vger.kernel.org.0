Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADE17170B
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2019 13:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389480AbfGWL3c (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Jul 2019 07:29:32 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42221 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727826AbfGWL3c (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Jul 2019 07:29:32 -0400
Received: by mail-wr1-f67.google.com with SMTP id x1so27789687wrr.9;
        Tue, 23 Jul 2019 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=f8H6U0+3Sk4VYW6Aa+OCSbWW6bgtEY44sozfQ1JdKIY=;
        b=emqkyIl67MRV4609gb6UHgsPFJpQTqlY4AIKr/P6xdna1LnwSmTV4o+KTXRKbgKxJO
         mqNeikCn49SdlGW+GBw61Y+n265yxRMms2f7q1XcqsSBSdSZkGBlSWI1FvVEuSvrQCMR
         K5GNF5WX5EIMFNTL6wuv7rFLTPby8/mx2C/265t6R0/uuzT5ZP9jX8Jnzrnzw+M5P2oH
         Kh5y9HyxFL0lRtqdeUKc4S0VrXuNDEpjv6DTSzz4NMGg2wvjHXtAUBCUjTe66k5w+PaF
         3OgAQPu303zjhz+oXRI01G/vfdFYlK/tWYr710+6b3DtsOtsfaRYfN0R8wDC6s62Vi0S
         Aq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=f8H6U0+3Sk4VYW6Aa+OCSbWW6bgtEY44sozfQ1JdKIY=;
        b=Zyr2nLKU9tEl4DVNtJP9IRDHW4tDEcav+WL9imX7Xk7K+zD+47WcCPigG8RLkVLGow
         62VsbCMGdM3H6qdAEooV0PPUMVUMwCWmEC36q8QenGsIh/XCff6fjNP08Ipdc86ftlq2
         6V1kcAAftuWu/ddG1ZVM5fsWnxouHM+pOpswfD98wZjhBo6rQQ6mBQKa60aI5s9uZ/+M
         8OxxdweItfI3pMQU4oKBY1M3oXDw/YmBzvPFzVyzQFuW4UGzAv95nrI5IRQa8eRJIeha
         9RRVXzkt9f7wZjk6jdii0fG4AggDBtgkKkyiEF3schY1SEH1rzw3YDUG9B0GhW0OdgPR
         HCRA==
X-Gm-Message-State: APjAAAVFmlXsXgFPrLosU3HUVntpxMNL77s6e4B/qhhZFRniVFmNQMNR
        2AN3X4qx5J5tmpwl3xH6AoU=
X-Google-Smtp-Source: APXvYqyRhaDv6KIgHD/AiOmbAATBBVRRDSQIUYC9zkJu06oXfg1tQ7o6XRww3imaVKsQ687Ybt6GfQ==
X-Received: by 2002:adf:f204:: with SMTP id p4mr2251248wro.317.1563881370004;
        Tue, 23 Jul 2019 04:29:30 -0700 (PDT)
Received: from [192.168.2.202] (pD9E5A8B2.dip0.t-ipconnect.de. [217.229.168.178])
        by smtp.gmail.com with ESMTPSA id t13sm52324256wrr.0.2019.07.23.04.29.28
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jul 2019 04:29:29 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] Input: soc_button_array - Add support for newer
 surface devices
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20190720150511.95076-1-luzmaximilian@gmail.com>
 <20190720150511.95076-3-luzmaximilian@gmail.com>
 <a2f75544-54ce-abce-56a4-ca226dbed51f@metux.net>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <901b9b74-4c59-9c6a-ce41-404d8885cb83@gmail.com>
Date:   Tue, 23 Jul 2019 13:29:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2f75544-54ce-abce-56a4-ca226dbed51f@metux.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 7/22/19 10:00 AM, Enrico Weigelt, metux IT consult wrote:
> On 20.07.19 17:05, Maximilian Luz wrote:
>> Power and volume button support for 5th and 6th generation Microsoft
>> Surface devices via soc_button_array.
>>
>> Note that these devices use the same MSHW0040 device as on the Surface
>> Pro 4, however the implementation is different (GPIOs vs. ACPI
>> notifications). Thus some checking is required to ensure we only load
>> this driver on the correct devices.
> 
> Could this also used on the older (pre pro4) devices (also using the
> gpios directly, and leave off acpi notifications) ?

As far as I can tell, no. The Pro 4 and Pro 3 don't have any GPIOs on
MSHW0028/MSHW0040. Book 1 has GPIOs but for a different purpose. The Pro
2 has a standard PNP0C0C power button (no idea how the volume buttons
are handled there, but also seems to be different from what I can gather
from DSDT). I can't say anything for the Pro 1 and non-Pro devices.

Maximilian
