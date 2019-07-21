Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC856F4F7
	for <lists+linux-input@lfdr.de>; Sun, 21 Jul 2019 21:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfGUT0S (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Jul 2019 15:26:18 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:40865 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbfGUT0S (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Jul 2019 15:26:18 -0400
Received: from [192.168.178.220] ([46.5.7.218]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N6srH-1iUfot0KmF-018MQk; Sun, 21 Jul 2019 21:26:16 +0200
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20190721072303.GA607@penguin>
 <20190721123756.10046-1-markus@notsyncing.net> <20190721174806.GA824@penguin>
From:   Markus Koch <markus@notsyncing.net>
Openpgp: preference=signencrypt
Autocrypt: addr=markus@notsyncing.net; prefer-encrypt=mutual; keydata=
 mQINBFzhXn8BEADZJoz838bVn5nbVV/6uaDlH1ZS6cppZYALxbawkUCb252qEBvh4/y86bed
 ksqAwzEjo9lstNT3NLXh4/1jOzVlP2jggmd8kVtHbrLulLWQ/cgWTpGI5t+rhl169nT4ZUg8
 x2xe4AhM/AEwIoqtorTRHd8Ti/9nvrquoD/1nqE6xyNGCvQIJzuSBb3y6VYPRM5pHeh+xibx
 vc844VIR1Z4JKTdzbuYAx1EC4debMICu/fuPfff+lgHcLL2Ypnb9swUX+XxuBgYUKpIiumx4
 2W5Wx25nmF+frvJkWBIEEkilS1K9iczPuJWJAOF8+3RuaOCN7nTW2e/7QZt/SxFcHWtj/ewB
 fMEU6NgpO9cCBT88STFc99zoQQH0Bk0ZPEdtD1SUHzIRkqPapBFx8SuBsVBAumG6Qcdmp6rD
 NpLF6sBaFG44XLZqCLdixk46lQXObGm0DaiGG3ogwoaja05vJOQc5w5iY5TwRuYtlCKX/RBs
 DrF9Wl1G9W4mkgHXWvEmIgAGvg+LLzDlnMqXOVUsewsbWsWdo6oNnBTyL1jclkBodpjtyTN1
 8eKV65W0F0eEW6A3vr4SrQ2SGtn78Y1OwLcG0KSwB3DWpcd7HgELaxw60Nu/6SI4qTnDESEu
 yzB0Ewv7BkzJ96FU4EFoNR15Fxdi1blPk+Iu3fCZ4pMLG6C+3wARAQABtCNNYXJrdXMgS29j
 aCA8bWFya3VzQG5vdHN5bmNpbmcubmV0PokCVAQTAQgAPhYhBECd7PeBtW8oQNFqPmVOAc8C
 8mRIBQJc4V5/AhsjBQkJZgGABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEGVOAc8C8mRI
 fmAP/3a8RO/EQm5Uikc5zmo7h7CHteM9RSHpMPbvzKA2e+4m198LNn//TXpMZxopQ7KyYVfW
 uFIl1JV3UEW5wqkym48i6rrybylmSkhA69Hq1pnk8a5rlrxdrucid1EHm1GmkQZj81lmjB1X
 Z5w1k7vkQNVi9JaQU/cKxfq5rjK9Slz8R+j+8B0F8nSoU4In+1DzN6mmYnaCdaaQZJJvmFKa
 QhcOGIaPViIsYN5vuaHRIMdK60PXsRMnqGdH+rhZ7rCjfhsCtQX2sGQ3bEGsVE8G5DGGbfdf
 hnhwojPk7d1kmOatscxvV6WabATQ7Jq/b5QbE9V8F4G/VtRRhsrN6fmCYxWOI93XejqPk+ic
 s9s2BJH4PiQ5A75CQiwT7SYBAIfcxVqnbbvh28yg3py3nVaodJgJdgTT49V3LqqKG+1bW+vX
 7ue232o2CQYYujYx6dzn9xMYCyWh9FjRbEbbnUIN63m8kPLpXEAAw8VDZxI3gFzynb2h7DHd
 YMVRBkYO1MDlviy6PSozbrtkZlmMYK9TEChoIys16hKzMsHNHKtj50Iaqf8/stGwPCQCAkRS
 2K0WYUqlycUuLlCCNmI7UENKmS13u+Gr6/YzmeuVrMD/Aom0kXtTEO01bZV82JuUe7HaxWbe
 jVVYH+doefmZhwHuSlv7CFB93CiM9p6+l7gFhj9RuQINBFzhXn8BEAC/JqpNuvRFt9lbXpe9
 c3LnyC/zYwUCasNAv7f/UVbTqg//yUJJ4uUoj6m/51wjk3i84Y71Ch1AE6A+N5dqp9IkFr/5
 a81zzWAif9YpiFe54JrvQ/M+E0TPhjrIWPxgsdHLt/lcaKRdvFIX6GBBBZsbDekTjDohvp5e
 SBBJ1ZVmySvVnAPXLbtnAKEUNt2CHtZDavJRLY/VXySAKrBaNecXtF5ahCtMVU4NX2Tu6ryo
 NZMuk/LIlGTP4Lnkzbb1F75+1qA0D/3Fy06OBO+tRbgXmyMpBW3NnUxRufY+RV/f5hjmh0RN
 9MhWXyz8uoqZAlW4MMox3JqKQ+kf/rWVERSpx98aPzSlzBZ4QhsOOgBHvdt51J46nCiGMnmt
 QmuzbcXGiylOf/teXYkyuubReiGFyWKnUAC7jIK5x0dMIj3qaydblFWnUOSjmACxmuz7SkOB
 K+f+aE+vHQhYQqUYbIazU02ZMj2oxYNiDkLfQ//4Y2rGcuqHkU/rsAEEsl/xE3F6iDF5Y0Cw
 BfK/vVmqSIbPyQ8pyIhWDmgB2PWb0UsVSB4SvCvxA392JxLVB7P6VYAdsmjqvH0ovRDF54Rs
 Y+LKagw2ZOgD+47edNsUl/mbLvgDNLQQmNKL2m15KUjzjW9qXmCofarWGI1B+3e7jdjdM8C2
 mi4NklgFNe/PZGGrMQARAQABiQI8BBgBCAAmFiEEQJ3s94G1byhA0Wo+ZU4BzwLyZEgFAlzh
 Xn8CGwwFCQlmAYAACgkQZU4BzwLyZEj0Vw/9HSpWwSlqXUYDAYKXZWxmY+1iNpl6bu2wVign
 XIOQahynWkFcI6oGNF0Q0k8L9rmiIWzAq3xkhMY44pPW4Kv06pfiuPALQHOpOfAfluakyHs6
 wrDKI4fE1OU0w4RZr69KNzkPMBWq85ShfJaxciYVC7PZ3A4F8CiqNukGxsL/+M+boFAcX21o
 Ammxj/nLFx0X4hy9eUvnH0nW4wJukZVmBcEHCdxpK2p0BjQfkD0vmvwjZ61jNcqyuLjfye5u
 txYKTsM4SZKuqShBxlPpfxRytRSE9k7AYxtinRr/FVsELQCabZjjIjpsDWu1h8YCZSVEfYYU
 tUwD9WQCTBcFz7lKk+ixZ/NlAZHSqon2IylhbH1DNf1VAwOPWDbvIIbbhHsHqmUz4AdUcr7B
 PcwiCg6nyxXOfhM/xClkHvveEiJVz47ZC3kZoIA4ptKvharVopdqqqmFI511GbgLD0qgXRIc
 YMn/wpOAZb8eF/EdqoEwpvOw/XUSXeXgId96qy/CpWRdNfbQA7mxMwin0w3hqEDMsfTvhRIm
 lkXe8W23xWlE7et0LiERa3qz+yu9z842UJ27SilNjrAX5nlxStwikl4F9afVxGUDUk/4AiBf
 193fmgRLlbYCeNQLqmajiaoyxp1J1mme101VCOZTVNpZ8JNX7Q3ttOJydMUVeP9msRlLITg=
Subject: Re: [PATCH v2] Input: add support for the FlySky FS-iA6B RC receiver
Message-ID: <42365b0b-2f96-878f-8727-fbc2ec83966a@notsyncing.net>
Date:   Sun, 21 Jul 2019 21:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190721174806.GA824@penguin>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:uadMqr/R8XT0qy/SFZ9RXN4y1QjnqkiKHbLiD91IQeDY1s7cO1A
 DZ5HjWBlUrvPXhFM10aaOWnVZPv+2N1cxersVcYJex/ZeTohtcrJC9/6XKsFKK4iMfJ/fMV
 W0aSWLQl1/4UKwvz5OoBZP6kvtrU5dTk+EHiF601vtttW2T19fhZ/R6kEJYyyb8t31Z19vP
 8XyQLR3yNUoIaUl1Sj+zA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RLQZ1+9ZlbM=:u5qyqINjbH/zqAzYCLsKkJ
 j/sA+m23FgWNauXqUhnjdIFxLmD6Sh0dVLXCiiN5I6Lwhxf1IUWzScEF4d7Sxzn6mhChoA2Pr
 e8USWGp584qFDiHed647FjCMU/DZ2chmJOSN4ZbR9SnymnMTDme8vhDrBnfygD0CafcbRbRyv
 QQiJvjDKuza9ciGG11IgzxZOhsKFgQ1ZrPhgYsuM4kqV0Xq2iEN36bAdLlEC1s9Nq+0Wh+cBY
 aYiIFiQebdlIDZwIN99wet5v2gAc59moJeSEY+Y5N+h3Sl8UoqYmRUQrPicF9iqcoTBMX/QOO
 FraysROrlCWE2EGNKBs9+OOsG3cSzw2WYm1eSeO56TACpVTyWxZGT3jeqj7VXGMspYSbcSHXk
 LAmhlZqRZS5TfZnhuhPifn6NGiqFBZbUp5VIdM9L7HM4LGEIZ8UcZKYoQHnj2xXR1jG/qsa7P
 FReX8qpj9n+58Iegwg56d4TT8/a/b64J3bMKGMbQBAyOSlGXd2Ffca6e2JDmaNyF23GIK7vPF
 ZwjPqmiLUTnNBH+UibN8+31oVTFp0UZcNM1DIPWjbPCiis8Lxdae3ibt8jRNMUNczinE6qZk/
 HUDO650ktQHy+H+y+wdDPUSQ4svNpCHvpsHeaU6iQel6lCRrk9AhADqeo94M8g4DsC09yB1Xp
 GduIhTAizTGJ4mJyq64HK3GEEer6W0W+P9sppgX+VbPhxwKVFnHV34iLj9PYDtl75njq1y7M0
 hE3S0jn3od/uIZehzP7GP4W+kBgyjJ3b8zylC0IgyK/iDMAyEW4VqxfDi+s=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On 7/21/19 7:48 PM, Dmitry Torokhov wrote:
> Hi Markus,
> 
> On Sun, Jul 21, 2019 at 02:37:59PM +0200, Markus Koch wrote:
>> +static int fsia6b_serio_connect(struct serio *serio, struct serio_driver *drv)
>> +{
>> +	struct fsia6b *fsia6b;
>> +	struct input_dev *input_dev;
>> +	int err;
>> +	int i, j;
>> +	int sw_id = 0;
>> +
>> +	fsia6b = kzalloc(sizeof(*fsia6b), GFP_KERNEL);
>> +	if (!fsia6b)
>> +		return -ENOMEM;
>> +
>> +	fsia6b->packet.ibuf = 0;
>> +	fsia6b->packet.offset = 0;
>> +	fsia6b->packet.state = SYNC;
>> +
>> +	serio_set_drvdata(serio, fsia6b);
>> +
>> +	err = serio_open(serio, drv);
>> +	if (err)
>> +		goto fail1;
>> +
> 
> I just noticed this: we should allocate the input device before opening
> the serio port, otherwise interrupt may come in earlier and you will end
> up with a null pointer dereference.
> 
> No need to resubmit, I can adjust on my side.
> 

Very good point. Thanks.

>> +
>> +	input_dev = input_allocate_device();
>> +	if (!input_dev) {
>> +		err = -ENOMEM;
>> +		goto fail2;
>> +	}
>> +	fsia6b->dev = input_dev;
>> +
>> +	snprintf(fsia6b->phys, sizeof(fsia6b->phys), "%s/input0", serio->phys);
>> +
>> +	input_dev->name = DRIVER_DESC;
>> +	input_dev->phys = fsia6b->phys;
>> +	input_dev->id.bustype = BUS_RS232;
>> +	input_dev->id.vendor = SERIO_FSIA6B;
>> +	input_dev->id.product = serio->id.id;
>> +	input_dev->id.version = 0x0100;
>> +	input_dev->dev.parent = &serio->dev;
>> +
>> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
>> +		input_set_abs_params(input_dev, fsia6b_axes[i],
>> +				     1000, 2000, 2, 2);
>> +	}
>> +
>> +	// Register switch configuration
>> +	for (i = 0; i < IBUS_SERVO_COUNT; ++i) {
>> +		if (((switch_config[i] == '\0') && (i != IBUS_SERVO_COUNT)) ||
> 
> I believe this condition is not needed, as you will never get here with
> i >= IBUS_SERVO_COUNT, and premature end of string will trip the
> check below as well.
> 
> I will remove it.
> 

You are right. It should be removed.

>> +				(switch_config[i] < '0') ||
>> +				(switch_config[i] > '3')) {
>> +			dev_err(&fsia6b->dev->dev,
>> +				"Invalid switch configuration supplied for fsia6b.\n");
>> +			err = -EINVAL;
>> +			goto fail3;
>> +		}
>> +
> 
> Thanks.
> 

Thanks a lot for your help!
