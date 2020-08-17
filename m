Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5340C246761
	for <lists+linux-input@lfdr.de>; Mon, 17 Aug 2020 15:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728358AbgHQNcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Aug 2020 09:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgHQNcJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Aug 2020 09:32:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25D47C061389;
        Mon, 17 Aug 2020 06:32:09 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D1F48297BC1
Subject: Re: [PATCH 2/2] tty/sysrq: Add configurable handler to execute a
 compound action
To:     Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
References: <20200804162402.2087-1-andrzej.p@collabora.com>
 <20200804162402.2087-3-andrzej.p@collabora.com>
 <0280e30a-2e70-7d21-68a9-5a2c22d7f316@kernel.org>
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Message-ID: <5fc8d6df-ff33-1afd-5a83-d79d41e0fefc@collabora.com>
Date:   Mon, 17 Aug 2020 15:32:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0280e30a-2e70-7d21-68a9-5a2c22d7f316@kernel.org>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

W dniu 12.08.2020 o 13:45, Jiri Slaby pisze:
> On 04. 08. 20, 18:24, Andrzej Pietrasiewicz wrote:
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
> I think I miss what's that good for, given I can do it one-by-one
> without setting such strings anywhere (I usually want to do different
> things on different kinds of crashes)?
> 

The "REISUB" action is a common way of handling a bad situation, though,
so having a shortcut for a common way is helpful, yet we are not forcing
this particular action to happen when the 'C' sysrq is invoked and offer
configurability instead.

I addressed the comments you had with regard to the code in a v2 series.

Regards,

Andrzej

