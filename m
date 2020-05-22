Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5391DEF15
	for <lists+linux-input@lfdr.de>; Fri, 22 May 2020 20:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730798AbgEVSWm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 May 2020 14:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVSWl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 May 2020 14:22:41 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D705DC061A0E;
        Fri, 22 May 2020 11:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=XQonmUw0pCP5G1rBbyKf46q0s3ut4wVacTLv+7V9ltw=; b=dP0RRZfBdGyAK5wkij4bUbE2Wl
        Xw0GLM/Cyba98UdnXATQkXu3Kzjlte1C3dowkOrBRWWJmfHSDu4LsEFOBSh7L2JtcZZuK/dvZwEnu
        04U7n/SbJthWU+2E+hqIBRBQWfKJKqRm5GdOWmNYPB/lnZKPlEyOav0zSkTlD+tN5/BiKOhNxZegF
        /pfQfmrd1yiwarpZDDlVirwuGf0JET3pTOsjDbBN+ykT0OtjvWbSEUUQRnzT0LEJ11Qs8q+OU4oXq
        o2qC3RSMH6vXDsH0ceK1etckkqp+FwozlNzC32L43IfnTPrk1GDqoJIZz2W21/Sp9nK6QUFgtJxJF
        CkdIer+g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jcCJd-0004Yu-0K; Fri, 22 May 2020 18:22:41 +0000
Subject: Re: linux-next: Tree for May 18 (input/misc/iqs269a.c & regmap)
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
References: <20200518205725.72eb3148@canb.auug.org.au>
 <60dadc36-daec-2c48-a317-843ce52ae4f5@infradead.org>
 <20200518162058.GA18713@labundy.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e6a56505-b99c-6b22-c35a-3596857fa421@infradead.org>
Date:   Fri, 22 May 2020 11:22:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200518162058.GA18713@labundy.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 5/18/20 9:20 AM, Jeff LaBundy wrote:
> Hi Randy et al,
> 
> On Mon, May 18, 2020 at 08:42:43AM -0700, Randy Dunlap wrote:
>> On 5/18/20 3:57 AM, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20200515:
>>>
>>
>> on i386:
>>
>>
>> CONFIG_REGMAP_I2C=y
>> CONFIG_I2C=m
>>
>> WARNING: unmet direct dependencies detected for REGMAP_I2C
>>   Depends on [m]: I2C [=m]
>>   Selected by [y]:
>>   - INPUT_IQS269A [=y] && !UML && INPUT [=y] && INPUT_MISC [=y]
>>
>>
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_read':
>> regmap-i2c.c:(.text+0x192): undefined reference to `i2c_smbus_read_byte_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_byte_reg_write':
>> regmap-i2c.c:(.text+0x1d7): undefined reference to `i2c_smbus_write_byte_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_read':
>> regmap-i2c.c:(.text+0x202): undefined reference to `i2c_smbus_read_word_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_read_swapped':
>> regmap-i2c.c:(.text+0x242): undefined reference to `i2c_smbus_read_word_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_write_swapped':
>> regmap-i2c.c:(.text+0x2a1): undefined reference to `i2c_smbus_write_word_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_smbus_word_reg_write':
>> regmap-i2c.c:(.text+0x2d7): undefined reference to `i2c_smbus_write_word_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read_reg16':
>> regmap-i2c.c:(.text+0x310): undefined reference to `i2c_smbus_write_byte_data'
>> ld: regmap-i2c.c:(.text+0x323): undefined reference to `i2c_smbus_read_byte'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write_reg16':
>> regmap-i2c.c:(.text+0x39c): undefined reference to `i2c_smbus_write_i2c_block_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_write':
>> regmap-i2c.c:(.text+0x3db): undefined reference to `i2c_smbus_write_i2c_block_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_smbus_i2c_read':
>> regmap-i2c.c:(.text+0x427): undefined reference to `i2c_smbus_read_i2c_block_data'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_read':
>> regmap-i2c.c:(.text+0x49f): undefined reference to `i2c_transfer'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_gather_write':
>> regmap-i2c.c:(.text+0x524): undefined reference to `i2c_transfer'
>> ld: drivers/base/regmap/regmap-i2c.o: in function `regmap_i2c_write':
>> regmap-i2c.c:(.text+0x56c): undefined reference to `i2c_transfer_buffer_flags'
>> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_init':
>> iqs269a.c:(.init.text+0xb): undefined reference to `i2c_register_driver'
>> ld: drivers/input/misc/iqs269a.o: in function `iqs269_i2c_driver_exit':
>> iqs269a.c:(.exit.text+0x9): undefined reference to `i2c_del_driver'
>>
>>
>>
>> Full randconfig file is attached.
> 
> A complete oversight on my part; during my testing I did not realize
> another module was selecting I2C for me. Valuable lesson learned :)
> 
> The kbuild test robot set off the alarm bells earlier today and I've
> sent a patch [1] already. Many apologies for all of the noise.
> 
>>
>> -- 
>> ~Randy
>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> 
> [1] https://patchwork.kernel.org/patch/11555469/
> 
> Kind regards,
> Jeff LaBundy


Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


This build error still happens in linux-next 20200522.
Perhaps we can have this patch merged & pushed out so that
linux-next can pick it up, please?

thanks
-- 
~Randy

