Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1E471A3E78
	for <lists+linux-input@lfdr.de>; Fri, 10 Apr 2020 04:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbgDJCvo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Apr 2020 22:51:44 -0400
Received: from cmccmta2.chinamobile.com ([221.176.66.80]:39480 "EHLO
        cmccmta2.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726538AbgDJCvo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Apr 2020 22:51:44 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.7]) by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee75e8fdf1e582-f778e; Fri, 10 Apr 2020 10:51:10 +0800 (CST)
X-RM-TRANSID: 2ee75e8fdf1e582-f778e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [172.20.21.224] (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee45e8fdf142a7-a539c;
        Fri, 10 Apr 2020 10:51:10 +0800 (CST)
X-RM-TRANSID: 2ee45e8fdf142a7-a539c
Subject: Re: Input: ep93xx_keypad: Checking for a failed
 platform_get_irq()call in ep93xx_keypad_probe()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-input@vger.kernel.org, Allison Randal <allison@lohutok.net>,
        Arnd Bergmann <arnd@arndb.de>,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        Olof Johansson <olof@lixom.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <11aecb68-d243-2eeb-0cc8-50e1ec22bd71@web.de>
 <20200409204819.GR75430@dtor-ws>
From:   Tang Bin <tangbin@cmss.chinamobile.com>
Message-ID: <55fdfd83-dc4f-36e9-b8a7-96ad4881a2ce@cmss.chinamobile.com>
Date:   Fri, 10 Apr 2020 10:52:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200409204819.GR75430@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

On 2020/4/10 4:48, Dmitry Torokhov wrote:
> Platform code historically allowed creating IRQ resources with IRQ
> number 0 to indicate "no interrupt assigned", so this driver tries to
> filter out such conditions. The negative IRQs (errors) will be rejected
> by request_irq() but I guess we can lose -EPROBE_DEFER. We could do
>
> 	if (keypad->irq <= 0) {
> 		err = keypad->irq ?: -ENXIO : keypad->irq;
> 		goto failed_free;
> 	}
>
>
I have been aware of this problem for a few days, and by doing 
experiments on the hardware, I have found the following ways that maybe 
suitable：

     if (keypad->irq <= 0) {
         err = keypad->irq ? : -ENXIO;
         goto failed_free;
     }
     or
     if (keypad->irq <= 0) {
         err = keypad->irq < 0 ? keypad->irq : -ENXIO;
         goto failed_free;
     }

If you think it's usefull, I will send this patch to fix it.

Thanks

Tang Bin


>


