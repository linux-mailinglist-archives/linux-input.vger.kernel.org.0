Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C116D3B298D
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 09:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231652AbhFXHoY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 03:44:24 -0400
Received: from puss.venthur.de ([138.201.246.87]:38912 "EHLO puss.venthur.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231531AbhFXHoW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 03:44:22 -0400
X-Greylist: delayed 413 seconds by postgrey-1.27 at vger.kernel.org; Thu, 24 Jun 2021 03:44:22 EDT
Received: from [10.3.128.125] (h-213.61.119.98.host.de.colt.net [213.61.119.98])
        by puss.venthur.de (Postfix) with ESMTPSA id 898761E0491;
        Thu, 24 Jun 2021 09:35:06 +0200 (CEST)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
To:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
 <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
From:   Bastian Venthur <mail@venthur.de>
Message-ID: <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
Date:   Thu, 24 Jun 2021 09:35:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans et al,


On 23.06.21 16:16, Hans de Goede wrote:
[...]
> Thank you for the logs and sorry for being so slow to respond.

no worries, thank you for working on that issue.


> So looking at your evemu-record output, the keyboard is actually
> behaving like a real Apple keyboard when put in Mac. mode.
> 
> This means that you should be able to send a "F1" keypress without
> specifying any module parameter at all by pressing "Fn + F1" when
> the keyboard is in Mac mode.
> 
> IOW in Mac mode everything should work fine, except that you may not
> like the default behavior of F1-F12 being to send "multi-media" key
> events instead of just plain "F1" - "F12" (and that you can change
> with the fnmode=2 module parameter).
> 
> Since the keyboard is also using an Apple vendor- + product-id code
> when in PC mode, things won't work as well in PC mode though since
> then the "Fn" key likely does not actually send an event to the
> machine to which the kbd is connected, causing the keys to be
> stuck in "multi-media" mode regardless of the Fn key state
> since when Fn is not pressed this is the default behavior and when
> Fn is pressed then the key-press gets reported on the second
> interface / device as a multi-media key-press.
> 
> This is really all the fault of the kbd-manufacturer, it should
> really use different (non Apple) vendor- + product-ids when in
> PC mode.
> 
> So the reason why I asked for the descriptors is to see if there
> was some way to distuingish this keyboard from real Apple
> keyboards, but I've already found a way to do that:
> 
>> # Properties:
>> N: Keychron Keychron C1
> 
> The "Keychron Keychron C1" here comes from the USB device
> strings; and we can use that to tell that we are dealing with
> this Apple clone.
> 
> So now the question becomes what to do with this info though.
> As I already said, I believe that in "Mac" mode all is working as
> it should.  The problem is the "PC mode", the only thing which
> I can come up with is to make fnmode=2 the default on this keyboard,
> since that will also work in Mac mode (albeit different as on real
> Mac keyboards) while also working in PC mode.
> 
> Does anyone (including you, Bastian) has any opinion on making
> fnmode=2 the default on this keyboard model ?

If i understand you correctly, you're saying you cannot make the fnmode 
depend on the Mac- or PC-mode that the keyboard is currently running on? 
I mean that would be of course the best solution, but if that is not 
possible I'd prefer the fnmode=2 switched on by default as this is not a 
Mac keyboard AND this is not an Apple operating system.


Thanks again Hans and take care,

Bastian

