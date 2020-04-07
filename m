Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFD121A0F92
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 16:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729177AbgDGOrb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 10:47:31 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43371 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729284AbgDGOrL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 10:47:11 -0400
Received: by mail-lf1-f65.google.com with SMTP id k28so2571236lfe.10;
        Tue, 07 Apr 2020 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZjR9e+bUX9QLydK8oHL5gRtVWql0LfajQG/APB8lzoQ=;
        b=ptY38GSrdgA8CLIhf2D4x6lBrbCgAB9GnhIZG9BPz9+PflofvDL4BrPk0dU8vhzXjR
         EN6ADfa0OBffwwkXUKfQAJFPFwCRKBnWhhynkZ1OYGH73acQXRX1fhQuSKj/iGmsYjIU
         lFODvTnd6ePf9AJsEMmqnh5rXH2pgLsR7w7j1+/iWnYwQypoiZVyZg2oHdPA45mD+DyD
         qs0Rngup53A84V+RD+BANK7/J90nwV8JYokfpDgX+RS+FsHIQ06gsfwajQ+WLnBk4sOm
         6nRIqtspxam5L+he1fEE/Kgp0UylehvEBK1n0QajuC+apzQ2qORs4ElfO2IvhW7mGp9K
         cCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZjR9e+bUX9QLydK8oHL5gRtVWql0LfajQG/APB8lzoQ=;
        b=DqvYKPGxNAP5YTNzWEEmbfdE7qGk+NzNOGX39CqSniirkTyy6keRDfGRqt+Dh2CJpd
         +6ve43nryFi98rqUXt7T7S8FXCmkxDUD9MScud78CUqTIZbJ+M1yANJfNZWhDY9llgQn
         qXUO9vWw8dBdrykCS74LKPrKImyrnXXhVY0CWLVNJo44KbbeQp+5HGXUPwFpk6LfZWir
         zf3gxf9LS3VyPJktRi8pfUT21OLNhS3aklk424p1R9oJ2rIqCW6mwISsMdLZeiZkWAcq
         BAiulm/SC2G3ITDzgTZec1qGWh527UWpJAdyuoQJ0XbylHa5hnvjKRcOF2FcBNXbFKLA
         zuwg==
X-Gm-Message-State: AGi0PuYdEFQwCu8m3bS4QvhCBZWZfNLYILckdTI8rA4gOVsMv3s2TTTp
        8fnB8QdIdE0rL2VuLuXz690LkYTW
X-Google-Smtp-Source: APiQypJLXWyalNeqXpB2reQ+HYchUM+EfmBNpisKVAZjBf1+v4XkE9R18DeFEIaGZ3fCuYJkBOaoYQ==
X-Received: by 2002:ac2:483a:: with SMTP id 26mr1733534lft.5.1586270829482;
        Tue, 07 Apr 2020 07:47:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id u4sm11718887ljj.44.2020.04.07.07.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 07:47:08 -0700 (PDT)
Subject: Re: [PATCH v10 43/55] dt-bindings: input: atmel: support to set max
 bytes transferred
To:     "Wang, Jiada" <jiada_wang@mentor.com>, nick@shmanahar.org,
        dmitry.torokhov@gmail.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200331105051.58896-1-jiada_wang@mentor.com>
 <20200331105051.58896-44-jiada_wang@mentor.com>
 <a15d312d-587e-5b10-e031-dde1965f6f89@gmail.com>
 <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <008d019c-2de7-4fe4-0c22-2668312f808b@gmail.com>
Date:   Tue, 7 Apr 2020 17:47:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9b98a3fc-b7ee-fc01-dc5c-248df507d4a2@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

07.04.2020 12:27, Wang, Jiada пишет:
..
>> Is this a software (firmware) limitation which varies from version to
>> version?
>>
> 
> the timeout issue trying to be addressed in this patch is from software,
> one of our board a Serializer/Deserializer bridge exists between the SoC
> (imx6) and the Atmel touch controller.
> imx6 i2c controller driver has a timeout value(100ms) for each i2c
> transaction,
> Large i2c read transaction failed to complete within this timeout value
> and therefore imx6 i2c controller driver aborts the transaction
> and returns failure.
> 
> Therefore this patch was created to split the large i2c transaction into
> smaller chunks which can complete
> within the timeout defined by i2c controller driver.

Isn't it possible to use the max_read/write_len of the generic struct
i2c_adapter_quirks for limiting the transfer size?

BTW, it looks like the i.MX I2C driver doesn't specify the
i2c_adapter_quirks, which probably needs to be fixed.
