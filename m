Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFCE43186F
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 14:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhJRMIW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 08:08:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33370 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJRMIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 08:08:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrewsh)
        with ESMTPSA id E276A1F415CD
Message-ID: <4b018979-31f8-1a0f-8a43-67b5ece7e93a@collabora.co.uk>
Date:   Mon, 18 Oct 2021 14:06:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH 1/2] HID: u2fzero: explicitly check for errors
Content-Language: en-GB
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     =?UTF-8?B?SmnFmcOtIEtvc2luYQ==?= <jikos@kernel.org>,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        kernel@collabora.com,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>
References: <20211018064800.15173-1-andrew.shadura@collabora.co.uk>
 <YW0aulXWy86FvTvq@kroah.com>
From:   Andrej Shadura <andrew.shadura@collabora.co.uk>
Organization: Collabora
In-Reply-To: <YW0aulXWy86FvTvq@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 18/10/2021 08:56, Greg KH wrote:
> On Mon, Oct 18, 2021 at 08:47:59AM +0200, Andrej Shadura wrote:
>> The previous commit fixed handling of incomplete packets but broke error
>> handling: offsetof returns an unsigned value (size_t), but when compared
>> against the signed return value, the return value is interpreted as if
>> it were unsigned, so negative return values are never less than the
>> offset.
>>
>> Fixes: 22d65765f211c("HID: u2fzero: ignore incomplete packets without data")
>> Fixes: 42337b9d4d958("HID: add driver for U2F Zero built-in LED and RNG")
> 
> Nit, you need a ' ' before the '(' character here, and you only need 12
> digits of the sha1.  It should look like:
> 	Fixes: 22d65765f211 ("HID: u2fzero: ignore incomplete packets without data")

Thanks, is there a script or something to help generate those? (I’m 
surprised --fixup cannot generate them.)

> Also, how about a cc: stable for these as well?

Sure, will do.

-- 
Cheers,
   Andrej
