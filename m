Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA2695D06
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 13:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbfHTLQM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 07:16:12 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54133 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728414AbfHTLQL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 07:16:11 -0400
Received: from [192.168.1.110] ([95.117.23.32]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M8QBa-1hvcGg03Oq-004QRK; Tue, 20 Aug 2019 13:16:10 +0200
Subject: Re: [PATCH] input: misc: soc_button_array: use
 platform_device_register_resndata()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <1564410372-18506-1-git-send-email-info@metux.net>
 <20190729172313.GA755@penguin>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Organization: metux IT consult
Message-ID: <6781780e-a01f-a9f4-62fa-c36e105a4b76@metux.net>
Date:   Tue, 20 Aug 2019 13:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190729172313.GA755@penguin>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PQPE9hNcWVuDwUGcotS3kp/AOb4M67BDPM5QWpPFH14NjMIsj5T
 7KR/tRuhB+b0/awpCX5Pffo/iMTmNoSOl3rLe6oibOO4Oi19/0eay18EGtVeBnlHAhTGQ8u
 7tg2rxg0YTSR3OKzKKAEkDrfObXMXvwCpci7labeqir7WWTVmi+mJo8v2lg8BnBYIVGVdSg
 qeouxYE1Q2nYejqhlMuJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0En8AnrOR8o=:SUFmKTawDT3GkJs1TrqqVR
 t9e1bW9t6ZB4p8sE8Rh+v3psE6sT5zza2pUVw7glpYBkU0V6awgiUyr5Y5CiuBwu5jsvcipXV
 gC++9PokfJNV52wuNjZgI+F3jPX2ooGqA5PR+dDtvItw7zBxMwBB1t1jvCeevhEq+NpaROkaA
 lX6OSfYoVmr1KbRCrcrP+Bx6DStgkbxyph8yVwXw4YVCWwuoU7xsPi+fqy7jVTyPr33THjGPW
 AyUuH69gEmZJmPgRaGrs5Hluw0C+GwNL6mtCPUbZa9eQNEd6yCUWmMjpGIsSsqm88tXIvkMbY
 +PdDuU1fXt4Y0ngZ4sNDQE8O2VmIKgUitnLYU2cbIb3n906MXHdKqKvb2qZp0CgOwu8cAJvc5
 OqNT8q+we92VTEwOHcTxiDUhQ5uIMhVZbWQBuJE/Xlb84cErWFlkJn/3f2ncZNu0dpRGe2Ipf
 zkMI0uhQc43po/V9jxZ7W2krFfY0hUQdPRNEo91VTzpmrj2IxdmxVbudJMVJVDkIjO+AtktCX
 Nhd5yc6DzFbHqfFnx8dFufEx4UpDlL2OsseDbqBXAcXshXxeMd1Wm/T/TFB2PSoKp9cAGtRCb
 ASyA7sFoDZbTPO+YxZKwZK4VqW7lFVAvGgQuWPmJyX7vIcCMNe2IdT3bufgucQcV2GbYsP9mx
 qsn90f/HgPI8rUGQehlJzr6/qbO1wgZ+udxCwg6TxCvwDNqV68llDjpTF7HUQwdSZHNu0qpLm
 ZtWehENYpx+Sqw9xoUf160NXaDJZjc8bn4anq6tXvUJ8HhsvXq7TiePUj2A=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 29.07.19 19:23, Dmitry Torokhov wrote:

Hi,

> I wonder if we should pass &pdev->dev instead of NULL here to form
> proper device hierarchy, now that we have this option.

good point, thanks, fixed in v2.


>> +		"gpio-keys",
>> +		PLATFORM_DEVID_AUTO,
>> +		NULL,
>> +		0,
>> +		gpio_keys_pdata,
>> +		sizeof(*gpio_keys_pdata));
>> +
>> +	if (IS_ERR(pd)) {
>> +		dev_err(&pdev->dev, "failed registering gpio-keys: %ld\n", PTR_ERR(pd));
>>   		goto err_free_mem;
> 
> Since you did not assign 'error' value here this goto will result in the
> function returning 0 even if platform_device_register_resndata() failed.

Uh, thanks. IMHO it's even worse: 'error' could be uninitialized.


I'm sending v2 separately.


Thanks for your review.

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
