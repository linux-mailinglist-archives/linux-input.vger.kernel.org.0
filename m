Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B3D3269360
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 19:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726381AbgINRaj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 13:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgINR35 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 13:29:57 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3398DC061788;
        Mon, 14 Sep 2020 10:29:48 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id z17so93365lfi.12;
        Mon, 14 Sep 2020 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EKbzfMJfGCgIRkk76i7u9y9y0/BR+pdaYaK3YA3wFGw=;
        b=gXRE07fjrWsB6CkTnWojLHMhBBDt8A4XCBh3YGVwf85zau7/BPgqSVnoxf/8plgz7U
         gqWBwMSw2+kya3rigz1mEIyeIZ8pOY/p1K3pgDlTE7vIRrhQ01TFZ9oVahwnioTbW5Th
         PG+hohW4QcLjdNFIrsXWPTr8Y+2RVBh59vrwv13ID2RLJvpHw46Qz0ueFT60pBzhz15V
         Zi1OqUFU90J1BREajLDeL6adFwpQUvCcfshUewbq8+fqJ+feLeRw/pFOfREvXZp0TgUW
         moDVvVy8LuLyWIBrbCs0OkARb7ecgk12ktITYIFbKF64AYA7NKj6dFAozeLfi/iLphll
         bfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EKbzfMJfGCgIRkk76i7u9y9y0/BR+pdaYaK3YA3wFGw=;
        b=mLb6PnDE4ikF+HEW6EytU7+n+jH/iQH54VOjwB2m9kHscOxO/FNPtAtIMB8DCe5C8I
         T0pFZXemKTTpYkVv+SiTD6jt1Qcd5TXuLdygBIO+nSkxDnmCD4JdiApdfKzKWTc2XiCz
         ldXF/96Kyc9cWXJhyiab1d3dF9mJBHVYaSQw9b+69PorNZ8oV+7FopdLfhDMvqBT2s/T
         7TQZo+DDyrAzEr5dZEWGSKIopMv32h64KAxdwV83L0ryk16lZI9W+arWO7cNpWXN9i65
         EpdK/fWNVtPzB0+WrDI7ACycdx45gOSyETOtWzo6yTWwwdQBEgUsPhQrkzECaICz9gsh
         b7+w==
X-Gm-Message-State: AOAM530SJv+f/E/yLTYnAALExyVq3tdbbZB5DHE8el2nwkvcsPvcrT/B
        2SH2Ll3psGR6Ms5XTdq23jY=
X-Google-Smtp-Source: ABdhPJwOtzmuoclCXzOdGVeUYKK5zCeOqRZ7mh1JEanKuR/HRBUUktwZzciFvDnNhrBK/YVjyzGWGQ==
X-Received: by 2002:a19:ca1e:: with SMTP id a30mr4449320lfg.575.1600104586681;
        Mon, 14 Sep 2020 10:29:46 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id 138sm3513821lfl.241.2020.09.14.10.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 10:29:45 -0700 (PDT)
Subject: Re: [PATCH v4 1/1] Input: atmel_mxt_ts - implement I2C retries
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, andy.shevchenko@gmail.com,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
References: <20200912005521.26319-1-jiada_wang@mentor.com>
 <20200913165644.GF1665100@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <65d1b9f2-a8e3-6398-712d-41d8067d06a1@gmail.com>
Date:   Mon, 14 Sep 2020 20:29:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200913165644.GF1665100@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

13.09.2020 19:56, Dmitry Torokhov пишет:
> Hi Jiada,
> 
> On Sat, Sep 12, 2020 at 09:55:21AM +0900, Jiada Wang wrote:
>> From: Nick Dyer <nick.dyer@itdev.co.uk>
>>
>> Some maXTouch chips (eg mXT1386) will not respond on the first I2C request
>> when they are in a sleep state. It must be retried after a delay for the
>> chip to wake up.
> 
> Do we know when the chip is in sleep state? Can we do a quick I2C
> transaction in this case instead of adding retry logic to everything? Or
> there is another benefit for having such retry logic?

Hello!

Please take a look at page 29 of:

https://ww1.microchip.com/downloads/en/DeviceDoc/mXT1386_1vx_Datasheet_LX.pdf

It says that the retry is needed after waking up from a deep-sleep mode.

There are at least two examples when it's needed:

1. Driver probe. Controller could be in a deep-sleep mode at the probe
time, and then first __mxt_read_reg() returns I2C NACK on reading out TS
hardware info.

2. Touchscreen input device is opened. The touchscreen is in a
deep-sleep mode at the time when input device is opened, hence first
__mxt_write_reg() invoked from mxt_start() returns I2C NACK.

I think placing the retries within __mxt_read() / write_reg() should be
the most universal option.

Perhaps it should be possible to add mxt_wake() that will read out some
generic register and then this helper should be invoked after HW
resetting (before mxt_read_info_block()) and from mxt_start() (before
mxt_set_t7_power_cfg()). But this approach feels a bit fragile to me.

AFAIK, there shouldn't be any extra benefits from the retrying other
than to handle the deep-sleep of mxt1386.
