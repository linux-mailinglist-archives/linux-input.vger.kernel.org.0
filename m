Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC9E20B032
	for <lists+linux-input@lfdr.de>; Fri, 26 Jun 2020 13:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbgFZLHq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 26 Jun 2020 07:07:46 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48404 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728232AbgFZLHp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 26 Jun 2020 07:07:45 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id A0FB72A5A67
Subject: Re: [PATCH] tty/sysrq: Add alternative SysRq key
To:     Pavel Machek <pavel@denx.de>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@collabora.com
References: <20200511180145.GU89269@dtor-ws>
 <20200619162819.715-1-andrzej.p@collabora.com> <20200621212106.GB22512@amd>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <8836da2c-b38d-7779-bef0-857ead18b557@collabora.com>
Date:   Fri, 26 Jun 2020 13:07:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200621212106.GB22512@amd>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Pavel,

W dniu 21.06.2020 o 23:21, Pavel Machek pisze:
> Hi!
> 
>> There exist machines which don't have SysRq key at all, e.g. chromebooks.
>>
>> This patch allows configuring an alternative key to act as SysRq. Devices
>> which declare KEY_SYSRQ in their 'keybit' bitmap continue using KEY_SYSRQ,
>> but other devices use the alternative SysRq key instead, by default F10.
>> Which key is actually used can be modified with sysrq's module parameter.
>>
>> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> 
> So... SysRq was selected because you are not going to press
> Alt-Printscreen-X by default.

This patch does not change the Alt-PrintScreen/SysRq-something sequence.
What it does instead is making the 'PrintScreen/SysRq' component of the
sequence configurable for input devices which don't declare KEY_SYSRQ in
their 'keybit' bitmap, so the sequence becomes:

Alt-<alternative sysrq key>-something

If the alternative sysrq key is used (i.e. the input device in question
does not declare KEY_SYSRQ), it is F10 by default and _that_ can be changed
with the module parameter.

To summarize:

- devices which do declare KEY_SYSRQ must use Alt-PrintScreen/SysRq-something
- devices which don't declare KEY_SYSRQ must use Alt-F10-something, but F10
can be changed with a module parameter to something else

Regards,

Andrzej
