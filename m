Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0B82812DC
	for <lists+linux-input@lfdr.de>; Fri,  2 Oct 2020 14:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgJBMgh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Oct 2020 08:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbgJBMgh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Oct 2020 08:36:37 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0325DC0613D0;
        Fri,  2 Oct 2020 05:36:37 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 7E41B29C483
Subject: Re: [PATCH v3 0/2] Add configurable handler to execute a compound
 action
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
 <20201002123158.GA3346786@kroah.com>
 <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
Message-ID: <9bd7ff2e-ddf3-f950-54ad-c143e9c60daa@collabora.com>
Date:   Fri, 2 Oct 2020 14:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <95030036-87fe-8c61-6fc6-c60452d8ca96@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

W dniu 02.10.2020 o 14:33, Andrzej Pietrasiewicz pisze:
> W dniu 02.10.2020 o 14:31, Greg Kroah-Hartman pisze:
>> On Tue, Aug 18, 2020 at 01:28:23PM +0200, Andrzej Pietrasiewicz wrote:
>>> This is a follow-up of this thread:
>>>
>>> https://www.spinics.net/lists/linux-input/msg68446.html
>>
>> lore.kernel.org is easier to pull stuff from :)
>>
>> Anyway, what ever happened to this series?  Is there a newer one
>> somewhere?
>>
>> thanks,
>>
>> greg k-h
>>
> 
> https://lkml.org/lkml/2020/8/18/440
> 
> Andrzej

Sorry about confusion.

This is the same thing, so there is nothing newer.

Andrzej
