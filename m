Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59E83F954D
	for <lists+linux-input@lfdr.de>; Fri, 27 Aug 2021 09:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244444AbhH0HqB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Aug 2021 03:46:01 -0400
Received: from puss.venthur.de ([138.201.246.87]:37696 "EHLO puss.venthur.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244395AbhH0HqB (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Aug 2021 03:46:01 -0400
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Aug 2021 03:46:01 EDT
Received: from [10.3.128.122] (h-213.61.119.98.host.de.colt.net [213.61.119.98])
        by puss.venthur.de (Postfix) with ESMTPSA id 5F1EB1E0148;
        Fri, 27 Aug 2021 09:39:13 +0200 (CEST)
Subject: Re: fn-key issue with hid_apple and keychron keyboards
From:   Bastian Venthur <mail@venthur.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        linux-input <linux-input@vger.kernel.org>
References: <f2ac3660-b95c-eb7b-8f92-57af0a27672d@venthur.de>
 <f82dd7a1-a5c6-b651-846c-29f6df9436af@redhat.com>
 <155865d7-f964-ac9a-2c02-1eabeac0e443@venthur.de>
 <897e57a9-38d8-c05f-ceed-01d486f02726@redhat.com>
 <ae3e52eb-fa43-ce5e-bf81-f014318a02ff@venthur.de>
 <0d69820a-30ee-755c-b146-49c2bbc0714f@redhat.com>
 <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
Message-ID: <a23380fb-579a-68ee-55f1-8bc429e09a2f@venthur.de>
Date:   Fri, 27 Aug 2021 09:39:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5815adb9-f9b4-308b-6ac8-3e7b10bd71b8@venthur.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans et al,


any updates on this one?


Cheers,

Bastian

On 24.06.21 09:35, Bastian Venthur wrote:
> On 23.06.21 16:16, Hans de Goede wrote:
>> Does anyone (including you, Bastian) has any opinion on making
>> fnmode=2 the default on this keyboard model ?
> 
> If i understand you correctly, you're saying you cannot make the fnmode 
> depend on the Mac- or PC-mode that the keyboard is currently running on? 
> I mean that would be of course the best solution, but if that is not 
> possible I'd prefer the fnmode=2 switched on by default as this is not a 
> Mac keyboard AND this is not an Apple operating system.
