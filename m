Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A40228145B
	for <lists+linux-input@lfdr.de>; Fri,  2 Oct 2020 15:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgJBNm6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Oct 2020 09:42:58 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49958 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgJBNm6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Oct 2020 09:42:58 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 7E7E629DCF4
Subject: Re: [PATCH v3 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
References: <20200818112825.6445-1-andrzej.p@collabora.com>
 <20200818112825.6445-3-andrzej.p@collabora.com>
 <20201002125429.GA3350322@kroah.com>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <db7fe4ed-19a4-3303-a544-eb789badb8a1@collabora.com>
Date:   Fri, 2 Oct 2020 15:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201002125429.GA3350322@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

W dniu 02.10.2020 o 14:54, Greg Kroah-Hartman pisze:
> On Tue, Aug 18, 2020 at 01:28:25PM +0200, Andrzej Pietrasiewicz wrote:
>> Userland might want to execute e.g. 'w' (show blocked tasks), followed
>> by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
>> upon a single magic SysRq. Or one might want to execute the famous "Raising
>> Elephants Is So Utterly Boring" action. This patch adds a configurable
>> handler, triggered with 'C', for this exact purpose. The user specifies the
>> composition of the compound action using syntax similar to getopt, where
>> each letter corresponds to an individual action and a colon followed by a
>> number corresponds to a delay of that many milliseconds, e.g.:
>>
>> ws:1000c
>>
>> or
>>
>> r:100eis:1000ub
> 
> A macro language for sysrq commands, who would have thought...
> 
> Anyway, _why_ would userland want to do something so crazy as this?
> What is the use-case here?
> 

A use-case is Chromebooks which do want to execute 'w', 's',
wait 1000ms and then 'c' under one key combination. Having that supported
upstream brings us one little step closer to those machines running
upstream kernel.

Another argument for such a "macro language" is when a machine's system
keeps degrading over time, possibly degrading (relatively) fast.
"Raising Elephants Is So Utterly Boring" consists of 6 actions, each
of which requires pressing several keys. The user might be unable
to complete all the 6 steps, while a "macro" requires user's involvement
for carrying out just one step.

Regards,

Andrzej
