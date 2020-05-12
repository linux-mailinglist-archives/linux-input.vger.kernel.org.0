Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F348A1CF14E
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 11:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgELJQE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 05:16:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33106 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726024AbgELJQE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 05:16:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id A85DB2A1F30
Subject: Re: [PATCH 6/6] tty/sysrq: Add configurable handler to execute a
 compound action
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        kernel@collabora.com
References: <20200511135918.8203-1-andrzej.p@collabora.com>
 <20200511135918.8203-7-andrzej.p@collabora.com>
 <20200511162113.GC2221063@kroah.com> <20200511182928.GV89269@dtor-ws>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <e286f6ae-e4cb-ab13-c652-daf91fe1af7a@collabora.com>
Date:   Tue, 12 May 2020 11:15:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511182928.GV89269@dtor-ws>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

W dniu 11.05.2020 o 20:29, Dmitry Torokhov pisze:
> On Mon, May 11, 2020 at 06:21:13PM +0200, Greg Kroah-Hartman wrote:
>> On Mon, May 11, 2020 at 03:59:18PM +0200, Andrzej Pietrasiewicz wrote:
>>> Some userland might want to execute e.g. 'w' (show blocked tasks), followed
>>> by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
>>> upon a single magic SysRq. Or one might want to execute the famous "Raising
>>> Elephants Is So Utterly Boring" action. This patch adds a configurable
>>> handler, triggered with 'C', for this exact purpose. The user specifies the
>>> composition of the compound action using syntax similar to getopt, where
>>> each letter corresponds to an individual action and a colon followed by a
>>> number corresponds to a delay of that many milliseconds, e.g.:
>>>
>>> ws:1000c
>>>
>>> or
>>>
>>> r:100eis:1000ub
>>
>> Cute, but why?  Who needs/wants this type of thing?

Surely things that can be done in userspace should be done there.
So we would envision an input daemon which reacts to a predefined
combination of keys. That said, it is not unimaginable to think of
userspace being dead enough (e.g. due to memory pressure) to be unable
to complete such a compound action. In other words userspace not being
able to do it is a good reason for putting the code in the kernel.

Dmitry has given a use case where such a compound action is needed.

Andrzej

> 
> On Chrome OS the first time user presses SysRq-X it will try to kill
> chrome (and that will cause crash to get uploaded if user consented).
> The 2nd time within 5 seconds the same combo is pressed, it will dump
> blocked tasks in syslog and try to sync and then panic. On panic the
> device will reboot, logs will be scraped from pstore, and uploaded for
> analysis.
> 
> Thanks.
> 

