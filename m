Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A290F43187D
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 14:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhJRMMD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 08:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRMMD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 08:12:03 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24E8AC06161C;
        Mon, 18 Oct 2021 05:09:52 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrewsh)
        with ESMTPSA id 8DA821F413E6
Message-ID: <a4f796b2-4a95-2d26-3a57-3b8abaa763e5@collabora.co.uk>
Date:   Mon, 18 Oct 2021 14:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/2] HID: u2fzero: explicitly check for errors
Content-Language: en-GB
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?B?SmnFmcOtIEtvc2luYQ==?= <jikos@kernel.org>,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
References: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
 <YW0aulXWy86FvTvq@kroah.com>
 <4b018979-31f8-1a0f-8a43-67b5ece7e93a@collabora.co.uk>
Organization: Collabora
In-Reply-To: <4b018979-31f8-1a0f-8a43-67b5ece7e93a@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18/10/2021 14:06, Andrej Shadura wrote:
> On 18/10/2021 08:56, Greg KH wrote:
>> On Mon, Oct 18, 2021 at 08:47:59AM +0200, Andrej Shadura wrote:
>>> The previous commit fixed handling of incomplete packets but broke error
>>> handling: offsetof returns an unsigned value (size_t), but when compared
>>> against the signed return value, the return value is interpreted as if
>>> it were unsigned, so negative return values are never less than the
>>> offset.
>>>
>>> Fixes: 22d65765f211c("HID: u2fzero: ignore incomplete packets without 
>>> data")
>>> Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and 
>>> RNG")
>>
>> Nit, you need a ' ' before the '(' character here, and you only need 12
>> digits of the sha1.  It should look like:
>>     Fixes: 22d65765f211 ("HID: u2fzero: ignore incomplete packets 
>> without data")
> 
> Thanks, is there a script or something to help generate those? (I’m 
> surprised --fixup cannot generate them.)

Replying to myself, apparently the answer to this is now in the 
"submitting patches" document.

-- 
Cheers,
   Andrej
