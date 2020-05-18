Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6891D7384
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 11:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726279AbgERJKr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 05:10:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726040AbgERJKr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 05:10:47 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FA5C061A0C;
        Mon, 18 May 2020 02:10:45 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id g1so8993399ljk.7;
        Mon, 18 May 2020 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=OR1MlZbml98F+x4zMQoY9JCyPXQQC5+BHqeUK/5YSAc=;
        b=BeCL82iYscMJtBM85Z9cMHdCMME7CXRkt/BKVCWO7IVd4KHyB7dXT+WaGl9LB1kfYT
         5fkZgGsq5AWxHEnbmZYqv+qGfSi2wj2mG2zS+3TvqV5r9CO/PW+WNun8z0GPv5fCM5NE
         B8X/SzVz+lnFnoRW81YvCoggcHbTYBsRVic+KdS2qBEOn5Lf8Zg8jwXSgSiizuxT5q58
         jyZi1jIYCbWpxOya3dYjM5N9SmqltYaPX+6lAey20QQMtutijuKG2KvOrny+l5mBCBrT
         wp4Wq+sokuxP+XaWQ2z4ujVFHp/Ij1d6qdbLSxNLZR5jmvC6rCyq6h7Z7GmBpg/8/OX8
         p6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=OR1MlZbml98F+x4zMQoY9JCyPXQQC5+BHqeUK/5YSAc=;
        b=swxCoPr0ljbnMjDxgqWjCeXrV8OSLR0sSON2L22omUDkQgIBu6yl7BQeXPGX32JbWo
         fVhZ7pcrXTasShlihv65qAql6nLI1lw41QcbAkrCn6UKj3tnJBPZdb8qXpnuDS9Qo5Bx
         VneZ+hxHAJA32difiFYwJeiadqifFO2yL3hEKCJg2BXcTTMg3S0Zgog8FAKhkCUMjcfK
         bbeBYIVutK8jbXvXzHYW2rTRGCvR4Idf78vWAQObu+6hFyXWPOtiQezRio4KxPYakXNB
         jecNPdwxRoD6azP1O/8WLeaSJ8QK+MShBoTltrUkASBvw57h8PjDeWXGUN/CIqoW08Ac
         FplQ==
X-Gm-Message-State: AOAM5310wSwRs+xsyeCOZrAoxLZEvi3ad2IFlDhUgBOGPTKZIhsWBONO
        vihzj59fTMHFJsXft/5PM7DqZh42
X-Google-Smtp-Source: ABdhPJwuPHFD2sdqR79/zFl7AfcJqYKpVUC++wN8CSF1gVCBQeOhSCG0RQBdFvv2sYslNp1iPvTLcQ==
X-Received: by 2002:a2e:a211:: with SMTP id h17mr10302139ljm.289.1589793043958;
        Mon, 18 May 2020 02:10:43 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id h2sm6127709ljb.45.2020.05.18.02.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 02:10:43 -0700 (PDT)
Subject: Re: [PATCH v5 07/10] input: elants: support 0x66 reply opcode for
 reporting touches
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Johnny Chuang <johnny.chuang@emc.com.tw>
Cc:     David Heidelberg <david@ixit.cz>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1587923061.git.mirq-linux@rere.qmqm.pl>
 <02dc25c5851e50d77bc707a2e1b44caf9d6354eb.1587923061.git.mirq-linux@rere.qmqm.pl>
 <20200518040532.GP89269@dtor-ws>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <268f009f-7bf7-28ce-ff2c-00d033a7bf5f@gmail.com>
Date:   Mon, 18 May 2020 12:10:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518040532.GP89269@dtor-ws>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

18.05.2020 07:05, Dmitry Torokhov пишет:
> On Sun, Apr 26, 2020 at 07:47:52PM +0200, Michał Mirosław wrote:
>> From: Dmitry Osipenko <digetx@gmail.com>
>>
>> eKTF3624 touchscreen firmware uses two variants of the reply opcodes for
>> reporting touch events: one is 0x63 (used by older firmware) and other is
>> 0x66 (used by newer firmware). The 0x66 variant is equal to 0x63 of
>> eKTH3500, while 0x63 needs small adjustment of the touch pressure value.
>>
>> Nexus 7 tablet device has eKTF3624 touchscreen and it uses 0x66 opcode for
>> reporting touch events, let's support it now. Other devices, eg. ASUS TF300T,
>> use 0x63.
>>
>> Note: CMD_HEADER_REK is used for replying to calibration requests, it has
>> the same 0x66 opcode number which eKTF3624 uses for reporting touches.
>> The calibration replies are handled separately from the the rest of the
>> commands in the driver by entering into ELAN_WAIT_RECALIBRATION state
>> and thus this change shouldn't change the old behavior.
> 
> Is it possible to know what format a device will use by querying it at
> probe time?

I guess only somebody from Elan could answer this question. AFAIK,
neither touchscreen firmware sources nor technical documentation aren't
publicly available.

Downstream kernel driver is the only source of information in our case
and it does the same thing as we do in this patch.
