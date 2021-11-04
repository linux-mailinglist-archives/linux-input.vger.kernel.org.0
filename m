Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88F634452E3
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 13:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhKDMY0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 08:24:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDMYZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 08:24:25 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0361DC061714;
        Thu,  4 Nov 2021 05:21:47 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 730751F46101
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
References: <20211103155438.11167-1-andrzej.p@collabora.com>
 <20211104120111.GB23122@duo.ucw.cz>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
Date:   Thu, 4 Nov 2021 13:21:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211104120111.GB23122@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

W dniu 04.11.2021 o 13:01, Pavel Machek pisze:
> Hi!
> 
>> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>>
>> This patch allows configuring an alternative key to act as SysRq. Devices
>> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
>> but other devices use the alternative SysRq key instead, by default F10.
>> Which key is actually used can be modified with sysrq's module
>> parameter.
> 
> Is F10 sensible default? Would it make sense to use something like
> alt-shift-esc so that this can be enabled by default?

Why "alt-shift-esc" could be enabled by default? Do you mean to enable it for
all systems regardless of whether they declare or don't declare KEY_SYSRQ
in their 'keybit' bitmap?

Andrzej
