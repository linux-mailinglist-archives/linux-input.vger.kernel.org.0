Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67E4C8B460
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 11:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727129AbfHMJkm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 05:40:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37549 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbfHMJki (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 05:40:38 -0400
Received: by mail-wm1-f66.google.com with SMTP id z23so863671wmf.2
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 02:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=t6fEiZ4sytTb7mfNqU+GHgkx4N2cyC0uVxBfUPG4iKY=;
        b=ZvsLh64Nk3rAwaI66fNByKOuqlUAVATJ7Anm+IGbigwF8Q1o/w3VJaWo75OL9J4RRh
         P6MM9VWap5aQfI/N7Lx2+MPdZtbDCPIaa38ij3O+dLMzs1uq4WksSPOpkiqrGPZURKOw
         F9ySGABl4fJIkLR2xFs7vzM02DlcYhTIt+TzjRUa9xYdL1zKROAHi2grMg0I75OWzLFr
         dNy0bYJ1bjGDxrwJnHYFPYYpdH9lagy5q2wRtvnRF6Vu6oz+I/mHuHZFELJiQ2Sm7GuK
         YRLTo+KSwWDHBc4xeE4N5MDdSOEMhHG+XEenWOrsZXIIrZFvWTBFsPxKm2ppGMuAc3HW
         6jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=t6fEiZ4sytTb7mfNqU+GHgkx4N2cyC0uVxBfUPG4iKY=;
        b=h/GHk6m9TfgxrZouNivf63vpzSWU4VfirKaFhHzrtrizO/ExabTIVfEMM8v+WuYVVq
         nLSod+vLQK8PxVvBhg6CZJakw9Iu4RpIIbiT8jKztcj7gWHg+w5UVTQRroG/ponXXFv6
         eFQ34cGhnPFfXmMfffE8cLMbA/3w3NbsQBcnkn+kebLZf0+IUJlMGHv16BBMxXIl7ax3
         2i9UVQIdAejO+Sl3ry3Ly8LfGmvVEi6FzZTYsJK3h8pwCWY73v2dPYVukmDVOHWm8SqS
         sxACm8+xQbEEBTrAj31qXzwGWFkzNv3YZBsamHWRZPi/u2vC7dts+LLkMt9VB0b8OafT
         iNgg==
X-Gm-Message-State: APjAAAVY0gfeS7+bN6b4/QOX/tu7Lq/T2ShluLJDqD3azA1sESTl38p1
        pMmmYTKdoMGjF2HH5al6M5q6zw==
X-Google-Smtp-Source: APXvYqxtZp5y+W/eo8hxCFccDh9B73EN2zN9q/ucA2LVNH+5drh1g1mUkC7z2xIrJUpFbM+AMvB0iA==
X-Received: by 2002:a1c:9a4b:: with SMTP id c72mr2089507wme.102.1565689236579;
        Tue, 13 Aug 2019 02:40:36 -0700 (PDT)
Received: from [192.168.86.34] (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.googlemail.com with ESMTPSA id f12sm122487785wrg.5.2019.08.13.02.40.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 02:40:35 -0700 (PDT)
Subject: Re: [PATCH v4 3/9] nvmem: core: add nvmem_device_find
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Evgeniy Polyakov <zbr@ioremap.net>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        netdev@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20190809103235.16338-1-tbogendoerfer@suse.de>
 <20190809103235.16338-4-tbogendoerfer@suse.de>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <8d18de64-9234-fcba-aa3d-b46789eb62a5@linaro.org>
Date:   Tue, 13 Aug 2019 10:40:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190809103235.16338-4-tbogendoerfer@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On 09/08/2019 11:32, Thomas Bogendoerfer wrote:
> nvmem_device_find provides a way to search for nvmem devices with
> the help of a match function simlair to bus_find_device.
> 
> Signed-off-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>
> ---
>   drivers/nvmem/core.c           | 62 ++++++++++++++++++++++--------------------
>   include/linux/nvmem-consumer.h |  9 ++++++
>   2 files changed, 41 insertions(+), 30 deletions(-)

Have you considered using nvmem_register_notifier() ?


--srini
