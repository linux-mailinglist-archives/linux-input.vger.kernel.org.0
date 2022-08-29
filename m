Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B875A4F08
	for <lists+linux-input@lfdr.de>; Mon, 29 Aug 2022 16:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230259AbiH2OUd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Aug 2022 10:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiH2OUY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Aug 2022 10:20:24 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C2826106
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 07:20:19 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id 10so6656080iou.2
        for <linux-input@vger.kernel.org>; Mon, 29 Aug 2022 07:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7lOhCwyCgxj70NfnYVELQ5Ug5sOCR4L+ZmNUGHh7yso=;
        b=K5vShWKeF1Wob7qbEXQGl+lFQjFKiskc02jJIQm54c5mFzEA+WwQXmZLpc+hy15dvx
         FH1RKVAEO7/EAZYxTlRBvliayeWFW/8Zv04hWRUAl5sVpGyf5H8r9Kq/s2W/la7fjVuA
         LIqXdrK0Ed/3pWkNYQajMmT+dTJWlHFX8nlpQjKZCi83rGzsNSI+cOwvd6gVTH8qya02
         NMLvma629uz+zlifnquXycus9vqRt4YRKEUIPMvd3jPm62pvzaBJ9wxlMk3unLNOIm3n
         pvS07e6ucclmnmxrsI5QmdWtwG2gMwyDoIJrq3VNktMsQlKKqlsFzpMnJkuudPhUcvbN
         F91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7lOhCwyCgxj70NfnYVELQ5Ug5sOCR4L+ZmNUGHh7yso=;
        b=wRoW9zl4J5ZL5nYBWmzR16b4GnlQ1dsIu+Ce0QyMbvVSEUqUwvf9hzsKrnMq3rLovK
         w6QS7x4tk6j7AqrhfuFS2CBfOAH7wstBYb1GG/tvnYeFYZDEgadfKq666GjKl69DAMkY
         TYCj8dBZ2sUAH1tP/x1z7XLmuAzZBXp3CG8rQfDzV0aKCfI2GZjDtd6obOklSMjX/rcE
         toBhyGvHzkPTDQjM6ZjqZ3gcoH1x3F1C4ANKXvHbsP7rT+2ioxLd2A6dN3viO+a+WSGz
         0qNKa6aflabfjoBmkF3P4puNZ9PfhR9wleUA7tR8pN65KKHHi67tSXfu9VGWQ1Z8xYv1
         Ga3A==
X-Gm-Message-State: ACgBeo06eqy6jpIaB3ApHCfKPaebcYaVFrhJ3fhq5SJWl/Oc2dj9JdVe
        jECiSGrWObGGSlFBCukInS8=
X-Google-Smtp-Source: AA6agR6++Vw5X81QfTRwMlKkE7U0h0rLr+Ogd6lS7mz4GTy7sEZHzXgo2nTZIkXvLGjjis3HW7VNjQ==
X-Received: by 2002:a5d:9383:0:b0:67b:adc2:c053 with SMTP id c3-20020a5d9383000000b0067badc2c053mr9046449iol.102.1661782819158;
        Mon, 29 Aug 2022 07:20:19 -0700 (PDT)
Received: from [192.168.0.27] ([204.237.49.50])
        by smtp.gmail.com with ESMTPSA id o3-20020a92d383000000b002ea915c3249sm4534836ilo.66.2022.08.29.07.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:20:18 -0700 (PDT)
Message-ID: <b98deb1e-ff3b-0b85-1f3d-2583ed726728@gmail.com>
Date:   Mon, 29 Aug 2022 10:20:16 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] HID: logitech-hidpp: Enable HID++ for all the Logitech
 Bluetooth devices
Content-Language: en-US
To:     Bastien Nocera <hadess@hadess.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Cc:     =?UTF-8?Q?Filipe_La=c3=adns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
References: <4542beb149883ab5dfdcfd7f6bb4b516e5c1bcdb.camel@hadess.net>
 <CAE7qMrrj+rBzoAFf2FezqexgWNo+iSAd6b5NZwKFQ1C1zD_Qaw@mail.gmail.com>
 <f285873c4cf0a0747db996bbca7e7d9234ce77fb.camel@gmail.com>
 <d3824bda564871c7759fd3b1ebad16b3d9affe1e.camel@hadess.net>
 <a1421662-18ef-dea1-6adb-a18390831aca@gmail.com>
 <10a9cd5638ad43f06ab2bc78aef1979c98b27e99.camel@hadess.net>
From:   "Peter F. Patel-Schneider" <pfpschneider@gmail.com>
In-Reply-To: <10a9cd5638ad43f06ab2bc78aef1979c98b27e99.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On 8/29/22 09:41, Bastien Nocera wrote:
> On Fri, 2022-08-26 at 11:37 -0400, Peter F. Patel-Schneider wrote:
>> Looking at
>> https://bugzilla.kernel.org/show_bug.cgi?id=215699 reminded me of
>> another problem with the driver code.   Several HID++ 2.0 features,
>> including
>> the HiRes Wheel, have commands with bit fields in them and set all
>> the bits in
>> the bit field at once. But when the driver code sets the high-
>> resolution bit
>> for this feature it also sets two other bits, ignoring their current
>> setting.
>> This prevents other software from reliably using these two other
>> bits, one of
>> which is for reporting wheel movement in the opposite direction, a.
>> k. a.
>> natural scrolling.
>>
>> It would be useful for the driver code to first get the other bits
>> and set
>> them to their retrieved values.
> Do you have any other examples of this? For the classic Linux desktop,
> this particular bug isn't something we'd hit, as natural scrolling is
> implemented at the higher levels (libinput) rather than something we
> expect the driver to support.


I looked and I didn't find any other examples of this in the driver.  The only 
HID++ command with this feature that is used by the driver, as far as I could 
tell, is

#define CMD_HIRES_WHEEL_SET_WHEEL_MODE 0x20

of

#define HIDPP_PAGE_HIRES_WHEEL 0x2121


The way Solaar users see this bug is that if they use this feature to set 
reverse scrolling sometimes the driver flips the bit off after Solaar flips 
the bit on.  If a user doesn't use Solaar or some other software that changes 
devices behaviour using HID++ commands then they won't see any problem.  (The 
could have a multi-host mouse, use Logitech software to flip the bit, and then 
when they change hosts to a Linux host the Linux driver would flip the bit.)


peter


